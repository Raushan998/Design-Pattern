class EmailNotificationService:
    def send(self, to: str, subject: str, body: str):
        print(f"Sending Email to {to}")
        print(f"Subject: {subject}")
        print(f"Body: {body}")
