require "rails_helper"

describe "Movies requests", type: :request do
  describe "movies list" do
    it "displays right title" do
      visit "/movies"
      expect(page).to have_selector("h1", text: "Movies")
    end
  end

  describe "send info" do
    let(:user) { create :user }
    let(:movie) { create :movie, title: "fake title" }

    it "redirects back to previous page" do
      sign_in(user)
      visit "/movies/#{movie.id}"
      click_link "Email me details about this movie"
      expect(page).to have_selector("#flash_notice", text: "Email sent with movie info")
      expect(page).to have_selector("h1", text: "fake title")
    end
  end
end
