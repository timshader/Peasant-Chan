# If network problems arise when playing voice, look into converting the mp3's into dca format.

require 'discordrb'

bot = Discordrb::Commands::CommandBot.new token: 'MzU1MTY1MjE3OTM3ODE3NjEy.DJOsTA.Ano_WmWFBqa-iyntX29NqJk9Z-k', client_id: 160123456789876543, prefix: '~', ignore_bots: true

#general connecting and voice control commands
#--------------------------------------------------------------------------
bot.command(:connect) do |event|
  channel = event.user.voice_channel
  next "You're not in any voice channel!" unless channel
  bot.voice_connect(channel)
  "Tim Shader is my creator. DM him about any issues."
  playLobbyMusic(event.voice)
end

bot.command(:connectx) do |event|
  channel = event.user.voice_channel
  next "You're not in any voice channel!" unless channel
  bot.voice_connect(channel)
  "Tim Shader is my creator. DM him about any issues."
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

#Command List
#--------------------------------------------------------------------------
# BE CAREFUL UPDATING THE STRING OF COMMANDS, IT LIKES TO BREAK THE BOT.
# IF NEW COMMANDS DON'T WORK WHEN UPDATING PEASANT-CHAN, THE FIRST THING TO TRY IS DELETING
# WHATEVER COMMANDS YOU ADDED TO THE COMMAND LIST STRING
bot.command(:commands) do |event|
  event.channel.send_message 'One of "~" and one of:

GENERAL COMMANDS
 -> commands
 -> connect
 -> connectx
 -> disconnect (or dc)
 -> volres
 -> stop

BALDURS GATE
 -> poor
 -> alaundo1 - alaundo5
 -> bbb
 -> copyright
 -> diddies
 -> heroes
 -> hotel
 -> hurt
 -> jehova
 -> bandit
 -> tiddies
 -> time
 -> town

DARK SOULS
 -> abyss
 -> catacombs
 -> covenant
 -> dark_party
 -> humanity
 -> man_cavern
 -> miasma
 -> seath
 -> stat_alignment
 -> trap
 -> waterpark

JOJO
 -> road_roller_da

SMASH
 -> nein
 -> downsmash
 -> wombo_combo

OBLIVION
 -> high_elves

MISCELLANEOUS
 -> lobby_music
 -> done_this
 -> big_ol_doinks
 -> ussr
 -> pools_closed'
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

# Dark Souls related mp3s
#--------------------------------------------------------------------------
bot.command(:abyss) do |event|
  voice_bot = event.voice
  voice_bot.volume = 0.5
  voice_bot.play_file('audio/DS/abyss.mp3')
end

bot.command(:catacombs) do |event|
  voice_bot = event.voice
  voice_bot.volume = 0.5
  voice_bot.play_file('audio/DS/catacombs.mp3')
end

bot.command(:covenant) do |event|
  voice_bot = event.voice
  voice_bot.volume = 0.5
  voice_bot.play_file('audio/DS/convenant.mp3')
end

bot.command(:dark_party) do |event|
  voice_bot = event.voice
  voice_bot.volume = 0.5
  voice_bot.play_file('audio/DS/dark_party.mp3')
end

bot.command(:humanity) do |event|
  voice_bot = event.voice
  voice_bot.volume = 0.5
  voice_bot.play_file('audio/DS/humanity.mp3')
end

bot.command(:man_cavern) do |event|
  voice_bot = event.voice
  voice_bot.volume = 0.5
  voice_bot.play_file('audio/DS/man_cavern.mp3')
end

bot.command(:miasma) do |event|
  voice_bot = event.voice
  voice_bot.volume = 0.5
  voice_bot.play_file('audio/DS/miasma.mp3')
end

bot.command(:seath) do |event|
  voice_bot = event.voice
  voice_bot.volume = 0.5
  voice_bot.play_file('audio/DS/seath.mp3')
end

bot.command(:stat_alignment) do |event|
  voice_bot = event.voice
  voice_bot.volume = 0.5
  voice_bot.play_file('audio/DS/stat_alignment.mp3')
end

bot.command(:trap) do |event|
  voice_bot = event.voice
  voice_bot.volume = 0.5
  voice_bot.play_file('audio/DS/trap.mp3')
end

bot.command(:waterpark) do |event|
  voice_bot = event.voice
  voice_bot.volume = 0.5
  voice_bot.play_file('audio/DS/waterpark.mp3')
end
#--------------------------------------------------------------------------

# Yugioh related mp3s
#--------------------------------------------------------------------------
bot.command(:cards) do |event|
  voice_bot = event.voice
  voice_bot.volume = 0.5
  voice_bot.play_file('audio/YUGI/cards.mp3')
end

bot.command(:joey_show) do |event|
  voice_bot = event.voice
  voice_bot.volume = 0.5
  voice_bot.play_file('audio/YUGI/joey_show.mp3')
end
#--------------------------------------------------------------------------

# Jojo related mp3s
#--------------------------------------------------------------------------
bot.command(:road_roller_da) do |event|
  voice_bot = event.voice
  voice_bot.volume = 0.45
  voice_bot.play_file('audio/JOJO/road_roller_da.mp3')
end
#--------------------------------------------------------------------------

# Smash related mp3s
#--------------------------------------------------------------------------
bot.command(:nein) do |event|
  voice_bot = event.voice
  voice_bot.volume = 0.5
  voice_bot.play_file('audio/SMASH/nein.mp3')
end

bot.command(:downsmash) do |event|
  voice_bot = event.voice
  voice_bot.volume = 0.45
  voice_bot.play_file('audio/SMASH/downsmash.mp3')
end

bot.command(:wombo_combo) do |event|
  voice_bot = event.voice
  voice_bot.volume = 0.05
  voice_bot.play_file('audio/SMASH/wombo_combo.mp3')
end
#--------------------------------------------------------------------------

# Oblivion related mp3s
#--------------------------------------------------------------------------
bot.command(:high_elves) do |event|
  voice_bot = event.voice
  voice_bot.volume = 0.5
  voice_bot.play_file('audio/TES4/high_elves.mp3')
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

bot.command(:turbo) do |event|
  voice_bot = event.voice
  voice_bot.volume = 0.5
  voice_bot.play_file('audio/MISC/turbo.mp3')
end

bot.command(:ussr) do |event|
  voice_bot = event.voice
  voice_bot.volume = 0.25
  voice_bot.play_file('audio/MISC/ussr.mp3')
end

bot.command(:pools_closed) do |event|
  event.channel.send_message 'https://i.imgur.com/lATXJn9.jpg'
  voice_bot = event.voice
  voice_bot.volume = 1
  voice_bot.play_file('audio/MISC/pools_closed.mp3')
end
#--------------------------------------------------------------------------

bot.run