require 'rails_helper'

RSpec.describe "/projects/:slug", type: :feature, js: true do
  projects.each do |subj|
    describe subj.name do
      before(:each) do
        visit "/projects/#{subj.slug}"
      end

      it "has class 'active' on navlink for '/projects'" do
        link = find_link(href: '/projects')
        expect(link).to be_active()
      end

      it "contains the associated Project name" do
        expect(page).to have_text(subj.name)
      end
      
      it "contains the proper links for the Project" do
        link = find_link(text: "GitHub Repository")
        expect(link[:href]).to match(/#{subj.git_url}/)
        if subj.url
          link = find_link(text: "Hosted Project")
          expect(link[:href]).to match(/#{subj.url}/)
        end
      end

      it "contains a code snippet example" do
        codeMirrorWrapper = find('div#codemirror')
        expect(codeMirrorWrapper).to have_selector('div.CodeMirror')
        expect(codeMirrorWrapper).to have_selector('pre')
      end
    end
  end
end