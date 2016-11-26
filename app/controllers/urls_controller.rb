class UrlsController < ApplicationController
  before_action :random_string, only: :create
  # run random_string before create
  before_action :string_check, only: :create
  # on a separate line, b/c only want this to run before create AFTER random_string has run


  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def random_string()
    # generate a random string of characters, 6 long
    letters = "abcdefghijklmnopqrstuvwxyz"
    stringy_string = Array[]
    6.times do
      r = rand 0..25
	    letter = letters[r]
	    stringy_string.push(letter)
    end

    @stringy_result = stringy_string.join("")
  end

  def string_check()
    # check the model & make sure that the string generated hasn't been used before
    if Url.find_by(short: @stringy_result)
      random_string()
      # if it's been used before, go back and generate another one
      p "********** had a duplicate random string created, make another! *********"
    else
      # if it hasn't been used before, then you can proceed...
      p "************ random string was unique, continue! *************"
    end
  end


  def create
    @url = Url.create(original: params[:url][:original])
    # ^^ This creates the URL from parameter, but can't yet make short = the record ID b/c
    #   must run create line before assigning its ID as something else...like the short slug

    @url.short = @stringy_result
    first_part = (request.protocol + request.host_with_port ).to_s
    @url.dynamic_link = "#{first_part}/#{@url.short}"

    @url.save
    redirect_to urls_index_path
  end

  def traffic_cop
    where_to_go = Url.find_by(short: params[:short])
    redirect_to where_to_go.original
  end

end
