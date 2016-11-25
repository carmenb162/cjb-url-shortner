class UrlsController < ApplicationController


  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.create(original: params[:url][:original])
    # ^^ This creates the URL from parameter, but can't yet make short = the record ID b/c
    #   must run create line before assigning its ID as something else...like the short slug

    @url.short = @url.id
    first_part = (request.protocol + request.host_with_port ).to_s
    @url.dynamic_link = "#{first_part}/#{@url.short}"

    @url.save
    redirect_to urls_index_path


    # if @url.save
    #   redirect_to urls_index_path
    # else
    #   redirect_to urls_new_path, :flash => {:error => "couldn't do it!"}
    # end

  end

  def traffic_cop
  where_to_go = Url.find(params[:id])

  redirect_to where_to_go.original


  end


end



#@url.short = request.protocol+request.host_with_port +"/" + @url.short
