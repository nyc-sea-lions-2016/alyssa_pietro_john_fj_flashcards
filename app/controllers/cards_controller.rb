get '/cards/:id' do
  @card = Card.find_by(id: params[:id])
  erb :'cards/show'
end

get '/cards/:id/edit' do
  @card = Card.find_by(id: params[:id])
  erb :'cards/edit'
end

put '/cards/:id/edit' do
  @card = Card.find(params[:id])
  @card.assign_attributes(params[:card])
  if @card.save
    redirect "/cards/#{@card.id}"
  else
    @errors = @card.errors.full_messages
  end
end
