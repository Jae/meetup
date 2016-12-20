# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
[
  {
    title: "Founders and Coders Unofficial Meetup",
    address: "5 Pancras Rd, N1C 4AG",
    city: "London",
    start_time: Time.new(2016,12,20,11),
    end_time: Time.new(2016,12,20,20),
    topics: ["Entrepreneurship", "Startup Businesses", "Software Development"]
  },
  {
    title: "Christmas Party: Citizen Inventor x Humanising Tech",
    address: "Chandos Place, Covent Garden, WC2N 4HS",
    city: "London",
    start_time: Time.new(2016,12,20,20),
    topics: ["Entrepreneurship", "Artificial Intelligence", "Software Development"]
  },
  {
    title: "Botmas drinks",
    address: "1 Fore Street, EC2Y 5EJ",
    city: "London",
    start_time: Time.new(2016,12,20,20,30),
    topics: ["Entrepreneurship", "chatbots", "Artificial Intelligence", "Mobile Development"]
  },
  {
    title: "London Clojure Dojo at ThoughtWorks (Soho)",
    address: "First Floor 76-78 Wardour Street London, W1F 0UR",
    city: "London",
    start_time: Time.new(2016,12,27,18,45),
    end_time: Time.new(2016,12,27,21,45),
    topics: ["Functional Programming", "Clojure", "Software Development"]
  },
  {
    title: "Intro to Graphs with Neo4j",
    address: "5 - 11 Lavington Street, SE10NZ",
    city: "London",
    start_time: Time.new(2017,1,4,18,30),
    end_time: Time.new(2017,1,4,20),
    topics: ["Graph Databases", "Big Data", "NoSQL"]
  },
  {
    title: "London Linux Drinks (every 3rd week)",
    address: "22 High Holborn, WC1V 6BN",
    city: "London",
    start_time: Time.new(2017,1,4,19),
    topics: ["Linux", "DevOps", "System Administration"]
  },
  {
    title: "London Linux Drinks (every 3rd week)",
    address: "22 High Holborn, WC1V 6BN",
    city: "London",
    start_time: Time.new(2017,1,4,19),
    topics: ["Linux", "DevOps", "System Administration"]
  },
  {
    title: "Tech Startups and New Ideas Night",
    address: "58 Gresham Street, EC2V 7BB",
    city: "London",
    start_time: Time.new(2017,1,4,18,45),
    end_time: Time.new(2017,1,4,21,30),
    topics: ["Entrepreneurship", "Startup Businesses", "Software Development"]
  }
].each do |event|
  Event.create_with(event.except(:title)).find_or_create_by(event.slice(:title))
end
