get '/cards/:id' do
  @card = Card.find_by(id: params[:id])
  erb :'cards/show'
end

get '/cards/:id/edit' do
  @card = Card.find_by(id: params[:id])
  erb :'cards/edit'
end
