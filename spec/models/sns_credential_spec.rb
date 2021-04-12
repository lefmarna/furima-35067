require 'rails_helper'

RSpec.describe SnsCredential, type: :model do
  before do
    user = FactoryBot.create(:user)
    @sns_credential = FactoryBot.build(:sns_credential)
  end

  describe 'SNS認証' do
    context 'SNS認証が成功するとき' do
      it 'すべての情報が正しく入力されていればSNS認証できる' do
        expect(@sns_credential).to be_valid
      end
      it 'ユーザーが紐付いていなくてもSNS認証できる' do
        @sns_credential.user = nil
        expect(@sns_credential).to be_valid
      end
    end

    context 'SNS認証が失敗するとき' do
      it 'providerが空だと登録できない' do
        @sns_credential.provider = ''
        @sns_credential.valid?
        expect(@sns_credential.errors.full_messages).to include("Provider can't be blank")
      end
      it 'uidが空だと登録できない' do
        @sns_credential.uid = ''
        @sns_credential.valid?
        expect(@sns_credential.errors.full_messages).to include("Uid can't be blank")
      end
    end
  end
end
