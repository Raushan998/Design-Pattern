from abc import ABC, abstractmethod


class State(ABC):

    @abstractmethod
    def press_play(self, player):
        pass

    @abstractmethod
    def press_stop(self, player):
        pass

    @abstractmethod
    def press_pause(self, player):
        pass

    @abstractmethod
    def display(self):
        pass


class StoppedState(State):

    def press_play(self, player):
        print("Starting playback")
        player.state = PlayingState()

    def press_stop(self, player):
        print("Already stopped")

    def press_pause(self, player):
        print("Can't pause. Media is already stopped")

    def display(self):
        print("Current State: Stopped")


class PlayingState(State):

    def press_play(self, player):
        print("Already playing")

    def press_stop(self, player):
        print("Stopping playback")
        player.state = StoppedState()

    def press_pause(self, player):
        print("Pausing playback")
        player.state = PausedState()

    def display(self):
        print("Current State: Playing")


class PausedState(State):

    def press_play(self, player):
        print("Resuming playback")
        player.state = PlayingState()

    def press_stop(self, player):
        print("Stopping playback from pause")
        player.state = StoppedState()

    def press_pause(self, player):
        print("Already paused")

    def display(self):
        print("Current State: Paused")


class MediaPlayer:

    def __init__(self, state: State):
        self.__state = state

    @property
    def state(self) -> State:
        return self.__state

    @state.setter
    def state(self, state: State):
        self.__state = state

    def play(self):
        self.__state.press_play(self)

    def stop(self):
        self.__state.press_stop(self)

    def pause(self):
        self.__state.press_pause(self)

    def display(self):
        self.__state.display()


# Client Code

player = MediaPlayer(StoppedState())

player.display()

player.play()
player.display()

player.pause()
player.display()

player.play()
player.display()

player.stop()
player.display()