class User
  include Mongoid::Document
  
  field :name, :type => String
  
  field :fans, :type => Array
  field :leaders, :type => Array

  def add_fan(fan_id)
    unless fans.include? fan_id
      fans << fan_id
      self.save!
    end
  end
  
  def remove_fan(fan_id)
    if fans.include? fan_id
      fans.delete fan_id
      self.save!
    end
  end

  def add_leader(leader_id)
    unless leaders.include? leader_id
      leaders << leader_id
      self.save!
    end
  end
  
  def remove_leader(leader_id)
    if leaders.include? leader_id
      leaders.delete leader_id
      self.save!
    end
  end

  def separate_from_fans
    fans.each do |fan_id|
      fan = User.find fan_id
      fan.remove_leader self.id
    end
  end

  def separate_from_leaders
    leaders.each do |leader_id|
      leader = User.find leader_id
      leader.remove_fan self.id
    end
  end

  def props
    my_fans     = self.class.sort_by_name fans
    my_leaders  = self.class.sort_by_name leaders

    friends     = User.all - my_leaders - [self]
    friends     = friends.to_a.sort { |a, b| a[:name] <=> b[:name] }

    {
      :id       => id,
      :name     => name,

      :fans     => my_fans,
      :leaders  => my_leaders,
      :friends  => friends
    }
  end

  def self.sort_by_name(user_ids)
    users = user_ids.map { |id| User.find(id) }

    return users if users.size.eql?(1)

    users.sort { |a, b| User.find(a).name <=> User.find(b).name }
  end
end
