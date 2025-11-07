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
	if not selector:is("singleton") then
		return selector
	end
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

	local function parseclass()
		local start = pos
		while pos <= len and string.match(peek(), "^%w") do
			advance()
		end
		return string.sub(str, start, pos - 1)
	end

	local function parsesimple()
		local name = parseclass()
		if name ~= "" then
			return creatableinstances:readproperty(types.singleton(name))
		end
		error("Not a creatable instance")
	end

	local function parsecomb(): string?
		skipws()
		if peek() == ">" then
			if peek(1) == ">" then
				advance(2)
				skipws()
				return ">>"
			else
				advance(1)
				skipws()
				return ">"
			end
		end
		return nil
	end

	local function parseexpr(minpow: number)
		local lhs = parsesimple()

		while true do
			skipws()
			if pos > len then break end

			local comb = parsecomb()
			if not comb then break end

			local pow = 0
			if comb == ">" then
				pow = 20
			elseif comb == ">>" then
				pow = 10
			end

			if pow < minpow then break end

			local rhs = parseexpr(pow + 1)

			if comb == ">" then
				local tbl = types.newtable()
				tbl:setproperty(types.singleton("Parent"), lhs)
				rhs = types.intersectionof(rhs, tbl)
			end

			lhs = rhs
		end

		return assert(lhs)
	end

	return parseexpr(0)
end

type function arrayof(element: type)
	local arr = types.newtable()
	arr:setindexer(types.number, element)
	return arr
end

local function querydescendants<T>(instance: Instance, selector: T): arrayof<querytype<T, CreatableInstances>>
	return instance:QueryDescendants(selector) :: arrayof<querytype<T, CreatableInstances>>
end

-- local txtlabels_under_image = querydescendants(
-- 	workspace,
-- 	"ImageButton > TextLabel[Name = 'Part10'][Transparency = 1]"
-- 		:: "ImageButton > TextLabel[Name = 'Part10'][Transparency = 1]"
-- )

return querydescendants
