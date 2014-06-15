require "rails_helper"

feature "Display the home page" do
  
  scenario "User visits the root url" do
    visit "/"
    expect(page.status_code).to be(200)
  end
  
  scenario "Links to the about page" do
    visit "/"
    click_link "About"
    expect(page).to have_content("Pages#about")
    expect(page.status_code).to be(200)
  end
  
end

feature "Display the about page" do
  
  scenario "User visits the about url" do
    visit "/about"
    expect(page.status_code).to be(200)
  end
  
  scenario "Links to the home page" do
    visit "/about"
    click_link "Home"
    expect(page).to have_content("Pages#home")
    expect(page.status_code).to be(200)
  end
  
end

