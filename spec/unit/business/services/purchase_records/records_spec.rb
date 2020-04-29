require 'rails_helper'

describe Services::PurchaseRecords::Records do
  let!(:user) { create(:user) }
  let!(:course) { create(:course) }
  let!(:record) { create(:purchase_record, { user: user, course: course }) }

  context 'filter course_type' do
    let!(:english_course) { create(:course, { course_type: 'english' }) }
    let!(:english_record) { create(:purchase_record, { user: user, course: english_course }) }
    let!(:course_type) { english_course.course_type }

    it 'should return filtered result' do
      result = Services::PurchaseRecords::Records.new(user: user, course_type: course_type).run
      expect(result.size).to eq(1)
      expect(result.first[:course][:course_type]).to eq(course_type)
    end
  end

  context 'filter available' do
    let!(:available) { false }
    let!(:start_at) { Time.now - 20.days }
    let!(:theme) { 'not_available' }
    let!(:expire_days) { 10 }
    let!(:not_available_course) { create(:course, { start_at: start_at, expire_days: expire_days, theme: theme}) }
    let!(:purchase_record) { create(:purchase_record, { user: user, course: not_available_course }) }
    it 'should return filtered result' do
      result = Services::PurchaseRecords::Records.new(user: user, available: available).run
      expect(result.size).to eq(1)
      expect(result.first[:course][:theme]).to eq(theme)
    end
  end

  context 'no filter' do
    let!(:theme) { 'english' }
    let!(:course2) { create(:course, { theme: theme}) }
    let!(:purchase_record) { create(:purchase_record, { user: user, course: course2 }) }
    it 'should return two purchase records' do
      result = Services::PurchaseRecords::Records.new(user: user).run
      expect(result.size).to eq(2)
    end
  end
end
