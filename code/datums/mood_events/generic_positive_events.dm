/datum/mood_event/ally_power
	description= "<span class='nicegreen'>You feel at ease, from being surrounded by your friends.</span>\n"
	mood_change = 1
	timeout = 2 MINUTES

/datum/mood_event/hug
	description = "<span class='nicegreen'>Hugs are nice.</span>\n"
	mood_change = 1
	timeout = 2 MINUTES

/datum/mood_event/betterhug
	description = "<span class='nicegreen'>Someone was very nice to me.</span>\n"
	mood_change = 3
	timeout = 5 MINUTES

/datum/mood_event/betterhug/add_effects(mob/friend)
	description = "<span class='nicegreen'>[friend.name] was very nice to me.</span>\n"

/datum/mood_event/besthug
	description = "<span class='nicegreen'>Someone is great to be around, they make me feel so happy!</span>\n"
	mood_change = 5
	timeout = 5 MINUTES

/datum/mood_event/besthug/add_effects(mob/friend)
	description = "<span class='nicegreen'>[friend.name] is great to be around, [friend.p_they()] makes me feel so happy!</span>\n"

/datum/mood_event/lamphug
	description = "<span class='nicegreen'>I just hugged a lamp.</span>\n"
	mood_change = 3
	timeout = 5 MINUTES

/datum/mood_event/lamphug/add_effects(mob/friend)
	description = "<span class='nicegreen'>I hugged a lamp called [friend.name].</span>\n"

/datum/mood_event/arcade
	description = "<span class='nicegreen'>I beat the arcade game!</span>\n"
	mood_change = 3
	timeout = 5 MINUTES

/datum/mood_event/blessing
	description = "<span class='nicegreen'>I've been blessed.</span>\n"
	mood_change = 3
	timeout = 5 MINUTES

/datum/mood_event/book_nerd
	description = "<span class='nicegreen'>I have recently read a book.</span>\n"
	mood_change = 3
	timeout = 5 MINUTES

/datum/mood_event/exercise
	description = "<span class='nicegreen'>Working out releases those endorphins!</span>\n"
	mood_change = 2
	timeout = 5 MINUTES

/datum/mood_event/pet_animal
	description = "<span class='nicegreen'>Animals are adorable! I can't stop petting them!</span>\n"
	mood_change = 3
	timeout = 5 MINUTES

/datum/mood_event/pet_animal/add_effects(mob/animal)
	description = "<span class='nicegreen'>\The [animal.name] is adorable! I can't stop petting [animal.p_them()]!</span>\n"

/datum/mood_event/honk
	description = "<span class='nicegreen'>I've been honked!</span>\n"
	mood_change = 2
	timeout = 4 MINUTES

/datum/mood_event/saved_life
	description = "<span class='nicegreen'>It feels good to save a life.</span>\n"
	mood_change = 6
	timeout = 5 MINUTES

/datum/mood_event/oblivious
	description = "<span class='nicegreen'>What a lovely day.</span>\n"
	mood_change = 3

/datum/mood_event/jolly
	description = "<span class='nicegreen'>I feel happy for no particular reason.</span>\n"
	mood_change = 6
	timeout = 2 MINUTES

/datum/mood_event/focused
	description = "<span class='nicegreen'>I have a goal, and I will reach it, whatever it takes!</span>\n" //Used for syndies, nukeops etc so they can focus on their goals
	mood_change = 12
	hidden = TRUE

/datum/mood_event/rebel
	description = "<span class='nicegreen'>Finally, change is in the air!</span>\n" //Used for rebels to buff up their mood
	mood_change = 5
	hidden = TRUE

/datum/mood_event/agent
	description = "<span class='nicegreen'>I have been giving a mission by my home district's administrator. I must not let emotions get in the way</span>\n" //Used for combine agents to buff up their mood
	mood_change = 10
	hidden = TRUE

/datum/mood_event/badass_antag
	description = span_nicegreen("I'm a fucking badass and everyone around me knows it. Just look at them; they're all fucking shaking at the mere thought of me around.\n")
	mood_change = 15
	hidden = TRUE

/datum/mood_event/creeping
	description = "<span class='greentext'>The voices have released their hooks on my mind! I feel free again!</span>\n" //creeps get it when they are around their obsession
	mood_change = 18
	timeout = 3 SECONDS
	hidden = TRUE

/datum/mood_event/revolution
	description = "<span class='nicegreen'>VIVA LA REVOLUTION!</span>\n"
	mood_change = 3
	hidden = TRUE

