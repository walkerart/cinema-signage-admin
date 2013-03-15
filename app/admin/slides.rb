ActiveAdmin.register Slide do
  form partial: "form"
  config.sort_order = "order_asc" # wierd
  config.filters = false

  batch_action :reorder do
    ids_and_orders = params[:slides].map{|k,v| [k.to_i, v[:order].to_i] } #cleansing
    results = ids_and_orders.collect  do |id, order|

      slide = Slide.update(id, order: order)
      slide.order == order and slide.valid?
    end
    render :json => "updated #{results.size} Slides"
  end


  index as: :block do |slide|

    div for: slide do

      ol class: "panels panels#{slide.panels.count}" do
        input name: "slides[#{slide.id}][order]", type: :hidden, value: slide.order
        li class: 'selection_cell' do
          resource_selection_cell slide
        end
        slide.panels.each do |panel|
          li class: 'panel' do
            if panel.background_file.present?
              # RANDOM: height set in css also: 130px
              image_tag panel.background_file.process(:resize, 'x130').url, width: '100%', height: '100%'
            else
              div class: 'text', style: "background-color: #{panel.slide.color};" do
                para class: 'text' do
                  panel.text
                end
              end
            end
          end
        end
        li class: 'panel_actions' do
          div class: 'action_items' do
            span class: 'action_item' do
              link_to "Edit", edit_admin_slide_path(slide)
            end
          end
        end
      end
      div class: 'clear_both'
    end
  end

  action_item only: :index do
    link_to  "New Slide (Full Panel)" , new_admin_slide_path(panels: 1)
  end

  action_item only: :index do
    link_to  "New Slide (3 Panel)" , new_admin_slide_path(panels: 3)
  end



  

  controller do
    
    def create
      @slide = Slide.new
      @slide.assign_attributes params[:slide]
      if @slide.save
        flash[:notice] = "Slide was successfully created"
        redirect_to admin_slides_path
      else
        flash[:errors] = "There were errors submitting this form"
        render :edit
      end        
    end

    def update
      @slide = Slide.find(params[:id])
      if @slide.update_attributes(params[:slide])
        flash[:notice] = "Slide was successfully saved"
        redirect_to admin_slides_path
      else
        flash[:errors] = "There were errors submitting this form"
        render :edit
      end
    end

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
