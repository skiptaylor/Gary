get '/admin/reservations' do
  authenticate
  @reservations = Reservation.all
  erb :'admin/reservations'
end

get '/admin/reservations/new' do
  @reservations = Reservation.new
  @workshops = Workshop.upcoming
  erb :'admin/reservations'
end

post '/admin/reservations/new' do
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

get '/admin/reservations/:id/delete' do
  authenticate
  reservation = Reservation.get(params[:id])
  reservation.destroy
  session[:flash] = 'The reservation has been removed.'
  redirect '/index'
end
