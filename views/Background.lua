local Background = {}

function Background:new()
    local obj = {}
    obj.image = love.graphics.newImage('sprites/background.png')
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Background:draw()
    love.graphics.draw(self.image, 0, 0)
end

return Background