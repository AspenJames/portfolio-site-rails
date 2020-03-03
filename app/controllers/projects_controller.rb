class ProjectsController < ApplicationController
  def index
    respond_to do |f|
      f.html {
        @projects = projects
      }
      f.json {
        render json: projects
      }
    end
  end

  def detail
    respond_to do |f|
      f.html {
        render :detail
      }
      f.json {
        render json: project_from_slug(params[:slug])
      }
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
