import dice
from time import sleep

def roll(amount:int, sides:int):
    return dice.roll(f'{amount}d{sides}')

for idx, result in enumerate(roll(5,6)):
    print(f'\u2022 Lanzamiento número {idx+1}: \nEl número obtenido es {result}')
    sleep(5)