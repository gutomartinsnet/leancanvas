class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  attr_accessor :current_password
  mount_uploader :icon, ImageUploader

  has_many :plans

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.username = auth["info"]["nickname"]
      user.name = auth["info"]["name"]
      user.image = auth["info"]["image"]
      user.email = User.dummy_email(auth)
    end
  end

  # def self.new_with_session(params, session)
  #   if session["devise.user_attributes"]
  #     new(session["devise.user_attributes"]) do |user|
  #       user.attributes = params
  #     end
  #   else
  #     super
  #   end
  # end

  # def self.from_omniauth(auth)
  #   # providerとuidでUserレコードを取得する
  #   # 存在しない場合は、ブロック内のコードを実行して作成する
  #   where(auth.slice(:provider, :uid)).first_or_create do |user|
  #     # auth.provider には "twitter"、
  #     # auth.uidには twitterアカウントに基づいた個別のIDが入っている
  #     # first_or_createメソッドが自動でproviderとuidを設定してくれるので、
  #     # ここでは設定は必要ない
  #     user.username = auth.info.nickname # twitterで利用している名前が入る
  #     user.email = auth.info.email # twitterの場合入らない
  #   end
  # end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

    # プロフィールを変更するときによばれる
  def update_with_password(params, *options)
    # パスワードが空の場合
    if encrypted_password.blank?
      # パスワードがなくても更新できる
      update_attributes(params, *options)
    else
      super
    end
  end
  
  private
 
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end
