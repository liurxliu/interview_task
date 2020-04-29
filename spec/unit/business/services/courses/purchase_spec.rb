require 'rails_helper'

describe Services::Courses::Purchase do
  let!(:payment_method) { 'credit_card' }
  let!(:user) { create(:user) }
  let(:run_service) {
    ->(course) {
      Services::Courses::Purchase.new(course: course, user: user, payment_method: payment_method).run
    }
  }

  context 'check course available' do
    let!(:course) { create(:course, { available: false, user: user }) }
    it 'should raise exception if course is not available' do
      expect { run_service[course] }
        .to raise_error('Course is not available')
    end
  end

  context 'check user can buy the course' do
    let!(:course) { create(:course, { user: user }) }
    let!(:record) { create(:purchase_record, { user: user, course: course }) }
    it 'should raise exception if user bought the course which is not expire' do
      allow(course).to receive(:expired?).and_return(false)

      expect { run_service[course] }
        .to raise_error('Already has this course')
    end
  end

  context 'success' do
    let!(:course) { create(:course, { user: user }) }
    it 'should create purchase record' do
      run_service[course]

      expect(PurchaseRecord.first.user_id).to eq(user.id)
      expect(PurchaseRecord.first.course_id).to eq(course.id)
      expect(PurchaseRecord.first.payment_method).to eq(payment_method)
    end
  end
end
