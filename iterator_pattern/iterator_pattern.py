from abc import abstractmethod

class IteratorInterface:
    @abstractmethod
    def has_next(self):
        pass

    @abstractmethod
    def next(self):
        pass

class BookIterator(IteratorInterface):
    def __init__(self, books: list[Book]):
        self.books = books
        self.position = 0
    
    def next(self):
        book = self.books[self.position]
        self.position+=1
        return book
    
    def has_next(self):
        return self.position < len(self.books)


class Book:
    def __init__(self, title):
        self.title = title

    def get_title(self):
        return self.title
    
class BookCollection:
    def __init__(self):
        self.books = []
    
    def add_book(self, book: Book):
        self.books.append(book)
    
    def get_books(self):
        return self.books
    
    def create_iterator(self):
        return BookIterator(self.books)




book_collection = BookCollection()
book_collection.add_book(Book("C++ Book"))
book_collection.add_book(Book("Java Book"))
book_collection.add_book(Book("Python Book"))
iterator = book_collection.create_iterator()
while(iterator.has_next()):
    book = iterator.next()
    print("Book Title: ", book.get_title())


