module Services
  module Courses
    class Purchase
      def initialize(course:, user:, payment_method:)
        @course = course
        @user = user
        @payment_method = payment_method
      end

      def run
        check_course_available
        check_user_can_buy_course
        store_purchase_record
      end

      private

      attr_accessor :course, :user, :payment_method

      def check_course_available
        raise 'Course is not available' unless course.available
      end

      def check_user_can_buy_course
        user_has_record = user.purchase_records.where(course_id: course.id).exists?

        raise 'Already has this course' if user_has_record && !course.expired?
      end

      def store_purchase_record
        PurchaseRecord.create(
          user_id: user.id,
          course_id: course.id,
          payment_method: payment_method,
          amount: course.price,
          currency: course.currency,
        )
      end
    end
  end
end
