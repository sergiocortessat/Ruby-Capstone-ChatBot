# logic1
require 'telegram/bot'
require_relative 'jokes'
require_relative 'motivational'
require_relative '../token'
require_relative 'stock'

class BotLogic
  attr_reader :token

  def initialize(token = nil)
    @token = if token.nil?
               TOKEN['token_key']
             else
               token
             end
    Telegram::Bot::Client.run(@token) do |bot|
      bot.listen do |message|
        case message.text
        when 'hello'
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Hello, #{message.from.first_name}. Welcome to this simple ChatBot.You can try different options. If unsure, please write 'options'")
        when 'who'
          bot.api.send_message(chat_id: message.chat.id,
                               text: "I am simple bot created to help you boost your daily mood. It aint easy to stay focus or motivated. I will try my best to help you #{message.from.first_name}")
        when 'options'
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Thanks for trying this chatbot #{message.from.first_name}. You can select some options such as Jokes ('joke'), Dayly powerfull messages ('motivation'), who am I ('who') or a welcome message ('hello')")
        when 'joke'
          joke = Jokes.new
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Thanks for trying some daily jokes #{message.from.first_name}. Hopefully the joke may cheer you up. #{joke.response.read_body[82..-4]}")

        when 'motivation'
          motivation = Phrases.new
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Thanks for trying this chatbot #{message.from.first_name}.I hope this inspires you:")
          bot.api.send_message(chat_id: message.chat.id,
                               text: "'#{motivation.random_phrase['text']}'.")
          bot.api.send_message(chat_id: message.chat.id,
                               text: "The Author of this phrase is '#{motivation.phrase_sample['author']}'")

        when 'stock'
          bot.api.send_message(chat_id: message.chat.id,
                               text: "I am programmed to keep you updated on Teslas stock market price #{message.from.first_name}. At this moment, the stock price is #{RESPONSE[1][12..-1]} USD")
        else
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Sorry, I don't understand '#{message.text}'. I only understand `hello` `who` `joke` 'options' and `motivation`")
        end
      end
    end
  end
end
