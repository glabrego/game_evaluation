# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
  Evaluation.create(r1: rand(1..5), r2: rand(1..5), r3: rand(1..5), r4: rand(1..5), r5: rand(1..5), r6: rand(1..5), r7: rand(1..5), r8: rand(1..5), r9: rand(1..5), r10: rand(1..5), r11: rand(1..5), r12: rand(1..5), r13: rand(1..5), r14: rand(1..5), r15: rand(1..5), r16: rand(1..5), r17: rand(1..5), r18: rand(1..5), r19: rand(1..5), r20: rand(1..5), r21: rand(1..5), r22: rand(1..5))
end
