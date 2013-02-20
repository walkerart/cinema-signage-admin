class State < ActiveRecord::Base
  BG_COLORS = {
    "blue"   => "#00ddf0",
    "purple" => "#b500f0",
    "orange" => "#f04200",
    "yellow" => "#f0dd00",
    "white"  => "#ffffff",
    "green"  => "#1bdb00",
    "pink"   => "#f0003e",
  }

  has_many :slides, dependent: :destroy

  accepts_nested_attributes_for( :slides, 
                                 allow_destroy: true,
                                 limit: 3)
  attr_accessible :order, :state_type, :slides_attributes, :background_color

  after_initialize :set_order

  def set_order
    self.order = State.count + 1
  end

  def to_s
    "State #{order}"
  end
end
