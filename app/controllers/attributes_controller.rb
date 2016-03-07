class AttributesController < ApplicationController
  
    def create
        @attribute = Attribute.new() 
    end
    def new
        @attribute = Attribute.new(attribute_params)
    end

    private
    def attribute_params
        params.require(:attribute).permit(:name)
    end


end