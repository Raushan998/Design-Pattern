module ReportTemplate
    def generate_report
        gather_data
        process_data
        format_report
        print_report
    end

    protected def gather_data
        raise NotImplementedError
    end

    protected def process_data
        raise NotImplementedError
    end

    protected def format_report
        puts "Formatting the report with appropriate layout and style"
    end

    protected def print_report
        puts "Printing the report for the final review and distribution"
    end
end

class InventoryReport
    include ReportTemplate
    protected def gather_data
        puts "Gathering the inventory report"
    end

    protected def process_data
        puts "Processing the inventory report"
    end
end


class EmployeeReport
    include ReportTemplate
    protected def gather_data
        puts "Gathering the employee report"
    end

    protected def process_data
        puts "Processing the inventory report"
    end
end

class SalesReport
    include ReportTemplate
    protected def gather_data
        puts "Gathering the sales report"
    end

    protected def process_data
        puts "Processing the report template"
    end
end

employee_report = EmployeeReport.new
employee_report.generate_report
sales_report = SalesReport.new
sales_report.generate_report
inventory_report = InventoryReport.new
inventory_report.generate_report
