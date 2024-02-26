require_relative './shape_factory'

shape_factory = ShapeFactory.new
shape_obj = shape_factory.get_shape('circle')
shape_obj.draw

shape_obj = shape_factory.get_shape('square')
shape_obj.draw

shape_obj = shape_factory.get_shape('rectangle')
shape_obj.draw