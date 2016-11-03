require 'test_helper'

class OmniauthCallbacksControllerTest < ActionController::TestCase
def self.from_omniauth(auth)
    where(provider: auth.provider, id: auth.uid).first_or_create do |user|
     user.provider = auth.provider
     user.name = auth.info.nickname
    end
end


end
