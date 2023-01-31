require 'rails_helper'

RSpec.describe Receive, type: :model do
  describe 'Receiveの保存' do
    before do
      @donation = FactoryBot.create(:donation)
      @user = FactoryBot.create(:user)
      @receive = FactoryBot.build(:receive, user_id: @user.id, donation_id: @donation.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば「いただきます」できること' do
        expect(@donation).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと「いただきます」 できないこと' do
        @receive.post_code = nil
        @receive.valid?
        expect(@receive.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと「いただきます」できないこと' do
        @receive.post_code = '1234567'
        @receive.valid?
        expect(@receive.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'region_idに「---」が選択されている場合は「いただきます」できない' do
        @receive.region_id = '1'
        @receive.valid?
       expect(@receive.errors.full_messages).to include "Region can't be blank"
       end
      it 'cityが空だと保存できないこと' do
        @receive.city = nil
        @receive.valid?
        expect(@receive.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @receive.address = nil
        @receive.valid?
        expect(@receive.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numが半角のハイフンを含んだと購入できないこと' do
        @receive.phone_num = '090-1111-2222'
        @receive.valid?
        expect(@receive.errors.full_messages).to include("Phone num is invalid")
      end
      it 'phone_numが空だと購入できないこと' do
        @receive.phone_num = nil
        @receive.valid?
        expect(@receive.errors.full_messages).to include("Phone num can't be blank")
      end
      it 'phone_numが9文字以下では登録できない' do
        @receive.phone_num = '12345678'
        @receive.valid?
        expect(@receive.errors.full_messages).to include("Phone num is invalid")
      end
      it 'phone_numが12文字以上では登録できない' do
        @receive.phone_num = '123456789012'
        @receive.valid?
        expect(@receive.errors.full_messages).to include("Phone num is invalid")
      end
      it 'phone_numが数字でなければ購入できないこと' do
        @receive.phone_num = 'abcdfnad'
        @receive.valid?
        expect(@receive.errors.full_messages).to include("Phone num is invalid")
      end
      it 'donation_idが紐付いていないと購入できないこと' do
      @receive.donation_id = nil
      @receive.valid?
      expect(@receive.errors.full_messages).to include()
      end
      it 'user_idが紐付いていないと購入できないこと' do
       @receive.user_id = nil
      @receive.valid?
       expect(@receive.errors.full_messages).to include()
      end
    end
  end
end

