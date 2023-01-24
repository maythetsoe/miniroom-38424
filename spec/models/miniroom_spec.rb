require 'rails_helper'

RSpec.describe Miniroom, type: :model do
  before do
    @miniroom = FactoryBot.build(:miniroom)
  end

  describe "Miniroom機能" do
    context 'Miniroom投稿できる' do
      it 'title,concept,imageが存在すれば投稿できる' do
        expect(@miniroom).to be_valid
      end
    end
    context '投稿できないとき' do
      it 'titleが空では投稿できない' do
      @miniroom.title = ''
      @miniroom.valid?
      expect(@miniroom.errors.full_messages).to include "Title can't be blank"
    end
    it 'conceptが空では投稿できない' do
    @miniroom.concept = ''
    @miniroom.valid?
    expect(@miniroom.errors.full_messages).to include "Concept can't be blank"
  end
    it 'imageが空では出品できない' do
      @miniroom.image = nil
      @miniroom.valid?
      expect(@miniroom.errors.full_messages).to include "Image can't be blank"
    end
    it 'ユーザーが紐付いていないと投稿できない' do
      @miniroom.user = nil
      @miniroom.valid?
      expect(@miniroom.errors.full_messages).to include('User must exist')
      end
  end
end
end
