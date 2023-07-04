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
Event.destroy_all
Message.destroy_all
Chatroom.destroy_all
User.destroy_all

file = File.open("app/assets/images/avatar1.png")
user = User.create!(id: 1, email: "admin@wagon.fr", nickname: "MASTER", password: "aloalo")
user.avatar.attach(io: file, filename: "avatar1.png", content_type: "image/jpg")
user.save

file = File.open("app/assets/images/avatar2.png")
user = User.create!(email: "alexis@wagon.fr", nickname: "alexis", password: "aloalo")
user.avatar.attach(io: file, filename: "avatar2.png", content_type: "image/jpg")
user.save

file = File.open("app/assets/images/avatar1.png")
user = User.create!(email: "romain@wagon.fr", nickname: "romain", password: "aloalo")
user.avatar.attach(io: file, filename: "avatar3.png", content_type: "image/jpg")
user.save

file = File.open("app/assets/images/avatar2.png")
user = User.create!(email: "quentin@wagon.fr", nickname: "quentin", password: "aloalo")
user.avatar.attach(io: file, filename: "avatar4.png", content_type: "image/jpg")
user.save

file = File.open("app/assets/images/avatar1.png")
user = User.create!(email: "arthur@wagon.fr", nickname: "arthur", password: "aloalo")
user.avatar.attach(io: file, filename: "avatar5.png", content_type: "image/jpg")
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

file = URI.open("https://icons8.com/icon/lte1KdZ4lP2I/liar-male")
game_1 = Game.create(title: "Two Truths and a Lie", rules: "Each person takes turns stating two true statements and one false statement about themselves. The group must guess which statement is the lie. The person who guesses correctly gets to choose who takes a drink.")
game_1.photo.attach(io: file, filename: "game1.png", content_type: "image/jpg")
game_1.save

file = URI.open("https://icons8.com/icon/25109/diversity")
game_2 = Game.create(title: "Categories", rules: 'Choose a category, such as "movies" or "sports teams" Starting with a player, each person must name something from that category within a few seconds. If someone fails to answer or repeats something already said, they take a drink.')
game_2.photo.attach(io: file, filename: "game2.png", content_type: "image/jpg")
game_2.save

file = URI.open("https://icons8.com/icon/10271/thumbs-up")
game_3 = Game.create(title: "Thumb Master", rules: 'One person is designated as the "Thumb Master." Throughout the evening, the Thumb Master discreetly puts their thumb on the edge of the table. As others notice and place their thumb on the table, the last person to do so drinks.')
game_3.photo.attach(io: file, filename: "game3.png", content_type: "image/jpg")
game_3.save

file = URI.open("https://icons8.com/icon/emHGHqyBaA5d/princess")
game_4 = Game.create(title: "Most Likely To...", rules: 'One person starts a sentence with "Most likely to..." and completes it with a scenario, such as "get arrested." On the count of three, everyone points to the person they think is most likely to fit the scenario. The person with the most votes takes a drink.')
game_4.photo.attach(io: file, filename: "game4.png", content_type: "image/jpg")
game_4.save

file = URI.open("https://icons8.com/icon/xrrbUt9GRgKr/o-key")
game_5 = Game.create(title: "Rhyme Time", rules: 'One person starts with a word, and the next person must quickly say a word that rhymes with it. This continues in a circle, and anyone who fails to come up with a rhyme within a few seconds takes a drink.')
game_5.photo.attach(io: file, filename: "game5.png", content_type: "image/jpg")
game_5.save

file = URI.open("https://icons8.com/icon/TW9bZua1rBzW/bad-bunny")
game_6 = Game.create(title: "Celebrity Name Game", rules: "Players take turns naming a celebrity. The next player must then name another celebrity whose first name starts with the first letter of the previous celebrity's last name. The game continues rapidly, and anyone who can't think of a name or repeats one takes a drink.")
game_6.photo.attach(io: file, filename: "game6.png", content_type: "image/jpg")
game_6.save

