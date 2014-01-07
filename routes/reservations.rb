get '/admin/reservations' do
  authenticate
  @reservation = Reservation.all
  erb :'admin/reservations'
end

get '/admin/reservations/new' do
  @reservation = Reservation.new
  @workshops = Workshop.upcoming
  erb :'admin/reservations'
end

post '/admin/reservations/new' do
  reservation = Reservation.create(
    :name        => params[:name],
    :email       => params[:email],
    :address1    => params[:address1],
    :address2    => params[:address2],
    :city        => params[:city],
    :state       => params[:state],
    :zip         => params[:zip],
    :phone       => params[:phone],
    :mobile      => params[:mobile],
    :workshop_id => params[:workshop]
  )
  params[:argosy] ? reservation.update(:argosy => true) : reservation.update(:argosy => false)
  
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
