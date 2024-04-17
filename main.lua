--[[

    ========================================================
    Você empunha sua espada e se prepara para lutar.
    É hora da batalha!

    | Prismarine Colossus
    |
    | Enormes estátuas de prismarine que medem mais de 20 metros de altura. Sua aparência ameaçadora pode assustar até os mais bravos guerreiros.
    | Eles têm olhos turquesa brilhantes, mas um elogio não vai te ajudar muito durante uma batalha.
    |
    | Atributos:
    | Vida          ◻️◻️◻️◻️◻️◻️◻️◻️◻️◻️
    | Ataque        ◻️◻️◻️◻️⬛⬛⬛⬛⬛⬛
    | Defesa        ◻️◻️◻️◻️◻️◻️◻️◻️◻️◻️
    | Agilidade     ◻️⬛⬛⬛⬛⬛⬛⬛⬛⬛

    O que você vai fazer?
    1. Atacar com a espada.
    2. Usar uma poção de regeneração.
    3. Atirar uma pedra.
    4. Se esconder.
    >

]]

-- Dependencies
local utils = require "utils"
local player = require "player.player"
local playerActions = require "player.actions"
local colossus = require "colossus.colossus"

-- Habilitar UTF-8 no terminal
utils.enableUtf8()

-- Header
utils.printHeader()

-- Obter a definição do monstro
local boss = colossus

-- Apresentar o monstro
utils.printCreature(boss)

-- Build actions
playerActions.build()

-- Começar o loop de batalha
while true do
    -- Mostrar ações para o jogador
    print()
    print("O que você deseja fazer em seguida?")
    local validPlayerActions = playerActions.getValidActions(player, boss)
    for i, action in pairs(validPlayerActions) do
        print(string.format("%d. %s", i, action.description))
    end

    local chosseIndex = utils.ask()
    local chosenAction = validPlayerActions[chosseIndex]
    local isActionValid = chosenAction ~= nil

    -- Simular o turno do jogador
    if isActionValid then
        chosenAction.execute(player, boss)
    else
        print("Sua ação é inválida. Você perdeu a vez.")
    end

    -- TODO
    -- Ponto de saída: Criatura ficou sem vida.
    if boss.health <= 0 then
        break
    end

    -- Simular o turno da criatura
    -- TODO

    -- Ponto de saída: Jogador ficou sem vida.
    if player.health <= 0 then
        break
    end
end

-- Fim
