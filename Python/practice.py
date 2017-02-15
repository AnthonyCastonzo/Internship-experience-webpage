def multiply(x,y):
    print(x * y)

def whileloop():
    z = 0
    while z < 10:
        print("I am less than 10")
        z+=1

def breakcontinue():
    names = ["Bob", "Steve", "Jim", "Steve", "Bob", "Bob", "Anthony", "Bob"]
    for name in names:
        if name == "Anthony":
            break

        if name == "Bob":
            continue

        print(name)

def members():
    return "Anthony", "Jack", "Ryan", "Joe", "Leraven"

def oline(member):
    return "A member of the o line is %s" %(member)

def nameOline():
    memberslist = members()
    for member in memberslist:
        print(oline(member))

#Characters

class characterclass:
    HP = 0
    strength = 0
    speed = 0
    MP = 0
knight = characterclass()
knight.HP = 200
knight.strength = 150
knight.speed = 5
knight.MP = 20
mage = characterclass()
mage.HP = 100
mage.strength = 30
mage.speed = 10
mage.MP = 150

def magemelee(character):
    return character.HP - mage.strength

print magemelee(knight)
nameOline()
multiply(2, 3)
whileloop()
breakcontinue()
