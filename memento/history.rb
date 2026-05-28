module History
    def save
        @history ||= []
        @history << @content.dup
    end

    def undo
        return if @history.empty?
        @content = @history.pop
    end
end