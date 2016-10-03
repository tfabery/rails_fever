require 'rails_helper'

describe Streamer do
  it { should validate_presence_of :channel_name }
  it { should validate_presence_of :name }
end
