# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'games/show', type: :view do
  before(:each) do
    @game = assign(:game, Game.create!(
                            name: 'Name',
                            description: 'Description',
                            easy_of_use: 2.5,
                            content_quality: 3.5,
                            versatility: 4.5,
                            pedagogical_aspects: 5.5,
                            didactical_resources: 6.5,
                            stimulates_the_initiative_and_self_learning: 7.5,
                            audiovisual_quality: 8.5,
                            technical_and_static_elements: 9.5,
                            navigation_and_interaction: 10.5,
                            originality_and_use_of_advanced_tecnology: 11.5
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4.5/)
    expect(rendered).to match(/5.5/)
    expect(rendered).to match(/6.5/)
    expect(rendered).to match(/7.5/)
    expect(rendered).to match(/8.5/)
    expect(rendered).to match(/9.5/)
    expect(rendered).to match(/10.5/)
    expect(rendered).to match(/11.5/)
  end
end
