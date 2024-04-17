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
local utils = require("utils")
local player = require("definitions.player")
local colossus = require("definitions.colossus")

-- Habilitar UTF-8 no terminal
utils.enableUtf8()

-- Header
utils.printHeader()

-- Obter a definição do monstro
local boss = colossus

-- Apresentar o monstro
utils.printCreature(boss)

-- Começar o loop de batalha
while true do

    -- Mostrar ações para o jogador
    -- TODO

    -- Simular o turno do jogador
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