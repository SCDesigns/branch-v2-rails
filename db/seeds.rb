#Seed file to populate Branch feed. Seed with 'rake db:seed'

def make_seeds
  make_cities
  make_categories
  make_users
  make_branches
end

def make_cities
  ['New York','Chicago','Los Angeles'].each do |name|
    City.create(name: name)
  end
end

def make_categories
  ['Music','Sports','Theatre','Tourism'].each do |name|
    Category.create(name: name, city_ids: [1, 2, 3])
  end
end


def make_users
  #Admin
    User.create(name: "admin", password: "asecret", email: "admin@branch.com", role: 1)
  #Venues
    User.create(name: "MSG", password: "4penn", email: "events@msg.com")
    User.create(name: "Apollo", password: "showtime", email: "events@theapollo.com")
    User.create(name: "United", password: "overbooked", email: "events@unitedcenter.com")
    User.create(name: "HouseOfBlues", password: "bbking", email: "events@hob.com")
    User.create(name: "HollywoodBowl", password: "notcereal", email: "events@thebowl.com")
  #Users
    User.create(name: "DefinitelyKyle", password: "shredthegnar", email: "totallykyle@gmail.com")
    User.create(name: "OkayyRach", password: "yayitsrach", email: "rachelg@aol.com")
end

def make_branches
##########
#  NYC   #
##########
  Branch.create(
    name: "Citi Hoops Classic: Kentucky Wildcats vs. Monmouth Hawks",
    organization: "NCAA",
    date: "2017-12-09 12:00:00 UTC",
    location: "Madison Sqaure Garden - Madison Square Garden, New York, NY 10001",
    info: "For Tickets & Game Times Visit - https://seatgeek.com/monmouth-hawks-at-kentucky-wildcats-basketball-tickets/ncaa-basketball/2017-12-09-12-pm/4000650",
    user: User.find_by(id: 2),
    category: Category.find_by(id: 2),
    city: City.find_by(id: 1))
  Branch.create(
    name: "New Jersey Devils at New York Rangers",
    organization: "NHL",
    date: "2017-12-09 19:00:00 UTC",
    location: "Madison Sqaure Garden - Madison Square Garden, New York, NY 10001",
    info: "For Tickets & Game Times Visit - http://madisonsquaregarden.ticketoffices.com/New+York+Rangers",
    user: User.find_by(id: 2),
    category: Category.find_by(id: 2),
    city: City.find_by(id: 1))
  Branch.create(
    name: "Amateur Night Holiday Special",
    organization: "Apollo Theatre Foundation",
    date: "2017-12-09 19:30:00 UTC",
    location: "Apollo Theatre - 253 W 125th St, New York, NY 10027",
    info: "For Tickets & More Info - https://www.apollotheater.org/calendar/",
    user: User.find_by(id: 2),
    category: Category.find_by(id: 3),
    city: City.find_by(id: 1))
  Branch.create(
    name: "Street Hockey Tournament",
    organization: "Downtown Rec",
    date: "2017-12-09 13:00:00 UTC",
    location: "Basketball Park - 322 2nd Ave, New York, NY 10003",
    info: "Call Kyle at 917-303-6411 and bring Skates!",
    user: User.find_by(id: 6),
    category: Category.find_by(id: 3),
    city: City.find_by(id: 1))
end
# ##########
# #  CHI   #
# ##########
#   Branch.create(
#     name: "Chicago Blackhawks vs. Nashville Predators - Game 4",
#     organization: "NHL",
#     date: "2017-04-20 20:00:00 UTC",
#     location: "United Center - 1901 W Madison St, Chicago, IL 60612",
#     info: "For Tickets & More Info - http://www.unitedcenter.com/",
#     user: User.find_by(id: 3),
#     category: Category.find_by(id: 2),
#     city: City.find_by(id: 2))
#   Branch.create(
#     name: "Chicago Bulls vs. Boston Celtics - Game 3",
#     organization: "NHL",
#     date: "2017-04-21 19:00:00 UTC",
#     location: "Apollo Theatre - 253 W 125th St, New York, NY 10027",
#     info: "For Tickets & More Info - http://www.unitedcenter.com/",
#     user: User.find_by(id: 3),
#     category: Category.find_by(id: 2),
#     city: City.find_by(id: 2))
#   Branch.create(
#     name: "Monster Energy Outbreak Presents: 21 Savage ‑ Issa Tour",
#     organization: "House of Blues Chicago",
#     date: "2017-04-20 17:30:00 UTC",
#     location: "329 N Dearborn St, Chicago, IL 60654",
#     info: "For Tickets & Schedule - http://www.ticketmaster.com/House-of-Blues-Chicago-tickets-Chicago/venue/32905",
#     user: User.find_by(id: 4),
#     category: Category.find_by(id: 1),
#     city: City.find_by(id: 2))
#
# ##########
# #  LA   #
# ##########
#   Branch.create(
#     name: "Lionel Richie: All The Hits With Very Special Guest Mariah Carey",
#     organization: "Hollywood Bowl",
#     date: "2017-05-05 19:00:00 UTC",
#     location: "2301 Highland Avenue, Los Angeles, CA",
#     info: "For Tickets & Schedule - http://www.livenation.com/venues/14273/hollywood-bowl",
#     user: User.find_by(id: 5),
#     category: Category.find_by(id: 1),
#     city: City.find_by(id: 3))
# end

make_seeds
