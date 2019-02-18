require 'json'
require 'open-uri'
require 'nokogiri'

## SEED ITINERARIES FROM CAMP_TO_CAMP
def api_call(itinerary, id)
  url = "https://api.camptocamp.org/#{itinerary}/#{id.to_s}"
  itinerary_hash = JSON.parse(open(url).read)
end

Itinerary.destroy_all

sitemap0 = Nokogiri::HTML(open("https://www.camptocamp.org/sitemaps/r/0.xml"))
sitemap1 = Nokogiri::HTML(open("https://www.camptocamp.org/sitemaps/r/1.xml"))
itinerary_ids = []

sitemap0.xpath("//loc").each do |url|
  itinerary_ids << url.to_s.split("/")[4]
end

sitemap1.xpath("//loc").each do |url|
  itinerary_ids << url.to_s.split("/")[4]
end

itinerary_ids[0..30].each do |id|
  itinerary = Itinerary.new
  itinerary.coord_x = api_call("routes", id)["geometry"]["geom"][17..-1].split(",")[0]
  itinerary.coord_y = api_call("routes", id)["geometry"]["geom"][17..-1].split(",")[1][1..-2]
  itinerary.diffculty = api_call("routes", id)["global_rating"]
  itinerary.elevation_max = api_call("routes", id)["elevation_max"]
  itinerary.height_diff_up = api_call("routes", id)["height_diff_up"]
  itinerary.engagement_rating = api_call("routes", id)["engagement_rating"]
  itinerary.equipment_rating = api_call("routes", id)["equipment_rating"]
  itinerary.activities = api_call("routes", id)["activities"]
  itinerary.orientations = api_call("routes", id)["orientations"]

  if api_call("routes", id)["associations"]["images"][0] != nil
    itinerary.picture_url = "https://media.camptocamp.org/c2corg-active/#{api_call("routes", id)["associations"]["images"][0]["filename"]}"
  end

  api_call("routes", id)["locales"].each do |locale|
    if locale["lang"] == "fr" && locale["title"] != nil
      itinerary.title = "#{locale["title_prefix"]} #{locale["title"]}"
    elsif locale["lang"] == "fr" && locale["title"].nil?
      itinerary.title = locale["title"]
    end
  end

  itinerary.number_of_outings = api_call("outings", id)["associations"]["recent_outings"]["total"]
  itinerary.save
  sleep(2)
end


## SEED FAKE USERS

User.destroy_all


## SEED FAKE TRIPS

Trip.destroy_all
