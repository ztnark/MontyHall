
get '/' do
  session[:gold] = rand(1..3)
  puts session[:gold]
  redirect '/game_on'
end

get '/game_on' do
  erb :game_on
end

get '/door1' do
  @gold = session[:gold]
  @chosen_door = 1
  erb :open_door
end

get '/door2' do

  @gold = session[:gold]
  @chosen_door = 2
  erb :open_door
end

get '/door3' do

  @gold = session[:gold]
  @chosen_door = 3
  erb :open_door
end

get '/switch/:door/:gold' do
  final_door = params[:door]
  @gold = params[:gold]
  if final_door ==  params[:gold]
    Game.create(win: true, switch: true)
    @outcome = "WINNER WINNER CHICKEN DINNER"
  else
    Game.create(win: false, switch: true)
    @outcome = "You LOSE"
  end
  erb :show
end

get '/keep/:door/:gold' do 
  @gold = params[:gold]
  final_door = params[:door]
  if final_door == params[:gold]
    Game.create(win: true, switch: false)
    @outcome = "WINNER WINNER CHICKEN DINNER"
  else
    Game.create(win: false, switch: false)
    @outcome = "You LOSE"
  end
  erb :show
end


# get '/show' do 
#   @gold = session[:gold]
#   erb :show
# end


