# frozen_string_literal: true

class StaticController < ApplicationController
  def homepage
    @pending_approvals = Post.submitted
  end
end
