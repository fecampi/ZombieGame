local Animation = {}

function Animation:new(url, width, height, duration, scale)
    local obj = {}
    obj.image = love.graphics.newImage(url)
    obj.width = width;
    obj.height = height
    obj.spriteSheet = obj.image;
    obj.quads = {};
    obj.scaledWidth = (width * scale) / width;
    obj.scaledHeight = (height * scale) / height;
    for y = 0, obj.image:getHeight() - height, height do
        for x = 0, obj.image:getWidth() - width, width do
            table.insert(obj.quads, love.graphics.newQuad(x, y, width, height, obj.image:getDimensions()))
        end
    end
    obj.duration = duration or 1
    obj.currentTime = 0
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Animation:update(dt)
    self.currentTime = self.currentTime + dt
    if self.currentTime >= self.duration then
        self.currentTime = self.currentTime - self.duration
    end
end

function Animation:draw(x, y, angle)
    local spriteNum = math.floor(self.currentTime / self.duration * #self.quads) + 1
    love.graphics.draw(self.spriteSheet, self.quads[spriteNum], x, y, angle, self.scaledWidth, self.scaledHeight,
        self.width / 2, self.height / 2)
end

return Animation