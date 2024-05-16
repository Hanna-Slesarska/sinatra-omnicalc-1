require "sinatra"
require "sinatra/reloader"


get("/square/new") do
  erb(:new_square_calc)
end

get("/square_root/new") do
  erb(:new_square_root)
end

get("/payment/new") do
  erb(:new_payment)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 2

  erb(:square_results)
end

get("/square_root/results") do
  @the_num = params.fetch("user_number").to_f
  @the_result = Math.sqrt(@the_num)

  erb(:root_results)
end

get("/payment/results") do

  @the_apr = (params.fetch("user_apr")).to_f
  @rate = @the_apr.to_fs(:percentage, { :precision => 4 } ) 
  @the_time = (params.fetch("user_years")).to_i
  @pv = (params.fetch("user_pv")).to_f
  @principal = @pv.to_fs(:currency) 
  @pv = @pv.round(2)

  @rate_i = @the_apr /100
  @month = 12
  @p = (1-(1+@rate_i/@month)**(-@month*@the_time))/(@rate_i/@month)
  @payment = (@pv/@p).round(2)
  @payment = @payment.to_fs(:currency)
  erb(:payment_results)
end

get("/random/new") do
  erb(:random_new)
end

get("/random/results") do
  @first_one = (params.fetch("user_min")).to_f
  @second_one = (params.fetch("user_max")).to_f
  @result = rand(@first_one..@second_one)

erb(:random_result)
end

get("/") do
  erb(:homepage)
end
