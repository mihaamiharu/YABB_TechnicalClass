require 'sinatra'

get '/messages' do 
    "<h1 style=\"background-color:DodgerBlue;\">Hello World !<h1>"
end

get '/messages/:name' do
     name = params['name'] 
     color = params['color'] ? params['color'] : 'DodgerBlue'
     erb:message, locals: {
        color: color,
        name: name
    }
    #"<h1 style=\"background-color:#{color};\">Hello #{name}<h1>"
end

get '/login' do
    erb :login
end

post '/login' do
    if params['username'] == "admin" && params['password'] == "admin"
        return "Logged In!"
    else
        redirect '/login'
    end
end

get '/item_list' do
      @item_name = params["item_name"]
      erb :item_list
end

get '/item_create' do
    erb :item_create
end

post '/item_create' do
    @item_name = params[:item_name]
end
