# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'evaluations/show', type: :view do
  before(:each) do
    @evaluation = assign(:evaluation, Evaluation.create!(
                                        r1: 2,
                                        r2: 3,
                                        r3: 4,
                                        r4: 5,
                                        r5: 6,
                                        r6: 7,
                                        r7: 8,
                                        r8: 9,
                                        r9: 10,
                                        r10: 11,
                                        r11: 12,
                                        r12: 13,
                                        r13: 14,
                                        r14: 15,
                                        r15: 16,
                                        r16: 17,
                                        r17: 18,
                                        r18: 19,
                                        r19: 20,
                                        r20: 21,
                                        r21: 22,
                                        r22: 23
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/8/)
    expect(rendered).to match(/9/)
    expect(rendered).to match(/10/)
    expect(rendered).to match(/11/)
    expect(rendered).to match(/12/)
    expect(rendered).to match(/13/)
    expect(rendered).to match(/14/)
    expect(rendered).to match(/15/)
    expect(rendered).to match(/16/)
    expect(rendered).to match(/17/)
    expect(rendered).to match(/18/)
    expect(rendered).to match(/19/)
    expect(rendered).to match(/20/)
    expect(rendered).to match(/21/)
    expect(rendered).to match(/22/)
    expect(rendered).to match(/23/)
  end
end
