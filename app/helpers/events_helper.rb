module EventsHelper

  def get_random_message
    messages = [
        'Have you heard of our Lord and Saviour, J.E.N.O.V.A.?',
        'Well, there is space to land NOW.',
        'Don\'t underestimate Craft: The Bones of my Enemies.',
        'Being captured by G0NK the Bounty Hunder: more insult than injury, really.',
        'So, do I pay you money for more information now, or...?',
        'Skinship is a Charisma skill, right?',
        'Don\'t ask why we hate turbolift shafts.',
        'Dustin\'s regret #17: Zephei\'s Diplomacy modifier.',
        'Oh yes, these tunnels were actually carved out by the water of Laaren\'s birth...',
        'Please don\'t try to punch the Harbringer.',
        'Okay, so here\'s the plan... We kill Abe. And then frame the Imperials!',
        'I attach my Swan Boat Feather Token to an arrow!',
        'I believe they came by boat.',
        'Let\'s drop this base!'
    ]
    messages[Random.new.rand(messages.length)]
  end

end
