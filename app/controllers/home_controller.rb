class HomeController < ApplicationController
  def action
      render file: Rails.root.join('public', 'index.html')
  end
end
