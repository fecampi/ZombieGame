function love.load()
    utils = require 'lib/utils'
    Background = require 'views/Background'
    Player = require 'entities/Player'
    Entity = require 'entities/Entity'
    Menu = require 'views/Menu'
    Animation = require 'lib/Animation'
    EnemiesController = require 'controllers/EnemiesController'
    BulletsController = require 'controllers/BulletsController'
    math.randomseed(os.time())
    background = Background:new()
    menu = Menu:new('Click para começar!')
    player = Player:new()
    enemiesController = EnemiesController:getInstance()
    bulletsController = BulletsController:getInstance()
    gameState = 1
    score = 0
    maxTime = 2
    timer = maxTime
end

function love.update(dt)
    if gameState == 2 then
        player:update(dt)
        bulletsController:update(dt)
        timer = timer - dt
        if timer <= 0 then
            enemiesController:create()
            maxTime = 0.95 * maxTime
            timer = maxTime
        end

        for i, z in ipairs(zombies) do
            z:update(dt)
            if utils:distanceBetween(z.x, z.y, player.x, player.y) < 30 then
                gameState = 1
                player:reset()
                enemiesController:deleteAll()
            end

            for j, b in ipairs(bulletsController.bullets) do
                if utils:distanceBetween(z.x, z.y, b.x, b.y) < 20 then
                    bulletsController:delete(j)
                    enemiesController:delete(i)
                    score = score + 1
                end
            end

        end
    end
end

function love.draw()
    background:draw()
    if gameState == 1 then
        menu:draw()
    elseif gameState == 2 then
        player:draw()
        enemiesController:draw()
        bulletsController:draw()
        love.graphics.printf("Score: " .. score, 0, 0, love.graphics.getWidth(), "center")
    end

end

function love.mousepressed(x, y, button)
    if button == 1 and gameState == 2 then
        bulletsController:create()
    elseif button == 1 and gameState == 1 then
        gameState = 2
        maxTime = 2
        timer = maxTime
        score = 0
    end
end

