class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      redirect_to @question
    else
      flash[:notice] = "Could not post answer with that format! Try again"
      redirect_to @question
    end
  end


private
  def answer_params
    params.require(:answer).permit(:body)
    end
end
