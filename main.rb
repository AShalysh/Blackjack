require 'pry-nav'
require_relative 'main_program'
require_relative 'interface'
require_relative 'bank'
require_relative 'dealer'
require_relative 'player'
require_relative 'deck'
require_relative 'card'

interface = Interface.new
main_program = MainProgram.new(interface)
main_program.start
