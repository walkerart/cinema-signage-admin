class Slide < ActiveRecord::Base
  BG_COLORS = {
    "blue"   => "#00ddf0",
    "purple" => "#b500f0",
    "orange" => "#f04200",
    "yellow" => "#f0dd00",
    "white"  => "#ffffff",
    "green"  => "#1bdb00",
    "pink"   => "#f0003e",
  }


  attr_accessible :background_color, :panels_attributes

  has_many :panels

  accepts_nested_attributes_for :panels
  

end
