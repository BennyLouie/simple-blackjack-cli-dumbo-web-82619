require 'pry'

def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  return rand(1..11)
end

def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp
end

def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

def initial_round
  card_total = deal_card + deal_card
  display_card_total(card_total)
  return card_total
end

def hit?(current_card_total)
  prompt_user
  input = get_user_input
  if input == 's'
    return current_card_total
    elsif input == 'h'
    d = deal_card
    card_total = current_card_total + d
    return card_total
  else
    invalid_command
    hit?(current_card_total)
  end
end

def invalid_command
  puts "Please enter a valid command"
end


def runner
  welcome
  card_total = initial_round
  until card_total > 21 do
    card_total = hit?(card_total)
    display_card_total(card_total)
  end
  end_game(card_total)
end