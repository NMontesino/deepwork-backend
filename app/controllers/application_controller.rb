class ApplicationController < ActionController::API

    before_action :user_from_token

    private

    def create_token(user)
        payload = {user_id: user.id}
        return JWT.encode(payload, secret, 'HS256')
    end

    def user_from_token
        # byebug
        payload = JWT.decode(valid_token, secret, true, algorithm: 'HS256')
        user = User.find(payload[0]['user_id'])
        return head :unauthorized unless user
        return user
    end

    def valid_token
        return request.headers['Authorization'].split(' ')[1] if request.headers['Authorization']
    end

    def secret
        "ctgbxidwhbcuwbcihed73y75e7548u2yjihvdwhc878tgndwvf2602yhf34g"
    end

end
