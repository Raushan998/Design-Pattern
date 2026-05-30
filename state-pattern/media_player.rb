module State
  def press_play(player)
    raise NotImplementedError
  end

  def press_stop(player)
    raise NotImplementedError
  end

  def press_pause(player)
    raise NotImplementedError
  end

  def display
    raise NotImplementedError
  end
end

class StoppedState
  include State

  def press_play(player)
    puts "Starting playback"
    player.state = PlayingState.new
  end

  def press_stop(player)
    puts "Already stopped"
  end

  def press_pause(player)
    puts "Can't pause. Media is already stopped"
  end

  def display
    puts "Current State: Stopped"
  end
end

class PlayingState
  include State

  def press_play(player)
    puts "Already playing"
  end

  def press_stop(player)
    puts "Stopping playback"
    player.state = StoppedState.new
  end

  def press_pause(player)
    puts "Pausing playback"
    player.state = PausedState.new
  end

  def display
    puts "Current State: Playing"
  end
end

class PausedState
  include State

  def press_play(player)
    puts "Resuming playback"
    player.state = PlayingState.new
  end

  def press_stop(player)
    puts "Stopping playback from pause"
    player.state = StoppedState.new
  end

  def press_pause(player)
    puts "Already paused"
  end

  def display
    puts "Current State: Paused"
  end
end

class MediaPlayer
  attr_accessor :state

  def initialize(state)
    unless state.is_a?(State)
      raise ArgumentError, "state must implement State"
    end

    @state = state
  end

  def play
    state.press_play(self)
  end

  def stop
    state.press_stop(self)
  end

  def pause
    state.press_pause(self)
  end

  def display_state
    state.display
  end
end

# Client Code

player = MediaPlayer.new(StoppedState.new)

player.display_state

player.play
player.display_state

player.pause
player.display_state

player.play
player.display_state

player.stop
player.display_state