file = URI.open("https://icons8.com/icon/10164/christmas-penguin")
game_7 = Game.create(title: "I Have Never", rules: 'Players take turns saying "I have never..." followed by something they have never done. Anyone who has done the mentioned action must drink. The game continues with each player sharing something they have never done.')
game_7.photo.attach(io: file, filename: "game7.png", content_type: "image/jpg")
game_7.save

file = URI.open("https://icons8.com/icon/9210/snail")
game_8 = Game.create(title: "Rock, Paper, Scissors Tournament", rules: 'Organize a Rock, Paper, Scissors tournament among the participants. Players pair up and play a round of Rock, Paper, Scissors. The loser of each round takes a drink, and the tournament continues until a winner is determined.')
game_8.photo.attach(io: file, filename: "game8.png", content_type: "image/jpg")
game_8.save

file = URI.open("https://icons8.com/icon/41328/abacus")
game_9 = Game.create(title: "Counting Game", rules: 'Starting with a random number, players count in a circle, with each person saying the next number in sequence. However, there are two exceptions: any number containing a 7 or a multiple of 7 must be replaced with the word "buzz." Anyone who makes a mistake takes a drink.')
game_9.photo.attach(io: file, filename: "game9.png", content_type: "image/jpg")
game_9.save

file = URI.open("https://icons8.com/icon/21448/coins")
game_10 = Game.create(title: "Coin Toss", rules: 'Players take turns flipping a coin. They call "heads" or "tails" before flipping. If they guess correctly, they choose someone else to take a drink. If they guess wrong, they drink.')
game_10.photo.attach(io: file, filename: "game10.png", content_type: "image/jpg")
game_10.save

file = URI.open("https://icons8.com/icon/DgDkLzPxR-a4/frog-face")
game_11 = Game.create(title: "Name That Tune", rules: 'One person hums or sings a few bars of a popular song, and the others have to guess the song title and artist. The person who guesses correctly gets to choose who drinks.')
game_11.photo.attach(io: file, filename: "game11.png", content_type: "image/jpg")
game_11.save

file = URI.open("https://icons8.com/icon/30220/roulette")
game_12 = Game.create(title: "Shot Roulette", rules: 'Each player takes turns spinning a bottle placed in the center of the table. The bottle points to a participant who then chooses a shot for someone else to take.')
game_12.photo.attach(io: file, filename: "game12.png", content_type: "image/jpg")
game_12.save

file = URI.open("https://icons8.com/icon/9239/alligator")
game_13 = Game.create(title: "Word Association", rules: 'Players take turns saying a word that is associated with the previous word. The game continues quickly, and anyone who fails to come up with a related word within a few seconds drinks.')
game_13.photo.attach(io: file, filename: "game13.png", content_type: "image/jpg")
game_13.save

file = URI.open("https://icons8.com/icon/9210/snail")
game_14 = Game.create(title: "Cheers to the Left", rules: 'Players sit in a circle and take turns saying "Cheers to the left!" while raising their glasses and taking a drink. The person to the left must quickly say "Cheers to the right!" and take a drink.')
game_14.photo.attach(io: file, filename: "game14.png", content_type: "image/jpg")
game_14.save

file = URI.open("https://icons8.com/icon/9889/coconut-cocktail")
game_15 = Game.create(title: "Simon Says Drink", rules: 'Similar to the classic game Simon Says, one person takes the role of "Simon" and gives instructions starting with "Simon says." If Simon says, "Simon says drink," everyone takes a drink. If Simon gives an instruction without saying "Simon says," anyone who follows the command drinks.')
game_15.photo.attach(io: file, filename: "game15.png", content_type: "image/jpg")
game_15.save

file = URI.open("https://icons8.com/icon/59383/hiragana-ha")
game_16 = Game.create(title: "Alphabet Categories", rules: 'Choose a category (e.g., animals, countries, food). Starting with a player, each person has to name something from that category that begins with the next letter of the alphabet. If someone fails to answer or repeats something already said, they drink.')
game_16.photo.attach(io: file, filename: "game16.png", content_type: "image/jpg")
game_16.save

