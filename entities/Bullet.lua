local Bullet = Entity:new()


function Bullet:new(x, y, angle)
    local obj = Entity:new(x,y,angle)
    obj.speed = 2000
    obj.audio = love.audio.newSource("sprites/sniper.wav", "static")
    setmetatable(obj, self)
    self.__index = self
    obj:create()
    return obj
end

function Bullet:create()
    self.audio:stop()
    love.audio.play(self.audio)   
end


function Bullet:draw()
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.circle("fill", self.x, self.y, 2)
    love.graphics.setColor(1, 1, 1, 1)
end

return Bullet
