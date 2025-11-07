--!strict
-- TODO(marcus): just steal from Roblox-TS
type CreatableInstances = {
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

type function querytype(selector: type, creatableinstances: type)
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

	local function parsequoted()
		advance()
		local start = pos
		while pos <= len and peek() ~= '"' do advance() end
		local v = string.sub(str, start, pos - 1)
		advance()
		return v
	end

	local function parsevalue()
		skipws()
		if peek() == '"' then
			return types.singleton(parsequoted())
		end
		local word = parseident()
		if word == "true" then
			return types.singleton(true)
		end
		if word == "false" then
			return types.singleton(false)
		end
		local num = tonumber(word)
		if num ~= nil then
			return types.number
		end
		return types.singleton(word)
	end

	local function and_into(base: type, tbl: type)
		return types.intersectionof(base, tbl)
	end

	local function parsesimplelist()
		local acc: type? = nil
		local class = ""
		if pos <= len and isident(peek()) then
			class = parseident()
			if class ~= "" then
				local elem = creatableinstances:readproperty(types.singleton(class))
				acc = elem
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
				acc = if acc then and_into(acc, tbl) else tbl
			elseif ch == "#" then
				advance()
				local name = parseident()
				local tbl = types.newtable()
				tbl:setproperty(types.singleton("Name"), types.singleton(name))
				acc = if acc then and_into(acc, tbl) else tbl
			elseif ch == "[" then
				advance()
				skipws()
				local is_attr = false
				if peek() == "$" then
					is_attr = true
					advance()
				end
				local key = parseident()
				skipws()
				advance()
				skipws()
				local val = parsevalue()
				skipws()
				advance()
				local tbl = types.newtable()
				local propname = if is_attr then ("$attr:" .. key) else key
				tbl:setproperty(types.singleton(propname), val)
				acc = if acc then and_into(acc, tbl) else tbl
			else
				break
			end
		end
		if not acc then error("Expected a simple selector") end
		return acc
	end

	while true do
		skipws()
		if peek() == ">" then
			if peek(1) == ">" then advance(2) else advance(1) end
		else
			break
		end
	end

	local function peekop(): string?
		skipws()
		if peek() == ">" then
			if peek(1) == ">" then return ">>" else return ">" end
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
	}

	local function parseexpr(min_bp: number)
		local lhs = parsesimplelist()
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
			if op ~= "," then break end
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

type function arrayof(element: type)
	local arr = types.newtable()
	arr:setindexer(types.number, element)
	return arr
end

local function querydescendants<T>(instance: Instance, selector: T | ""): arrayof<querytype<T, CreatableInstances>>
	return instance:QueryDescendants(selector) :: arrayof<querytype<T, CreatableInstances>>
end

-- local txtlabels_under_image_under_folder = querydescendants(
-- 	workspace,
-- 	"Folder > ImageButton > TextLabel[Name = 'Part10'][Transparency = 1]"
-- )

return querydescendants
