class RecipeSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers

    attributes :id,:title, :ingredient, :cooking_instructions, :time_tiken, :cuisine_type, :dietary_restrictions, :is_public, :recipe_image, :recipe_url

    def recipe_image

        if object.recipe_image.attached?
           "http://localhost:3000"+ rails_blob_path(object.recipe_image , only_path: true)
            # Rails.application.routes.url_helpers.rails_blob_path(object.recipe_image)
        else
            nil
        end
    end

    def recipe_url
        recipes_item_path + "/#{object.id}"
    end
    
    
end