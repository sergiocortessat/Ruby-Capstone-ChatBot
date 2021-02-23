#!/usr/bin/env ruby
require_relative '../lib/bot_logic'
require_relative '../lib/logic2'
require_relative '../lib/motivational'
require_relative '../lib/jokes'

def token_id(token = nil)
    if token == nil
        return bot = BotLogic.new
        return bot.initialize
    else
        bot = BotLogic.new(token)
        bot.initialize
    end
end

puts 'the bot has started..'
token_id("1565232960:AAEH6D-6Te-C7MS3j8e-OEjXyvnzKkM4KN4")
