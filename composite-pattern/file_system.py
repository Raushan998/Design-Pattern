from dataclasses import dataclass, field
from abc import ABC, abstractmethod

class FileSystemComponent(ABC):
    @abstractmethod
    def show_details(self):
        pass

@dataclass
class File(FileSystemComponent):
    name: str
    
    def show_details(self):
        print(f"File: {self.name}")

@dataclass
class Folder(FileSystemComponent):
    name: str
    file_system_components: list['FileSystemComponent'] = field(default_factory=list)
    
    def add_filesystem_component(self, file_system_component: FileSystemComponent):
        self.file_system_components.append(file_system_component)
    
    def show_details(self):
        print(f"Folder: {self.name}")
        for file_system_component in self.file_system_components:
            file_system_component.show_details()


file_1 = File("File.txt")
file_2 = File("File-2.txt")
folder = Folder("Documents")
sub_folder = Folder("Python-Project")
file_3 = File("python-new.py")
folder.add_filesystem_component(file_1)
folder.add_filesystem_component(file_2)
sub_folder.add_filesystem_component(file_3)
# sub_folder.add_filesystem_component(file_2)
folder.add_filesystem_component(sub_folder)
folder.show_details()