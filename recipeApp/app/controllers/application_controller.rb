class ApplicationController < ActionController::API
    def require_login
        auth_header = request.headers['Authorization']
        if auth_header
          token = auth_header.split(' ').last
          begin
            decoded_token, header = JWT.decode(token, secret_key, true, algorithm: 'HS256', verify_iss: false)
            user_id = decoded_token['user_id']
            issued_at = decoded_token['issued_at']
            nonce = decoded_token['nonce']
            @current_user = User.find(user_id)
            if @current_user && header['alg'] == 'HS256' && nonce.present? && nonce == @current_user.nonce && Time.now.to_i - issued_at < 24.hours.to_i
              # valid token
            else
              render json: { error: "Invalid token" }, status: :unauthorized
            end
          rescue JWT::DecodeError
            render json: { error: "Invalid token" }, status: :unauthorized
          end
        else
          render json: { error: "Authorization header missing" }, status: :unauthorized
        end
    end

    private
  
    def secret_key
      Rails.application.credentials.jwt_secret_key || Rails.application.secrets.secret_key_base
    end

    def auth_header
        # { Authorization: 'Bearer <token>' }
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            # header: { 'Authorization': 'Bearer <token>' }
            begin
            JWT.decode(token, Rails.application.secret_key_base, true, algorithm: 'HS256')
            rescue JWT::DecodeError
            nil
            end
        end
    end

    def current_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end
      
end
