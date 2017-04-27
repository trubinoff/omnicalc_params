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

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    @text_split_into_array = @text.split
    @word_count = @text_split_into_array.length

    @character_count_with_spaces = @text.chars.length

    @character_count_without_spaces = @text.gsub(" ","").gsub("\n","").gsub("\t","").gsub("\r","").length

    text_array = @text.gsub(/[^a-z0-9\s]/i, "").downcase.split
    @occurrences = 0
    text_array.each do |word|
      if word == @special_word.downcase
        @occurrences += 1
      end

      render{"calculations/word_count.html.erb"}

    end

    def word_count_form
      render("calculations/word_count_form.html.erb")
    end

  end

  def descriptive_stats
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)
    @sorted_numbers = @numbers.sort

      @count = @numbers.count

      @minimum = @numbers.min

      @maximum = @numbers.max

      @range = @maximum - @minimum

      middle=@count/2
      if @count.even?
        median = (@sorted_numbers[middle]+ @sorted_numbers[middle-1])/2
      else
        median = @sorted_numbers[middle]
      end

      @median = median

      @sum = @numbers.inject(0){|sum,x| sum + x }

      @mean = @sum/@count

      variance1 = @numbers.inject(0.0) {|s,x| s + (x - @mean)**2}
      variance2 = variance1/@count

      @variance = variance2

      @standard_deviation = @variance**(1.0/2)

      freq = @numbers.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
      mode = @numbers.max_by { |v| freq[v] }
      @mode = mode

      render("calculation/descriptive_stats.html.erb")

  end

  def descriptive_stats_form
    render("calculations/descriptive_stats_form.html.erb")
  end

end
