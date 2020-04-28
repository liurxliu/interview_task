module V1
  class PurchaseRecords < Grape::API
    include V1::Defaults

    resources :purchase_records do
      get '' do
        ::Services::PurchaseRecords::Records.new(
          user: current_user,
          course_type: params[:course_type],
          available: params[:available]
        ).run()
      end
    end
  end
end

