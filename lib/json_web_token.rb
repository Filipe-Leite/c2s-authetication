module JsonWebToken
  SECRET_KEY = Rails.application.secrets.secret_key_base

  def self.issue_token(payload)
    JWT.encode(payload, SECRET_KEY, 'HS256')
  end

  def self.decode_token(token)
    JWT.decode(token, SECRET_KEY, true, algorithm: 'HS256')[0]
  end
end