require 'rails_helper'

RSpec.describe Donation, type: :model do
  before do
    @donation = FactoryBot.build(:donation)
  end

  describe "Donation機能" do
    context 'Donationできるとき' do
      it 'nameとdescription, category_id, condition_id, delivery_id, region_id, ship_id, size_id, imageが存在すればDonationできる' do
        expect(@donation).to be_valid
      end
    end
    context 'Donationできないとき' do
      it 'nameが空では出品できない' do
        @donation.name = ''
      @donation.valid?
      expect(@donation.errors.full_messages).to include "Name can't be blank"
    end
    it 'imageが空では出品できない' do
      @donation.image = nil
      @donation.valid?
      expect(@donation.errors.full_messages).to include "Image can't be blank"
    end
    it 'descriptionが空では出品できない' do
      @donation.description = nil
    @donation.valid?
    expect(@donation.errors.full_messages).to include "Description can't be blank"
  end
  it 'カテゴリーに「---」が選択されている場合は出品できない' do
    @donation.category_id = '1'
  @donation.valid?
  expect(@donation.errors.full_messages).to include "Category can't be blank"
  end
   it '商品の状態に「---」が選択されている場合は出品できない' do
   @donation.condition_id = '1'
   @donation.valid?
    expect(@donation.errors.full_messages).to include "Condition can't be blank"
   end
   it '配送料の負担に「---」が選択されている場合は出品できない' do
  @donation.delivery_id = '1'
  @donation.valid?
   expect(@donation.errors.full_messages).to include "Delivery can't be blank"
   end
   it '発送元の地域に「---」が選択されている場合は出品できない' do
   @donation.region_id = '1'
   @donation.valid?
  expect(@donation.errors.full_messages).to include "Region can't be blank"
  end
   it '発送までの日数に「---」が選択されている場合は出品できない' do
   @donation.ship_id = '1'
   @donation.valid?
   expect(@donation.errors.full_messages).to include "Ship can't be blank"
   end
   it 'ユーザーが紐付いていないと出品できない' do
   @donation.user = nil
   @donation.valid?
   expect(@donation.errors.full_messages).to include('User must exist')
   end
  end
end
end



