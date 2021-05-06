class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  has_many :friendships
  has_many :friends, through: :friendships

  def stock_alredy_tracked?(ticker_symbol)
    return false unless !stocks.empty?
    stock = Stock.check_db(ticker_symbol)
    if !stock.nil?
      UserStock.where(stock_id: stock.id,user_id: id).exists?
    else 
      false
    end
  end

  #restriction by requirements an user can't track more than 10 stocks
  def under_stock_limit?
    stocks.count < 10 
  end
  
  def can_track_stocks?(ticker_symbol)
    if (stock_alredy_tracked?(ticker_symbol) == false) and under_stock_limit?  
      true
    else
      false
    end
  end

  def alredy_following?(friend)
    friend = Friendship.where(friend_id: friend.id, user_id: id)
    if !friend.blank?
      return true
    end
    false
  end


  def full_name
   if fname or lname
    "#{fname} #{lname}"
   else
     "Anonymous"
   end
  end

end
