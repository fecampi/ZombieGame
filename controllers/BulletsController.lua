Bullet = require 'entities/Bullet'

local BulletsController = {}
local instance = nil

-- Função para criar a instância única da classe
local function createInstance()
    local obj = {}
    obj.bullets = {}
    setmetatable(obj, { __index = BulletsController })
    return obj
end

function BulletsController.getInstance()
    if not instance then
        instance = createInstance()
    end
    return instance
end

function BulletsController:draw()
    for i, b in ipairs(self.bullets) do
        b:draw()
    end
end

function BulletsController:update(dt)
    for i, b in ipairs(self.bullets) do
        b:update(dt)
        if b.dead then
            self:delete(i)
        end
    end
end

function BulletsController:delete(index)
    table.remove(self.bullets, index)
end

function BulletsController:create()
    table.insert(self.bullets, Bullet:new(player.x, player.y, player.angle))
end

return BulletsController
