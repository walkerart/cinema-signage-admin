class Slide < ActiveRecord::Base
  attr_accessible :background, :background_file, :background_color,
                  :belongs_to, :position, :text, :slide_type,
                  :retained_background_file, :remove_background_file, :background_file_url

  belongs_to :state
  validates_associated :state

  file_accessor :background_file

  def to_s
    "s#{position}e#{state.order}"
  end
  
end
