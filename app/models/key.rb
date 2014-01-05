class Key < ActiveRecord::Base 
  has_many :users
   
  def available_slots
    slots.to_i - used_slots.to_i
  end
  
  def used_slots
    users = User.where({:key_id => id })
    users.count
  end
  
  def has_slots?
    available_slots > 0
  end 
  
  def self.exists?(key)
    self.where({:label => key.to_s}).count == 1
  end
  
  def self.retrieve_id(key)
    Key.where({:label=>key}).first.id
  end
  
  def self.validate_label_by_id(key_id, label)
    Key.where({:id=>key_id}).first.label == label
  rescue
    false
  end
end