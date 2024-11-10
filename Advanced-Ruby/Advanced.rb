# class Example
#     attr_reader :data

#     def print_data(&block)
#         block.call(self) if block
#     end

#     def assign_values(*name)
#         puts name.join(", ")
#     end

#     private
#     def print_hello
#         puts "Hello World"
#     end
# end

# example = Example.new
# example.print_data { |example| example.assign_values("Raushan", "Rohit", "Anish")}

# module ActiveRecord
#     class Migration
#         def self.inherited(subclass)
#             if subclass.superclass == ActiveRecord::Migration
#                 raise "You must specify a version when inheriting from ActiveRecord::Migration"
#             end
#         end
#    end 
# end

# class AddDetailsToUser < ActiveRecord::Migration
#     def initialize
#         puts "Child has been called"
#     end
# end

# AddDetailsToUser.new

# class Parent
#     def say
#       p "I'm the parent"
#     end
# end
  
# class Child < Parent
#     def say(message)
#       super()
#     end
# end
  
# Child.new.say('Hi!')

# Super with blocks

# class Parent
#     def initialize
#         yield(self) if block_given?
#     end

#     def print_data
#         puts "Print Data has been called!!!"
#     end
# end

# class Child < Parent
#     def initialize
#         super
#     end

#     def say
#         puts "I have called you"
#     end
# end

# Child.new {|example| example.print_data}

#  class Animal
#   def speak(sound)
#     puts sound
#   end
# end

# class Dog < Animal
#   def speak(sound)
#     super
#   end
# end
# Dog.new.speak("Bark")


# animal = Class.new do
#   def speak
#     puts "Wow! Wow!"
#   end
# end
# dog = Class.new(animal)
# dog.new.speak
# puts animal.superclass

# class Animal
# end

# puts Animal.ancestors
# class Greeting
#   def self.hello
#     'hello world!'
#   end

#   def self.eigenclass
#     class << self
#       self
#     end
#   end
# end

# puts Greeting.eigenclass
# puts Greeting.eigenclass # => #<Class:Greeting>
# puts Greeting.eigenclass.name # => nil
# puts Greeting.singleton_methods # => [:hello, :eigenclass]
# puts Greeting.eigenclass.instance_methods(false) # => [:hello, :eigenclass]
# puts Greeting.instance_methods(false)

# class Animal
#   def initialize
#     puts self
#   end
# end

# class Animal
#     def self.speak
#       puts self
#     end
# end

# Animal.speak

# class Vehicle
#   class << self
#     def speak
#       puts self
#     end
#   end
# end

# Vehicle.speak

# class Animal
#   # def self.speak
#   #   puts "I am talking"
#   # end
#   class << self
#     def speak
#       puts "I am talking"
#     end
#   end
# end

# class Cat < Animal
  
# end

# Cat.speak
# Animal.speak --> this will not work

# class Speaker
#   # Define a method in the singleton class of Speaker
#   class << self
#     def speak
#       puts "I am talking"
#     end
#   end
# end

# # Create an instance of Speaker
# speaker = Speaker.new

# # Define a method in the singleton class of the instance
# class << speaker
#   def only_talk
#     puts "I can only speak."
#   end
# end

# # Call the class method
# Speaker.speak # Outputs: "I am talking"

# # Call the singleton class method
# speaker.only_talk # Outputs: "I can only speak."

# m = Module.new
# # puts m.name
# Mod = m
# puts m.name
# puts Mod.name

# Class_ = Class.new
# puts Class_.name

# Animal = Module.new do
#   def speak
#     puts "I can speak"
#   end
# end

# class Cat
#    include Animal
#   def speak
#     super
#   end
# end

# puts Cat.new.speak

# module Commentable
#   def self.included(commentable_entity)
#     puts "The #{commentable_entity} entity now accepts comments!"
#   end
# end

# class RubyCademy
#   include Commentable
# end


# module Foo
#   def self.included(base)
#     base.class_eval do
#       def print_data
#         puts "Hello World"
#       end
#     end
#   end
# end

# module Commentable
#   include Foo

#   def self.included(base)
#     puts "#{base} now includes Commentable"
#     puts "The #{base} entity now accepts comments!"

#     base.class_eval do
#       def add_comment(comment)
#         @comments ||= []
#         @comments << comment
#       end

#       def comments
#         @comments ||= []
#       end
#     end
#   end
# end

# class Post
#   include Commentable
# end

# # Testing the added methods
# post = Post.new
# post.add_comment("This is a great post!")
# puts post.comments.inspect # => ["This is a great post!"]

# # Testing the class method injected by Foo
# if Post.respond_to?(:print_data)
#   Post.print_data # => "Hello World"
# else
#   puts "Post does not have a method named print_data"
# end

# module Manager
#   extend self
#   def name
#     puts "I'm your Manager"
#   end
# end

# class Developer
#   include Manager
# end

