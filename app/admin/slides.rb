ActiveAdmin.register Slide do
  form partial: "form"


  index as: :block do |slide|
    div for: slide do      
      # resource_selection_cell slide
      h3 do
        link_to "Edit", edit_admin_slide_path(slide)
      end
      ol class: "panels#{slide.panels.count}" do
        slide.panels.each do |panel|
          li class: 'panel' do
            if panel.background_file.present?
              image_tag panel.background_file.thumb('100x100').url
            else
              div style: "background-color: #{panel.background_color};" do
                panel.text
              end
            end
          end
        end
      end
    end
  end

  action_item do
    link_to  "New Slide (Full Panel)" , new_admin_slide_path(panels: 1)
  end

  action_item do
    link_to  "New Slide (3 Panel)" , new_admin_slide_path(panels: 3)
  end


  controller do
    def new
      @slide = Slide.new
      if params[:panels]
        params[:panels].to_i.times do 
          @slide.panels.build
        end
      end
    end
  end
end
