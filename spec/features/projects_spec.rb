require 'rails_helper'

RSpec.describe "/projects", type: :feature do
  it "has class 'active' on navlink for '/projects'" do
    visit '/projects'
    link = find_link(href: '/projects')
    expect(link).to be_active()
  end

  it "contains a heading and ul" do
    visit '/projects'
    expect(page).to have_selector("h1")
    expect(page).to have_selector("ul")
  end

  it "has a number of li elements equal to the length of projects_json" do
    visit '/projects'
    lis = page.find_all('li')
    expect(lis.length).to eq(projects_json.length)
  end

  context "List items" do
    before(:all) { @projects = projects }

    it "each contain a link to its associated Project#detail page" do
      visit '/projects'
      lis = page.find_all('li')

      lis.each_with_index do |li, i|
        project = @projects[i]

        expect(li).to have_selector('a')
        a = li.find('a')
        expect(a[:href]).to match(project_path(project.slug))
        expect(a.text).to match(/#{project.name}/)
      end
    end
  end

  context "Fun facts" do
    context "on initial render" do
      it "contains a div#funfact-div that is empty" do
        visit '/projects'
        expect(page).to have_selector('div#funfact-div')
        div = page.find('div#funfact-div')
        expect(div.text).to eq("")
      end

      it "contains a button#funfact-button with text 'Yes please!'" do
        visit '/projects'
        expect(page).to have_selector('button#funfact-button')
        button = page.find_button(id: 'funfact-button')
        expect(button).to have_text("Yes please!")
      end
    end

    context "on clicking the funfact-button", js: true do
      after(:each) do
        page.cleanup!
      end

      it "populates the funfact-div" do
        visit '/projects'
        div = page.find('div#funfact-div')
        click_button(id: 'funfact-button')
        expect(div.text).not_to be("")
        expect(div.text.length).to be > 0
      end

      it "changes the funfact-div on each button press" do
        visit '/projects'
        5.times do
          expect{ click_button(id: 'funfact-button') }.to change(find_by_id('funfact-div'), :text)
        end
      end

      it "changes the button text exactly once" do
        visit '/projects'
        button = find_button(id: 'funfact-button')
        expect{ click_button(id: 'funfact-button') }.to change(button, :text)
          .from("Yes please!").to("Another!")
        expect{ click_button(id: 'funfact-button') }.not_to change(button, :text)
      end
    end

  end
end
