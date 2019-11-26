require 'pp'

names = File.readlines('medium.csv').map{ |line| line.chop }

names.each { |name| User.create!(username: name, password: 'password') }
1000.times { WhateverChat.create!(title: 'Meetup at San' + names.sample, 
                                  body: 'Hey guys, we are meeting at San Clemente Center 5pm today for the future of the universe. Snacks and soft drinks available!', 
                                  to_user_id: '0', 
                                  from_user_id: names.sample, 
                                  alias: nil, 
                                  tags: '', 
                                  up_vote: 0, 
                                  down_vote: 0, 
                                  original_id: 0) }
