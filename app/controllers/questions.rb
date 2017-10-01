get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end

get '/questions/new' do
  erb :'/questions/new'
end

post '/questions' do
  @question = Question.new(user_id: current_user.id, title: params[:title], body: params[:question])
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    @errors = ["Please try again."]
    erb :'/questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find_by(id:params[:id])
  erb :'/questions/show'
end
