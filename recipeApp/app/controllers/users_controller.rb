class UsersController < ApplicationController
  
    # POST /register
    def all
    user=User.all
    render json: { user: user }
    end
    
    def create
      user = User.find_by(email: params[:email])
      if user
        render json: { message: 'User already exists' }, status: :conflict
      elsif params[:password] != params[:confirm_password]
        render json: { error: "Passwords do not match" }, status: :unprocessable_entity
      else
        if params[:password] == params[:confirm_password]
          hashed_password = BCrypt::Password.create(params[:password])
          user = User.create(
            mobile_no: params[:mobile_no],
            email: params[:email],
            first_name: params[:first_name],
            last_name: params[:last_name],
            password: hashed_password,
            confirm_password: hashed_password
          )
          render json: { user: user }, status: :created
        else
          render json: { message: 'Passwords do not match' }, status: :bad_request
        end
      end
    end
      
    # POST /login
    def login
      user = User.find_by(email: params[:email])
      if user && BCrypt::Password.new(user.password) == params[:password]
        jwt_token = generate_jwt_token(user)
        render json: { message: 'Login Successfull', user_id: user.id, first_name:user.first_name, last_name:user.last_name, token: jwt_token }, status: :ok
      else
        render json: { error: "Invalid email or password" }, status: :unauthorized
      end
    end
    
    private
          def generate_jwt_token(user)
            payload = {
        user_id: user.id,
        issued_at: Time.now.to_i,
        nonce: SecureRandom.hex(8)
      }
      secret_key = Rails.application.credentials.jwt_secret_key || Rails.application.secrets.secret_key_base
      JWT.encode(payload, secret_key)
          end
    
      
        def user_params
          params.permit(:first_name, :last_name, :mobile_no, :email, :password, :confirm_password)
        end
    end
      