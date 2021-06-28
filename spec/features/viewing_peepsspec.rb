feature 'Viewing peeps' do
  scenario 'permit users to see the peeps' do
    Peeps.create(messaage: 'This is a peep!')
    viit '/chitter'
    expect(page).to have_content 'This is the peep'
  end
end
