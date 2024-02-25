# Open-Closed Principle

class InvoiceDao
    def save_to_db
        puts "Invoice has been saved to db." 
    end
end

# If the above code has been tested and deployed over production.
# New changes to come for saving the invoice to file and defining the method inside SaveToDao may leads to error.
#  so this doesn't follow open-closed principle.

#  Now we will modify our code

module InvoiceDao
    def save
        
    end
end

class DatabaseInvoiceDao
    include InvoiceDao
    def save
        puts "Invoice has been saved to database."
    end
end

class FileInvoiceDao
    include InvoiceDao
    def save
        puts "Invoice has been saved to file."
    end 
end

file_save = FileInvoiceDao.new
file_save.save
database_save = DatabaseInvoiceDao.new
database_save.save

# If new usecase comes as save to sql db or save to nosql db we can add new class as sql/no_sql invoice dao and makes them save.