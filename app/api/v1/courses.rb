module V1
  class Courses < Grape::API
    include V1::Defaults

    resources :courses do
      post ':id/purchase' do
        course = Course.find(params[:id])
        ::Services::Courses::Purchase.new(
          course: course,
          user: current_user,
          payment_method: params[:payment_method]
        ).run

        status 200
      end

    end
  end
end

