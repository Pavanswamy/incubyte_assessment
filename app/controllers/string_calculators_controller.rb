class StringCalculatorsController < ApplicationController
  def index
    @result = flash[:result].to_s
    @error = flash[:error].to_s
  end

  def calculate
    input_numbers = params[:numbers] || ""
    flash[:result] = StringCalculator.new.add(input_numbers).to_s
    redirect_to root_path
  rescue StandardError => e
    flash[:error] = e.message
    redirect_to root_path
  end
end