file = URI.open("https://icons8.com/icon/59383/hiragana-ha")
game_17 = Game.create(title: "Buzzword", rules: 'Select a buzzword or a forbidden word at the beginning of the evening. Whenever someone says the word, they have to take a drink. The person who catches others saying the word assigns the penalty.')
game_17.photo.attach(io: file, filename: "game17.png", content_type: "image/jpg")
game_17.save

file = URI.open("https://icons8.com/icon/9480/literature")
game_18 = Game.create(title: "Story Time", rules: 'One person starts a story with a sentence. Then, each player adds one sentence to continue the story. The story goes around the circle, and if someone forgets or messes up the story, they take a drink.')
game_18.photo.attach(io: file, filename: "game18.png", content_type: "image/jpg")
game_18.save

file = URI.open("https://icons8.com/icon/58097/tango")
game_19 = Game.create(title: "Dance-Off", rules: 'Challenge another participant to a dance-off. Take turns showcasing your best dance moves, and the rest of the group determines the winner. The loser drinks, and a new challenger can step forward')
game_19.photo.attach(io: file, filename: "game19.png", content_type: "image/jpg")
game_19.save

file = URI.open("https://icons8.com/icon/7844/crazy")
game_20 = Game.create(title: "Emoji Interpretation", rules: 'Share a popular or random emoji with the group, and each person must come up with the funniest or most creative interpretation of what it represents. The person with the best interpretation gets to assign a drink.')
game_20.photo.attach(io: file, filename: "game20.png", content_type: "image/jpg")
game_20.save

file = URI.open("https://icons8.com/icon/10325/micro")
game_21 = Game.create(title: "Blind Taste Test", rules: 'Blindfold a participant and give them different shots or drink samples. They have to guess the type of alcohol or beverage they are tasting. If they guess incorrectly, they take a drink.')
game_21.photo.attach(io: file, filename: "game21.png", content_type: "image/jpg")
game_21.save

file = URI.open("https://icons8.com/icon/9010/movie")
game_22 = Game.create(title: "Charades", rules: 'Act out a movie, song, or book without speaking, and the others have to guess what it is. The person who fails to guess correctly takes a drink, and a new actor takes their turn.')
game_22.photo.attach(io: file, filename: "game22.png", content_type: "image/jpg")
game_22.save

file = URI.open("https://icons8.com/icon/41273/speed")
game_23 = Game.create(title: "Speed Questions", rules: 'Each player must ask a rapid-fire question to the person next to them. The questions can be as silly or challenging as desired. If someone hesitates or repeats a question, they take a drink.')
game_23.photo.attach(io: file, filename: "game23.png", content_type: "image/jpg")
game_23.save

file = URI.open("https://icons8.com/icon/84635/earth-planet")
game_24 = Game.create(title: "World Tour", rules: 'A challenge to be done during a pub crawl with international bars. Each participant must order a typical drink from a different country at each stop. The challenge is to taste exotic beverages and discover new flavors.')
game_24.photo.attach(io: file, filename: "game24.png", content_type: "image/jpg")
game_24.save

file = URI.open("https://icons8.com/icon/BfXI0CM8A8-S/couple-posing")
game_25 = Game.create(title: "Tandem Shot Challenge", rules: "Participants form teams of two. Each team has to order a 'tandem shot,' where both partners have to drink the shot at the same time, without stopping until it's empty. The team that finishes the fastest wins, and the other teams have to drink.")
game_25.photo.attach(io: file, filename: "game25.png", content_type: "image/jpg")
game_25.save

file = URI.open("https://icons8.com/icon/36114/adam-sandler")
game_26 = Game.create(title: "Movie Quote Game", rules: 'Players take turns quoting lines from movies. The next person must guess which movie the quote is from. If they guess correctly, the person who said the quote drinks. Otherwise, they drink.')
game_26.photo.attach(io: file, filename: "game26.png", content_type: "image/jpg")
game_26.save
