import random
import sys

HANGMAN_ASCII_ART = """
   _    _                                         
  | |  | |                                        
  | |__| | __ _ _ __   __ _ _ __ ___   __ _ _ __  
  |  __  |/ _` | '_ \ / _` | '_ ` _ \ / _` | '_ \ 
  | |  | | (_| | | | | (_| | | | | | | (_| | | | |
  |_|  |_|\__,_|_| |_|\__, |_| |_| |_|\__,_|_| |_|
                        __/ |                      
                      |___/
  """
MAX_TRIES = 6
hangman_photos = ["""
    x-------x"""
    , """
    x-------x
    |
    |
    |
    |
    |"""
    , """
    x-------x
    |       |
    |       0
    |
    |
    |
    """
    , """
    x-------x
    |       |
    |       0
    |       |
    |
    |"""
    , """
    x-------x
    |       |
    |       0
    |      /|\\
    |
    |"""
    , """
    x-------x
    |       |
    |       0
    |      /|\\
    |      /
    | """
    , """ 
    x-------x
    |       |
    |       0
    |      /|\\
    |      / \\
    |"""]

old_letter_guessed = []


def print_intro():
    print(HANGMAN_ASCII_ART, MAX_TRIES)


def print_hangman(num_of_tries):
    print(hangman_photos[num_of_tries])


def choose_word(index):
    words = ["alligator", "ant", "baboon", "bear", "butterfly", "camel", "cat",
             "cow", "dog", "duck", "frog", "fox", "gorilla", "horse"]
    return words[index]


def update_letter_guessed(letter_guessed, old_letter_guessed):
    old_letter_guessed += [letter_guessed]
    print(old_letter_guessed)


def show_hidden_word(secret_word, old_letter_guessed):
    s = ""
    for i in range(0, len(secret_word)):
        if secret_word[i] in old_letter_guessed:
            s += secret_word[i] + " "
        else:
            s += "_ "
    return s


def check_win(secret_word, old_letters_guessed):
    for i in range(0, len(secret_word)):
        if secret_word[i] in old_letters_guessed:
            pass
        else:
            return False
    return True


def main():
    print_intro()
    print_hangman(MAX_TRIES)
    index = random.randint(0, 13)
    secret_word = choose_word(index)
    print(show_hidden_word(secret_word, old_letter_guessed))
    num_of_tries = 0
    while (check_win(secret_word, old_letter_guessed) == False) & (num_of_tries <= MAX_TRIES):
        letter = input('Guess a letter: ')
        update_letter_guessed(letter, old_letter_guessed)
        if letter in secret_word:
            print(show_hidden_word(secret_word, old_letter_guessed))
            if check_win(secret_word, old_letter_guessed):
                print("congratulations! you win!! ")
        else:
            if num_of_tries == MAX_TRIES:
                print_hangman(num_of_tries)
                print("sorry, you lose..")
                sys.exit()
            else:
                print_hangman(num_of_tries)
                num_of_tries += 1


main()
