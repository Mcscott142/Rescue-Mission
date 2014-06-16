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
       flash[:notice] = "Could not post question with that format! Try again"
        render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers.order('created_at DESC')
  end

  def edit
   @question = Question.find(params[:id])
  end


  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      flash[:notice] = "Question Updated"

      redirect_to @question
    else
      flash[:notice] = "Unable to submit update in this format."


      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])

    if @question.destroy
      flash[:notice] = "Your question has been deleted."

      redirect_to '/questions/'
    else
      flash[:notice] = "Unable to delete question."

      render :new
    end
  end



  private
  def question_params
    params.require(:question).permit(:title, :description)
  end
end

