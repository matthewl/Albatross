module Themes
  class Desert
    BODY_FONT_FAMILY = "Oswald"
    HEADINGS_FONT_FAMILY = "Source Serif Pro"
    THEME = "teal"

    def self.color_options
      [
        ["Blue Gray", "blueGray"],
        ["Cool Gray", "coolGray"],
        ["Gray", "gray"],
        ["True Gray", "trueGray"],
        ["Warm Gray", "warmGray"],
        ["Red", "red"],
        ["Orange", "orange"],
        ["Amber", "amber"],
        ["Lime", "lime"],
        ["Green", "green"],
        ["Emerald", "emerald"],
        ["Teal", "teal"],
        ["Cyan", "cyan"],
        ["Light Blue", "lightBlue"],
        ["Blue", "blue"],
        ["Indigo", "indigo"],
        ["Violet", "violet"],
        ["Purple", "purple"],
        ["Fuschia", "fuschia"],
        ["Pink", "pink"],
        ["Rose", "rose"]
      ]
    end

    def self.body_font_family
      BODY_FONT_FAMILY.gsub(" ", "+")
    end

    def self.headings_font_family
      HEADINGS_FONT_FAMILY.gsub(" ", "+")
    end
  end
end
