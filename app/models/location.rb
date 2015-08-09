class Location < ActiveRecord::Base
  geocoded_by :zip_code

end
