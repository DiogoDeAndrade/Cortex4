import random

def remove_from_list(l, i):
    if i in l:
        l.remove(i)

skin = [ "yellow", "magenta", "white", "black", "red" ]
shirt = [ "white", "yellow", "green", "cyan", "red", "magenta" ]
eyes = [ "blue", "black", "green", "red" ]
suit = [ "blue", "black", "green", "red" , "white" ]
hair = [ "black", "yellow", "red", "white", "none" ]

sel_skin = random.choice(skin)
remove_from_list(suit, sel_skin)
remove_from_list(hair, sel_skin)
sel_eyes = random.choice(eyes)
sel_suit = random.choice(suit)
sel_tie = random.choice(suit)
remove_from_list(hair, sel_suit)
remove_from_list(hair, sel_tie)
remove_from_list(shirt, sel_suit)
remove_from_list(shirt, sel_tie)
sel_shirt = random.choice(shirt)
sel_hair = random.choice(hair)

print("Skin=",sel_skin)
print("Eye=",sel_eyes)
print("Hair=",sel_hair)
print("Suit=",sel_suit)
print("Shirt=",sel_shirt)
print("Tie=",sel_tie)

