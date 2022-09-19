module Themes
  class Parkland
    BODY_FONT_FAMILY = "Roboto"
    HEADINGS_FONT_FAMILY = "Roboto Condensed"
    THEME = "emerald"

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
      BODY_FONT_FAMILY.tr(" ", "+")
    end

    def self.headings_font_family
      HEADINGS_FONT_FAMILY.tr(" ", "+")
    end
  end
end
