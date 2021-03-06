# config/initializers/geocoder.rb
Geocoder.configure(

  # geocoding service (see below for supported options):
  :lookup => :dstk,

  # to use an API key:
#   :api_key => "...",

#   geocoding service request timeout, in seconds (default 3):
  :timeout => 6,

  # set default units to kilometers:
#   :units => :km,

  # caching (see below for details):
#   :cache => Redis.new,
#   :cache_prefix => "..."

)