class Hero < ActiveRecord::Base
    belongs_to :attr, class_name: "Attribute", foreign_key: "attribute_id"
end
