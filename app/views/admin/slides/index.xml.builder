xml.cinema do
  xml.title "Cinema Signage"
  xml.link "http://walkerart.org/"
  xml.description "http://walkerart.org/"
  xml.views do
    @states.each do |state|
      xml.state(type: state.state_type) do
        state.slides.each do |slide|
          xml.position slide.position
          xml.type slide.slide_type
          xml.text slide.text
          xml.background slide.background
        end
      end
    end
  end
end
