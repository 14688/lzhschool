class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def name
	  'ggg'
  end
  
  def username_for_avatar
    # Translate Chinese hanzi to pinyin
    # https://github.com/flyerhzm/chinese_pinyin
    Pinyin.t(self.username)

  end
  protected

  def email_required?
	  false
  end
end
