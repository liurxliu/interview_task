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
        prepare_purchase_records

        render_and_format_response
      end

      private

      attr_accessor :user, :course_type, :available
      attr_accessor :query, :purchase_records

      def prepare_query
        @query = user.purchase_records.joins(:course)
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

      def prepare_purchase_records
        purchase_record_ids = @query.select(:id).map(&:id)
        @purchase_records = ::PurchaseRecord.includes(:course).where(id: purchase_record_ids)
      end

      def render_and_format_response
        @purchase_records.map do |record|
          course = record.course
          {
            course: V1::Entities::Course.represent(course),
            record: V1::Entities::PurchaseRecord.represent(record)
          }
        end
      end
    end
  end
end
