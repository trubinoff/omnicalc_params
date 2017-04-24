class CalculationsController < ApplicationController

  def random
    @minimum_num = params[:minimum_num].to_f
    @maximum_num = params[:maximum_num].to_f
    @random_num = rand(@minimum_num..@maximum_num)
    render{"calculations/random.html.erb"}
  end

  def random_form
    render("calculations/random_form.html.erb")
  end

  def payment

    @apr = params[:apr].to_f
    @years = params[:years].to_f
    @principal = params[:principal].to_f

    months = @years*12
    month_rate = (@apr/100)/12
    step1 = month_rate*@principal
    step2 = (1+month_rate)**(-1*months)
    step3 = 1-step2

    @monthly_payment = step1/step3
    render{"calculations/payment.html.erb"}
  end

  def payment_form
    render("calculations/payment_form.html.erb")
  end

  def square_root
    # Parameters: {"user_number"=>"22"}
    @user_number = params[:user_number].to_f
    @square_root = Math.sqrt(@user_number)
    render{"calculations/square_root.html.erb"}
  end

  def square_root_form
    render("calculations/square_root_form.html.erb")
  end

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

  def flex_square_root
    @user_number = params["num"].to_f
    @square_root = Math.sqrt(@user_number).round(2)
    render("calculations/flex_square_root.html.erb")
  end

  def flex_payment
    @apr = params[:apr].to_f
    @years = params[:years].to_f
    @principal = params[:principal].to_f

    @apr_percent = @apr/100
    months = @years*12
    month_rate = (@apr_percent/100)/12
    step1 = month_rate*@principal
    step2 = (1+month_rate)**(-1*months)
    step3 = 1-step2

    @monthly_payment = (step1/step3).round(2)
    render("calculations/flex_payment.html.erb")
  end

  def flex_random
    @minimum_num = params[:num1].to_f
    @maximum_num = params[:num2].to_f
    @random_num = rand(@minimum_num..@maximum_num).round(0)
    render{"calculations/flex_random.html.erb"}
  end

end
