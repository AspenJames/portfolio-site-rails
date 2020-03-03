class StaticController < ApplicationController
  def about
    render :about
  end

  def resume
    respond_to do |f|
      f.html do
        file = File.join(Rails.root, 'app', 'assets', 'markdown', 'resume.md')
        file = File.read(file)
        @doc = Kramdown::Document.new(file).to_html
        render :resume
      end

      f.pdf do
        send_file(
          "#{Rails.root}/public/resume.pdf",
          filename: "AspenJames.pdf",
          type: "application/pdf"
        )
      end
    end
  end
end
