import random
level = 0
potionInv = 1
phoenixdownInv = 1

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
    
class charClass:
    def __init__(self, namecall, maxhit_points, mana_points, strg, spd, mag, dfense, turn_num, turn_wait, exp, lev, hit_points):
        self.name = namecall
        self.maxhp = maxhit_points
        self.maxmp = mana_points
        self.strength = strg
        self.speed = spd
        self.magic = mag
        self.defense = dfense
        self.turn = turn_num
        self.turnwait = turn_wait
        self.exp = exp
        self.level = lev
        self.hp = hit_points
        
    def levelup(self):
        self.level += 1
        self.maxhp += (0.10 * self.maxhp)
        self.maxmp += (0.10 * self.maxmp)
        self.strength += (0.10 * self.strength)
        self.speed += (0.10 * self.speed)
        self.magic += (0.10 * self.magic)
        self.defense += (0.10 * self.defense)
        
    def defend(self):
        print('I am defending')

    def move_left(self, distance):
        print("{} moved left: {}".format(self.name, distance))

'''
HERO CLASSES
'''

class knight(charClass):
    def __init__(self, namecall, maxhit_points, mana_points, strg, spd, mag, dfense, turn_num, turn_wait, exp, lev, hit_points):
        super().__init__(namecall, maxhit_points, mana_points, strg, spd, mag, dfense, turn_num, turn_wait, exp, lev, hit_points)
        
    def slash(self, target):
        slashPow = ((50 - target.defense)/50) * (self.strength * random.uniform(0.70, 1.10))
        target.hp = target.hp - slashPow  
        print("SLASH!", "%s lost %d HP" %(target.name, slashPow))
        self.turnwait -= random.randint(15, 20)

    def rush(self, target):
        criticalroll = random.randint(0, 100)
        if criticalroll > 60:
            critical = 2.0
        else:
            critical = 1.0
        rushPow = ((50 - target.defense)/50) * (self.strength * random.uniform(0.20, 0.90))
        target.hp = target.hp - rushPow
        print('WHOOSH!! %s lost %d HP' %(target.name, rushPow))
        self.turnwait -= random.randint(12, 15)

    def shieldthrow(self, target):
        throwPow = ((50 - target.defense)/50) * (self.strength * random.uniform(1.20, 1.80))
        target.hp = target.hp - throwPow
        print("THWACK!", "%s lost %d HP" %(target.name, throwPow))
        self.turn = 0
        self.turnwait -= 22

    def get_attacks(self):
        return ['slash', 'rush']
    def get_charge(self):
        return 'shieldthrow'

class mage(charClass):
    def __init__(self, namecall, maxhit_points, mana_points, strg, spd, mag, dfense, turn_num, turn_wait, exp, lev, hit_points):
        super().__init__(namecall, maxhit_points, mana_points, strg, spd, mag, dfense, turn_num, turn_wait, exp, lev, hit_points)           

    def fire(self, target):
        firePow = ((50 - target.defense)/50) * (self.magic * random.uniform(0.70, 2.0))
        target.hp = target.hp - firePow
        print("BUUURRRNNN!", "%s lost %d HP" %(target.name, firePow))
        self.turnwait -= random.randint(15, 20)

    def staffwhack(self, target):
        criticalroll = random.randint(1,100)
        if (criticalroll > 85):
            critical = 8.0
        else:
            critical = 1.0
        whackPow = ((50 - target.defense)/50) * (self.strength * 1.0 * critical)
        target.hp = target.hp - whackPow
        print("SMACK!", "%s lost %d HP" %(target.name, whackPow))
        self.turnwait -= random.randint(10, 15)

    def cardtrick(self, target): 
        card_chance = random.randint(1, 100)
        if card_chance < 50:
            cardpull = random.randint(0, 4)
        if card_chance >= 50:
            cardpull = random.randint(13, 20)
        cardPow = (((50 - target.defense)/50) * (self.strength * cardpull))
        target.hp = target.hp - cardPow
        if card_chance < 50:
            print('Unlucky draw. %s lost %d HP' %(target.name, cardPow))
        if card_chance >= 50:
            print("Your lucky card!! %s lost %d HP" %(target.name, cardPow))
        self.turn = 0
        self.turnwait -= 22


    def get_attacks(self):
        return ['fire', 'staffwhack']
    def get_charge(self):
        return 'cardtrick'