/datum/mood_event/cult
	description = "<span class='nicegreen'>I have seen the truth, praise the almighty one!</span>\n"
	mood_change = 40 //maybe being a cultist isnt that bad after all
	hidden = TRUE

/datum/mood_event/changeling
	description = "<span class='nicegreen'>No feeling supersedes our hunger.</span>\n" //if i could i'd just make them not get all those human feelings
	mood_change = 40
	hidden = TRUE

/datum/mood_event/heretics
	description = "<span class='nicegreen'>I can't stop here. If I continue my research, I could become immortal!</span>\n"
	mood_change = 10
	hidden = TRUE

/datum/mood_event/goodmusic
	description = "<span class='nicegreen'>There is something soothing about this music.</span>\n"
	mood_change = 3
	timeout = 1 MINUTES

/datum/mood_event/chemical_euphoria
	description = "<span class='nicegreen'>Heh...hehehe...hehe...</span>\n"
	mood_change = 4

/datum/mood_event/chemical_laughter
	description = "<span class='nicegreen'>Laughter really is the best medicine! Or is it?</span>\n"
	mood_change = 4
	timeout = 3 MINUTES

/datum/mood_event/chemical_superlaughter
	description = "<span class='nicegreen'>*WHEEZE*</span>\n"
	mood_change = 12
	timeout = 3 MINUTES

/datum/mood_event/religiously_comforted
	description = span_nicegreen("You are comforted by the presence of a holy person.\n")
	mood_change = 3
	timeout = 5 MINUTES

/datum/mood_event/clownshoes
	description = "<span class='nicegreen'>The shoes are a clown's legacy, I never want to take them off!</span>\n"
	mood_change = 5

/datum/mood_event/sacrifice_good
	description ="<span class='nicegreen'>The gods are pleased with this offering!</span>\n"
	mood_change = 5
	timeout = 3 MINUTES

/datum/mood_event/artok
	description = "<span class='nicegreen'>It's nice to see people are making art around here.</span>\n"
	mood_change = 2
	timeout = 2 MINUTES

/datum/mood_event/artgood
	description = "<span class='nicegreen'>What a thought-provoking piece of art. I'll remember that for a while.</span>\n"
	mood_change = 3
	timeout = 3 MINUTES

/datum/mood_event/artgreat
	description = "<span class='nicegreen'>That work of art was so great it made me believe in the goodness of humanity. Says a lot in a place like this.</span>\n"
	mood_change = 4
	timeout = 4 MINUTES

/datum/mood_event/hope_lavaland
	description = "<span class='nicegreen'>What a peculiar emblem.  It makes me feel hopeful for my future.</span>\n"
	mood_change = 5

/datum/mood_event/drippy
	description = "<span class='nicegreen'>My self confidence, unstopping. My style, unbreakable.</span>\n"
	mood_change = 5

/datum/mood_event/dripjordan
	description = "<span class='nicegreen'>These shoes make me feel like I could really push myself to victory!</span>\n"
	mood_change = 5

/datum/mood_event/motivation
	description = "<span class='nicegreen'>Sitting in that chair for so long really got me motivated.</span>\n"
	mood_change = 10
	timeout = 4 MINUTES

/datum/mood_event/confident_mane
	description = span_nicegreen("I'm feeling confident with a head full of hair.\n")
	mood_change = 2

/datum/mood_event/pet_borg
	description = span_nicegreen("I just love my robotic friends!\n")
	mood_change = 3
	timeout = 5 MINUTES
	required_job = list("Research Director", "Union Scientist", "Roboticist", "Geneticist") // Only for science and science-adjacent jobs.

/datum/mood_event/nice_tool
	description = span_nicegreen("I recently used a nice tool.\n")
	mood_change = 2
	timeout = 2 MINUTES

/datum/mood_event/adrenaline
	description = span_nicegreen("I'M FEELING THE ADRENALINE KICK IN!\n")
	mood_change = 8

/datum/mood_event/ice_cream
	description = span_nicegreen("I recently enjoyed some nice and cool ice cream.\n")
	mood_change = 2
	timeout = 2 MINUTES

/datum/mood_event/lovemaxpain
	description = "<span class='boldwarning'>THE PAIN, IT HURTS SO GOOD!!!</span>\n"
	mood_change = 12

/datum/mood_event/loveseriouspain
	description = "<span class='warning'>Fuck, it hurts so much, but feels so good...</span>\n"
	mood_change = 6

/datum/mood_event/area
	description = "" //Fill this out in the area
	mood_change = 0

/datum/mood_event/area/add_effects(_mood_change, _description)
	mood_change = _mood_change
	description = _description
