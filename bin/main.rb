#!/usr/bin/env ruby
require_relative '../lib/bot_logic'
require_relative '../lib/logic2'
require_relative '../lib/motivational'
require_relative '../lib/jokes'

def token_id(token = nil)
  if token.nil?
    BotLogic.new
  else
    BotLogic.new(token)
  end
end
puts 'the bot has started..'
puts 'You can enter your key and use one time, or set it up on the token.rb file. Please read instructions'
puts 'Enter Y or N'
user_input = gets.chomp.upcase
if user_input == 'Y'
  puts 'Please eter yout token key'
  user_token = gets.chomp
  token_id(user_token)
else
  token_id

end
