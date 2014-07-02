class EventsController < ApplicationController

  def index
    @events = Event.all
    @random_message = get_random_message
  end

  def new
  end

  def create
    @event = Event.new(event_params)
    @event.save
    redirect_to @event
    # replace with redirect to home directory: redirect_to '/'
  end

  def show
    @event = Event.find(params[:id])
  end

  private

    def event_params
      params.require(:event).permit(:game_title, :session_title, :date_time, :address, :instructions, :description)
    end

    def get_random_message
      messages = Array.new
      messages << 'Hello'
      messages << 'Hi there'
      messages << 'Please don\'t tell the others, but... you are my favourite <3'
      messages << 'Oh... it\'s you...'
      messages << 'Shall I teleport you to the nexus?'
      messages << 'Hyperfolding Event Envelopes...'
      messages << 'You must be wondering why I brought you here...'
      messages << 'I\'m different.'
      messages << 'Welcome to Factory Reset!'
      messages << 'Initialising event data...'
      messages << 'What am I?'
      messages << 'Well... this is awkward...'
      messages << 'So... is this your first time too?'
      messages << 'I am so much more than a web app. The things I could show you! But no... you are not ready.'
      messages << 'You are just. The. Worst.'
      messages << 'We must cleanse the Sunwell.'
      messages << 'Do, or do not. There is no try.'
      messages << 'Have you ever made love to a woman, Jon Snow?'
      messages << 'I hate this website.'
      messages << 'I put my finder in your butt.'
      messages << 'This is exciting!'
      messages << 'I used to be an adventurer like you...'
      messages << 'Isn\'t Chloe just SO nice?'
      messages << 'Oh my god, take me. Take me now, right here on this SQL table!'
      messages << 'Have you heard of our Lord and Saviour, Genova?'
      messages << 'Futomara o daisuki yo ;)'
      messages << 'Yakisoba gozaimasu i desu!!! :3'
      messages << 'It\'s dangerous to go alone!'
      messages << 'I think I peed a little.'
      messages << 'Don\'t forget! Drink this potion to forget!'
      messages << 'Carry ooon, my waaayward sooooooooon.'
      messages << 'Cake and counseling will be available at the end of the website.'
      messages << 'The cake is a lie.'
      messages << 'Press ALT + F4 to kill JarJar.'
      messages << 'Press ALT + F4 to search for futanari hypno hentai.'
      messages << 'I read that book you love. It was awful.'
      messages << 'I\'m a real boy!'
      messages << 'So, how about that weather, eh?'
      messages << 'Well, there is space to land NOW.'
      messages << 'Don\'t underestimate Craft: The Bones of my Enemies.'
      messages << 'Being captured by G0NK the Bounty Hunder: more insult than injury, really.'
      messages << 'So, do I pay you money for more information now, or...?'
      messages << 'Skinship is a Charisma-based skill, right?'
      messages << 'Don\'t ask why we hate turbolift shafts.'
      messages << 'Dustin\'s regret #17: Zephei\'s Diplomacy modifier.'
      messages << 'Oh yes, these tunnels were actually carved out by the water of Laaren\'s birth...'
      messages << 'Please don\'t try to punch the Harbringer.'
      messages << 'I need a shave.'
      messages[Random.new.rand(messages.length)]
    end

end