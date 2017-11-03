require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  let!(:owner)      { Owner.create(name: "Sam's Snacks") }
  let!(:dons)       { owner.machines.create(location: "Don's Mixed Drinks") }
  let!(:yung_snack) { dons.snacks.create(title: 'sah tasty mahn', price: 350) }
  let!(:another)    { dons.snacks.create(title: 'like, a snickers...', price: 2) }

  scenario 'they see the location of that machine' do
    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario "they see the name of all the snacks and prices associated with machine" do
    visit machine_path(dons)

    expect(page).to have_content(yung_snack.title)
    expect(page).to have_content(yung_snack.price)
    expect(page).to have_content(another.title)
    expect(page).to have_content(another.price)
  end

  scenario "they see the average price of all itmes associated with machine" do
    visit machine_path(dons)
    expect(page).to have_content("Average Snack Price:")
    expect(page).to have_content(176.0)
  end
end