class brute(charClass):
    def __init__(self,namecall, maxhit_points, mana_points, strg, spd, mag, dfense, turn_num, turn_wait, exp, lev, hit_points):
        super().__init__(namecall, maxhit_points, mana_points, strg, spd, mag, dfense, turn_num, turn_wait, exp, lev, hit_points)           

    def bodyslam(self, target):
        criticalroll = random.randint(0, 100)
        if criticalroll > 92:
            critical = 2.2
        else:
            critical = 1.0
        slamPow = ((50 - target.defense)/50) * (self.strength * random.uniform(0.55, 1.3) * critical)
        target.hp = target.hp - slamPow
        print('KABOOM! %s lost %d HP' %(target.name, slamPow))
        self.turnwait -= random.randint(15, 20)

    def crush(self, target):
        accuracyroll = random.randint(0, 100)
        if accuracyroll > 50:
            accuracy = 0
        else:
            accuracy = 1
        crushPow = ((50 - target.defense)/50) * (self.strength * 2.5 * accuracy)
        target.hp = target.hp - crushPow
        if crushPow == 0:
            print('Whiff! You missed!')
        else:
            print("Crush...%s lost %d HP" %(target.name, crushPow))
        self.turnwait -= random.randint(18, 20)

    def facestomp(self, target):
        stompPow = self.strength * 2
        target.hp = target.hp - stompPow
        print('In the faaaaace! %s lost %d HP' %(target.name, stompPow))
        self.turn = 0
        self.turnwait -= 22

    def get_attacks(self):
        return ['bodyslam', 'crush']
    def get_charge(self):
        return 'facestomp'
        



'''
ENEMY CLASSES
'''


class enemy(charClass):
    def __init__(self, namecall, maxhit_points, mana_points, strg, spd, mag, dfense, turn_num, turn_wait, exp, lev, hit_points):
        super().__init__(namecall, maxhit_points, mana_points, strg, spd, mag, dfense, turn_num, turn_wait, exp, lev, hit_points)           

    def punch(self, user):
        criticalroll= random.randint(1,100)
        if (criticalroll > 80):
            critical = 3.0
        else:
            critical = 1.0
        punchPow = ((50 - user.defense)/50)*(self.strength * 1.0 * random.uniform(0.6, 1.0) * critical)
        user.hp = user.hp - punchPow
        print("Ouch! %s got punched and lost %d HP!" %(user.name, punchPow))
        self.turnwait -= random.randint(12, 18)

    def slap(self, user):
        criticalroll= random.randint(1,100)
        if (criticalroll > 80):
            critical = 1.8
        else:
            critical = 1.0
        slapPow = ((50 - user.defense)/50)*(self.strength * random.uniform(0.3, 1.8) * critical)
        user.hp = user.hp - slapPow
        print("SMACK! %s got slapped and lost %d HP!" %(user.name, slapPow))
        self.turnwait -= random.randint(11, 16)            
        
    def get_attacks(self):
        return ['punch', 'slap']
    
'''
CHARACTER CHOOSING
'''

z = knight('Knight', 300, 0, 40, 4, 0, 5, 1, 0, 0, 1, 300)
b = mage('Mage', 200, 100, 10, 4, 40, 2, 1, 0, 0, 1, 200)
c = brute('Brute', 250, 15, 50, 3, 10, 5, 1, 0, 0, 1, 200)
ehp = random.randint(250, 400)

