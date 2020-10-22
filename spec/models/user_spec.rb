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
        @user.password = "123abc"
        @user.password_confirmation = "123abc"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("メールを入力してください")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "emailに@が含まれない場合登録できない" do
        @user.email = abcdef-gmail.com
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスに@を入れてください")
      end
      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "123ab"
        @user.password_confirmation = "123ab"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）を入力してください")
      end
      it "passwordが半角数字のみの場合、登録ができない" do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and number")
      end
      it "passwordが半角英字のみの場合、登録できない" do
        @user.password = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and number")
      end
      it "firstnameが空では登録できない" do
        @user.firstname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(全角)苗字を入力してください")
      end
      it "firstnameが全角でなければ登録できない" do
      @user.firstname = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(全角)苗字は不正な値です")
      end
      it "lastnameが空では登録できない" do
        @user.lastname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(全角)名前を入力してください")
      end
      it "lastnameが全角でなければ登録できない" do
        @user.lastname = "bbb"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(全角)名前は不正な値です")
      end
      it "kana_firstnameが空では登録できない" do
        @user.kana_firstname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(全角)苗字を入力してください")
      end
      it "kana_firstnameが全角(カタカナ)でなければ登録できない" do
        @user.kana_firstname = "試験１"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(全角)苗字は不正な値です")
      end
      it "kana_lastnameが空では登録できない" do
        @user.kana_lastname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(全角)名前を入力してください")
      end
      it "kana_lastnameが全角(カタカナ)でなければ登録できない" do
        @user.kana_lastname = "試験２"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(全角)名前は不正な値です")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
