require 'rails_helper'
require 'airborne'

RSpec.describe "JSON resources" do

  describe "/projects.json" do
    it "should return an array" do
      get '/projects.json'

      expect(json_body).to be_a_kind_of(Array)
    end

    it "should contain as many records as projects.json file" do
      get '/projects.json'

      expect(json_body.length).to eq(projects_json.length)
    end

    context "each record" do
      it "should contain the required keys" do
        get '/projects.json'

        json_body.each_with_index do |record|
          required_keys.each do |key|
            expect(record[key]).not_to be nil
          end
        end
      end
    end
  end

  describe "/projects/:slug.json" do
    valid_slugs.each do |slug|
      context "#{slug}" do
        it "returns an object with the proper types" do
          get "/projects/#{slug}.json"

          expect_json_types(
            name: :string,
            git_url: :string,
            description: :string,
            short_desc: :string,
            lang: :string,
            snippet: :string,
            url: :string_or_null,
            snippet_url: :string_or_null
          )
        end

        it "matches attributes for #{slug}" do
          get "/projects/#{slug}.json"

          proj = projects.find{|p| p.slug == slug}

          expect(proj).not_to be nil

          required_keys.each do |key|
            expect(json_body[key]).to eq(proj.send(key))
          end
        end
      end
    end
  end
end