require 'rails_helper'

describe "display index" do
  it "loads the index page" do
    visit puzzles_path
    # binding.pry
    expect(page).to have_content("bazooka")
  end

  # it "gives error when no name is entered" do
  #   visit new_product_path
  #   click_on 'Create Product'
  #   expect(page).to have_content 'errors'
  # end
end
