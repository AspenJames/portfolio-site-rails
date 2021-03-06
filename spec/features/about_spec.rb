require 'rails_helper'
require File.expand_path('../support/nav_matcher', __dir__)

RSpec.describe "About", type: :feature do
  before(:each) do
    visit '/'
  end

  it "contains the proper heading" do
    heading = find('h1')
    expect(heading).to have_text(/Aspen James/)
  end

  it "contains navigation links" do
    expect(page).to have_navlinks(
      ['/', '/projects', 'https://dev.to/aspenjames', '/resume']
    )
  end

  it "has class 'active' on navlink for '/'" do
    link = find_link(href: '/')
    expect(link).to be_active()
  end

  it "contains proper email link" do
    link = find_link(text: "Email me")
    expect(link[:href]).to eq("mailto:aspenjames@tqca.org")
  end

  it "contains proper phone link" do
    link = find_link(text: "Phone me")
    expect(link[:href]).to eq("tel:+12062902148")
  end
end