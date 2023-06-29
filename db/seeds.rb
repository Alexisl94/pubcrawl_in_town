# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

Pubcrawl.destroy_all
Bar.destroy_all
User.destroy_all

user = User.create!(email: "alexis@wagon.fr", nickname: "alexis", password: "aloalo")
user.save

user = User.create!(email: "romain@wagon.fr", nickname: "romain", password: "aloalo")
user.save

user = User.create!(email: "quentin@wagon.fr", nickname: "quentin", password: "aloalo")
user.save

user = User.create!(email: "arthur@wagon.fr", nickname: "arthur", password: "aloalo")
user.save

# Paris
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

# Seville
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

# Londres
bar_16 = Bar.create(name: "The Churchill Arms", description: "Step into The Churchill Arms and experience the charm of a traditional English pub. Enjoy a wide selection of ales, classic pub dishes, and the unique ambiance adorned with beautiful flowers.", address: "119 Kensington Church St, Kensington, London")
bar_16.save

bar_17 = Bar.create(name: "The Porterhouse Brewing Co.", description: "Discover the flavors of Ireland at The Porterhouse Brewing Co. This multi-level pub offers an extensive range of craft beers brewed on-site, along with hearty Irish fare.", address: "21-22 Maiden Ln, Covent Garden, London")
bar_17.save

bar_18 = Bar.create(name: "Nightjar", description: "Step into the glamorous world of cocktail speakeasies at Nightjar. Indulge in innovative and expertly crafted cocktails, accompanied by live jazz music in a dimly lit, intimate setting.", address: "129 City Rd, Hackney, London")
bar_18.save

# Berlin
bar_19 = Bar.create(name: "Prater Garten", description: "Escape the city buzz and relax in the idyllic Prater Garten, Berlin's oldest beer garden. Enjoy a cold German beer, traditional cuisine, and the lush green surroundings.", address: "Kastanienallee 7-9, Prenzlauer Berg, Berlin")
bar_19.save

bar_20 = Bar.create(name: "Kaschk", description: "Kaschk is a cozy craft beer and coffee bar, offering a unique combination of handcrafted brews and specialty coffees. Explore their rotating beer taps and enjoy the relaxed atmosphere.", address: "Linienstraße 40, Mitte, Berlin")
bar_20.save

bar_21 = Bar.create(name: "Green Door", description: "Step through the Green Door and discover a hidden gem of Berlin's cocktail scene. This speakeasy bar offers a wide range of innovative and artfully crafted cocktails.", address: "Winterfeldtstraße 50, Schöneberg, Berlin")
bar_21.save

# Madrid
bar_22 = Bar.create(name: "El Viajero", description: "El Viajero is a vibrant rooftop bar with stunning views of Madrid's skyline. Sip on refreshing cocktails, savor delicious tapas, and soak in the energetic atmosphere.", address: "Plaza de la Cebada, 11, La Latina, Madrid")
bar_22.save

bar_23 = Bar.create(name: "Del Diego", description: "Del Diego is a classic cocktail bar known for its expert mixology and elegant ambiance. Enjoy signature cocktails and personalized service in this sophisticated setting.", address: "Calle de la Reina, 12, Gran Vía, Madrid")
bar_23.save

bar_24 = Bar.create(name: "La Venencia", description: "Step back in time at La Venencia, a historic sherry bar that has preserved its traditional charm since the 1930s. Experience the authentic Spanish atmosphere while enjoying a glass of sherry.", address: "Calle de Echegaray, 7, Sol, Madrid")
bar_24.save

# Barcelone
bar_25 = Bar.create(name: "Paradiso", description: "Paradiso is a speakeasy cocktail bar hidden behind a refrigerator door in a pastrami shop. Explore their creative cocktails and immerse yourself in the mysterious atmosphere.", address: "Plaça de les Olles, 8, 08003 Barcelona, Spain")
bar_25.save

bar_26 = Bar.create(name: "El Xampanyet", description: "El Xampanyet is a traditional Spanish bar famous for its delicious cava and tapas. Join the lively crowd, enjoy the vibrant ambiance, and indulge in the local flavors.", address: "Carrer de Montcada, 22, El Born, Barcelona")
bar_26.save

bar_27 = Bar.create(name: "Bobby Gin", description: "Bobby Gin is a gin-focused bar that offers an extensive selection of premium gins and creative gin cocktails. Immerse yourself in the world of botanicals and enjoy the sophisticated atmosphere.", address: "Carrer de Francisco Giner, 47, Gràcia, Barcelona")
bar_27.save

file = URI.open("https://res.cloudinary.com/dgu6zhgkn/image/upload/v1687877455/photo-1566417713940-fe7c737a9ef2_inmchw.jpg")
pubcrawl = Pubcrawl.create(name: "Paris 18", description: "Explore the vibrant nightlife of Paris with our Super Pubcrawl, where you'll visit the trendiest bars in the Marais district, sip delicious cocktails, and dance the night away.", location: "Paris", category: "Night fever", nb_max: 50, first_bar: bar_1, middle_bar: bar_2, last_bar: bar_3)
pubcrawl.photo.attach(io: file, filename: "pubc1.png", content_type: "image/jpg")
pubcrawl.save

