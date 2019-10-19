# typed: strict
class HomeController < ApplicationController
  extend T::Sig

  sig { returns(NilClass) }
  def index
  end
end