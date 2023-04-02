local utils = {}

function utils:spawnInPosition()
    local position = {}
    position.x = 0
    position.y = 0

    local side = math.random(1, 4)
    if side == 1 then
        position.x = -30
        position.y = math.random(0, love.graphics.getHeight())
        return position
    elseif side == 2 then
        position.x = love.graphics.getWidth() + 30
        position.y = math.random(0, love.graphics.getHeight())
        return position
    elseif side == 3 then
        position.x = math.random(0, love.graphics.getWidth())
        position.y = -30
        return position
    elseif side == 4 then
        position.x = math.random(0, love.graphics.getWidth())
        position.y = love.graphics.getHeight() + 30
        return position
    end
end

function utils:distanceBetween(x1, y1, x2, y2)
    return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end


return utils