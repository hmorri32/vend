require 'rails_helper'

feature 'When a user visits a snack show page' do
  let!(:owner)       { Owner.create(name: "Sam's Snacks") }
  let!(:corner_sto)  { owner.machines.create(location: 'dont care & whatever') }
  let!(:yung_corner) { corner_sto.snacks.create(title: 'sah tasty mahn', price: 350) }
  let!(:corner_2)    { corner_sto.snacks.create(title: 'another one', price: 2) }
  let!(:dons)        { owner.machines.create(location: "Don's Mixed Drinks") }
  let!(:yung_snack)  { dons.snacks.create(title: 'sah tasty mahn', price: 350) }
  let!(:another)     { dons.snacks.create(title: 'like, a snickers...', price: 2) }

  scenario "They see the name of that snack" do
    visit(snack_path(yung_snack, snack_title: yung_snack.title))

    expect(page).to have_content(yung_snack.title)

  end
end
