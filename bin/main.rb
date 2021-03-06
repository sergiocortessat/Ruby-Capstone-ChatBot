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

puts 'Welcome to the bot set up..'
puts 'You can enter your key and use it one time, or set it up on the token.rb file. Please read instructions'
puts 'Enter Y or N'

user_input = gets.chomp.upcase
condition = true
if user_input == 'Y'
  puts 'Please enter your Token Key.'
  user_token = gets.chomp
  while condition == true
    begin
      puts 'The bot has started...'
      token_id(user_token)
      condition == false
    rescue StandardError
      puts 'Wrong token. try again'
      user_token = gets.chomp
    end
  end
else
  puts 'The bot has started...'
  token_id
end