# # Developer.new.name
# # Developer.name
# puts Manager.instance_methods.include?(:name)
# puts Manager.singleton_methods.include?(:name)
# puts Developer.instance_methods.include?(:name)
# puts Developer.singleton_methods.include? :name

# module ModuleFunction
#   def who_am_i
#     "ModuleFunction"
#   end

#   module_function :who_am_i
# end

# puts ModuleFunction.who_am_i # => "ModuleFunction"

# module ModuleFunction
#   def who_am_i
#     "overridden ModuleFunction"
#   end
# end

# puts ModuleFunction.who_am_i # => "ModuleFunction"

# module ModuleFunction
#   module_function :who_am_i
# end

# puts ModuleFunction.who_am_i # => "overridden ModuleFunction"

# class Person
#   attr_reader :params
#   def initialize(**params)
#     puts "Outside Person has been called."
#     @params = params
#   end
# end

# module Actions
#   class PersonCreator
#     def self.call(**person_params)
#       Person.new(**person_params)
#     end
#   end

#   class Person
#     attr_reader :params

#     def initialize(**params)
#       puts "Inner Person has been called."
#       @params = params
#     end
#   end
# end

# Actions::PersonCreator.call(name: 'John')

# class Person
#   attr_reader :params

#   def initialize(**params)
#     @params = params
#   end
# end

# module Actions; end
# class Actions::PersonCreator
#   def self.call(**person_params)
#     Person.new(**person_params)
#   end
# end

# Actions::PersonCreator.call

# module Actions; end

# class Actions::PersonCreator
#   pp Module.nesting
# end
# # => [Actions::PersonCreator]

# module Actions
#   class PersonCreator
#     pp Module.nesting
#   end
# end

# class Person
#   attr_reader :params

#   def initialize(**params)
#     @params = params
#   end
# end

# module Actions
#   class Person
#     attr_reader :params

#     def initialize(**params)
#       puts 'Actions::Person'
#       @params = params
#     end
#   end
# end

# class Actions::PersonCreator
#   def self.call(**person_params)
#     Person.new(**person_params)
#   end
# end

# module Actions
#   class PersonCreator
#     def self.call(**person_params)
#       Person.new(**person_params)
#     end
#   end
# end

# Actions::PersonCreator.call(name: "Hirako Shinji")

# module Actions end;
# class Actions::PersonCreator
#   def self.call
#     Person.new
#   end

#   class Person
#     pp "local person"
#   end
# end

# class Person
#   def initialize
#     puts "Global Person"
#   end
# end

# Actions::PersonCreator.call

# module Commentable
#   def self.included(base)
#     puts base
#   end
# end

# class Item
#   include Commentable
#   def initialize
#     puts "I am Printed in class"
#   end
# end
# Item.new

# class A
#   module B; end
# end

# class C < A
#   def initialize
#     pp B == A::B
#   end
# end
# C.new

# module A
#   module B; end
#   module C
#     module D
#       pp Module.nesting
#     end
#   end
# end

# module A
#   module B; end
#   module C
#     module D
#       puts B == A::B
#     end
#   end
# end

# class A
#   module B; end
# end

# class C < A
#   class D
#     A
#   end
# end

# String.class_eval do
#   def /(delimiter)
#     split(delimiter)
#   end
# end

# puts "1,2,3"/","

# class A
#   module B; end
# end

# class C
#   module B; end
#   A.class_eval{ B } == C::B
# end

# array_second = <<-RUBY
#   def second
#     self[1]
#   end
# RUBY

# Array.class_eval(array_second)

# String.class_eval do
#   def /(delimiter)
#     split(delimiter)
#   end
# end

# [1,2,3].second # => 2
# "1,2,3" / ','  # => ["1", "2", "3"]

# module Commentable
#   def add_comment(comment)
#     self.comments << comment
#   end

#   def comments
#     @comments ||= []
#   end
# end

# Commentable.module_eval do
#   def comment_count
#     comments.count
#   end
# end

# class Post
#   include Commentable
# end

# post = Post.new

# post.add_comment("Very nice !") # => ["Very nice !"] 
# post.comment_count 

# def proc_demo_method
#   proc_demo = Proc.new { return "Only I print!" }
#   proc_demo.call
#   "But what about me?" # Never reached
# end

# puts proc_demo_method 
# # Output 
# # Only I print!

# # (Notice that the proc breaks out of the method when it returns the value.)

# def lambda_demo_method
#   lambda_demo = lambda { return "Will I print?" }
#   lambda_demo.call
#   "Sorry - it's me that's printed."
# end

# puts lambda_demo_method

# double_proc = Proc.new do |arr|
#   arr.map! do |element|
#     element ** 2
#   end
# end
# arr=[1,2,3,4,5]
# double_proc.call(arr)
# pp arr

# double_proc = Proc.new { |element| element**2}
# arr=[1,2,3,4,5]
# arr.map!(&double_proc)
# puts arr

# multiplication = lambda { |x, y| return x * y * 2 }
# puts multiplication.call(10, 20)
