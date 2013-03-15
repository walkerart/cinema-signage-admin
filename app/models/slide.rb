class Slide < ActiveRecord::Base
  Colors = {
    "blue"   => "#00ddf0",
    "purple" => "#b500f0",
    "orange" => "#f04200",
    "yellow" => "#f0dd00",
    "white"  => "#ffffff",
    "green"  => "#1bdb00",
    "pink"   => "#f0003e",
  }

  default_scope order("'slides'.'order'") # wtf sqlite bug?
  has_many :panels
  accepts_nested_attributes_for :panels, allow_destroy: true
  attr_accessible :panels_attributes, :order, :color

  def background_color
    @color || "#ffffff"
  end

  def slide_type
    {1 => 'one', 3 => 'three'}.fetch panels.size, nil
  end

  def to_s
    id.to_s
  end
end
