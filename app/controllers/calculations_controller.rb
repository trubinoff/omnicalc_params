class CalculationsController < ApplicationController

def square
    # Parameters: {"user_number"=>"22"}
    @user_number = params[:user_number].to_f
    @square = @user_number**2
    render{"calculations/square.html.erb"}
end

  def square_form
    render("calculations/square_form.html.erb")
  end

  def flex_square_5
    # Parameters: {"num"=>"5"}
    @user_number = params["num"].to_f
    @square = @user_number **2
    render("calculations/flex_square_5.html.erb")
  end

end
