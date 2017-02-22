import random
level = 0

'''
Need to inherit a class called "special" from the master class so that each
special within each subclass can be a separate subclass of the "special" move in
the master class.  Can I do this same thing with "attack". "attack 1", "attack 2", etc?
Do I need to make a trait for inheritance called "turns?"
right now charge attacks only work if knight is user 1 and mage is user 2

Still need to make brute and enemy charge attacks.

where it says if cmd== ... will ideally become u.special(t)

move balance will come with adding speed to the moves.

really need to figure out how to say 'if a certain function is called'
'''


while True:
    level+= 1
    print('Level %d' %(level))

    class charClass:
        def __init__(self, namecall, hit_points, mana_points, str, spd, mag, dfense, turn_num, turn_wait):
            self.name = namecall
            self.hp = hit_points
            self.mp = mana_points
            self.strength = str
            self.speed = spd
            self.magic = mag
            self.defense = dfense
            self.turn = turn_num
            self.turnwait = turn_wait

        def defend(self):
            print('I am defending')

        def move_left(self, distance):
            print("{} moved left: {}".format(self.name, distance))

    '''
    HERO CLASSES
    '''

    class knight(charClass):
        def __init__(self, namecall, hit_points, mana_points, str, spd, mag, dfense, turn_num, turn_wait):
            super().__init__(namecall, hit_points, mana_points, str, spd, mag, dfense, turn_num, turn_wait)           

        def slash(self, target):
            slashPow = ((50 - target.defense)/50) * (self.strength * random.uniform(0.70, 1.10))
            target.hp = target.hp - slashPow  
            print("SLASH!", "enemy lost %d HP" %(slashPow))
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
        def __init__(self, namecall, hit_points, mana_points, str, spd, mag, dfense, turn_num, turn_wait):
            super().__init__(namecall, hit_points, mana_points, str, spd, mag, dfense, turn_num, turn_wait)           

        def fire(self, target):
            firePow = ((50 - target.defense)/50) * (self.magic * random.uniform(0.70, 2.0))
            target.hp = target.hp - firePow
            print("BUUURRRNNN!", "enemy lost %d HP" %(firePow))
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
        def __init__(self,namecall, hit_points, mana_points, str, spd, mag, dfense, turn_num, turn_wait):
            super().__init__(namecall, hit_points, mana_points, str, spd, mag, dfense, turn_num, turn_wait)           

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
            print('In the faaaaace! %s lost %d HP' %(target.name, target.hp))
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
        def __init__(self, namecall, hit_points, mana_points, str, spd, mag, dfense, turn_num, turn_wait):
            super().__init__(namecall, hit_points, mana_points, str, spd, mag, dfense, turn_num, turn_wait)           

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

    print("Class choices are |knight| |mage|  |brute|")
    while True:
        u1choice = input("Choose your first class:")
        if u1choice == 'knight':
            u1 = knight('knight1', 300, 0, 40, 4, 0, 5, 1, 0)
            print('knight added to party')
            break
        if u1choice == 'mage':
            u1 = mage('mage1', 200, 100, 10, 4, 40, 2, 1, 0)
            print('mage added to party')
            break
        if u1choice == 'brute':
            u1 = brute('brute1', 250, 15, 50, 3, 10, 5, 1, 0)
        else:
            continue

    while True:
        u2choice = input("Choose your second class:")
        if u2choice == 'knight':
            u2 = knight('knight2', 300, 0, 40, 4, 0, 5, 1, 0)
            print('knight added to party')
            break
        if u2choice == 'mage':
            u2 = mage('mage2', 200, 100, 10, 4, 40, 2, 1, 0)
            print('mage added to party')
            break
        if u2choice == 'brute':
            u2 = brute('brute2', 250, 15, 50, 3, 10, 5, 1, 0)
            break
        else:
            continue

    e1 = enemy('enemy', random.randint(250,400), 100, random.randint(50, 80), random.randint(3, 5), random.randint(10, 40), random.randint(1, 5), 1, 0)
    print('%s has attacked!' %(e1.name))
    while True:
        targ = input('Who is your target?:')
        if targ == 'enemy':
            t1 = e1
            break
        else:
            continue

    '''
    BATTLE SYSTEM
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

    if (u2.hp > 0 and t1.hp > 0 and u1.hp < 0):
        while(u2.hp > 0 and t1.hp > 0):
            u2.turnwait += (u2.speed + random.randint(-1,1))
            t1.turnwait += (t1.speed + random.randint(-1,1))
            if (u2.turnwait >= 15):
                print(u2.hp)
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
            if t1.turnwait >= 15:
                attack_roll = random.randint(0, 100)
                if attack_roll >=55:
                    attack = 'punch'
                if attack_roll < 55:
                    attack = 'slap'
                cmd ='t1.{}(u2)'.format(attack)
                eval(cmd)                   
                t1.turn += 1
                t1.turnwait = random.randint(0,5)
            
    if (u1.hp > 0 and u2.hp < 0 and t1.hp > 0):    
        while (u1.hp > 0 and t1.hp > 0):
            u1.turnwait += (u1.speed + random.randint(-1,1))
            t1.turnwait += (t1.speed + random.randint(-1,1))
            if (u1.turnwait >= 15):
                print(u1.name, int(u1.hp))
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
            if t1.turnwait >= 15:
                attack_roll = random.randint(0, 100)
                if attack_roll >=55:
                    attack = 'punch'
                if attack_roll < 55:
                    attack = 'slap'
                cmd ='t1.{}(u1)'.format(attack)
                eval(cmd)                   
                t1.turn += 1
                t1.turnwait = random.randint(0,5)

    if (u1.hp < 0 and u2.hp <0 and t1.hp > 0):
        print('You are dead. The game is over. Goodbye.')
        break
            
    if (t1.hp < 0 and u1.hp > 0 and u2.hp > 0):
        print("%s is dead. Congratulations." %(t1.name))





'''

    USER CLASSES - Notice move powers are modified by target's defense stat:
    power * (50-def)/50 = power modified for defense

