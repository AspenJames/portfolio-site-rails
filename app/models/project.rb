class Project
  attr_reader :name, :url, :git_url, :description, :snippet, :snippet_url, :lang, :short_desc

  def initialize(obj)
    obj.each do |key, val|
      self.instance_variable_set("@#{key}".to_sym, val) if key != 'snippet_path'
    end
    example = File.join([Rails.root, *obj['snippet_path']])
    @snippet = File.read(example)
  end

  def slug
    self.name.parameterize
  end
end
