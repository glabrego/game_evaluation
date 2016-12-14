# frozen_string_literal: true
class AddColumnToResearcher < ActiveRecord::Migration[5.0]
  def change
    add_column :researchers, :name, :string
  end
end
