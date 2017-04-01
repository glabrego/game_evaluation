# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'games/edit', type: :view do
  before(:each) do
    @game = assign(:game, Game.create!(
                            name: 'MyString',
                            description: 'MyString',
                            easy_of_use: 1.5,
                            content_quality: 1.5,
                            versatility: 1.5,
                            pedagogical_aspects: 1.5,
                            didactical_resources: 1.5,
                            stimulates_the_initiative_and_self_learning: 1.5,
                            audiovisual_quality: 1.5,
                            technical_and_static_elements: 1.5,
                            navigation_and_interaction: 1.5,
                            originality_and_use_of_advanced_tecnology: 1.5
    ))
  end

  it 'renders the edit game form' do
    render

    assert_select 'form[action=?][method=?]', game_path(@game), 'post' do
      assert_select 'input#game_name[name=?]', 'game[name]'

      assert_select 'input#game_description[name=?]', 'game[description]'

      assert_select 'input#game_easy_of_use[name=?]', 'game[easy_of_use]'

      assert_select 'input#game_content_quality[name=?]', 'game[content_quality]'

      assert_select 'input#game_versatility[name=?]', 'game[versatility]'

      assert_select 'input#game_pedagogical_aspects[name=?]', 'game[pedagogical_aspects]'

      assert_select 'input#game_didactical_resources[name=?]', 'game[didactical_resources]'

      assert_select 'input#game_stimulates_the_initiative_and_self_learning[name=?]', 'game[stimulates_the_initiative_and_self_learning]'

      assert_select 'input#game_audiovisual_quality[name=?]', 'game[audiovisual_quality]'

      assert_select 'input#game_technical_and_static_elements[name=?]', 'game[technical_and_static_elements]'

      assert_select 'input#game_navigation_and_interaction[name=?]', 'game[navigation_and_interaction]'

      assert_select 'input#game_originality_and_use_of_advanced_tecnology[name=?]', 'game[originality_and_use_of_advanced_tecnology]'
    end
  end
end
