get '/workshops/?' do
  authenticate
  @workshops = Workshop.all
  erb :'workshops/index'
end

get '/workshops/new/?' do
  authenticate
  @workshop = Workshop.new
  erb :'workshops/workshop'
end

post '/workshops/new/?' do
  authenticate
  workshop = Workshop.create(
    :start_date  => Chronic.parse("#{params[:start_date_year]}-#{params[:start_date_month]}-#{params[:start_date_day]}"),
    :end_date    => Chronic.parse("#{params[:end_date_year]}-#{params[:end_date_month]}-#{params[:end_date_day]}"),
    :venue       => params[:venue],
    :description => params[:description],
    :program     => params[:program]
  )
  
  session[:flash] = 'Your workshop has been created.'
  redirect '/workshops'
end

get '/workshops/:id/edit/?' do
  authenticate
  @workshop = Workshop.get(params[:id])
  erb :'workshops/workshop'
end

post '/workshops/:id/edit/?' do
  authenticate
  workshop = Workshop.get(params[:id])
  workshop.update(
    :start_date  => Chronic.parse("#{params[:start_date_year]}-#{params[:start_date_month]}-#{params[:start_date_day]}"),
    :end_date    => Chronic.parse("#{params[:end_date_year]}-#{params[:end_date_month]}-#{params[:end_date_day]}"),
    :venue       => params[:venue],
    :description => params[:description],
    :program     => params[:program]
  )
  
  session[:flash] = 'Your workshop has been updated.'
  redirect '/workshops'
end

get '/workshops/:id/delete' do
  authenticate
  workshop = Workshop.get(params[:id])
  workshop.destroy
  session[:flash] = 'Your workshop has been removed.'
  redirect '/workshops'
end