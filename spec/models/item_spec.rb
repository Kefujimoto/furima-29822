require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '商品新規登録がうまくいくとき' do
      it "nameとexplain、category_idとstaatus_id、chaarge_idとarea_id、days_idとpriceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品新規登録がうまくいかないとき' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("image can't be blank")
      end
      it "nameが空だと登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      end
      it "explainが空では登録できない" do
        @item.explain = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end
      it "category_idが1では登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "status_idが1では登録できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "charge_idが1では登録できない" do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge must be other than 1")
      end
      it "area_idが1では登録できない" do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end
      it "days_idが1では登録できない" do
        @item.days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days must be other than 1")
      end
      it "priceが空では登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが300以上でなければ登録できない" do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 30")
      end
      it "priceが9999999以下でなければ登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end
      it "priceが半角数字以外の場合、登録ができない" do
        @item.price = "12ab"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end