# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'games/index', type: :view do
  before(:each) do
    assign(:games, [
             Game.create!(
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
             ),
             Game.create!(
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
             )
           ])
  end

  it 'renders a list of games' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Description'.to_s, count: 2
    assert_select 'tr>td', text: 2.5.to_s, count: 2
    assert_select 'tr>td', text: 3.5.to_s, count: 2
    assert_select 'tr>td', text: 4.5.to_s, count: 2
    assert_select 'tr>td', text: 5.5.to_s, count: 2
    assert_select 'tr>td', text: 6.5.to_s, count: 2
    assert_select 'tr>td', text: 7.5.to_s, count: 2
    assert_select 'tr>td', text: 8.5.to_s, count: 2
    assert_select 'tr>td', text: 9.5.to_s, count: 2
    assert_select 'tr>td', text: 10.5.to_s, count: 2
    assert_select 'tr>td', text: 11.5.to_s, count: 2
  end
end
