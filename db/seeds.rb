# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Pubcrawl.destroy_all
Bar.destroy_all
User.destroy_all

user_1 = User.create!( email: "alexis@wagon.fr", password: "aloalo")
user_1.save

# user_2 = User.create!(username: "Blazor", email: "romain@wagon.fr", password: "aloalo")
# user_2.save

# user_3 = User.create!(username: "Zorg", email: "quentin@wagon.fr", password: "aloalo")
# user_3.save

# user_4 = User.create!(username: "Nebulox", email: "arthur@wagon.fr", password: "aloalo")
# user_4.save

bar_1 = Bar.create(name: "Bistro General", description: "At Bistro Général, immerse yourself in the cozy ambiance of a little corner of France with delicious dishes and an exquisite selection of wines.", address: "17 Rue Eugène Sue, 75018 Paris")
bar_1.save

bar_2 = Bar.create(name: "Dikkenek", description: "Dikkenek transports you to a wild atmosphere with its eclectic decor, captivating music, and original cocktails.", address: "59 Rue Ramey, 75018 Paris")
bar_2.save

bar_3 = Bar.create(name: "Enkore", description: "At Enkore, indulge in refined gastronomic dishes in a modern and elegant setting, accompanied by a carefully curated wine list.", address: "16 Rue Letort, 75018 Paris")
bar_3.save

bar_4 = Bar.create(name: "Le gadjio", description: "Le gadjio is the perfect place for live music enthusiasts, offering exciting performances in a unique bohemian atmosphere.", address: "15 Rue Pierre Fontaine")
bar_4.save

bar_5 = Bar.create(name: "Le barbiche", description: "Experience the warm and laid-back vibe of Le barbiche, where you can enjoy craft beers accompanied by delicious cheese and charcuterie boards.", address: "11 Rue Pierre Fontaine, 75009 Paris")
bar_5.save

bar_6 = Bar.create(name: "Le Boucan", description: "Discover an eclectic blend of flavors and styles at Le boucan, where talented mixologists will surprise you with unique cocktails on each visit.", address: "108 Bd de Clichy, 75018 Paris")
bar_6.save

bar_7 = Bar.create(name: "L'orange mécanique", description: "L'Orange Mécanique immerses you in a futuristic and surreal universe, with colorful cocktails, mesmerizing light shows, and a lively dance floor.", address: "59 Rue de la Fontaine au Roi, 75011 Paris")
bar_7.save

bar_8 = Bar.create(name: "Chat noir", description: "Le Chat Noir is a haven for cat lovers, where you can sip your coffee in the company of these adorable felines.", address: "76 Rue Jean-Pierre Timbaud, 75011 Paris")
bar_8.save

bar_9 = Bar.create(name: "Café chéri", description: "At Café Chéri, enjoy a cozy atmosphere and a delightful selection of traditional French pastries.", address: "44 Boulevard de la Chapelle, 75018 Paris")
bar_9.save

bar_10 = Bar.create(name: "Central", description: "Central is the perfect spot for sports enthusiasts, with giant screens broadcasting the latest matches and a vibrant atmosphere.", address: "Calle José de Velilla, 1, 41001 Sevilla, Espagne")
bar_10.save

bar_11 = Bar.create(name: "Bulebar", description: "At Bulebar, let yourself be seduced by its bohemian atmosphere and artistic decor while savoring creative cocktails and delicious tapas.", address: "Calle Betis, 69, 41010 Sevilla, Espagne")
bar_11.save

bar_12 = Bar.create(name: "Plan B", description: "Plan B is a trendy bar where you can enjoy daring cocktails, play board games, and experience original themed nights.", address: "Calle Betis, 52, 41010 Sevilla, Espagne")
bar_12.save

bar_13 = Bar.create(name: "Alfalfa", description: "Alfalfa is a vegetarian bar offering a variety of healthy and refreshing drinks, as well as creative vegan dishes.", address: "Calle Candilejo, 1, 41004 Sevilla, Espagne")
bar_13.save

bar_14 = Bar.create(name: "Agua de fuego", description: "Agua de Fuego is an exotic cocktail bar that will awaken your senses with tropical flavors and a fiery ambiance.", address: "Calle Peris Mencheta, 21, 41004 Sevilla, Espagne")
bar_14.save

bar_15 = Bar.create(name: "La bodega", description: "Immerse yourself in the cozy atmosphere of La Bodega, where you can enjoy traditional Spanish tapas and a selection of fine wines.", address: "Calle Alfalfa, 3, 41004 Sevilla, Espagne")
bar_15.save


pubcrawl_1 = Pubcrawl.create(name: "Pubcrawl Paris 18", description: "Explore the vibrant nightlife of Paris with our Super Pubcrawl, where you'll visit the trendiest bars in the Marais district, sip delicious cocktails, and dance the night away.", location: "Paris", category: "Night fever", nb_max: 50, first_bar: bar_1, middle_bar: bar_2, last_bar: bar_3)
pubcrawl_1.save

pubcrawl_2 = Pubcrawl.create(name: "Pubcrawl Paris 9", description: "Join our exhilarating Super Pubcrawl through the lively Latin Quarter in Paris, where you'll experience an unforgettable evening of bar-hopping, meeting fellow travelers, and enjoying a mix of music genres.", location: "Paris", category: "Night fever", nb_max: 40, first_bar: bar_4, middle_bar: bar_5, last_bar: bar_6)
pubcrawl_2.save

pubcrawl_3= Pubcrawl.create(name: "Pubcrawl Paris 11", description: "Embark on a thrilling Super Pubcrawl in the bustling neighborhood of Bastille in Paris, where you'll discover hidden gem bars, indulge in local drinks, and make memories with new friends from around the world.", location: "Paris", category: "Chill", nb_max: 20, first_bar: bar_7, middle_bar: bar_8, last_bar: bar_9)
pubcrawl_3.save

pubcrawl_4 = Pubcrawl.create(name: "Pubcrawl Seville Alameda", description: "Experience the pulsating energy of Seville with our Super Pubcrawl, taking you through the enchanting streets of Alfalfa and Alameda neighborhoods, immersing you in the vibrant local nightlife scene.", location: "Seville", category: "Chill", nb_max: 100, first_bar: bar_10, middle_bar: bar_11, last_bar: bar_12)
pubcrawl_4.save

pubcrawl_5 = Pubcrawl.create(name: "Pubcrawl Seville Alfalfa", description: "Join our unforgettable Super Pubcrawl in Seville, where you'll dive into the lively atmosphere of the city's historic center, visit authentic tapas bars, and dance the night away to traditional flamenco beats.", location: "Seville", category: "Night fever", nb_max: 25, first_bar: bar_13, middle_bar: bar_14, last_bar: bar_15)
pubcrawl_5.save
