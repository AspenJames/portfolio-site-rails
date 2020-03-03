module Helpers
  def projects_json
    file_path = File.join([Rails.root, "app", "assets", "json", "projects.json"])
    file_data = File.read(file_path)
    proj_json = JSON.parse(file_data)
  end

  def projects
    projects_json.map{ |p| Project.new(p) }
  end

  def valid_slugs
    projects_json.map{ |p| p["name"].parameterize }
  end

  def required_keys
    [:name, :git_url, :short_desc, :description, :snippet, :snippet_url, :lang]
  end
end
