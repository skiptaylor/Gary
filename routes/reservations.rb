get '/workshops/reservations' do
  authenticate
  @reservations = Reservation.all
  erb :'workshops/reservations'
end

get '/workshops/reservations/new' do
  @reservations = Reservation.new
  @workshops = Workshop.upcoming
  erb :'workshops/reservations'
end

post '/workshops/reservations/new' do
  Reservation.create(
    :name        => params[:name],
    :email       => params[:email],
    :workshop_id => params[:workshop]
  )
  redirect '/reserved'
end

get '/reserved/?' do
  erb :'reserved'
end

get '/workshops/reservations/:id/delete' do
  authenticate
  reservation = Reservation.get(params[:id])
  reservation.destroy
  session[:flash] = 'The reservation has been removed.'
  redirect '/workshops'
end
