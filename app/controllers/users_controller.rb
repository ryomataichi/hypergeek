class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :nilgorosi, only:[:show]
    after_action :apude, only:[:match]


    def index
      @users=User.all
    end
  
    def show
      @user=User.find(params[:id])
      @currentUserEntry=Entry.where(user_id: current_user.id)
      @userEntry=Entry.where(user_id: @user.id)
        if @user.id == current_user.id
          @msg ="他のユーザーとDMしてみよう！"
        else
        @currentUserEntry.each do |cu|
          @userEntry.each do |u|
            if cu.room_id == u.room_id then
              @isRoom = true
              @roomId = cu.room_id
            end
          end
        end
  
        if @isRoom != true
        @room = Room.new
        @entry = Entry.new
        end
        end
    end

    def match
      @user=User.find(params[:bangou])
      @currentUserEntry=Entry.where(user_id: current_user.id)
      @userEntry=Entry.where(user_id: @user.id)
        if @user
        @currentUserEntry.each do |cu|
          @userEntry.each do |u|
            if cu.room_id == u.room_id then
              @isRoom = true
              @roomId = cu.room_id
            end
          end
        end
      else
      redirect_to :action => "match"
        if @isRoom != true
        @room = Room.new
        @entry = Entry.new
        end
        end
    end

    def nilgorosi
      ninzuu = User.all.size
      puts ninzuu
      user = current_user
      if user.bangou == nil
        user.update!(bangou: user.id)
        redirect_to user_path(user)
      elsif user.bangou > ninzuu
        new_bangou = 1
        user.update!(
        bangou: new_bangou
        )
      end
    end

    def apude
    user = current_user
    new_bangou = user.bangou + 1
    user.update!(
    bangou: new_bangou
    )
    end



  def user_params
    params.require(:user).permit(:kaisuu, :last_posted_date, :bangou) 
  end

  end