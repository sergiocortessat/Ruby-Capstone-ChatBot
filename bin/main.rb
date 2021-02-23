#!/usr/bin/env ruby
require_relative '../lib/bot_logic'
require_relative '../lib/motivational'
require_relative '../lib/jokes'
require_relative '../lib/stock'

def token_id(token = nil)
  if token.nil?
    BotLogic.new
  else
    BotLogic.new(token)
  end
end
# rubocop:disable:line MyCop
# rubocop:disable:method MyCop
# rubocop:disable:block MyCop
puts 'Welcome to the bot set up..'
puts 'You can enter your key and use one time, or set it up on the token.rb file. Please read instructions'
puts 'Enter Y or N'

user_input = gets.chomp.upcase
condition = true

condiftion_y = true
while condiftion_y == true
  case user_input
  when user_input == 'Y'
    puts 'Please eter yout token key'
    user_token = gets.chomp
    while condition == true
      begin
        token_id(user_token)
        puts 'the bot has started..'
        condition == false
      rescue StandardError
        puts 'Wrong token. try again'
        user_token = gets.chomp
      end
    end
  when user_input == 'N'
    condiftion_y = false
    puts 'the bot has started..'
    token_id
  else
    puts 'Try again please'
    user_input = gets.chomp.upcase
  end
end
