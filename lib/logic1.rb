# logic1
require 'telegram/bot'

class BotLogic
  attr_reader :token

  def initialize(token = nil)
    @token = token
    Telegram::Bot::Client.run('1565232960:AAEH6D-6Te-C7MS3j8e-OEjXyvnzKkM4KN4') do |bot|
      bot.listen do |message|
        bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}. Welcome to this simple 
            chatbot. You can try different options. If unsure, please write /options")
        case message.text
        when '/who'
          bot.api.send_message(chat_id: message.chat.id,
                               text: "I am simple bot created to help you boost your daily mood.
                               It aint easy to stay focus or motivated. I will try my best to help 
                               you #{message.from.first_name}")
        when '/options'
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Thanks for trying this chatbot #{message.from.first_name}. You can select some
                               options such as Jokes (/joke), Dayly powerfull messages (/motivation)")
        end
      end
    end
  end
end
