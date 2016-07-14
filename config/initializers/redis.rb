if Rails.env.production?
  $redis = Redis.new(host: 'boohee-falcon', port: 6379)

  # $ssdb = Redis.new(host: 'boohee-falcon', port: 7983)
elsif Rails.env.test?
  $redis = Redis.new(host: 'localhost', port: 6379, db: 7)

  # $ssdb = Redis.new(host: 'localhost', port: 6379)
else
  $redis = Redis.new(host: 'localhost', port: 6379, db: 6)

  # $ssdb = Redis.new(host: 'localhost', port: 7981)
end
