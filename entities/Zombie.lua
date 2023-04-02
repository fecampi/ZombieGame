local Zombie = Entity:new()

function Zombie:new(x, y)
    local obj = Entity:new(x,y)
    obj.speed = 50
    obj.animation = Animation:new("sprites/zombie.png", 40, 43, 1, 2)
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Zombie:update(dt)
    Entity.update(self,dt)
    self.animation:update(dt)
end

function Zombie:draw()
    self.animation:draw(self.x, self.y, self.angle)
end

return Zombie
