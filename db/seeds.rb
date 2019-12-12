# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
u1 = User.create :name => 'kian', :email => 'kian@gmail.com', :password => 'chicken', :admin => true
u2 = User.create :name => 'test', :email => 'test@ga.com'   , :password => 'chicken', :admin => false
puts "#{User.count} users created"


Product.destroy_all
p1 = Product.create :name => 'London', :category => 'Door Sign', :price => 30.0, :img_tag => 'https://sdo.textalk.se/upload/doorsigns/fornicklad_massing_jcgt4748.svg',
  :material => 'Silver Brass', :width => 40, :height => 30, :fixing_method => 'scrow'

p2 = Product.create :name => 'Oslo', :category => 'Door Sign', :price => 30.0,
  :img_tag => 'https://sdo.textalk.se/upload/doorsigns/blank_massing_jcgt4746.svg', :material => 'Matt Brass', :width => 40, :height => 30, :fixing_method => 'scrow'

puts "#{Product.count} products created"

Order.destroy_all
o1 = Order.create(:total_price => 30.0, :user_id => u1.id)

puts "#{Order.count} orders created"

LineItem.destroy_all
l1 = LineItem.create(:quantity => 1, :product_id => p1.id, :order_id => o1.id)
puts "#{LineItem.count} lineitem created"