file = URI.open("https://res.cloudinary.com/dgu6zhgkn/image/upload/v1687877418/photo-1576661929310-a29e8fc38c7f_ps6z8c.jpg")
pubcrawl = Pubcrawl.create(name: "Paris 9", description: "Join our exhilarating Super Pubcrawl through the lively Latin Quarter in Paris, where you'll experience an unforgettable evening of bar-hopping, meeting fellow travelers, and enjoying a mix of music genres.", location: "Paris", category: "Night fever", nb_max: 40, first_bar: bar_4, middle_bar: bar_5, last_bar: bar_6)
pubcrawl.photo.attach(io: file, filename: "pubc2.png", content_type: "image/jpg")
pubcrawl.save

file = URI.open("https://res.cloudinary.com/dgu6zhgkn/image/upload/v1687877550/photo-1575444758702-4a6b9222336e_kynuea.jpg")
pubcrawl = Pubcrawl.create(name: "Paris 11", description: "Embark on a thrilling Super Pubcrawl in the bustling neighborhood of Bastille in Paris, where you'll discover hidden gem bars, indulge in local drinks, and make memories with new friends from around the world.", location: "Paris", category: "Chill", nb_max: 20, first_bar: bar_7, middle_bar: bar_8, last_bar: bar_9)
pubcrawl.photo.attach(io: file, filename: "pubc3.png", content_type: "image/jpg")
pubcrawl.save

file = URI.open("https://res.cloudinary.com/dgu6zhgkn/image/upload/v1687877431/photo-1569924995012-c4c706bfcd51_hyhich.jpg")
pubcrawl = Pubcrawl.create(name: "Seville Alameda", description: "Experience the pulsating energy of Seville with our Super Pubcrawl, taking you through the enchanting streets of Alfalfa and Alameda neighborhoods, immersing you in the vibrant local nightlife scene.", location: "Seville", category: "Chill", nb_max: 100, first_bar: bar_10, middle_bar: bar_11, last_bar: bar_12)
pubcrawl.photo.attach(io: file, filename: "pubc4.png", content_type: "image/jpg")
pubcrawl.save

file = URI.open("https://res.cloudinary.com/dgu6zhgkn/image/upload/v1687877472/photo-1590423859012-39c5ee2845bd_mbv1hb.jpg")
pubcrawl = Pubcrawl.create(name: "Seville Alfalfa", description: "Join our unforgettable Super Pubcrawl in Seville, where you'll dive into the lively atmosphere of the city's historic center, visit authentic tapas bars, and dance the night away to traditional flamenco beats.", location: "Seville", category: "Night fever", nb_max: 25, first_bar: bar_13, middle_bar: bar_14, last_bar: bar_15)
pubcrawl.photo.attach(io: file, filename: "pubc5.png", content_type: "image/jpg")
pubcrawl.save

file = URI.open("https://images.unsplash.com/photo-1493763175065-bb40a98094aa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80")
pubcrawl = Pubcrawl.create(name: "London Covent Garden", description: "Embark on a thrilling Pubcrawl through the vibrant streets of Covent Garden in London. Experience the lively atmosphere, enjoy handcrafted cocktails, and dance the night away in the heart of the city.", location: "London", category: "Night fever", nb_max: 60, first_bar: bar_16, middle_bar: bar_17, last_bar: bar_18)
pubcrawl.photo.attach(io: file, filename: "pubc6.png", content_type: "image/jpg")
pubcrawl.save

file = URI.open("https://images.unsplash.com/photo-1517457373958-b7bdd4587205?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1738&q=80")
pubcrawl = Pubcrawl.create(name: "Berlin Prenzlauer Berg", description: "Discover the hip and happening Prenzlauer Berg district in Berlin with our Pubcrawl. Enjoy the vibrant nightlife, hop from one trendy bar to another, and have a blast with fellow partygoers.", location: "Berlin", category: "Night fever", nb_max: 40, first_bar: bar_19, middle_bar: bar_20, last_bar: bar_21)
pubcrawl.photo.attach(io: file, filename: "pubc7.png", content_type: "image/jpg")
pubcrawl.save

file = URI.open("https://images.unsplash.com/photo-1519671482749-fd09be7ccebf?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80")
pubcrawl = Pubcrawl.create(name: "Madrid La Latina", description: "Experience the lively atmosphere of La Latina in Madrid with our Pubcrawl. Visit the most popular bars in the area, taste delicious cocktails, and dance the night away in the heart of the Spanish capital.", location: "Madrid", category: "Night fever", nb_max: 50, first_bar: bar_22, middle_bar: bar_23, last_bar: bar_24)
pubcrawl.photo.attach(io: file, filename: "pubc7.png", content_type: "image/jpg")
pubcrawl.save

file = URI.open("https://images.unsplash.com/photo-1556974065-52eeca9b8f68?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80")
pubcrawl = Pubcrawl.create(name: "Barcelona El Born", description: "Immerse yourself in the vibrant nightlife of El Born in Barcelona with our Pubcrawl. Discover hidden gems, sip on exquisite cocktails, and make unforgettable memories in the heart of the city.", location: "Barcelona", category: "Night fever", nb_max: 80, first_bar: bar_25, middle_bar: bar_26, last_bar: bar_27)
pubcrawl.photo.attach(io: file, filename: "pubc8.png", content_type: "image/jpg")
pubcrawl.save
