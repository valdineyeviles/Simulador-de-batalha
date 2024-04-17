local utils = {}

--
---Essa função habilita o modo UTF-8 no terminal do vscode.
--
function utils.enableUtf8()
    os.execute("chcp 65001")
end

---Faz o print da apresentação do simulador no terminal.
function utils.printHeader()
    print([[
======================================================================================
        _____
        \   /
        |   |
    .__.         |   |_____________________________________________
    |  |_________|   |                                              \
    |  |         |   |________________________________________________\
    |  |_________|   |                                                /
    |__|         |   |_____________________________________________ /
        |   |
        |   |
        /___\
        
                    -----------------------------------------------
==                            ⚔️    SIMULADOR DE BATALHA    ⚔️                     ==
======================================================================================

                        Você empunha sua espada e se prepara para lutar.
                                      É hora da batalha!
        ]])
end

--
---Calcula uma barra de progresso ASCII baseada em um atributo.
---@param attribute number Número de 0 a  10.
---@return string
--
function utils.getProgressBar(attribute)
    local fullChar = "◻️"
    local emptyChar = "⬛"

    local result = ""
    for i = 1, 10, 1 do
        -- if i <= attribute then
            -- result = result .. fullChar
        -- else
            -- result = result .. emptyChar
        -- end        
        result = result .. (i <= attribute and fullChar or emptyChar)
    end
    return result
end

--
---Faz o print das informações de uma criatura.
---@param creature table
--
function utils.printCreature(creature)
    -- Calculate health rate
    local healthRate = math.floor((creature.health / creature.maxHealth) * 10)

    -- Cartão
    print("| " .. creature.name)
    print("| ")
    print("| " .. creature.description)
    print("| ")
    print("| Atributos")
    print("|    Vida:           " .. utils.getProgressBar(healthRate))
    print("|    Ataque:         " .. utils.getProgressBar(creature.attack))
    print("|    Defesa:         " .. utils.getProgressBar(creature.defense))
    print("|    Velocidade:     " .. utils.getProgressBar(creature.speed))
end

return utils
