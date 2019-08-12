class StaticController < ApplicationController
  def resume
    file = File.join(Rails.root, 'app', 'assets', 'markdown', 'resume.md')
    file = File.read(file)
    @doc = Kramdown::Document.new(file).to_html
    render :resume
  end
end
