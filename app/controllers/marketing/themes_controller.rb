module Marketing
  class ThemesController < ApplicationController
    layout "theme"

    def index
      @theme = params[:t] || "parkland"
      render @theme.to_sym
    end
  end
end
