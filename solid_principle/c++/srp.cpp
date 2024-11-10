#include <iostream>
#include <cstring>
using namespace std;

class User {
public:
    string username, password, email, name;
    User(const string& username, const string& password, const string& email, const string& name)
        : username(username), password(password), email(email), name(name) {}
    
};

class InterfaceUser {
public:
    virtual bool login(const User* user, const string& username, const string& password) const = 0;
    virtual User* registerUser(const string& username, const string& password, const string& email, const string& name) const = 0;
    virtual ~InterfaceUser() {}
};

class ILogger {
public:
    virtual void logError(const string& error) const = 0;
    virtual ~ILogger() {}
};

class IEmail {
public:
    virtual bool sendEmail(const string& email_content) const = 0;
    virtual ~IEmail() {}
};

class UserManagement: public InterfaceUser{
    public:
    bool login(const User* user, const string& username, const string& password) const override{
        if(username != user->username && password != user->password){
            cout<<"User can't be loggedin";
            return false;
        }
        else{
            cout<<"You are successfully logged in";
        }
        return true;
    }

    User* registerUser(const string& username, const string& password, const string& email, const string& name) const override{
        User* user = new User(username, password, email, name);
        return user;
    }
};

class EmailService : public IEmail {
    User* user;

public:
    EmailService(User* user) {
        this->user = user;
    }

    bool sendEmail(const string& email_content) const override {
        cout << "Email has been sent to " << user->email << " with content:" << endl;
        cout << email_content << endl;
        return true;
    }
};

int main() {
    UserManagement* user_management = new UserManagement();
    User* user = user_management->registerUser("Raushan998", "12345678", "raushan@yopmail.com", "Raushan");
    EmailService* email_service = new EmailService(user);
    email_service->sendEmail("This is to inform you that we are writing this to github.");

    delete email_service;
    delete user;
    delete user_management;

    return 0;
}