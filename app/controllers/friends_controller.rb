class FriendsController < ApplicationController

  def destroy
    friend = Friendship.find_by(user_id: current_user.id,friend_id: params[:id])
    friend.destroy
    flash[:alert] = "removed successfully from friends's list" 
    redirect_to my_friends_path
  end

  def create
   puts "---> create friend" 
   friend = User.find_by(id: friend_param) 
   if !friend.blank?
     Friendship.create(user_id: current_user.id, friend_id: friend.id)
     flash[:notice] = "Friend successfully add to your friends's list"
   else
     flash[:alert] = "Friend not added to your friends's list"
   end
     redirect_to my_friends_path
  end

  def search_friend
    @friends = User.where("fname like ?","%#{friend_param}%")
      .or(User.where("email like ?","%#{friend_param}%"))
      .or(User.where("lname like ?","%#{friend_param}%"))
    respond_to do |format|
      format.js { render partial: 'friends/result_searching_friend'}
    end
  end

  private

  def friend_param
    params[:friend]
  end

end
