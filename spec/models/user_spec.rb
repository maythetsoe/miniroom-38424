require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it 'nickname,firstname,lastname,email,password,password_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123abc'
      @user.password_confirmation = '123abcd'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordは数字のみでは保存できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it 'passwordは英字のみでは保存できない' do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'samplemail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが6文字以下では登録できない' do
      @user.password = '123ab'
      @user.password_confirmation = '123ab'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが129文字以上では登録できない' do
      @user.password = Faker::Internet.password(min_length: 129)
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
    end
    it 'passwordは半角英数字混合でないと登録できない' do
      @user.password = '1231234'
      @user.password_confirmation = '1231234'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it 'firstnameが空では登録できない' do
      @user.firstname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname can't be blank")
    end
    it 'lastnameが空では登録できない' do
      @user.lastname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname can't be blank")
    end
    it '全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user.firstname = "ﾔﾏﾀﾞ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname is invalid")
    end
    it '全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user.lastname = "ｹﾝﾀﾛｳ" 
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname is invalid")
    end
end
end
end
