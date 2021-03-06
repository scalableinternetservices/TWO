# app/controllers/photos_controller.rb

class AdsController < ApplicationController
  skip_forgery_protection
    def index
      @ads = Ad.all
    end
  
    def show
      @ad = Ad.find(params[:id])
    end
    
    def new
      @ad = Ad.new
    end
  
    def create      
        params.permit!
      # build a photo and pass it into a block to set other attributes
        @ad = Ad.new(params[:ad])       
      # normal save
        if @ad.save
          redirect_to("/whatever_chats", :notice => 'Ad was successfully created.')
        else
          render :action => "new"
        end
    end
    
    def destroy
      @ad = Ad.find(params[:id])
      @ad.destroy
      redirect_to(ads_url)
    end

    def serve
        expires_in 1.hours, public: true
        @ad = Ad.find(params[:id])
        send_data(@ad.image, :type => @ad.mime_type, :filename => "#{@ad.name}.jpg", :disposition => "inline")
      end
  end
