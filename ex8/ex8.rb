# frozen_string_literal: true

require_relative 'ex8backing'

# app/controllers/user_controller.rb
class UserController < ApplicationController
  def create
    @form = UserForm.new(user_params)

    if @form.valid?
      @user = User.new(user_params)
      @user.save
      redirect_to @user.attributes[:id]
    else
      render :new
    end
  end

  def user_params
    params
      .require(:user)
      .permit(:id, :user)
  end
end

class Form
  def initialize(params); end

  def valid?
    true
  end
end

class UserForm < Form
end

require 'test/unit'
class TestParams < Test::Unit::TestCase
  def test_require_with_valid
    params = Params.new({ user: 'edd', id: 1 })
    assert_equal params.require(:id), params
  end

  def test_require_with_invalid
    params = Params.new({ user: 'edd', id: 1 })
    assert_raise { params.require(:name) }
  end

  def test_permit
    params = Params.new({ user: 'edd', id: 1, not_allowed: 'derp' })
    assert_equal params.permit(:user, :id), { user: 'edd', id: 1 }
  end
end

class TestUserController < Test::Unit::TestCase
  def setup
    params = Params.new({ user: 'edd', id: 1 })
    @controller = UserController.new(params)
  end

  def test_valid_data
    assert_equal @controller.create, 'redirected to user 1'
  end
end
