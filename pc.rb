# If network problems arise when playing voice, look into converting the mp3's into dca format.

require 'discordrb'

bot = Discordrb::Commands::CommandBot.new token: 'MzU1MTY1MjE3OTM3ODE3NjEy.DJOsTA.Ano_WmWFBqa-iyntX29NqJk9Z-k', client_id: 160123456789876543, prefix: '~', ignore_bots: true

#general connecting and voice control commands
#--------------------------------------------------------------------------
bot.command(:connect) do |event|
  channel = event.user.voice_channel
  next "You're not in any voice channel!" unless channel
  bot.voice_connect(channel)
  "Connected to voice channel: #{channel.name}"
  playLobbyMusic(event.voice)
end

bot.command(:connectx) do |event|
  channel = event.user.voice_channel
  next "You're not in any voice channel!" unless channel
  bot.voice_connect(channel)
  "Connected to voice channel: #{channel.name}"
end

bot.command(:disconnect) do |event|
  channel = event.user.voice_channel
  bot.voice_destroy(channel)
end

bot.command(:dc) do |event|
  channel = event.user.voice_channel
  bot.voice_destroy(channel)
end

bot.command(:volres) do |event|
  event.voice.volume = 1
end

bot.command(:stop) do |event|
  event.voice.stop_playing
end
#--------------------------------------------------------------------------

#functions called by other functions
#--------------------------------------------------------------------------
def playLobbyMusic(voice_bot)
  voice_bot.volume = 0.15
  voice_bot.play_file('audio/TUNES/macintosh_plus.mp3')
end
#--------------------------------------------------------------------------


# Youtube player: don't use this until ive come up with a way to directly stream audio, rather than downloading files
#--------------------------------------------------------------------------
$isplaying = 0
bot.command(:play) do |event, songlink|
  if $isplaying == 1
    event.message.delete
    event.channel.send_message 'Already playing music'
  end
  break unless $isplaying == 0
  $isplaying = 1
  voice_bot = event.voice
  # system("youtube-dl --no-playlist --max-filesize 50m -o 'music/s.%(ext)s' -x --audio-format mp3 #{songlink}")
  system("mpv #{songlink} --no-video")
  event.channel.send_message "Playing"
  # voice_bot.play_file('./music/s.mp3')
  # bot.voices[event.server.id].destroy
  $isplaying = 0
  nil
end
#--------------------------------------------------------------------------

# Baldur's Gate mp3's
#--------------------------------------------------------------------------
bot.command(:poor) do |event|
  # `event.voice` is a helper method that gets the correct voice bot on the server the bot is currently in. Since a
  # bot may be connected to more than one voice channel (never more than one on the same server, though), this is
  # necessary to allow the differentiation of servers.
  #
  # It returns a `VoiceBot` object that methods such as `play_file` can be called on.
  voice_bot = event.voice
  voice_bot.play_file('audio/BG/poor.mp3')
end

bot.command(:alaundo1) do |event|
  voice_bot = event.voice
  voice_bot.volume = 1
  voice_bot.play_file('audio/BG/alaundo1.mp3')
end

bot.command(:alaundo2) do |event|
  voice_bot = event.voice
  voice_bot.volume = 1
  voice_bot.play_file('audio/BG/alaundo2.mp3')
end

bot.command(:alaundo3) do |event|
  voice_bot = event.voice
  voice_bot.volume = 1
  voice_bot.play_file('audio/BG/alaundo3.mp3')
end

bot.command(:alaundo4) do |event|
  voice_bot = event.voice
  voice_bot.volume = 1
  voice_bot.play_file('audio/BG/alaundo4.mp3')
end

bot.command(:alaundo5) do |event|
  voice_bot = event.voice
  voice_bot.volume = 1
  voice_bot.play_file('audio/BG/alaundo5.mp3')
end

bot.command(:bbb) do |event|
  voice_bot = event.voice
  voice_bot.volume = 1
  voice_bot.play_file('audio/BG/bbb.mp3')
end

bot.command(:copyright) do |event|
  voice_bot = event.voice
  voice_bot.volume = 1
  voice_bot.play_file('audio/BG/copyright.mp3')
end

bot.command(:diddies) do |event|
  voice_bot = event.voice
  voice_bot.volume = 1
  voice_bot.play_file('audio/BG/diddies.mp3')
end

bot.command(:heroes) do |event|
  voice_bot = event.voice
  voice_bot.volume = 1
  voice_bot.play_file('audio/BG/heroes.mp3')
end

bot.command(:hotel) do |event|
  voice_bot = event.voice
  voice_bot.volume = 1
  voice_bot.play_file('audio/BG/hotel.mp3')
end

bot.command(:hurt) do |event|
  voice_bot = event.voice
  voice_bot.volume = 1
  voice_bot.play_file('audio/BG/hurt.mp3')
end

bot.command(:jehova) do |event|
  voice_bot = event.voice
  voice_bot.volume = 1
  voice_bot.play_file('audio/BG/jehovas_witness.mp3')
end

bot.command(:bandit) do |event|
  voice_bot = event.voice
  voice_bot.volume = 1
  voice_bot.play_file('audio/BG/kick.mp3')
end

bot.command(:poor) do |event|
  voice_bot = event.voice
  voice_bot.volume = 1
  voice_bot.play_file('audio/BG/poor.mp3')
end

bot.command(:tiddies) do |event|
  voice_bot = event.voice
  voice_bot.volume = 1
  voice_bot.play_file('audio/BG/tiddies.mp3')
end

bot.command(:time) do |event|
  voice_bot = event.voice
  voice_bot.volume = 1
  voice_bot.play_file('audio/BG/time.mp3')
end

bot.command(:town) do |event|
  voice_bot = event.voice
  voice_bot.volume = 1
  voice_bot.play_file('audio/BG/town.mp3')
end
#--------------------------------------------------------------------------

# Misc mp3s
#--------------------------------------------------------------------------
bot.command(:lobby_music) do |event|
  voice_bot = event.voice
  voice_bot.volume = 0.15
  voice_bot.play_file('audio/TUNES/macintosh_plus.mp3')
end

bot.command(:do_this) do |event|
  voice_bot = event.voice
  voice_bot.volume = 1
  voice_bot.play_file('audio/MISC/done_this.mp3')
end

bot.command(:big_ol_doinks) do |event|
  voice_bot = event.voice
  voice_bot.volume = 1
  voice_bot.play_file('audio/MISC/doinks.mp3')
end
#--------------------------------------------------------------------------

bot.run