class PagesController < ApplicationController
  def home
      @entries = Entry.take(6)
  end

  def generic
  end

  def elements
  end

  def forms
  end
end
