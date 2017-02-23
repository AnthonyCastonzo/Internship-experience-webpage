class charClass:
    def __init__(self, name):
        self.name = name
        self.HP = 0
        self.MP = 0
        self.strength = 0
        self.speed = 0
        self.magic = 0

    def attack(self):
        print("Rawr!", self.name)

    def move_left(self, distance):
        print("{} moved left: {}".format(self.name, distance))

knight = charClass('knight')
knight.HP = 300
knight.MP = 0
knight.strength = 50
knight.speed = 4
knight.magic = 0
def knightslash(target):
    import random
    slashPow = (knight.strength * 0.5 * random.uniform(0.80, 1.00))
    target.HP = target.HP - slashPow
    print("SLASH!", "%s lost %d HP" %(target.name, slashPow))



mage = charClass('mage')
mage.HP = 200
mage.MP = 100
mage.strength = 10
mage.speed = 4
mage.magic = 40

userChar = input("Choose your character class: ")
print("You have chosen %s" %(userChar.name))

while (target.HP > 0):
    knightslash(input("Whom would you like to slash?:"))
    if target.HP <= 0:
        print("%s is dead. Congratulations." %(target.name))
