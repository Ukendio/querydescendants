--!strict
-- TODO(marcus): just steal from Roblox-TS
type creatableinstances = {
	Part: Part,
	Model: Model,
	Frame: Frame,
	TextLabel: TextLabel,
	ImageLabel: ImageLabel,
	TextButton: TextButton,
	ImageButton: ImageButton,
	ScrollingFrame: ScrollingFrame,
	ViewportFrame: ViewportFrame,
	SpotLight: SpotLight,
	PointLight: PointLight,
	SurfaceLight: SurfaceLight,
	Folder: Folder,
	Configuration: Configuration,
	Script: Script,
	LocalScript: LocalScript,
	ModuleScript: ModuleScript,
	ScreenGui: ScreenGui,
	BillboardGui: BillboardGui,
	SurfaceGui: SurfaceGui,
	UIListLayout: UIListLayout,
	UIPadding: UIPadding,
	UICorner: UICorner,
	UIStroke: UIStroke,
	UIGradient: UIGradient,
	Sound: Sound,
	ParticleEmitter: ParticleEmitter,
	Attachment: Attachment,
	Weld: Weld,
	Motor6D: Motor6D,
}

type function querytype(selector: type)
	local str = selector:value()
	assert(typeof(str) == "string")

	local pos = 1
	local len = string.len(str)

	local function peek(n: number?)
		n = n or 0
		return string.sub(str, pos + n, pos + n)
	end

	local function advance(n: number?)
		n = n or 1
		pos = pos + n
	end

	local function skipws()
		while pos <= len and peek() == " " do
			advance()
		end
	end

	local function isident(ch: string)
		return string.match(ch, "^[%w_%-]$") ~= nil
	end

	local function parseident()
		local start = pos
		while pos <= len and isident(peek()) do
			advance()
		end
		return string.sub(str, start, pos - 1)
	end

	local function parsevalue()
		skipws()
		local word = parseident()
		if word == "true" or word == "false" then
			return types.boolean
		end
		local num = tonumber(word)
		if num ~= nil then
			return types.number
		end
		if peek() == "'" or peek() == "\"" then
			return types.string
		end
		error("Cannot serialize this value")
	end

	local function intostr(ty: type)
		if ty:is("string") then
			return "string"
		elseif ty:is("boolean") then
			return "boolean"
		elseif ty:is("number") then
			return "number"
		end
		error("Cannot serialize this type")
	end

	local function parseatom(): type
		local acc: type? = nil
		local classname = ""
		if pos <= len and isident(peek()) then
			classname = parseident()
			if classname ~= "" then
				local elem = creatableinstances:readproperty(types.singleton(classname))
				acc = elem :: type
			end
		end
		while pos <= len do
			skipws()
			local ch = peek()
			if ch == "." then
				advance()
				local tag = parseident()
				local tbl = types.newtable()
				tbl:setproperty(types.singleton("$tag:" .. tag), types.boolean)
				acc = if acc then types.intersectionof(acc, tbl) else tbl
			elseif ch == "#" then
				advance()
				local name = parseident()
				local tbl = types.newtable()
				tbl:setproperty(types.singleton("Name"), types.singleton(name))
				acc = if acc then types.intersectionof(acc, tbl) else tbl
			elseif ch == "[" then
				advance()
				skipws()
				if peek() == "$" then
					advance()
				end
				local key = parseident()
				skipws()
				if peek() == "=" then
					advance()
					skipws()
					local value = parsevalue()
					if acc and acc:is("class") then
						local foundkey = false
						for k, v in acc:properties() do
							if k == types.singleton(key) then
								foundkey = true
								if v.write:is("boolean") then
									assert(
										value:is("boolean"),
										`The field {key} expects a boolean but got {intostr(value)}}`
									)
								elseif v.write:is("number") then
									assert(
										value:is("number"),
										`The field {key} expects a number but got {intostr(value)}`
									)
								elseif v.write:is("string") then
									assert(
										value:is("string"),
										`The field {key} expects a string but got {intostr(value)}}`
									)
								else
									error("Cannot serialize this type")
								end
							end
						end
						assert(foundkey, "Expected a valid key")
					end
				end
				skipws()
				advance()
			else
				break
			end
		end
		if not acc then
			error("Expected a simple selector")
		end
		return acc
	end

	while true do
		skipws()
		if peek() == ">" then
			if peek(1) == ">" then
				advance(2)
			else
				advance(1)
			end
		else
			break
		end
	end

	local function peekop(): string?
		skipws()
		if peek() == ">" then
			if peek(1) == ">" then
				return ">>"
			else
				return ">"
			end
		elseif peek() == "," then
			return ","
		end
		return nil
	end

	local function consumeop(op: string)
		skipws()
		if op == ">>" then advance(2) elseif op == ">" or op == "," then advance(1) end
		skipws()
	end

	local OPS = {
		[">"]  = { lbp = 30, rbp = 31 },
		[">>"] = { lbp = 20, rbp = 21 },
	} :: { [string]: { lbp: number, rbp: number }}

	local function parseexpr(min_bp: number)
		local lhs = parseatom()
		while true do
			local op = peekop()
			if not op or op == "," then
				break
			end
			local info = OPS[op]
			if not info or info.lbp < min_bp then
				break
			end
			consumeop(op)
			local rhs = parseexpr(info.rbp)
			if op == ">" then
				local tbl = types.newtable()
				tbl:setproperty(types.singleton("Parent"), lhs)
				rhs = types.intersectionof(rhs, tbl)
			end
			lhs = rhs
		end
		return lhs
	end

	local function parseunion()
		local parts = { parseexpr(0) }
		while true do
			local op = peekop()
			if op ~= "," then
				break
			end
			consumeop(",")
			table.insert(parts, parseexpr(0))
		end
		if #parts == 1 then
			return parts[1]
		end
		return types.unionof(table.unpack(parts))
	end

	return parseunion()
end

local function querydescendants<T>(instance: Instance, selector: T & (string | "")): { querytype<T> }
	return instance:QueryDescendants(selector) :: any
end

-- local txtlabels_under_image_under_folder = querydescendants( workspace,
-- 	"Folder > ImageButton > TextLabel[Text = 'Part10'][Transparency = 1]" ::
-- 	"Folder > ImageButton > TextLabel[Text = false][Transparency = 1]"
-- )

-- for _, v in txtlabels_under_image_under_folder do
-- end

return querydescendants
