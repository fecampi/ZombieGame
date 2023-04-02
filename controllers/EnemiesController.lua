Zombie = require 'entities/Zombie'
local EnemiesController = {}
local instance = nil


zombies = {}
-- Função para criar a instância única da classe
local function createInstance()
    local obj = {}
    obj.bullets = {}
    setmetatable(obj, { __index = EnemiesController })
    return obj
end

function EnemiesController.getInstance()
    if not instance then
        instance = createInstance()
    end
    return instance
end


function EnemiesController:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function EnemiesController:create()
    local position = utils:spawnInPosition()
    table.insert(zombies, Zombie:new(position.x, position.y))
end

function EnemiesController:delete(index)
    zombies[index].dead = true
    table.remove(zombies, index)
end

function EnemiesController:deleteAll(index)
    zombies = {}
end

function EnemiesController:draw()
    for i, z in ipairs(zombies) do
        z.angle = player:zombiePlayerAngle(z)
        z:draw()
    end
end

return EnemiesController
