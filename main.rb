# Constante com o texto inicial
INTRODUCTION = <<-INTRO
----------------------------------------------------------------------------------------------
- - - - - - - - - - - - - - - - - - - - - Assignment - - - - - - - - - - - - - - - - - - - - -
----------------------------------------------------------------------------------------------

In cryptography, a Caesar cipher, also known as Caesar’s cipher,
the shift cipher, Caesar’s code or Caesar shift,
is one of the simplest and most widely known encryption techniques.
It is a type of substitution cipher in which each letter in the plaintext is
replaced by a letter some fixed number of positions down the alphabet.
For example, with a left shift of 3, D would be replaced by A, E would become B, and so on.
The method is named after Julius Caesar, who used it in his private correspondence.
----------------------------------------------------------------------------------------------

Implement a caesar cipher that takes in a string and the shift factor
and then outputs the modified string:
  > caesar_cipher('What a string!', 5)
  => 'Bmfy f xywnsl!'

Quick Tips:
  - You will need to remember how to convert a string into a number.
  - Don’t forget to wrap from z to a.
  - Don’t forget to keep the same case.
----------------------------------------------------------------------------------------------

INTRO

def clear_screen
  if RUBY_PLATFORM =~ /win32|win64|\.NET|windows|cygwin|mingw32/i
    system('cls')
  else
    system('clear')
  end
end

def print_introduction
  clear_screen
  puts INTRODUCTION
end

def handle_input
  input = []

  puts "Inform the string to be encrypted:"
  input << gets.chomp
  puts "Inform the shift"
  input << gets.chomp.to_i

  input
end

def shift_letter(letter, shift)
  if letter =~ /[A-Z]/
    base = 'A'.ord
    ((letter.ord - base + shift) % 26 + base).chr
  elsif letter =~ /[a-z]/
    base = 'a'.ord
    ((letter.ord - base + shift) % 26 + base).chr
  else
    letter
  end
end

def handle_string(string, shift)
  characters = string.split(//)
  new_chars = characters.map { |char| shift_letter(char, shift) }
  new_chars.join
end

def convert_to_boolean(input)
  input.chomp.downcase == 'y'
end

def main
  answer = true

  while answer
    print_introduction
    input = handle_input
    puts handle_string(*input)

    puts "One more encryption? (Y/N):"
    answer_str = gets.chomp

    answer = convert_to_boolean(answer_str)
  end
end

main
