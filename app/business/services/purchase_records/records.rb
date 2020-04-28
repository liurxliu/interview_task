module Services
  module PurchaseRecords
    class Records
      def initialize(user:, course_type: nil, available: nil)
        @user = user
        @course_type = course_type
        @available = available
      end

      def run
        prepare_query
        filter_by_course_type
        filter_by_available

        render_and_format_response
      end

      private

      attr_accessor :user, :course_type, :available
      attr_accessor :query

      def prepare_query
        purchase_record_ids = user.purchase_records.select(:id).map(&:id)
        @query = PurchaseRecord.joins(:course)
                               .where(id: purchase_record_ids)
      end

      def filter_by_course_type
        return if course_type.nil?

        @query = @query.merge(Course.where("courses.course_type like '#{course_type}'"))
      end

      def filter_by_available
        return if available.nil?

        if available
          @query = @query.merge(Course.where("DATE_ADD(courses.start_at, interval courses.expire_days day) > ?", Time.now))
        else
          @query = @query.merge(Course.where("DATE_ADD(courses.start_at, interval courses.expire_days day) < ?", Time.now))
        end
      end

      def render_and_format_response
        @query.map do |record|
          course = record.course
          {
            course: course,
            record: record
          }
        end
      end
    end
  end
end
