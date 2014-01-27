#encoding: utf-8
require "#{Rails.root}/app/facade/dashboard_facade.rb"
class Admin::DashboardController < Admin::ApplicationController

	def index
		@dashboard = DashboardFacade.new
	end

	def stats
		@dashboard = DashboardFacade.new
	end

end
