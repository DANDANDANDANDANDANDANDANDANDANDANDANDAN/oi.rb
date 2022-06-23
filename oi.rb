require 'telegram/bot'

'''
Setup Instructions:
1. Install the telegram/bot gem: gem install telegram-bot-ruby
2. Install Telegram on your device
3. Add botfather as a contact: https://t.me/botfather
4. Send the botfather a message to create a bot
    * /newbot
    * Name your bot
    * Assign a unique username to the bot (ending in bot or -bot)
5. Follow the t.me link to your new bot, issue /start, then send a message or two
6. Create a new group chat with your bot and send it another message or two (this will be the chat that receives your notifications!)
7. Visit here and grab the chat id of the group chat, replace the key with your own:
    * https://api.telegram.org/bot<BOTKEYGOESHERE>/getUpdates
    PLEASE NOTE: the ID will be a minus number in some cases, it is referenced as ID in the JSON structure
8. Add your BotFather bot API Token and Chat ID below
'''

#CHANGE THIS STUFF
$token = '1234567890:ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789' #Change this to your BotFather bot API token
$chat_id = '1234567890' #Change this to the ID of the chat with your bot

usage = "🌀 Usage: ruby oi.rb '<command>'"

if ARGV.length == 1
    begin
        puts "🌀 Executing command: '#{ARGV[0]}'"
        system("#{ARGV[0]}")
        #Spins up the bot
        puts "🌀 Command finished. Sending alert!"
        Telegram::Bot::Client.run($token) do |bot|
            #Sends the message
            bot.api.send_message(chat_id: $chat_id, text: "Oi! A command of yours finished at #{Time.now.strftime("%d/%m/%Y %H:%M:%S")}.")
        end
    rescue
        puts usage
    end
else
    puts usage
end