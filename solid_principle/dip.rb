# Dependency Inversion Principle - It states that higher level module should not depend on lower level module. both should depend on abstraction.
#  Abstractions should not depend on details. Details should depend on abstractions.

class XmlReportGenerator
    def initialize(data)
        @data = data
    end

    def generate
        puts "Xml Report has been generated for #{@data}"
    end
end

class ReportGeneratorManager
    def initialize(data)
        @data = data
    end

    def call
        generate_report
        additional_actions
    end

    private

    attr_reader :data
    
    def generate_report
        XmlReportGenerator.new(data).generate
    end

    def additional_actions
    end
end

data = "Data"
report_generator = ReportGeneratorManager.new(data)
report_generator.generate

# Above code violates dependency inversion principle because XmlReportGenerator and ReportGenerateManager are tightly coupled with eachother.
# If we implement a new generator, it will require modification in our ReportGenerateManager class.

class XmlReportGenerator
    def initialize(data)
        @data = data
    end

    def generate
        puts "Xml Report has been generated for #{@data}"
    end
end

class JsonReportGenerator
    def initialize(data)
        @data = data
    end

    def generate
        puts "Json Report has been generated for #{@data}"
    end
end

class ReportGeneratorManager
    attr_accessor :data, :generator

    def initialize(data, generator)
        @data = data
        @generator = generator
    end

    def call
        generate_report
        additional_actions
    end

    private

    attr_reader :data
    
    def generate_report
        generator.new(data).generate
    end

    def additional_actions
    end
end

data = "Data"
report_generator = ReportGeneratorManager.new(data, XmlReportGenerator)
report_generator.call

report_generator = ReportGeneratorManager.new(data, JsonReportGenerator)
report_generator.call