class Content

  attr_accessor :type

  def self.vision
    c = Content.new
    c.type = :vision
    c
  end
  def self.values
    c = Content.new
    c.type = :values
    c
  end
  def self.members
    c = Content.new
    c.type = :members
    c
  end
  def self.music
    c = Content.new
    c.type = :music
    c
  end
  def self.how_we_operate
    c = Content.new
    c.type = :how_we_operate
    c
  end
end