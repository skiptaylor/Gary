get '/sign-in/?' do
  erb :'sign-in'
end

post '/sign-in/?' do
  params[:username].strip!
  params[:username].downcase!
  params[:password].strip!
  params[:password].downcase!
  if (params[:username] == 'gary') && (params[:password] == 'littlefella')
    session[:admin] = true
    redirect '/workshops'
  else
    session[:flash] = 'Sign in failed. Try again.'
    redirect '/sign-in'
  end
end

get '/sign-out/?' do
  session[:admin] = nil
  session[:flash] = 'You are now signed out.'
  redirect '/'
end


helpers do
  
  
# Gary must be signed in

  def authenticate
    redirect '/sign-in' unless session[:admin]
  end
  
  
end
