# frozen_string_literal: true

class Evaluation < ApplicationRecord
  belongs_to :game
  validates :r1, :r2, :r3, :r4, :r5, :r6, :r7, :r8, :r9, :r10, :r11, :r12, :r13, :r14, :r15, :r16, :r17, :r18, :r19, :r20, :r21, :r22, presence: true
end
