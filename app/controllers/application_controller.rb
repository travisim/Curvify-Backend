class ApplicationController < ActionController::Base

    def encode(id)
         JWT.encode({ user_id: id, exp: 24.hours.from_now.to_i }, Rails.application.secrets.secret_key_base)
    end
    def decode(token)
        JWT.decode(token, "anything", true, {algorithm: 'HS256'})[0]
     end
end
