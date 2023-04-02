local Menu = {}

function Menu:new(text)
    local obj = {}
    obj.text = text
    obj.myFont = love.graphics.newFont(30)
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Menu:draw()
    love.graphics.setFont(self.myFont)
    love.graphics.printf(self.text, 0, 50, love.graphics.getWidth(), "center")
end

return Menu