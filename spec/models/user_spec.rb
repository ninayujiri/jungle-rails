require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    subject { User.new(
      first_name: 'Joe',
      last_name: 'Malone',
      email: 'jmalone@example.com',
      password: 'test123',
      password_confirmation: 'test123'
    )}

    it 'is valid if it has a first_name, last_name, email, password and password_confirmation' do
      expect(subject).to be_valid
      puts subject.errors.full_messages
    end

    it 'requires a first_name' do
      subject.first_name = nil
      expect(subject).not_to be_valid
      expect(subject.errors).to have_key(:first_name)
      puts subject.errors.full_messages
    end

    it 'requires a last_name' do
      subject.last_name = nil
      expect(subject).not_to be_valid
      expect(subject.errors).to have_key(:last_name)
      puts subject.errors.full_messages
    end

    it 'requires an email' do
      subject.email = nil
      expect(subject).not_to be_valid
      expect(subject.errors).to have_key(:email)
      puts subject.errors.full_messages
    end

    it 'is not valid if password and password_confirmation do not match' do
      subject.password = 'test'
      expect(subject).not_to be_valid
      puts subject.errors.full_messages
    end

    it 'is not valid if email has already been taken' do
      subject.save
      subject2 = User.create(
        first_name: 'Jane',
        last_name: 'Malone',
        email: 'jmalone@example.com',
        password: 'fake123',
        password_confirmation: 'fake123'
      )
      expect(subject2).not_to be_valid
      puts subject2.errors.full_messages
    end

    it 'is not valid if the password is less than 6 characters' do
      subject.password = 'test'
      subject.password_confirmation = "test"
      expect(subject).not_to be_valid
      puts subject.errors.full_messages
    end





  end
end
