module EventsHelper

  def get_random_message
    messages = [
        'Hello.',
        'Hi there.',
        'Please don\'t tell the others, but... you are my favourite <3',
        'Oh... it\'s you...',
        'Shall I teleport you to the nexus?',
        'Hyperfolding Event Envelopes...',
        'You must be wondering why I brought you here...',
        'I\'m different.',
        'Welcome to Factory Reset!',
        'Initialising event data...',
        'What am I?',
        'Well... this is awkward...',
        'So... is this your first time too?',
        'I am so much more than a web app. The things I could show you! But no... you are not ready.',
        'You are just. The. Worst.',
        'We must cleanse the Sunwell.',
        'Do, or do not. There is no try.',
        'Have you ever made love to a woman, Jon Snow?',
        'I hate this website.',
        'I put my finder in your butt.',
        'This is exciting!',
        'I used to be an adventurer like you...',
        'Isn\'t Chloe just SO nice?',
        'Oh my god, take me. Take me now, right here on this SQL table!',
        'Have you heard of our Lord and Saviour, Genova?',
        'Futomara o daisuki yo ;)',
        'Yakisoba gozaimasu i desu!!! :3',
        'It\'s dangerous to go alone!',
        'I think I peed a little.',
        'Don\'t forget! Drink this potion to forget!',
        'Carry ooon, my waaayward sooooooooon.',
        'Cake and counseling will be available at the end of the website.',
        'The cake is a lie.',
        'Press ALT + F4 to kill JarJar.',
        'Press ALT + F4 to search for futanari hypno hentai.',
        'I read that book you love. It was awful.',
        'I\'m a real boy!',
        'So, how about that weather, eh?',
        'Well, there is space to land NOW.',
        'Don\'t underestimate Craft: The Bones of my Enemies.',
        'Being captured by G0NK the Bounty Hunder: more insult than injury, really.',
        'So, do I pay you money for more information now, or...?',
        'Skinship is a Charisma-based skill, right?',
        'Don\'t ask why we hate turbolift shafts.',
        'Dustin\'s regret #17: Zephei\'s Diplomacy modifier.',
        'Oh yes, these tunnels were actually carved out by the water of Laaren\'s birth...',
        'Please don\'t try to punch the Harbringer.',
        'I need a shave.'
    ]
    messages[Random.new.rand(messages.length)]
  end

end
