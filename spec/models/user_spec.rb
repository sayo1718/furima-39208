require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end
 # 入力されている場合のテスト ▼

  describe 'ユーザー新規登録' do
      it "全ての項目の入力が存在すれば登録できること" do
        expect(@user).to be_valid
      end
    end
  end