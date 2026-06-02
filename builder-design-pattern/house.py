class House:
    def __init__(self, builder):
        self.foundation: str = builder.foundation
        self.structure: str = builder.structure
        self.roof: str = builder.roof
        self.has_garage = builder.has_garage
        self.has_swimming_pool = builder.has_swimming_pool
        self.has_garden = builder.has_garden
    
    def __str__(self):
        return (
            f"House("
            f"foundation={self.foundation}, "
            f"structure={self.structure}, "
            f"roof={self.roof}, "
            f"garage={self.has_garage}, "
            f"swimming_pool={self.has_swimming_pool}, "
            f"garden={self.has_garden})"
        )
    
    @staticmethod
    def build(builder):
        return House(builder)


class HouseBuilder:
    def __init__(self, foundation, structure, roof):
        self.foundation: str = foundation
        self.structure: str = structure
        self.roof: str = roof
        self.has_garage: bool
        self.has_swimming_pool: bool
        self.has_garden: bool
    
    def set_garden(self, has_garden: bool):
        self.has_garden = has_garden
        return self
    
    def set_swimming_pool(self, has_swimming_pool: bool):
        self.has_swimming_pool = has_swimming_pool
        return self
    
    def set_garage(self, has_garage: bool):
        self.has_garage = has_garage
        return self
    
    def build(self):
        return House.build(self)

house = (
    HouseBuilder("Concrete Foundation", "Brick Structure", "Tile Roof")
    .set_garage(True)
    .set_garden(True)
    .set_swimming_pool(False)
    .build()
)

print(house)