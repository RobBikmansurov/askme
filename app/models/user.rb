require 'openssl'

class User < ApplicationRecord
  ITERATIONS = 20_000
  DIGEST = OpenSSL::Digest.new('SHA256')

  attr_accessor :password

  before_validation :downcase_username
  after_validation :normalize_name
  before_save :encrypt_password

  has_many :questions

  validates :name, :username, presence: true
  validates :email, :username, uniqueness: true
  validates :email, format: { with: /\A[\w\d._-]+@{1}[\d\w.]+\.\w+\z/ }
  validates :username, format: { with: /\A([A-Za-z0-9_])+\z/ }
  validates :username, length: { maximum: 40 }
  validates :password, :password_confirmation, presence: true, on: :create
  validates :password, confirmation: true

  def self.authenticate(email, password)
    user = find_by(email: email)
    return nil unless user.present?

    hashed_password = User.hash_to_string(
      OpenSSL::PKCS5.pbkdf2_hmac(
        password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST
      )
    )
    return nil unless user.password_hash == hashed_password

    user
  end

  def encrypt_password
    return unless password.present?

    self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))
    self.password_hash = User.hash_to_string(
      OpenSSL::PKCS5.pbkdf2_hmac(
        password, password_salt, ITERATIONS, DIGEST.length, DIGEST
      )
    )
    # Оба поля попадут в базу при сохранении (save).
  end

  # Служебный метод, преобразующий бинарную строку в шестнадцатиричный формат, для удобства хранения.
  def self.hash_to_string(password_hash)
    password_hash.unpack1('H*')
  end

  private
  def downcase_username
    self.username = username.downcase
  end

  def normalize_name
    self.name = name.downcase.titleize
  end
end
