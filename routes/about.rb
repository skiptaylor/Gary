get '/?' do
  @workshop = Workshop.upcoming
  erb :'about/home'
end

get '/about/gary/?' do
  erb :'about/gary'
end

get '/about/workshops/?' do
  erb :'about/workshops'
end

get '/about/studyguides/?' do
  erb :'about/studyguides'
end

get '/thankyou/?' do
  erb :'thankyou'
end

get '/sign-in/?' do
  erb :'sign-in'
end