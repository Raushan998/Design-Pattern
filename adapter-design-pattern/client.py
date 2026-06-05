from email_notification_service import EmailNotificationService
from notification_service import NotificationService;
from send_grid_adapter import SendGridAdapter

class Client:
    def __init__(self):
        self.send_grid_adapter = SendGridAdapter()
        self.send_grid_adapter.send("customer@support.com", "Regarding new Support Ticket", "I am fine and thank you.")

client = Client()