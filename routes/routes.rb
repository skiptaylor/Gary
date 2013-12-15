get '/?' do
  @workshop = Workshop.upcoming
  erb :'home'
end

get '/gary/?' do
  erb :'gary'
end

get '/workshops/?' do
  erb :'workshops'
end

get '/studyguides/?' do
  erb :'studyguides'
end

get '/thankyou/?' do
  erb :'thankyou'
end

get '/sign-in/?' do
  erb :'sign-in'
end