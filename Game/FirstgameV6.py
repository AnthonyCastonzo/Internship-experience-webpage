import random
level = 0
user_turn = 1
user2_turn = 1
target_turn = 1

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

        def attack(self):
            print("Rawr!", self.name)

        def move_left(self, distance):
            print("{} moved left: {}".format(self.name, distance))

    '''
    USER CLASSES - Notice move powers are modified by target's defense stat:
    power * (50-def)/50 = power modified for defense
    '''

    class knight():
        def __init__(self):
            self.name = 'knight'
            self.HP = 300
            self.MP = 0
            self.strength = 50
            self.speed = 4
            self.magic = 0
            self.defense = 4

        def get_attacks(self):
            return ['slash', 'rush']

        def get_chargeup(self):
            return ['slash', 'rush', 'shieldthrow']

        def slash(self, target):
            slashPow = ((50 - target.defense)/50) * (self.strength * random.uniform(0.70, 1.10))
            target.HP = target.HP - slashPow  
            print("SLASH!", "%s lost %d HP" %(target.name, slashPow))

        def rush(self, target):
            criticalroll = random.randint(0, 100)
            if criticalroll > 60:
                critical = 2.0
            else:
                critical = 1.0
            rushPow = ((50 - target.defense)/50) * (self.strength * random.uniform(0.20, 0.90))
            target.HP = target.HP - rushPow
            print('WHOOSH!! %s lost %d HP' %(target.name, rushPow))

        def shieldthrow(self, target):
            throwPow = ((50 - target.defense)/50) * (self.strength * random.uniform(1.20, 1.80))
            print("THWACK!", "%s lost %d HP" %(target.name, throwPow))

    class mage():
        def __init__(self):
            self.name = 'mage'
            self.HP = 200
            self.MP = 100
            self.strength = 10
            self.speed = 4
            self.magic = 40
            self.defense = 2
            self.turn = 1

        def get_attacks(self):
            return ['fire', 'staffwhack']

        def get_chargeup(self):
            return ['fire', 'staffwhack', 'cardtrick']


        def fire(self, target):
            firePow = ((50 - target.defense)/50) * (self.magic * random.uniform(0.70, 2.0))
            target.HP = target.HP - firePow
            print("BUUURRRNNN!", "%s lost %d HP" %(target.name, firePow))

        def staffwhack(self, target):
            criticalroll = random.randint(1,100)
            if (criticalroll > 85):
                critical = 8.0
            else:
                critical = 1.0
            whackPow = ((50 - target.defense)/50) * (self.strength * 1.0 * critical)
            target.HP = target.HP - whackPow
            print("SMACK!", "%s lost %d HP" %(target.name, whackPow))

        def cardtrick(self, target): 
            card_chance = random.randint(1, 100)
            if card_chance < 50:
                cardpull = random.randint(0, 4)
            if card_chance >= 50:
                cardpull = random.randint(13, 20)
            cardPow = (((50 - target.defense)/50) * (self.strength * cardpull))
            target.HP = target.HP - cardPow
            if card_chance < 50:
                print('Unlucky draw. %s lost %d HP' %(target.name, cardPow))
            if card_chance >= 50:
                print("Your lucky card!! %s lost %d HP" %(target.name, cardPow))

    class brute():
        def __init__(self):
            self.name = 'brute'
            self.HP = 250
            self.MP = 15
            self.strength = 50
            self.speed = 3
            self.magic = 10
            self.defense = 5
            self.turn = 1

        def get_attacks(self):
            return ['bodyslam', 'crush']

        def bodyslam(self, target):
            criticalroll = random.randint(0, 100)
            if criticalroll > 92:
                critical = 2.2
            else:
                critical = 1.0
            slamPow = ((50 - target.defense)/50) * (self.strength * random.uniform(0.55, 1.3) * critical)
            target.HP = target.HP - slamPow
            print('KABOOM! %s lost %d HP' %(target.name, slamPow))

        def crush(self, target):
            accuracyroll = random.randint(0, 100)
            if accuracyroll > 50:
                accuracy = 0
            else:
                accuracy = 1
            crushPow = ((50 - target.defense)/50) * (self.strength * 2.5 * accuracy)
            target.HP = target.HP - crushPow
            if crushPow == 0:
                print('Whiff! You missed!')
            else:
                print("Crush...%s lost %d HP" %(target.name, crushPow))

        def facestomp(self, target):
            stompPow = self.strength * 2
            target.HP = target.HP - stompPow
            print('In the faaaaace! %s lost %d HP' %(target.name, target.HP))
    '''
    ENEMY CLASSES
    '''

    class enemy():
        def __init__(self):
            self.name = 'enemy'
            self.HP = random.randint(250,400)
            self.MP = 100
            self.strength = random.randint(60, 80)
            self.speed = random.randint(3,5)
            self.magic = random.randint(10, 40)
            self.defense = random.randint (1, 5)
            self.turn = 1
        
        ''''def recoup(self):
            self.HP = self.HP + 0.10 * self.HP'''
        def punch(self, user):
            criticalroll= random.randint(1,100)
            if (criticalroll > 80):
                critical = 3.0
            else:
                critical = 1.0
            punchPow = ((50 - user.defense)/50)*(self.strength * 1.0 * random.uniform(0.6, 1.0) * critical)
            user.HP = user.HP - punchPow
            print("Ouch! %s got punched and lost %d HP!" %(user.name, punchPow))

        'vil_moves = [recoup(), punch()]'

    '''
    CHOOSING CLASSES AND TARGETS
    '''
            
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

    '''
    BATTLE SYSTEM
    '''

    user_speed = u.speed
    user2_speed = u2.speed
    target_speed = t.speed

    if (u.HP > 0 and u2.HP > 0 and t.HP > 0):
        while(u.HP > 0 and u2.HP > 0 and t.HP > 0):
            user_speed += (u.speed + random.randint(-1,1))
            user2_speed += (u2.speed + random.randint(-1,1))
            target_speed += (t.speed + random.randint(-1,1))
            if (user_speed < 15 and user2_speed < 15 and target_speed < 15):
                continue
            if (user_speed >= 15):
                print(u.name, int(u.HP))
                print(u2.name, int(u2.HP))
                print("Attack options are %s" %(u.get_attacks()))
                a = input ("Choose attack (%s):" %(char))
                cmd = 'u.{}(t)'.format(a)
                try:
                    eval(cmd)
                    user_turn += 1
                    user_speed = random.randint(0,5)
                except:
                    print('invalid command')
            elif (user2_speed >= 15):
                print(u.name, int(u.HP))
                print(u2.name, int(u2.HP))
                print("Attack options are %s" %(u2.get_attacks()))
                a = input ("Choose attack (%s):" %(char2))
                cmd = 'u2.{}(t)'.format(a)
                try:
                    eval(cmd)
                    user2_turn += 1
                    user2_speed = random.randint(0,5)
                except:
                    print('invalid command')
            elif target_speed >= 15:
                attack_targ_roll = random.randint(0, 100)
                if attack_targ_roll >= 50:
                    t.punch(u)
                if attack_targ_roll < 50:
                    t.punch(u2)
                '''z = vil_moves[random.randint(0, (len(vil_moves) - 1))]
                cmd2 = 'z({}'.format(u)
                print(cmd2)'''
                target_turn += 1
                target_speed = random.randint(0,5)

    if (u2.HP > 0 and t.HP > 0 and u.HP < 0):
        while(u2.HP > 0 and t.HP > 0):
            user2_speed += (u2.speed + random.randint(-1,1))
            target_speed += (t.speed + random.randint(-1,1))
            if (user2_speed >= 15):
                print(user2.HP)
                print("Attack options are %s" %(u2.get_attacks()))
                a = input ("Choose attack (%s):" %(char2))
                cmd = 'u2.{}(t)'.format(a)
                try:
                    eval(cmd)
                    user2_turn += 1
                    user2_speed = random.randint(0,5)
                except:
                    print('invalid command')
            if target_speed >= 15:
                t.punch(u2)
                target_turn += 1
                target_speed = random.randint(0,5)
            
    if (u.HP > 0 and u2.HP < 0 and t.HP > 0):    
        while (u.HP > 0 and t.HP > 0):
            user_speed += (u.speed + random.randint(-1,1))
            target_speed += (t.speed + random.randint(-1,1))
            if (user_speed >= 15):
                print(u.name, int(u.HP))
                print("Attack options are %s" %(u.get_attacks()))
                a = input ("Choose attack (%s):" %(char))
                cmd = 'u.{}(t)'.format(a)
                try:
                    eval(cmd)
                    user_turn += 1
                    user_speed = random.randint(0,5)
                except:
                    print('invalid command')
            if target_speed >= 15:
                t.punch(u)
                '''z = vil_moves[random.randint(0, (len(vil_moves) - 1))]
                cmd2 = 'z({}'.format(u)
                print(cmd2)'''
                target_turn += 1
                target_speed = random.randint(0,5)

    if (u.HP < 0 and u2.HP <0 and t.HP > 0):
        print('You are dead. The game is over. Goodbye.')
        break
        
    if (t.HP < 0 and u.HP > 0 and u2.HP > 0):
        print("%s is dead. Congratulations." %(t.name))
