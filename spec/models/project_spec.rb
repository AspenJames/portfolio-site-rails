require_relative '../rails_helper.rb'

RSpec.describe Project do
  describe "initization" do

    let(:attrs){{
      title: 'Project title',
      description: 'A test project',
      source: 'github.com/aspenjames/test-project',
      img_src: 'path.com/to/image'
    }}

    it "can be created with valid data" do
      proj = Project.create(attrs)
      expect(proj).to be_valid
    end
  end
end
