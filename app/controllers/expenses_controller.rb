class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[show edit update destroy]

  # GET /expenses or /expenses.json
  def index
    @category = Category.find(params[:category_id])
    @expenses = @category.expenses.where(user_id: current_user.id).order('created_at DESC')
  end

  # GET /expenses/1 or /expenses/1.json
  def show; end

  # GET /expenses/new
  def new
    @expense = Expense.new
    @category = Category.find(params[:category_id])
  end

  # GET /expenses/1/edit
  def edit; end

  # POST /expenses or /expenses.json
  def create
    @expense = Expense.new(expense_params)
    @expense.user = current_user
    @category = Category.find(params[:category_id])

    respond_to do |format|
      if @expense.save
        @expense.categories << @category
        format.html do
          redirect_to user_category_expenses_path(current_user, @category)
        end
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1 or /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to expense_url(@expense) }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1 or /expenses/1.json
  def destroy
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to expenses_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expense
    @expense = Expense.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