KNIGHT

        def get_chargeup(self):
            return ['slash', 'rush', 'shieldthrow']


MAGE

        def get_attacks(self):
            return ['fire', 'staffwhack']

        def get_chargeup(self):
            return ['fire', 'staffwhack', 'cardtrick']




BRUTE


        def get_attacks(self):
            return ['bodyslam', 'crush']





        def facestomp(self, target):
            stompPow = self.strength * 2
            target.HP = target.HP - stompPow
            print('In the faaaaace! %s lost %d HP' %(target.name, target.HP))

    ENEMY CLASSES

ENEMY


        def recoup(self):
            self.HP = self.HP + 0.10 * self.HP
        

        'vil_moves = [recoup(), punch()]'


    CHOOSING CLASSES AND TARGETS

            
    print ('Character classes are mage, brute, or knight')

    while True:
        char = input("Choose your first character class: ")
        if char == 'mage':
            u = mage()
        elif char == 'knight':
            u = knight()
        elif char == 'brute':
            u = brute()
        try:
            eval(u.name)
            break
        except:
            print("Sorry. That character doesn't exist...yet")
            continue

    while True:
        char2 = input("Choose your second character class: ")
        if char2 == 'mage':
            u2 = mage()
        elif char2 == 'knight':
            u2 = knight()
        elif char2 == 'brute':
            u2 = brute()
        try:
            eval(u2.name)
            break
        except:
            print("Sorry. That character doesn't exist...yet")
            continue
              
    print ("You are attacked by: enemy")
    while True:
        targ = input("Who is your target?:")
        if targ == 'mage':
            t = mage()
        elif targ == 'knight':
            t = knight()
        elif targ == 'enemy':
            t = enemy()
        try:
            eval(t.name)
            break
        except:
            print("That character isn't attacking you!")
        
    print("Your target is %s." %(t.name))


    BATTLE SYSTEM








        '''
