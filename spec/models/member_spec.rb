require 'rails_helper'

RSpec.describe Member, type: :model do
  context 'sex カラムでオブジェクトを生成するとき' do
    it 'sex == 0 のときは sex == "unknown" になって enum が正しく効いていること' do
      member = Member.new(sex: 0)
      expect(member.sex).to eq 'unknown'
    end

    it 'sex == 1 のときは sex == "male" になって enum が正しく効いていること' do
      member = Member.new(sex: 1)
      expect(member.sex).to eq 'male'
    end

    it 'sex == 2 のときは sex == "female" になって enum が正しく効いていること' do
      member = Member.new(sex: 2)
      expect(member.sex).to eq 'female'
    end

    it 'sex == 3 のときは sex == "other" になって enum が正しく効いていること' do
      member = Member.new(sex: 3)
      expect(member.sex).to eq 'other'
    end
  end

  context 'sex カラムにおいて、異なる値が入ったオブジェクトを複数生成したとき' do
    it 'enum で生やしたメソッドを実行することで、enum の値を変更できること' do
      member = Member.new(sex: 1)
      member.sex_female!
      expect(member.sex).to eq 'female'
    end

    it 'sex が、"unknown" および "male" および "female" および "other" のオブジェクトを作成したとき、Member.female メソッドを用いることで sex == "female" のレコードだけを抽出できること から #female! を実行した際に sex == "female" に変更されていること' do
      unknown_sex_member  = FactoryBot.create(:member, sex: :unknown)
      male_sex_member     = FactoryBot.create(:member, sex: :male)
      female_sex_member   = FactoryBot.create(:member, sex: :female)
      other_sex_member    = FactoryBot.create(:member, sex: :other)

      expect(Member.sex_female.first).to_not eq unknown_sex_member
      expect(Member.sex_female.first).to_not eq male_sex_member
      expect(Member.sex_female.first).to eq female_sex_member
      expect(Member.sex_female.first).to_not eq other_sex_member
    end
  end

  # デバッグ用
  context 'NOT NULL 制約があるカラムが NULL だった場合' do
    let(:member) { Member.new }

    it 'firstname の DEFAULT である "UNKNOWN" が入っていること' do
      expect(member.firstname).to eq 'UNKNOWN'
    end

    it 'lastname の DEFAULT である "UNKNOWN" が入っていること' do
      expect(member.lastname).to eq 'UNKNOWN'
    end

    it 'age の DEFAULT である -1 が入っていること' do
      expect(member.age.negative? && member.age.abs == 1).to eq true
    end

    it 'sex の DEFAULT である 0 (enum における unknown) が入っていること' do
      expect(member.sex).to eq 'unknown'
    end

    it 'born_at_pref の DEFAULT である "UNKNOWN" が入っていること' do
      expect(member.born_at_pref).to eq 'UNKNOWN'
    end

    it 'is_japanese の DEFAULT である true が入っていること' do
      expect(member.is_japanese).to eq true
    end
  end
end
