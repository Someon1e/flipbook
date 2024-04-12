local flipbook = script:FindFirstAncestor("flipbook")

local types = require(flipbook.Renderers.types)

type Renderer = types.Renderer

local function createRobloxRenderer(): Renderer
	local handle

	local function shouldUpdate()
		return true
	end

	local function mount(target, element, args)
		if typeof(element) == "function" then
			element = element(args)
		end

		if typeof(element) == "Instance" and element:IsA("GuiObject") then
			element.Parent = target
			handle = element
		end
		return element
	end

	local function unmount()
		if handle then
			handle:Destroy()
		end
	end

	return {
		shouldUpdate = shouldUpdate,
		mount = mount,
		unmount = unmount,
	}
end

return createRobloxRenderer
