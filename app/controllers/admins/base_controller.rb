# frozen_string_literal: true

module Admins
  class BaseController < ApplicationController
    before_action :authenticate_admin!
  end
end
