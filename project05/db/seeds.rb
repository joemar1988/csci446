# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
title = "Pro Wrestling Challenge"
description = "Professional wrestling is a combination of athletics and theatrical performance. It takes the form of events, held by touring companies, which mimic a title match combat sport. The unique form of sport portrayed is fundamentally based on classical and catch wrestling, with modern additions of striking attacks, strength-based holds and throws, and acrobatic maneuvers; much of these derive from the influence of various international martial arts. An additional aspect of combat with improvised weaponry is sometimes included to varying degrees.
The matches have preplanned outcomes in order to heighten entertainment value, and all combative maneuvers are worked in order to lessen the chance of actual injury.[1] These facts were once kept highly secretive but are now a widely accepted open secret. By and large, the true nature of the performance is not discussed by the performing company in order to sustain and promote the willing suspension of disbelief for the audience by maintaining an aura of verisimilitude."
titl = "Quarterback"
descriptio = "Retired 1998"
tit = "Tight End"
descripti = "Retired 2002"
ti = "Running Back"
descript = "Retired 2003"
Article.create( :title => title , :description => description , :author => Author.new( :name => 'Joe Martinez'));
Article.create( :title => titl , :description => descriptio , :author => Author.new( :name => 'John Elway'));
Article.create( :title => tit , :description => descripti , :author => Author.new( :name => 'Shannon Sharpe'));
Article.create( :title => ti , :description => descript , :author => Author.new( :name => 'Terrell Davis'));