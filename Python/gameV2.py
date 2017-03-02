import random

class charClass:

    def attack(self):
        print("Rawr!", self.name)

    def move_left(self, distance):
        print("{} moved left: {}".format(self.name, distance))

class knight():
    def __init__(self):
        self.name = 'knight'
        self.HP = 300
        self.MP = 0
        self.strength = 50
        self.speed = 4
        self.magic = 0

    def get_attacks():
        return ['slash', 'shieldthrow']

    def slash(target):
        slashPow = (knight.strength * 0.5 * random.uniform(0.80, 1.00))
        target.HP = target.HP - slashPow
        print("SLASH!", "%s lost %d HP" %(target.name, slashPow))

    def shieldthrow(target):
        throwPow = (knight.strength * 1.0 * random.uniform(0.80, 1.00))
        print("THWACK!", "%s lost %d HP" %(target.name, throwPow))

class mage():
    def __init__(self):
        self.name = 'mage'
        self.HP = 200
        self.MP = 100
        self.strength = 10
        self.speed = 4
        self.magic = 40

    def get_attacks():
        return ['fire', 'staffwhack']


    def fire(target):
        firePow = (mage.magic * 0.8 * random.uniform(0.80, 1.00))
        target.HP = target.HP - firePow
        print("BUUURRRNNN!", "%s lost %d HP" %(target.name, firePow))

    def staffwhack(target):
        criticalroll= random.randint(1,100)
        if (criticalroll > 80):
            critical = 8.0
        else:
            critical = 1.0
        whackPow = (mage.strength * 1.0 * critical)
        print("SMACK!", "%s lost %d HP" %(target.name, whackPow))

u = input("Choose your character class: ")
print("You have chosen %s" %(u.name))
t = input("Who is your target?:")
print("Your target is %s." %(t.name))

print("Attack options are %s" %(u.get_attacks()))

while (t.HP > 0):
    input ("Choose attack:")(target)
    if t.HP <= 0:
        print("%s is dead. Congratulations." %(t.name))
