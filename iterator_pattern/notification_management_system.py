from abc import abstractmethod

class IteratorNotification:
    @abstractmethod
    def has_next(self):
        pass

    @abstractmethod
    def next(self):
        pass

class NotificationManager:
    def __init__(self, email_notification: EmailNotification, sms_notification: SmsNotification):
        self.email_notification = email_notification
        self.sms_notification = sms_notification
    
    def add_email_notification(self, message: str):
        self.email_notification.add_notification(message)
    
    def add_sms_notification(self, message: str):
        self.sms_notification.add_notification(message)
    
    def print_all_notification(self):
        self.print_notification(self.email_notification.create_iterator(), "Email")
        self.print_notification(self.sms_notification.create_iterator(), "SMS")
        
    def print_notification(self, iterator, type):
        while(iterator.has_next()):
            print("Notification: ", type)
            print(iterator.next(), "\n")

class Notification:
    def __init__(self, message):
        self.message = message
    
    def get_message(self):
        return self.message

class NotificationCollection:
    @abstractmethod
    def create_iterator(self):
        pass

class EmailNotification(NotificationCollection):
    def __init__(self):
        self.email_notifications = []
    
    def add_notification(self, message: str):
        self.email_notifications.append(message)

    def create_iterator(self):
        return EmailNotificationIterator(self.email_notifications)

class EmailNotificationIterator(IteratorNotification):
    def __init__(self, notifications: list[Notification]):
        self.position = 0
        self.notifications = notifications
    
    def has_next(self):
        return self.position < len(self.notifications)
    
    def next(self):
        notification = self.notifications[self.position]
        self.position += 1
        return notification


class SmsNotification(NotificationCollection):
    def __init__(self):
        self.sms_notifications = []
    
    def add_notification(self, message: str):
        self.sms_notifications.append(message)

    def create_iterator(self):
        return SmsNotificationIterator(self.sms_notifications)

class SmsNotificationIterator(IteratorNotification):
    def __init__(self, notifications: list[Notification]):
        self.position = 0
        self.notifications = notifications
    
    def has_next(self):
        return self.position < len(self.notifications)
    
    def next(self):
        notification = self.notifications[self.position]
        self.position += 1
        return notification


sms_notification = SmsNotification()
email_notification = EmailNotification()
notification_manager = NotificationManager(email_notification, sms_notification)
notification_manager.add_email_notification("Dear Raushan\n We will be shortly sending you an email regarding new python course")
notification_manager.add_email_notification("Dear Raushan\n, Please go ahead with your new python course")
notification_manager.add_sms_notification("Your otp is 94784")
notification_manager.add_sms_notification("New Otp will be regenerated in 5 minutes")
notification_manager.print_all_notification()
