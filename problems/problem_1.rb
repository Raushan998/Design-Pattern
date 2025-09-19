=begin
The Problem: Build a Mini Workflow Engine
You need to design a Workflow Engine in Ruby that:
Defines tasks using blocks. Each task will:
Accept input from the previous task.
Use yield to pass processed data forward.
Supports conditional execution using lambdas.
For example: only run a task if ->(data) { data[:status] == :ok } evaluates to true.
Allows chaining tasks together in a pipeline.
Each task can transform the data.
If a task fails (raises an exception), the workflow should catch it and either:
Continue (if an error handler lambda is provided).
Stop the workflow otherwise.
Supports reusable workflows.
A workflow can be saved and later executed with different input.
=end

class Workflow
    def initialize
        @tasks= []
        @error_handler = ->(error) { raise error }
        @data = {}
    end

    def on_error(handler_lambda=nil, &block)
        @error_handler = handler_lambda || block
    end

    def task(name, condition_lambda=nil, &block)
        @tasks << {name: name, condition_lambda: condition_lambda, block: block}
    end

    def run(input: )
        @data[:input] = input
        @tasks.each do |current_task|
            begin
                next unless current_task[:condition_lambda].nil? || current_task[:condition_lambda].call(@data)

                current_task[:block].call(@data) do |yielded|
                    @data = yielded
                end
            rescue => e
                @error_handler.call(e, @data)
            end
        end
        @data
    end
end

workflow = Workflow.new

workflow.task("Validate Input", ->(d) { !d[:input].nil? }) do |data, &next_step|
  next_step.call(data.merge(valid: true))
end

workflow.task("Double the number") do |data, &next_step|
  next_step.call(data.merge(result: data[:input] ** 2))
end

workflow.task("Only keep even", ->(d) { d[:result].even? }) do |data, &next_step|
  next_step.call(data.merge(filtered: true))
end


workflow.on_error(->(err, data) {
  puts "Error: #{err.message}, Data: #{data.inspect}"
  data.merge(error: err.message)
})

output = workflow.run(input: 10)
puts output.inspect
