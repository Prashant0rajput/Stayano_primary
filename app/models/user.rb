class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
geocoded_by :current_sign_in_ip
after_validation :geocode , :if => lambda{ |obj| obj.current_sign_in_ip_changed? }

  
  acts_as_mappable :default_units => :kms,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :lat,
                   :lng_column_name => :lng






   
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable ,:omniauthable, :omniauth_providers => [:facebook]
  has_many :conversations, :foreign_key => :sender_id
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :friends


   # User Avatar Validation
   mount_uploader :avatar, AvatarUploader
  validates_integrity_of  :avatar
  validates_processing_of :avatar

  mount_uploader :coverpic, CoverUploader
  validates_integrity_of  :coverpic
  validates_processing_of :coverpic




 
  private
    def avatar_size_validation
      errors[:avatar] << "should be less than 2MB" if avatar.size > 2.megabytes
    end




  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|

        user.provider = auth.provider
        user.uid = auth.uid
        user.username = auth.info.name
        user.email = auth.info.email
        user.avatar = auth.info.image
        user.password = Devise.friendly_token[0,20]
         user.gender = auth.extra.raw_info.gender
         user.save!

      end
  end

   def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
