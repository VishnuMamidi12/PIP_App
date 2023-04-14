class RecipesController < ApplicationController
    #before_action :authenticate_user
    #before_action :authorized

    def create
        puts recipe_params
        @recipe = Recipe.new(recipe_params)
        @recipe.users_id = 2
        if recipe_params[:recipe_image].present?
            @recipe.recipe_image.attach(recipe_params[:recipe_image])
        end
        existing_recipe = Recipe.find_by(title: recipe_params[:title])
        if existing_recipe
          render json: { error: "Recipe already exists" }, status: :unprocessable_entity
        else
          if @recipe.save
            render json: @recipe, status: :created
          else
            render json: @recipe.errors, status: :unprocessable_entity
          end
        end
    end
    
     def index
        @recipes = Recipe.all
        render json: {recipes: ActiveModel::Serializer::CollectionSerializer.new(@recipes, serializer: RecipeSerializer)}
      end

      def show
        @recipes = Recipe.find(params[:id])
        render json: @recipes
      end

      def title
        @recipes = Recipe.where("title ILIKE ?", "%#{params[:title]}%")
        @recipes = Recipe.where("cuisine_type ILIKE ?", "%#{params[:cuisine_type]}%")
        render json: @recipes
      end

    def recipe_params
        params.permit(:title, :ingredient, :cooking_instructions, :time_tiken, :cuisine_type, :dietary_restrictions, :is_public, :recipe_image)
    end
end
