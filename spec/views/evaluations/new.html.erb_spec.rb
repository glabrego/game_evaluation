# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'evaluations/new', type: :view do
  before(:each) do
    assign(:evaluation, Evaluation.new(
                          r1: 1,
                          r2: 1,
                          r3: 1,
                          r4: 1,
                          r5: 1,
                          r6: 1,
                          r7: 1,
                          r8: 1,
                          r9: 1,
                          r10: 1,
                          r11: 1,
                          r12: 1,
                          r13: 1,
                          r14: 1,
                          r15: 1,
                          r16: 1,
                          r17: 1,
                          r18: 1,
                          r19: 1,
                          r20: 1,
                          r21: 1,
                          r22: 1
    ))
  end

  it 'renders new evaluation form' do
    render

    assert_select 'form[action=?][method=?]', evaluations_path, 'post' do
      assert_select 'input#evaluation_r1[name=?]', 'evaluation[r1]'

      assert_select 'input#evaluation_r2[name=?]', 'evaluation[r2]'

      assert_select 'input#evaluation_r3[name=?]', 'evaluation[r3]'

      assert_select 'input#evaluation_r4[name=?]', 'evaluation[r4]'

      assert_select 'input#evaluation_r5[name=?]', 'evaluation[r5]'

      assert_select 'input#evaluation_r6[name=?]', 'evaluation[r6]'

      assert_select 'input#evaluation_r7[name=?]', 'evaluation[r7]'

      assert_select 'input#evaluation_r8[name=?]', 'evaluation[r8]'

      assert_select 'input#evaluation_r9[name=?]', 'evaluation[r9]'

      assert_select 'input#evaluation_r10[name=?]', 'evaluation[r10]'

      assert_select 'input#evaluation_r11[name=?]', 'evaluation[r11]'

      assert_select 'input#evaluation_r12[name=?]', 'evaluation[r12]'

      assert_select 'input#evaluation_r13[name=?]', 'evaluation[r13]'

      assert_select 'input#evaluation_r14[name=?]', 'evaluation[r14]'

      assert_select 'input#evaluation_r15[name=?]', 'evaluation[r15]'

      assert_select 'input#evaluation_r16[name=?]', 'evaluation[r16]'

      assert_select 'input#evaluation_r17[name=?]', 'evaluation[r17]'

      assert_select 'input#evaluation_r18[name=?]', 'evaluation[r18]'

      assert_select 'input#evaluation_r19[name=?]', 'evaluation[r19]'

      assert_select 'input#evaluation_r20[name=?]', 'evaluation[r20]'

      assert_select 'input#evaluation_r21[name=?]', 'evaluation[r21]'

      assert_select 'input#evaluation_r22[name=?]', 'evaluation[r22]'
    end
  end
end
