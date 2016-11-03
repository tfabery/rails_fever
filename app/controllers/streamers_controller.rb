class StreamersController < ApplicationController
  def index
    Streamer.live_check (Streamer.all)
    @streams = Streamer.where(is_live: true)
  end

  def new
    @streamer = Streamer.new
  end

  def create
    @streamer = Streamer.new(streamer_params)
    if @streamer.save
      redirect_to streamers_path
    else
      redirect_to new_streamer_path
    end
  end

  def show
    @stream = Streamer.find(params['id'])
  end

private
  def streamer_params
    params.require(:streamer).permit(:name, :channel_name)
  end
end
