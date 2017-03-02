'''
not recognizing the variables i am formatting into the command as legit
'''
phoenixdownInv = 1
potionInv = 1
def potion(toBeHealed):
    if toBeHealed.hp <= 0:
        pass
    else:
        toBeHealed.hp += 30
        if toBeHealed.hp >= toBeHealed.maxhp:
            toBeHealed.hp = toBeHealed.maxhp
        print("%s gains 30 HP" %(toBeHealed.name))
        global potionInv
        potionInv -= 1
def phoenixdown(deadGuy):
    if deadGuy.hp <= 0:
        deadGuy.hp = 0.5 * deadGuy.maxhp
        print("%s returns from the grave" %deadGuy.name)
        global phoenixdownInv
        phoenixdownInv -= 1
    else:
        pass
while True:    
    item = input('Use item? |potion| |phoenixdown|:')
    if item == ('potion'):
        healee_name = input('On whom?:')
        if healee_name == u1.name:
            healee = u1
        elif healee_name == u2.name:
            healee = u2
        else:
            print('Not in your party!')
            continue
        if potionInv > 0:
            potion(healee)
        else:
            print('None left!')
        continue
    if item == ('phoenixdown'):
        revivee_name = input('On whom?:')
        if revivee_name == u1.name:
            revivee = u1
        elif revivee_name == u2.name:
            revivee = u2
        else:
            print('Not in your party')
            continue
        if phoenixdownInv > 0:
            phoenixdown(revivee)
            continue
        else:
            print('None left!')
        continue
    if item == ('no'):
        break
    else:
        print("Not an item")
        
        
