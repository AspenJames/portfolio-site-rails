class ProjectsController < ApplicationController
	def index
		@projects = projects
	end

	def detail
		slug = params[:slug]
		if @project = project_from_slug(slug)
			render :detail
		else
			render :not_found
		end
	end

	private
	def projects
		proj_json = File.read(File.join(Rails.root, 'app', 'assets', 'json', 'projects.json'))
		proj_hash = JSON.parse proj_json
		proj_hash.map{|p| Project.new(p)}
	end

	def project_from_slug(slug)
		projects.find do |p|
			p.slug == slug
		end
	end
end