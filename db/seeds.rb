# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
["167387976606223_991165394228473", "167387976606223_991635970848082", "167387976606223_992060887472257"].each do |post_id|
  post = Post.new
  post.post_id = post_id
  post.save
end
