class UsersController < ApplicationController
  def index
    @users = User.all

    @users = @users.to_a.sort! { |a, b| a[:name] <=> b[:name] }
  end

  def follow
    @user       = User.find params[:id]
    @leader     = User.find params[:leader_id]
    @follower   = User.find params[:follower_id]

    @leader.add_fan         @follower.id
    @follower.add_leader    @leader.id

    redirect_to :action => :show, :id=> @follower.id, :flash => {:from_action => 'follow'}
  end
  
  def do_not_follow
    @user       = User.find params[:id]
    @leader     = User.find params[:leader_id]
    @follower   = User.find params[:follower_id]

    @leader.remove_fan          @follower.id
    @follower.remove_leader     @leader.id

    redirect_to :action => :show, :id=> @follower.id, :flash => {:from_action => 'do_not_follow'}
  end
  
  def show
    if (params.include? :flash) and (params[:flash].include? :from_action)
      @from_action = params[:flash][:from_action]
    else
      @from_action = 'list_fans'
    end

    @user_props = User.find(params[:id]).props
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    user_name = params[:user][:name]

    if User.find_by(name: user_name)
      redirect_to(users_url)
    else
      @user           = User.new params[:user]
      @user.fans      = []
      @user.leaders   = []

      if @user.save
        redirect_to(users_url)
      else
        render :action => :new
      end
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to(@user, :notice => 'User was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.separate_from_fans
    @user.separate_from_leaders

    @user.destroy

    redirect_to(users_url)
  end
end
