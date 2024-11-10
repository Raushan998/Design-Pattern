#include <iostream>
#include <cstring>
using namespace std;

class User {
public:
    string username, password, email, name;
    bool is_login = false;
    User(const string& username, const string& password, const string& email, const string& name)
        : username(username), password(password), email(email), name(name) {}
    
};

class InterfaceUser {
public:
    virtual bool login(User* user, const string& username, const string& password) const = 0;
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
    bool login(User* user, const string& username, const string& password) const override{
        if(username != user->username && password != user->password){
            cout<<"User can't be loggedin"<<endl;
            return false;
        }
        else{
            user->is_login = true;
            cout<<"You are successfully logged in"<<endl;
        }
        return true;
    }

    User* registerUser(const string& username, const string& password, const string& email, const string& name) const override{
        User* user = new User(username, password, email, name);
        return user;
    }

    bool is_login(const User* user){
        if(user->is_login)
           return true;
        return false;
    }
};

class EmailService : public IEmail {
    User* user;

public:
    EmailService(User* user) {
        this->user = user;
    }

    bool sendEmail(const string& email_content) const override {
        if(user->is_login){
            cout << "Email has been sent to " << user->email << " with content:" << endl;
            cout << email_content << endl;
            return true;
        }
        else
          cout<<"User is not logged in"<<endl;
        return false;
    }
};

int main() {
    UserManagement* user_management = new UserManagement();
    User* user = user_management->registerUser("Raushan998", "12345678", "raushan@yopmail.com", "Raushan");
    user_management->login(user, "Raushan998", "12345678");
    EmailService* email_service = new EmailService(user);
    email_service->sendEmail("This is to inform you that we are writing this to github.");

    delete email_service;
    delete user;
    delete user_management;

    return 0;
}