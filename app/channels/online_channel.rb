class OnlineChannel < ApplicationCable::Channel
  def subscribed
    appear(current_user)
  end

  def unsubscribed
    away(current_user)
  end

  def appear(data)
    # current_user.appear on: data['appearing_on']
    puts "*******appear*******"
    # puts data
    Remos::Online.new('sst:online').appear(data)
  end

  def away(data)
    # current_user.away
    puts "*******away*******"
    # puts data
    Remos::Online.new('sst:online').away(data)
  end
end