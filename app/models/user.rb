class User < ActiveRecord::Base

  validates :nickname, :name, :image, :presence => true

  has_many :authorizations
  has_many :participants

  attr_accessible :github

  def self.random(num=50)
    all.shuffle[0, num].reject{|u| u.nil? }
  end

  def self.create_from_hash!(hash)
    create do |user|
      user.handle_attributes(hash)
    end
  end

  def participates?(event)
    participants.any? { |participant| participant.event_id == event.id }
  end

  def participation(event)
    participants.find(:first, :conditions => [ "event_id = ?", event.id])
  end

  def twurl
    "http://twitter.com/#{nickname}"
  end

  def email # needed for RailsAdmin
    nickname
  end

  def update_from_auth!(hash)
    handle_attributes(hash)
    save!
  end

  def handle_attributes(hash)
    self.nickname     = hash['user_info']['nickname']
    self.name         = hash['user_info']['name']
    self.location     = hash['user_info']['location']
    self.image        = hash['user_info']['image']
    self.description  = hash['user_info']['description']
    self.url          = hash['user_info']['urls']['Website']
  end

end
