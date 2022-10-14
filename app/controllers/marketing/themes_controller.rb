require "faker"

module Marketing
  class ThemesController < ApplicationController
    layout "theme"

    def desert
      @theme = "desert"
      @website = Website.find_by(subdomain: "mapleshore")
    end

    def links
      @theme = "links"
      @website = Website.find_by(subdomain: "mapleshore")
    end

    def parkland
      @theme = "parkland"
      @website = Website.find_by(subdomain: "mapleshore")
    end
  end
end
