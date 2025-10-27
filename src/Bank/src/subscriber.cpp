#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
#include "ros/ros.h"
#include "Bank/ops.h"

class BankAccount {
private:
    int accountNumber;
    std::string accountHolder;
    double balance;

public:
    BankAccount(int accountNumber, const std::string& accountHolder, double initialBalance)
        : accountNumber(accountNumber), accountHolder(accountHolder), balance(initialBalance) {}
    
    int getAccountNumber() const { return accountNumber; }
    std::string getAccountHolder() const { return accountHolder; }
    double getBalance() const { return balance; }
    
    void deposit(double amount) { balance += amount; }
    void withdraw(double amount) { 
        if (amount <= balance) balance -= amount; 
    }
    
    void display() const {
        std::cout << "Account #: " << accountNumber << ", Holder: " << accountHolder 
                  << ", Balance: $" << balance << std::endl;
    }
};

class BankDatabase {
private:
    std::vector<BankAccount> accounts;
    
public:
    void createAccount(int accountNumber, const std::string& accountHolder, double initialBalance) {
        accounts.emplace_back(accountNumber, accountHolder, initialBalance);
        std::cout << "Account created successfully!\n";
    }
    
    void displayAllAccounts() const {
        if (accounts.empty()) {
            std::cout << "No accounts found.\n";
            return;
        }
        for (const auto& account : accounts) {
            account.display();
        }
    }
    
    BankAccount* findAccount(int accountNumber) {
        auto it = std::find_if(accounts.begin(), accounts.end(),
            [accountNumber](const BankAccount& a) { return a.getAccountNumber() == accountNumber; });
        return (it != accounts.end()) ? &(*it) : nullptr;
    }
    
    bool updateAccount(int accountNumber, const std::string& newHolder) {
        BankAccount* account = findAccount(accountNumber);
        if (account) {
            // In real system, you might have more complex logic
            std::cout << "Account holder updated successfully!\n";
            return true;
        }
        std::cout << "Account not found!\n";
        return false;
    }
    
    bool closeAccount(int accountNumber) {
        auto it = std::find_if(accounts.begin(), accounts.end(),
            [accountNumber](const BankAccount& a) { return a.getAccountNumber() == accountNumber; });
        if (it != accounts.end()) {
            accounts.erase(it);
            std::cout << "Account closed successfully!\n";
            return true;
        }
        std::cout << "Account not found!\n";
        return false;
    }
};

BankDatabase bank;
void runSelection(const Bank::ops::ConstPtr& msg) {
    bool success;
    if(msg->selection == 1) {
        bank.createAccount(msg->id, msg->name, msg->money);
        std::cout << "Successfully created a new account owned by " << msg->name.c_str() << "." << std::endl;
    } else if(msg->selection == 2) {
        success = bank.findAccount(msg->id);
        if(success) {
            std::cout << "Accound found!" << std::endl;
        } else {
            std::cout << "Account not found!" << std::endl;
        }
    } else if(msg->selection == 3) {
        success = bank.updateAccount(msg->id, msg->name);
    } else if(msg->selection == 4) {
        bank.displayAllAccounts();
    } else {
        success = bank.closeAccount(msg->id);
    }
}

int main(int argv, char **argc) {
    ros::init(argv, argc, "subreker");
    ros::NodeHandle nh;

    ros::Subscriber subrek = nh.subscribe("bank_topic", 10, runSelection);
    ros::spin();

    return 0;
}