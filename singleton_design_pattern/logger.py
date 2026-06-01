import threading
class SingletonModule(type):
    _instances = {}
    _lock = threading.Lock()

    def __call__(klass, *args, **kwargs):
        with klass._lock:
            if klass not in klass._instances:
                klass._instances[klass] = super().__call__(*args, **kwargs)
        return klass._instances[klass]

class Logger(metaclass=SingletonModule):
    def log(self, level: str, message: str):
        print(level, message)

    def info(self, message: str):
        self.log("INFO", message)
    
    def warn(self, message: str):
        self.log("WARN", message)
    
    def error(self, message: str):
        self.log("ERROR", message)

def worker():
    logger = Logger()
    print(id(logger))

threads = []
for _ in range(10):
    t = threading.Thread(target= worker)
    threads.append(t)
    t.start()

for t in threads:
    t.join()

info_logger = Logger()
info_logger.info("Data got created!!!!")
warn_logger = Logger()
warn_logger.warn("Data has duplicacy present!!!")
print(info_logger == warn_logger)