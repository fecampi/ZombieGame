
local Entity = {}

function Entity:new(x,y,angle)
    local obj = {}
    obj.x = x or 0
    obj.y = y or 0
    obj.dead = false
    obj.angle =  angle or 0
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Entity:update(dt)
    self.x = self.x + (math.cos(self.angle) * self.speed * dt)
    self.y = self.y + (math.sin(self.angle) * self.speed * dt)
    if self.x < 0 or self.y < 0 or self.x > love.graphics.getWidth() or self.y > love.graphics.getHeight() then
        self.dead = true
    end
end

return Entity