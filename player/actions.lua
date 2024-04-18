local utils = require "utils"
local actions = {}

actions.list = {}

--
---Cria uma lista de ações que é armazenada internamente
--
function actions.build()
    -- Reset list
    actions.list = {}

    -- Atacar com espada
    local weaponAttack = {
        description = "Atacar com a arma.",
        requeriment = nil,
        execute = function(playerData, creatureData)
            -- 1. Definir a chance de sucesso
            local successChance = creatureData.speed == 0 and 1 or playerData.speed / creatureData.speed
            local success = math.random() <= successChance

            -- 2. Calcular dano
            local rawDamage = playerData.attack - math.random() * creatureData.defense
            local damage = math.max(1, math.ceil(rawDamage))

            if success then
                -- 3. Aplicar o dano em caso de sucesso
                creatureData.health = creatureData.health - damage

                -- 4. Apresentar o resultado como print
                print(string.format("%s atacou %s e causou %d pontos de dano", playerData.name, creatureData.name, damage))
                local healthRate = math.floor((creatureData.health / creatureData.maxHealth) * 10)
                print(string.format("%s: %s", creatureData.name, utils.getProgressBar(healthRate)))
            else
                print(string.format("%s tentou atacar %s, mas esqueceu a arma na mochila.", playerData.name, creatureData.name))
            end
        end
    }

    -- Usar poção de regeneração
    local regenPotion = {
        description = "Tomar uma poção de regeneração.",
        requeriment = function(playerData, creatureData)
            return playerData.potions >= 1
        end,
        execute = function(playerData, creatureData)
            -- Tirar a poção do inventário
            playerData.potions = playerData.potions - 1

            -- Recuperar vida do jogador
            local regenPoints = 10
            playerData.health = math.min(playerData.maxHealth, playerData.health + regenPoints)
            print(string.format("%s usou uma poção e recuperou %d pontos de vida.", playerData.name, regenPoints))
        end
    }


    -- Populate list
    actions.list[#actions.list + 1] = weaponAttack
    actions.list[#actions.list + 1] = regenPotion
end

--
---Retorna uma lista de ações validas
---@param playerData table Definição do jogador
---@param creatureData table Definição da criatura
---@return table
--
function actions.getValidActions(playerData, creatureData)
    local validActions = {}
    for _, action in pairs(actions.list) do
        local requeriment = action.requeriment
        local isValid = requeriment == nil or requeriment(playerData, creatureData)
        if isValid then
            validActions[#validActions + 1] = action
        end
    end
    return validActions
end

return actions
