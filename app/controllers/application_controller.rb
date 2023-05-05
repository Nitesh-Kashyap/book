class ApplicationController < ActionController::API
	before_action :verify_user

	def verify_user
		unless Registration.find_by(password_digest: request.authorization.gsub("Bearer ", "")).present?
			render json: {message: "Not Authorized"}
		end
	end
end
