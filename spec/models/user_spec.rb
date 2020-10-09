require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、firstnameとlastname、kana_firstnameとkana_lastname、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@が含まれない場合登録できない" do
        @user.email = abcdef-gmail.com
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスに@を入れてください")
      end
      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが半角英数字混合でなければ登録できない" do
        @user.password = "試験"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and number")
      end
      it "firstnameが空では登録できない" do
        @user.firstname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it "firstnameが全角でなければ登録できない" do
      @user.firstname = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname Full-width characters")
      end
      it "lastnameが空では登録できない" do
        @user.lastname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end
      it "lastnameが全角でなければ登録できない" do
        @user.lastname = "abd"
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname Full-width characters")
      end
      it "kana_firstnameが空では登録できない" do
        @user.kana_firstname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana_firstname can't be blank")
      end
      it "kana_firstnameが全角(カタカナ)でなければ登録できない" do
        @user.kana_firstname = "試験１"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana_firstname Full-width katakana characters")
      end
      it "kana_lastnameが空では登録できない" do
        @user.kana_lastname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana_lastname can't be blank")
      end
      it "kana_lastnameが全角(カタカナ)でなければ登録できない" do
        @user.kana_lastname = "試験２"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana_lastname Full-width katakana characters")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
