class Slide < ActiveRecord::Base
  attr_accessible :background, :belongs_to, :position, :text, :slide_type

  belongs_to :state
  validates_associated :state

  def to_s
    "s#{position}e#{state.order}"
  end
  
end