'''
BATTLE SYSTEM
'''
while True:
    e1 = enemy('Troll', ehp, 100, random.randint(50, 80), random.randint(3, 5), random.randint(10, 40), random.randint(1, 5), 1, 0, 100, 1, ehp)
    print('%s has attacked!' %(e1.name))
    while True:
        targ = input('Who is your target?:')
        if targ == 'Troll':
            t1 = e1
            break
        else:
            continue
    level+= 1
    print('Level %d' %(level))
    print("Character choices are |Knight| |Mage|  |Brute|")
    while True:
        u1choice = input("Choose your first character:")
        if u1choice == 'Knight':
            u1 = z
            print('knight added to party')
            break
        if u1choice == 'Mage':
            u1 = b
            print('mage added to party')
            break
        if u1choice == 'Brute':
            u1 = c
            print('brute added to party')
            break
        else:
            continue
    '''
        if u1choice == 'sirknight':
            u1 = knight('Sir Knight', 300, 0, 40, 4, 0, 5, 1, 0, lev)
            print('knight added to party')
            break
        if u1choice == 'magician':
            u1 = mage('Magician', 200, 100, 10, 4, 40, 2, 1, 0, 1)
            print('mage added to party')
            break
        if u1choice == 'knucks':
            u1 = brute('Knucks', 250, 15, 50, 3, 10, 5, 1, 0, 1)
            print'brute added to party')
        else:
            continue
'''

    while True:
        u2choice = input("Choose your second character:")
        if u2choice == 'Knight':
            u2 = z
            if u2choice == u1choice:
                print('Already chosen. Select again.')
                continue
            else:
                print('knight added to party')
                break
        if u2choice == 'Mage':
            u2 = b
            if u2choice == u1choice:
                print('Already chosen. Select again.')
                continue
            else:
                print('mage added to party')
                break
        if u2choice == 'Brute':
            u2 = c
            if u2choice == u1choice:
                print('Already chosen. Select again.')
                continue
            else:
                print('brute added to party')
                break
        else:
            continue 
    '''
        if u2choice == 'sirknight':
            u2 = knight('Sir Knight', 300, 0, 40, 4, 0, 5, 1, 0, 1)
            if u2 == u1:
                print('Already chosen. Select again.')
                continue
            else:
                print('knight added to party')
                break
        if u2choice == 'magician':
            u2 = mage('Magician', 200, 100, 10, 4, 40, 2, 1, 0, 1)
            if u2 == u1:
                print('Already chosen. Select again.')
                continue
            else:
                print('mage added to party')
                break
        if u2choice == 'knucks':
            u2 = brute('Knucks', 250, 15, 50, 3, 10, 5, 1, 0, 1)
            if u2 == u1:
                print('Already chosen. Select again.')
                continue
            else:
                print('brute added to party')
                break
    '''       

    if (u1.hp > 0 and u2.hp > 0 and t1.hp > 0):
        while(u1.hp > 0 and u2.hp > 0 and t1.hp > 0):
            u1.turnwait += (u1.speed + random.randint(-1,1))
            u2.turnwait += (u2.speed + random.randint(-1,1))
            t1.turnwait += (t1.speed + random.randint(-1,1))
            if (u1.turnwait < 15 and u2.turnwait < 15 and t1.turnwait < 15):
                continue
            if (u1.turnwait >= 15):
                print(u1.name, int(u1.hp))
                print(u2.name, int(u2.hp))
                if u1.turn < 3:
                    print("Attack options are %s" %(u1.get_attacks()))
                if u1.turn >= 3:
                    print("Attack options are %s, %s" %(u1.get_attacks(), u1.get_charge()))                    
                a = input ("Choose attack (%s):" %(u1.name))
                cmd = 'u1.{}(t1)'.format(a)
                try:
                    eval(cmd)
                    u1.turn += 1
                    u1.turnwait = random.randint(0,5)
                except:
                    print('invalid command')
            elif (u2.turnwait >= 15):
                print(u1.name, int(u1.hp))
                print(u2.name, int(u2.hp))
                if u2.turn < 3:
                    print("Attack options are %s" %(u2.get_attacks()))
                if u2.turn >= 3:
                    print("Attack options are %s, %s" %(u2.get_attacks(), u2.get_charge())) 
                a = input ("Choose attack (%s):" %(u2.name))
                cmd = 'u2.{}(t1)'.format(a)
                try:
                    eval(cmd)
                    u2.turn += 1
                    u2.turnwait = random.randint(0,5)
                except:
                    print('invalid command')
            elif t1.turnwait >= 15:
                attack_roll = random.randint(0, 100)
                if attack_roll >=55:
                    attack = 'punch'
                if attack_roll < 55:
                    attack = 'slap'
                attack_targ_roll = random.randint(0, 100)
                if attack_targ_roll >= 50:
                    cmd ='t1.{}(u1)'.format(attack)
                    eval(cmd)
                if attack_targ_roll < 50:
                    cmd ='t1.{}(u2)'.format(attack)
                    eval(cmd)                   
                t1.turn += 1
                t1.turnwait = random.randint(0,5)
            

    if (u2.hp > 0 and t1.hp > 0 and u1.hp <= 0):
        while(u2.hp > 0 and t1.hp > 0):
            u2.turnwait += (u2.speed + random.randint(-1,1))
            t1.turnwait += (t1.speed + random.randint(-1,1))
            if (u2.turnwait >= 15):
                print(u1.name, 0)
                print(u2.name, int(u2.hp))
                if u2.turn < 3:
                    print("Attack options are %s" %(u2.get_attacks()))
                if u2.turn >= 3:
                    print("Attack options are %s, %s" %(u2.get_attacks(), u2.get_charge())) 
                a = input ("Choose attack (%s):" %(u2.name))
                cmd = 'u2.{}(t1)'.format(a)
                try:
                    eval(cmd)
                    u2.turn += 1
                    u2.turnwait = random.randint(0,5)
                except:
                    print('invalid command')
            elif t1.turnwait >= 15:
                attack_roll = random.randint(0, 100)
                if attack_roll >=55:
                    attack = 'punch'
                if attack_roll < 55:
                    attack = 'slap'
                cmd ='t1.{}(u2)'.format(attack)
                eval(cmd)                   
                t1.turn += 1
                t1.turnwait = random.randint(0,5)
            
    if (u1.hp > 0 and u2.hp <= 0 and t1.hp > 0):    
        while (u1.hp > 0 and t1.hp > 0):
            u1.turnwait += (u1.speed + random.randint(-1,1))
            t1.turnwait += (t1.speed + random.randint(-1,1))
            if (u1.turnwait >= 15):
                print(u1.name, int(u1.hp))
                print(u2.name, 0)
                if u1.turn < 3:
                    print("Attack options are %s" %(u1.get_attacks()))
                if u1.turn >= 3:
                    print("Attack options are %s, %s" %(u1.get_attacks(), u1.get_charge())) 
                a = input ("Choose attack (%s):" %(u1.name))
                cmd = 'u1.{}(t1)'.format(a)
                try:
                    eval(cmd)
                    u.turn += 1
                    u1.turnwait = random.randint(0,5)
                except:
                    print('invalid command')
            elif t1.turnwait >= 15:
                attack_roll = random.randint(0, 100)
                if attack_roll >=55:
                    attack = 'punch'
                if attack_roll < 55:
                    attack = 'slap'
                cmd ='t1.{}(u1)'.format(attack)
                eval(cmd)                   
                t1.turn += 1
                t1.turnwait = random.randint(0,5)

    if (u1.hp <= 0 and u2.hp <= 0 and t1.hp > 0):
        print('%s HP: 0' %(u1.name))
        print('%s HP: 0' %(u2.name))
        print('You are dead. The game is over. Goodbye.')
        break
    
    if (t1.hp <= 0 and u2.hp > 0 and u1.hp > 0):
        u1.exp += (0.5 * t1.exp)
        u2.exp += (0.5 * t1.exp)
        if u1.exp >= 100:
            u1.levelup()
            u1.exp = 0
        if u2.exp >= 100:
            u2.levelup()
            u2.exp = 0
        print("%s is dead. Congratulations." %(t1.name))
        print ("%s exp: %d" %(u1.name, u1.exp))
        print ("%s exp: %d" %(u2.name, u2.exp))
        print('%s HP: %d' %(u1.name, u1.hp))
        print('%s HP: %d' %(u2.name, u2.hp))
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
                
    if (t1.hp <= 0 and u2.hp <= 0 and u1.hp > 0):
        u1.exp += t1.exp
        if u1.exp >= 100:
            u1.levelup()
            u1.exp = 0       
        print("%s is dead. Congratulations." %(t1.name))
        print ("%s exp: %d" %(u1.name, u1.exp))
        print('%s HP: %d' %(u1.name, u1.hp))
        print('%s HP: 0' %(u2.name))
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
        
    if (t1.hp <= 0 and u2.hp > 0 and u1.hp <= 0):
        u2.exp += t1.exp
        if u2.exp >= 100:
            u2.levelup()
            u2.exp = 0
        print("%s is dead. Congratulations." %(t1.name))
        print ("%s exp: %d" %(u2.name,u2.exp))
        print('%s HP: 0' %(u1.name))
        print('%s HP: %d' %(u2.name, u2.hp)) 
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
