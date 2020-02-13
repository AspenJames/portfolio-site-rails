class Project
	attr_reader :name, :url, :git_url, :description, :snippet, :lang

	def initialize(obj)
		obj.each do |key, val|
			self.instance_variable_set("@#{key}".to_sym, val)
		end
	end

	def slug
		self.name.parameterize
	end
end