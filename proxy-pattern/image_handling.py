from abc import ABC, abstractmethod
class Image(ABC):
    @abstractmethod
    def display(self):
        pass

class RealImage(Image):
    def __init__(self, filename):
        self.filename = filename

    def display(self):
        print(f"Displaying the image: {self.filename}" )


class ProxyImage(Image):
    def __init__(self, filename):
        self.realImage: RealImage = None
        self.filename = filename
    
    def display(self):
        if not self.realImage:
            self.realImage = RealImage(self.filename)
        return self.realImage.display()

image_1 = ProxyImage("dog.png")
image_2 = ProxyImage("cat.png")
image_1.display()
image_2.display()