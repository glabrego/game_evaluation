# frozen_string_literal: true
class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.integer :r1
      t.integer :r2
      t.integer :r3
      t.integer :r4
      t.integer :r5
      t.integer :r6
      t.integer :r7
      t.integer :r8
      t.integer :r9
      t.integer :r10
      t.integer :r11
      t.integer :r12
      t.integer :r13
      t.integer :r14
      t.integer :r15
      t.integer :r16
      t.integer :r17
      t.integer :r18
      t.integer :r19
      t.integer :r20
      t.integer :r21
      t.integer :r22

      t.timestamps
    end
  end
end
