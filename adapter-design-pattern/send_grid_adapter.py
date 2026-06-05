from notification_service import NotificationService
from send_grid_service import SendGridService

class SendGridAdapter(NotificationService):
    def __init__(self):
        self.__send_grid_service = SendGridService()

    def send(self, to: str, subject: str, body: str):
        self.__send_grid_service.send_email(to, subject, body)