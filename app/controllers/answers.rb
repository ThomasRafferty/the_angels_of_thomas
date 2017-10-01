post '/answers/new' do
  @question = Question.find_by(user_id: current_user.id)
  @answer = Answer.new(body: params[:question], user_id: current_user.id, question_id: @question.id)
  if @answer.save
    redirect "/questions/#{@question.id}"
  else
    @errors = ["Please try again."]
    erb :'questions/show'
  end
end
