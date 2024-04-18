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
---Define os atributos do jogador de acordo com a classe escolhida.
---@param player table
---@param jobId number
--
function utils.playerAttrSet(player, jobId)
    print()
    print(string.format("%s, você escolheu ser um: %s!", player.name, player.jobType[jobId].race))
    player.job = jobId
    player.description = player.jobType[jobId].description
    player.health = player.jobType[jobId].health
    player.maxHealth = player.jobType[jobId].health
    player.attack = player.jobType[jobId].attack
    player.defense = player.jobType[jobId].defense
    player.speed = player.jobType[jobId].speed
    print()
end

--
--
---Faz o print das informações de uma criatura.
---@param creature table
function utils.printCreature(creature)
    -- Calculate health rate
    local healthRate = math.floor((creature.health / creature.maxHealth) * 10)

    -- Cartão
    print("| * BOSS: " .. creature.name)
    print("| ")
    print("| " .. creature.description)
    print("| ")
    print("| Atributos")
    print("|    Vida:           " .. utils.getProgressBar(creature.maxHealth))
    print("|    Ataque:         " .. utils.getProgressBar(creature.attack))
    print("|    Defesa:         " .. utils.getProgressBar(creature.defense))
    print("|    Velocidade:     " .. utils.getProgressBar(creature.speed))
end

function utils.printPlayer(player)
    -- Calculate health rate
    local healthRate = math.floor((player.health / player.maxHealth) * 10)

    -- Cartão
    print("| * Player: " .. player.name)
    print("| ")
    print("| " .. player.description)
    print("| ")
    print("| Atributos")
    print("|    Vida:                       " .. utils.getProgressBar(player.maxHealth))
    print("|    Ataque:                     " .. utils.getProgressBar(player.attack))
    print("|    Defesa:                     " .. utils.getProgressBar(player.defense))
    print("|    Velocidade:                 " .. utils.getProgressBar(player.speed))
    print("|    Poções de recuperação:      " .. player.potions)
end

---Pergunta ao usuário por um número, que é retornado pela função
---@return any
function utils.ask()
    io.write(">")
    local answer = io.read("*n")
    return answer
end

---Pergunta ao usuário o nome que ele quer para seu personagem, que é retornado pela função
---@return string nome do jogador
function utils.askPlayerName()
    io.write(">")
    local name = io.read()
    return name
end

function utils.checkIsValidPlayerName(playerName)
    local nameLenght = string.len(playerName)
    -- Verifica se o nome do jogador tem entre 4 e 16 caracteres
    if nameLenght >= 3 and nameLenght <= 16 then
        -- Verifica se o nome do jogador contém apenas letras (a-z, A-Z) ou números (0-9)
        if string.match(playerName, "^[a-zA-Z0-9]+$") then
            return true
        else
            return false, "Seu nome deve conter apenas letras e números."
        end
    else
        return false, "Seu nome deve ter entre 4 e 16 caracteres."
    end
end

function utils.checkIsValidJob(jobId)
    if type(jobId) == "number" then
        if jobId > 0 and jobId < 4 then
            return true
        else
            return false,
                "O jogo possui apenas 3 classes, escolha um número entre 1 e 3.\n 1 = Guerreiro, 2 = Arqueiro, 3 = Tank"
        end
    else
        return false, "Por favor digite um número entre 1 e 3 para definir a classe do seu personagem."
    end
end

return utils
