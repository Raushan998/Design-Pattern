require_relative './shape'
require_relative './circle'
require_relative './rectangle'
require_relative './square'

class ShapeFactory
    FIGURE = {
        'circle'=>Circle,
        'rectangle' => Rectangle,
        'square' => Square
    }
    def get_shape(figure)
        FIGURE[figure].new
    end
end