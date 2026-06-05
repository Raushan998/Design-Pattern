class SendGridService:
    def send_email(self, recipient: str, title: str, content: str):
        print(f"Sending Email via Sendgrid to {recipient} having subject {title} with content {content}")
