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

post '/questions/:id/upvote' do
  if logged_in?
    @question = Question.find(params[:id])
    @up_vote = @question.votes.create(user_id: current_user.id, value: 1)
    redirect "/questions/#{@question.id}"
  else
    @errors = ["Login First!"]
    redirect '/login'
  end
end

post '/questions/:id/downvote' do
  if logged_in?
  @question = Question.find(params[:id])
  @down_vote = @question.votes.create(user_id: current_user.id, value: -1)
  redirect "/questions/#{@question.id}"
  else
    @errors = ["You need to be logged in to cast a  vote"]
    redirect '/login'
  end
end
