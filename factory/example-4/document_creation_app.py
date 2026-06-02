from abc import ABC, abstractmethod

class DocumentFactory():
    @staticmethod
    def create_document(document: str):
        match document:
            case "HtmlDocument":
                return HTMLDocument()
            case "WordDocument":
                return WordDocument()
            case "PDFDocument":
                return PDFDocument()
            case _:
                return "Invalid Document"

class Document(ABC):
    @abstractmethod
    def display_type(self):
        pass

class HTMLDocument(Document):
    def display_type(self):
        print("Creating an HTML Document")

class WordDocument(Document):
    def display_type(self):
        print("Creating a Word Document")

class PDFDocument(Document):
    def display_type(self):
        print("Creating a PDF Document")

document_1 = DocumentFactory.create_document("HtmlDocument")
document_2 = DocumentFactory.create_document("WordDocument")
document_3 = DocumentFactory.create_document("PDFDocument")

document_1.display_type()
document_2.display_type()
document_3.display_type()