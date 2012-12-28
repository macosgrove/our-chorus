require 'spec_helper'

describe Content do
  it 'should create vision' do
    Content.vision.type.should be(:vision)
  end
  it 'should create values' do
    Content.values.type.should be(:values)
  end
  it 'should create music' do
    Content.music.type.should be(:music)
  end
  it 'should create how_we_operate' do
    Content.how_we_operate.type.should be(:how_we_operate)
  end

end
