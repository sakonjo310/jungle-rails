require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    User.create(
      first_name: 'Satoe',
      last_name: 'Sakonjo',
      email: 'test@test.com',
      password: '123',
      password_confirmation: '123'
    )
  }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without first_name' do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without last_name' do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without password confirmation' do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with password confirmation does not match the password' do
      subject.password_confirmation = '234'
      expect(subject).to_not be_valid
    end

    it 'is not valid with password less than 3 characters length' do
      subject.password = '12'
      subject.password_confirmation = '12'
      expect(subject).to_not be_valid
    end

    it 'is not valid without unique email' do
      subject.save
      @user = User.create(
        first_name: 'Satoe',
        last_name: 'Sakonjo',
        email: 'TEST@test.com',
        password: '123',
        password_confirmation: '123'
      )
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'is valid with the valid credentials' do
      subject.save
      @user = User.authenticate_with_credentials('test@test.com', '123')
      expect(@user).to_not be_nil
    end

    it 'is not valid without valid email' do
      subject.save
      @user = User.authenticate_with_credentials('test2@test.com', '123')
      expect(@user).to be_nil
    end

    it 'is not valid without valid password' do
      subject.save
      @user = User.authenticate_with_credentials('test@test.com', '1234')
      expect(@user).to be_nil
    end

    it 'is valid without valid email with spaces around it' do
      subject.save
      @user = User.authenticate_with_credentials(' test@test.com ', '123')
      expect(@user).to_not be_nil
    end

    it 'is valid without valid email with wrong case' do
      subject.save
      @user = User.authenticate_with_credentials('TEST@test.com', '123')
      expect(@user).to_not be_nil
    end

  end
end
