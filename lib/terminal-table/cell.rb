
module Terminal
  class Table
    class Cell
      TEXT_COLORS = { :black => 30,
          :red => 31,
          :green => 32,
          :yellow => 33,
          :blue => 34,
          :magenta => 35,
          :cyan => 36,
          :white => 37 }
      BACKGROUND_COLORS = { :black => 40,
          :red => 41,
          :green => 42,
          :yellow => 43,
          :blue => 44,
          :magenta => 45,
          :cyan => 46,
          :white => 47 }
      TEXT_STYLES = { :plain => 3,
          :bold => 1,
          :underlined => 4 }
      ##
      # Cell width.
      
      attr_reader :width
      
      ##
      # Cell value.
      
      attr_reader :value
      
      ##
      # Cell alignment.
      
      attr_reader :alignment
      
      ##
      # Column span.
      
      attr_reader :colspan
      
      ##
      # Cell Text Color
      
      attr_reader :text_color
      
      ##
      # Cell background Color
      
      attr_reader :background_color
      
      ##
      # Cell Text Style
      
      attr_reader :text_style
      
      ##
      # Initialize with _width_ and _options_.
      
      def initialize width, options = nil
        @width = width
        @value, options = options, {} unless Hash === options
        @value = options.fetch :value, value
        @alignment = options.fetch :alignment, :left
        @text_color = options.fetch :text_color, nil#:white
        @text_style = options.fetch :text_style, nil#:plain
        @background_color = options.fetch :background_color, nil#:black
        @colspan = options.fetch :colspan, 1
      end
      
      ##
      # Render the cell.
      
      def render
        if stylized?
          a = TEXT_COLORS[text_color]
          b = BACKGROUND_COLORS[background_color]
          c = TEXT_STYLES[text_style]
          " \e[#{a};#{b};#{c}m#{value}\e[0m ".align alignment, width + 16
        else
          " #{value} ".align alignment, width + 2
        end
      end
      alias :to_s :render
      
      ##
      # Cell length.
      
      def length
        value.to_s.length + (stylized? ? 16 : 2)
      end
      
      ##
      # Check if any visual styles have been applied
      
      def stylized?
        !text_color.nil? || !background_color.nil? || !text_style.nil?
      end
    end
  end
end