class JsonWebToken
  SECRET_KEY = 'cd39571073e008aa12ed9711d37817fe4430383d45542b2d769fcca406fc3dd7f11bba870c86c298ec677747fde790f1790eafcf9d991dac84de68fad5ee3961'

  def self.encode(payload)
    JWT.encode(payload, SECRET_KEY, 'HS512')
  end

  def self.decode(token)
    begin
      JWT.decode(token, SECRET_KEY, true, { algorithm: 'HS512' } )[0]
    rescue Exception => e
      puts 'Authentication Error:', e
      return false
    end
  end
end
