require 'openssl'

class User < ApplicationRecord
  ITERATIONS = 20_000
  DIGEST = OpenSSL::Digest.new('SHA256')

  before_save :encrypt_password

  has_many :questions

  validates :name, :username, :email, presence: true
  validates :email, :username, uniqueness: true

  # Виртуальное поле, которое не сохраняется в базу. Из него перед сохранением читается пароль,
  # и сохраняется в базу уже зашифрованная версия пароля в
  attr_accessor :password

  # валидация будет проходить только при создании нового юзера
  validates :password, :password_confirmation, presence: true, on: :create
  # и поле подтверждения пароля
  validates_confirmation_of :password

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
end
