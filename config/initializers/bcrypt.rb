if Rails.env.local?
  BCrypt::Engine.cost = 1
else
  BCrypt::Engine.cost = 12
end
