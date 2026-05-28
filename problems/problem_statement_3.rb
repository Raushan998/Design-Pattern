=begin
    Design a Collaborative Document Editing System (like Google Docs)
    Your system should allow:
    Multiple users editing the same document simultaneously.
    Each keystroke/update should be visible to others in real-time.
    Support undo/redo operations.
    Maintain a version history of the document.
    Handle conflicts when two users edit the same section at the same time.
    Support offline editing → once user comes online, changes sync correctly.
    ✨ Challenges you need to address:

    Data Model: how to represent a document (text buffer? tree structure? operational logs?).
    Conflict Resolution: Operational Transformation (OT) vs Conflict-free Replicated Data Types (CRDTs).
    Concurrency Control: ensuring changes apply in correct order.
    Scalability: multiple docs, thousands of users per doc.
    APIs:
    edit(documentId, userId, operation)
    subscribe(documentId, userId) → stream of changes
    getVersion(documentId, versionId)
=end

class Document
    attr_reader :id, :version_history_list, :performed_stack
    
    def initialize
        @id = rand(1...1000) #it will auto-increment as of now kept it as random
        @mutex = Mutex.new
        @version_history_list = {}
        @performed_stack = Hash.new {|h, k| h[k]=[]}
    end

    def edit(user_id, operation)
        @version = Version.new
        @mutex.synchronize do
            @version.track_history(operation, self.id, user_id)
            perform_operation(operation)
            @version_history_list[@version.id] = @version
            @performed_stack[user_id] << @version
        end
    end

    def getVersion(versionId)
        @version_history_list[versionId]
    end

    def undo(user_id)
        @mutex.synchronize do
            last_version = @performed_stack[user_id].pop
            return unless last_version

            inverse_op = last_version.operation.inverse
            perform_operation(inverse_op)
            new_version = Version.new
            new_version.track_history(inverse_op, self.id, user_id)
            @performed_stack[user_id] << new_version
            @version_history_list[new_version.id] = new_version
        end
    end
    
    def perform_operation(operation)
       case operation.type
       when :insert
        puts "Inserted '#{operation.keystroke}' at (#{operation.x_coordinate}, #{operation.y_cordinate})"
       when :delete
        puts "Deleted '#{operation.keystroke}' at (#{operation.x_coordinate}, #{operation.y_cordinate})"
       end
    end
end

class User
    attr_reader :name, :email

    def initialize(name, email)
        @id = rand(1...1000) #it will auto-increment as of now kept it as random
        @name = name
        @email = email
    end
end

class Operation
    attr_reader :x_coordinate, :y_cordinate, :keystroke, :type

    def initialize(x_coordinate, y_cordinate, keystroke, type)
        @x_coordinate = x_coordinate
        @y_cordinate = y_cordinate
        @keystroke = keystroke
        @type = type
    end

    def inverse
        inverse_type = @type == :insert ? :delete : :insert
        Operation.new(@x_coordinate, @y_cordinate, @keystroke, inverse_type)
    end
end

class Version
    attr_reader :id, :operation, :documentId, :userId, :time_stamp
    def initialize
        @id = rand(1...1000) #it will auto-increment as of now kept it as random
    end

    def track_history(operation, documentId, userId)
        @operation = operation
        @documentId = documentId
        @userId = userId
        @time_stamp = Time.now
    end
end

@user_1 = User.new("Raushan", "raushan.raman123@gmail.com")
@user_2 = User.new("Shivam", "shivam.shubham108@gmail.com")

@document = Document.new
@operation_1 = Operation.new('1.0', '2.0', 'k', :insert)
@operation_2 = Operation.new('2.0', '3.0', 'y', :insert)
@document.edit(@user_1, @operation_1)
@document.edit(@user_2, @operation_2)
@document.undo(@user_1)