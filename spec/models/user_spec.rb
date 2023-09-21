require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録できるとき' do
        it 'nic_knameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
          expect(@user).to be_valid
        end
      end
      context '新規登録できないとき' do
        it 'nicknameが空では登録できない' do
          @user.nick_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nick name can't be blank")
        end
        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'passwordとpassword_confirmationが不一致では登録できない' do
          @user.password = '123asd'
          @user.password_confirmation = '123asf'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it '重複したemailが存在する場合は登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it 'emailは@を含まないと登録できない' do
          @user.email = 'testmail'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end
        it 'passwordが5文字以下では登録できない' do
          @user.password = '00000'
          @user.password_confirmation = '00000'
          @user.valid?
           expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
        it 'passwordが129文字以上では登録できない' do
          @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
          @user.password_confirmation = @user.password
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
        end
        it "last_name_fullがない場合は登録できないこと" do
          @user.last_name_full = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name full can't be blank")
        end
  
        it "last_name_kanaがない場合は登録できないこと" do
          @user.last_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end
  
        it "first_name_fullがない場合は登録できないこと" do
          @user.first_name_full = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name full can't be blank")
        end
        
        it "first_name_kanaがない場合は登録できないこと" do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end
  
        it "birthがない場合は登録できないこと" do
          @user.birth = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth can't be blank")
        end
        it 'passwordが英字のみのパスワードでは登録できない' do
         @user.password = 'aaaaaa'
         @user.password_confirmation = 'aaaaaa'
         @user.valid?
         expect(@user.errors.full_messages).to include("Password is invalid")
         end
         it 'passwordが数字のみのパスワードでは登録できない' do
          @user.password = '111111'
          @user.password_confirmation = '111111'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
          end
          it 'passwordが全角文字を含むパスワードでは登録できない' do
            @user.password = '11111ａ'
            @user.password_confirmation = '11111ａ'
            @user.valid?
            expect(@user.errors.full_messages).to include("Password is invalid")
            end
  

  # 名前全角入力のテスト ▼

  it 'last_name_fullが全角入力でなければ登録できないこと' do
    @user.last_name_full = "ｱｲｳｴｵ"
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name full is invalid")
  end

  it 'first_name_fullが全角入力でなければ登録できないこと' do
    @user.first_name_full = "ﾔﾏﾀﾞ" # 意図的に半角入力を行いエラーを発生させる
    @user.valid?
    expect(@user.errors.full_messages).to include("First name full is invalid")
  end

  # カタカナ全角入力のテスト ▼

  it 'last_name_kanaが全角カタカナでなければ登録できないこと' do
    @user.last_name_kana = "あいうえお" # 意図的にひらがな入力を行いエラーを発生させる
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana is invalid")
  end

  it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
    @user.first_name_kana = "あいうえお" # 意図的にひらがな入力を行いエラーを発生させる
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana is invalid")
  end

  end
end
end