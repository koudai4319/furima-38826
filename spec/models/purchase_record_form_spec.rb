require 'rails_helper'
RSpec.describe PurchaseRecordForm, type: :model do

  before do
    @purchase_record_form = FactoryBot.build(:purchase_record_form)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての入力事項が正しれば保存できる' do
        expect(@purchase_record_form).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @purchase_record_form.user_id = 1
        expect(@purchase_record_form).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @purchase_record_form.item_id = 1
        expect(@purchase_record_form).to be_valid
      end
      it '郵便番号が「3桁+-+4桁」の組み合わせであれば保存できる' do
        @purchase_record_form.postcode = '123-4560'
        expect(@purchase_record_form).to be_valid
      end
      it '都道府県が「---」以外であれば保存できる' do
        @purchase_record_form.prefecture_id = 1
        expect(@purchase_record_form).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @purchase_record_form.city = '函館市'
        expect(@purchase_record_form).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @purchase_record_form.block = '五稜郭町43-9'
        expect(@purchase_record_form).to be_valid
      end
      it '建物名が空でも保存できる' do
        @purchase_record_form.building = nil
        expect(@purchase_record_form).to be_valid
      end
      it '電話番号が10桁以上11桁以内かつハイフンなしであれば保存できる' do
        @purchase_record_form.phone_number = 1234567890
        expect(@purchase_record_form).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @purchase_record_form.user_id = nil
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @purchase_record_form.item_id = nil
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @purchase_record_form.postcode = nil
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include("Postcode can't be blank", 'Postcode is invalid. Include hyphen(-)')
      end
      it '郵便番号に-がないと保存できないこと' do
        @purchase_record_form.postcode = 1234567
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it '都道府県が「---」だと保存できないこと' do
        @purchase_record_form.prefecture_id = 0
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が空だと保存できないこと' do
        @purchase_record_form.prefecture_id = nil
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @purchase_record_form.city = nil
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @purchase_record_form.block = nil
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include("Block can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @purchase_record_form.phone_number = nil
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号に-があると保存できないこと' do
        @purchase_record_form.phone_number = '123-1234-1234'
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @purchase_record_form.phone_number = 123456789010
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が10桁未満だと保存できないこと' do
        @purchase_record_form.phone_number = 123456789
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'トークンが空だと保存できないこと' do
        @purchase_record_form.token = nil
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
