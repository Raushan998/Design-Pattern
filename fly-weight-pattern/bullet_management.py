class BulletType:
    def __init__(self, color: str):
        self.color = color

class BulletTypeFactory:
    bullet_type_store = {}
    
    @classmethod
    def get_bullet_type(cls, color: str):
        if color not in cls.bullet_type_store:
            cls.bullet_type_store[color] = BulletType(color)
        
        return cls.bullet_type_store[color]
        
class Bullet:
    def __init__(self, x:int, y:int, velocity: int, color: str):
        self.x = x
        self.y = y
        self.velocity = velocity
        self.color = BulletTypeFactory.get_bullet_type(color)
    
    def display(self):
        print(f"Bullet at {self.x} {self.y} {self.velocity} {self.color.color}")


for x in range(5):
    bullet = Bullet(x*10, x*12, 5, "Red")
    bullet.display()

for y in range(10):
    bullet = Bullet(y*10, y*12, 5, "Greeen")
    bullet.display()