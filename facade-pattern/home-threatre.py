class DvdPlayer:
    def play(self):
        print(f"Playing the the Dvd")

    def pause(self):
        print(f"Pausing the Dvd")

    def stop(self):
        print(f"Stoping the Dvd")

class Projector:
    def turn_on(self):
        print(f"Turn On the projector")
    
    def turn_off(self):
        print(f"Turning Off the Projector")
    
    def set_input(self):
        print(f"Projector: Input set to DVD")

class SoundSystem:
    def turn_on(self):
        print("Turning on the sound system")
    
    def turn_off(self):
        print("Turning off the sound system")
    
    def set_volume(self, volume):
        print(f"Setting up the volume of Sound System {volume}")

class LightingControl:
    def turn_on(self):
        print("Turning on the light")
    
    def turn_off(self):
        print("Turning off the light")
    
    def dim_light(self, dim_percentage):
        print(f"Dimming the light {dim_percentage}")


class HomeThreatreFacade:
    def __init__(self):
        self.dvd_player: DvdPlayer = DvdPlayer()
        self.projector: Projector = Projector()
        self.sound_system: SoundSystem = SoundSystem()
        self.lighting_control: LightingControl = LightingControl()

    def watch_movie(self, dim_percentage, sound_volume):
        print(f"User is getting ready to watch a movie")
        self.lighting_control.dim_light(dim_percentage)
        self.projector.turn_on()
        self.projector.set_input()
        self.sound_system.turn_on()
        self.sound_system.set_volume(sound_volume)
        self.dvd_player.play()
        print(f"Movie is ready to watch!")

home_threatre_facade = HomeThreatreFacade()
home_threatre_facade.watch_movie(20, "MEDIUM")

        
