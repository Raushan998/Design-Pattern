class SingletonModule(type):
    _instances = {}
    def __call__(klass, *args, **kwargs):
        if klass not in klass._instances:
            klass._instances[klass] = super().__call__(*args, **kwargs)
        # print(type,args, kwargs, klass, klass._instances)
        return klass._instances[klass]
     
class AppSetting(metaclass=SingletonModule):
    # _instance = None

    # def __new__(cls):
    #     if cls._instance is None:
    #         cls._instance = super().__new__(cls)
    #     return cls._instance
    
    def __init__(self):
        self.__databaseUrl: str = "jbdc://localhost:3306/mydatabase"
        self.__apiKey: str = "12345-ABCDE"
    
    def get_database_url(self) -> str:
        return self.__databaseUrl
    
    def get_api_key(self) -> str:
        return self.__apiKey

# app_settting = AppSetting()
