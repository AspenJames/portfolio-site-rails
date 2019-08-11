class ApplicationController < ActionController::Base
  def index
    file = File.join(Rails.root, 'app', 'posts', 'test_post.md')
    file = File.read(file)
    @doc = Kramdown::Document.new(file).to_html
    render :index
  end
end