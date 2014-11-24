class User < ActiveRecord::Base
  enum role: [:user, :contributor, :admin]
  after_initialize :set_default_role, :if => :new_record?

  class << self
    def from_omniauth(auth)
      params = ActionController::Parameters.new(auth.to_h).permit(:provider, :uid)
      where(params).first_or_initialize.tap do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.save!
      end
    end
  end

  def set_default_role
    self.role ||= :user
  end

end
