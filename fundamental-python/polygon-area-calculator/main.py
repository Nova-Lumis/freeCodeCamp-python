# Building a Polygon Area Calculator

class Rectangle:
    # Parameters, instance attrs
    def __init__(self, width, height):
        self.width = width
        self.height = height
    
    # Manipulate parameter
    def set_width(self, width):
        self.width = width
    def set_height(self, height):
        self.height = height
    
    # Calculates area, perimeter, and diagonal
    def get_area(self):
        return self.width * self.height
    def get_perimeter(self):
        return 2*(self.width + self.height)
    def get_diagonal(self):
        return (self.width**2 + self.height**2) ** 0.5
    
    # Drawing the rectange picture.
    def get_picture(self):
        # Set the limit
        if self.width > 50 or self.height > 50:
            return "Too big for picture."
        rect_draw = ""
        # drawing the rectangle
        for i in range(self.height):
            rect_draw += ("*" * self.width) + "\n"
        return rect_draw
    
    # when called
    def __str__(self):
        return f"Rectangle(width={self.width}, height={self.height})"
    
    # get amount inside
    def get_amount_inside(self, shape):
        # get the result of self.width divided by another shape.width
        divided_width = int(self.width / shape.width) 
        # same as height
        divided_height = int(self.height / shape.height)
        # the get amount earn by multiply both divided number
        return divided_width * divided_height

class Square(Rectangle):
    def __init__(self, side):
        self.side = side
        self.width = side
        self.height = side

    def set_side(self, side):
        self.side = side
        self.set_width(side)
        self.set_height(side)
        
    # Overrides width and height
    def set_width(self, side):
        self.side = side
        self.width = side
        self.height = side
    def set_height(self, side):
        self.side = side
        self.width = side
        self.height = side
    # When called
    def __str__(self) -> str:
        return f"Square(side={self.side})"


# MAIN
rect = Rectangle(10, 5)
print(rect.get_area())
rect.set_height(3)
print(rect.get_perimeter())
print(rect)
print(rect.get_picture())

sq = Square(9)
print(sq.get_area())
sq.set_side(4)
print(sq.get_diagonal())
print(sq)
print(sq.get_picture())

rect.set_height(8)
rect.set_width(16)
print(rect.get_amount_inside(sq))
