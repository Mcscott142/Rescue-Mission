class QuestionsController < ApplicationController
  def index
    @questions = Question.order('created_at DESC')
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to '/questions'
    else
       flash.now[:notice] = "Could not post question with that format! Try again"
        render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers.order('created_at DESC')
  end

  def update
    update_question = Question.find(params[:id])
    update_question.update(question_params)

    redirect_to to @questions
  end



  private
  def question_params
    params.require(:question).permit(:title, :description)
  end
end

