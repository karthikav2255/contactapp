class PictureController < ApplicationController

    def list
        @pictures=current_user.pictures.all
    end
    def show
        @picture = Picture.find(params[:id])
     end
 
    def create
        puts "---------- pic-cntrlr-------- create.........."
        puts picture_param
        @picture=current_user.pictures.build(picture_param)
        respond_to do |format|
            if @picture.save
                format.html {redirect_to picture_new_url(@picture), notice: "A picture is successfully uploaded!"}
                format.json {render :show,status: :created, location: :@picture}
            else
                format.html{render :new, status: :unprocessable_entity}
                format.json{render json: @picture.errors, status: :unprocessable_entity}
            end
        end
    end
    
    def picture_param
        p 'uuuuuuuuuuuu'
        params.require(:picture).permit!
    end

    def new
        @picture= Picture.new
    end
end
