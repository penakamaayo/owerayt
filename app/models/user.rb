# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  full_name              :string
#  contact_number         :string
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :contacts
  has_many :contact, :through => :contacts

  has_many :inverse_contacts, :class_name => 'Contact', :foreign_key => 'contact_id'
  has_many :inverse_friends, :through => :inverse_contacts, :source => :user

  has_many :debts, :foreign_key => 'owner_id'
  has_many :inverse_debts, :class_name => 'Debt', :foreign_key => 'payer_id'


  devise :omniauthable, :omniauth_providers => [:google_oauth2]


  def self.from_omniauth access_token
    data = access_token.info

    User.where(:email => data['email']).first
  end

end
