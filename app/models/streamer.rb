class Streamer < ActiveRecord::Base
  validates_presence_of :channel_name, :name

  def self.live_check(streamers)
    channels = ''
    streamers.each do |streamer|
      if channels == ''
        channels = streamer.channel_name
      else
        channels = channels + ',' + streamer.channel_name
      end
    end

    begin
      response = RestClient::Request.new(
        method: :get,
        url: 'https://api.twitch.tv/kraken/streams',
        headers: {
          client_id: 'a4ti12901v9428rzk0jnwpcul3b67te',
          params: {
            game: 'League of Legends',
            channel: channels,
            steam_type: 'live'
          }
        }
      ).execute
      rescue Exception => error
        puts JSON.parse(error.response)
    end

    if response
      live_streams = JSON.parse(response)['streams']
      streamers.each do |streamer|
        live_streams.each do |live_stream|
          if streamer.channel_name == live_stream['channel']['name']
            streamer.update is_live: true, logo: live_stream['channel']['logo']
            break
          else
            streamer.update is_live: false
          end
        end
      end
    else
      streamers.each do |streamer|
        streamer.update is_live: false
      end
    end
  end
end
