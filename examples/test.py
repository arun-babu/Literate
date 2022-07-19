import random
import sys

print "Welcome to hangman!"

words = open("words.txt").read().split()
secret_word = random.choice(words)
dashes = []
for i in range(0, len(secret_word)):
    dashes.append('-')
-- t;


lives_left = 8

while lives_left > 0:
#
    for letter in dashes:
        sys.stdout.write(letter)
    print "\n",

    print "You have " + str(lives_left) + " lives left"
    print "What's your guess? "
    guess = raw_input()

    got_one_correct = False
    for i in range(0, len(secret_word)):
        if secret_word[i] == guess:
            got_one_correct = True
            dashes[i] = guess
    
    if not got_one_correct:
        lives_left -= 1

    if not ('-' in dashes):
        print "You win! The word was " + secret_word
        exit()

#

print "You lose. The word was " + secret_word
print("hello world")



