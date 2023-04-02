local Player = {}

function Player:new()
    local obj = {}
    obj.x = love.graphics.getWidth() / 2
    obj.y = love.graphics.getHeight() / 2
    obj.animation = Animation:new("sprites/player.png", 100,206, 1, 1)
    obj.speed = 180
    obj.angle = 0
    setmetatable(obj, self)
    self.__index = self
    return obj
end


function Player:zombiePlayerAngle(enemy)
    return math.atan2(self.y - enemy.y, self.x - enemy.x)
end

function Player:update(dt)
    self.angle = math.atan2(self.y - love.mouse.getY(), self.x - love.mouse.getX()) + math.pi
    self.animation:update(dt)
    if love.keyboard.isDown("d") and self.x < love.graphics.getWidth() then
        self.x = self.x + self.speed * dt
    end
    if love.keyboard.isDown("a") and self.x > 0 then
        self.x = self.x - self.speed * dt
    end
    if love.keyboard.isDown("w") and self.y > 0 then
        self.y = self.y - self.speed * dt
    end
    if love.keyboard.isDown("s") and self.y < love.graphics.getHeight() then
        self.y = self.y + self.speed * dt
    end
end

function Player:reset()
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
end

function Player:draw()
    self.animation:draw(self.x, self.y, self.angle)
end


return Player
