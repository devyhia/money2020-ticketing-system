class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create {
  	self['token'] = Devise.friendly_token
    balance = 0
  }

  after_create {
    create_qr_code
  }

  def balance
    self['balance'] ? self['balance'] : 0
  end

  def qr_code_path
  	"./public/qrs/#{token}.png"
  end

  def qr_code_link
  	"/qrs/#{token}.png"
  end

  def create_qr_code
  	RQRCode::QRCode.new("#{id}", :size => 1, :level => :h ).to_img.resize(250,250).save(qr_code_path)
  end
end
