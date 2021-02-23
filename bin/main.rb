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
  if user_input == 'Y'
    condiftion_y = false
    puts 'Please eter your token key'
    user_token = gets.chomp
    while condition == true
      begin
        puts 'the bot has started..'
        token_id(user_token)
        condition == false
      rescue StandardError
        puts 'Wrong token. try again'
        user_token = gets.chomp
      end
    end
  elsif user_input == 'N'
    condiftion_y = false
    puts 'the bot has started..'
    token_id
  else
    puts 'Try again please'
    user_input = gets.chomp.upcase
  end
end
