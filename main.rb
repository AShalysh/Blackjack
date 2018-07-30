require 'pry-nav'
require_relative 'main_programm'
require_relative 'interface'
require_relative 'person'
require_relative 'dealer'
require_relative 'player'
require_relative 'deck'
require_relative 'card'


interface = Interface.new
main_programm = MainProgramm.new(interface)
main_programm.start
