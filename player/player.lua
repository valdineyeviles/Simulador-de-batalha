local player = {}

player.jobType = {
    [1] = {
        race = "Guerreiro",
        weapon = "Espada",
        description = "Destemido pela capacidade de empunhar duas espadas.",
        health = 8,
        attack = 5,
        defense = 4,
        speed = 3
    },
    [2] = {
        race = "Arqueiro",
        weapon = "Arco",
        description = "Realiza ataques a longa distância e é bem ágil.",
        health = 5,
        attack = 8,
        defense = 2,
        speed = 5
    },
    [3] = {
        race = "Tank",
        weapon = "Martelo",
        description = "Conhecido pela seu poder de tankar monstros poderosos.",
        health = 10,
        attack = 3,
        defense = 8,
        speed = 2
    },
}

player.name = ""
player.job = 0
player.description = ""
player.health = 0
player.maxHealth = 0
player.attack = 0
player.defense = 0
player.speed = 0

player.potions = 3

return player