require 'rails_helper'

RSpec.describe "evaluations/index", type: :view do
  before(:each) do
    assign(:evaluations, [
      Evaluation.create!(
        :r1 => 2,
        :r2 => 3,
        :r3 => 4,
        :r4 => 5,
        :r5 => 6,
        :r6 => 7,
        :r7 => 8,
        :r8 => 9,
        :r9 => 10,
        :r10 => 11,
        :r11 => 12,
        :r12 => 13,
        :r13 => 14,
        :r14 => 15,
        :r15 => 16,
        :r16 => 17,
        :r17 => 18,
        :r18 => 19,
        :r19 => 20,
        :r20 => 21,
        :r21 => 22,
        :r22 => 23
      ),
      Evaluation.create!(
        :r1 => 2,
        :r2 => 3,
        :r3 => 4,
        :r4 => 5,
        :r5 => 6,
        :r6 => 7,
        :r7 => 8,
        :r8 => 9,
        :r9 => 10,
        :r10 => 11,
        :r11 => 12,
        :r12 => 13,
        :r13 => 14,
        :r14 => 15,
        :r15 => 16,
        :r16 => 17,
        :r17 => 18,
        :r18 => 19,
        :r19 => 20,
        :r20 => 21,
        :r21 => 22,
        :r22 => 23
      )
    ])
  end

  it "renders a list of evaluations" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
    assert_select "tr>td", :text => 10.to_s, :count => 2
    assert_select "tr>td", :text => 11.to_s, :count => 2
    assert_select "tr>td", :text => 12.to_s, :count => 2
    assert_select "tr>td", :text => 13.to_s, :count => 2
    assert_select "tr>td", :text => 14.to_s, :count => 2
    assert_select "tr>td", :text => 15.to_s, :count => 2
    assert_select "tr>td", :text => 16.to_s, :count => 2
    assert_select "tr>td", :text => 17.to_s, :count => 2
    assert_select "tr>td", :text => 18.to_s, :count => 2
    assert_select "tr>td", :text => 19.to_s, :count => 2
    assert_select "tr>td", :text => 20.to_s, :count => 2
    assert_select "tr>td", :text => 21.to_s, :count => 2
    assert_select "tr>td", :text => 22.to_s, :count => 2
    assert_select "tr>td", :text => 23.to_s, :count => 2
  end
end
