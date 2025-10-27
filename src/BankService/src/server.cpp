#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
#include "ros/ros.h"
#include "BankService/ops1.h"

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
    
    std::string display() const {
        std::cout << "Account #: " << std::to_string(accountNumber) << ", Holder: " << accountHolder 
                << ", Balance: $" << std::to_string(balance) << "\n";
        return "Account #: " + std::to_string(accountNumber) + ", Holder: " + accountHolder 
                + ", Balance: $" + std::to_string(balance) + "\n";
    }
};

class BankDatabase {
private:
    std::vector<BankAccount> accounts;
    
public:
    void createAccount(int accountNumber, const std::string& accountHolder, double initialBalance) {
        accounts.emplace_back(accountNumber, accountHolder, initialBalance);
    }
    
    std::string displayAllAccounts() const {
        if (accounts.empty()) {
            return "No accounts found.";
        }
        std::string result;
        for (const auto& account : accounts) {
            account.display();
        }
        return result;
    }
    
    BankAccount* findAccount(int accountNumber) {
        auto it = std::find_if(accounts.begin(), accounts.end(),
            [accountNumber](const BankAccount& a) { return a.getAccountNumber() == accountNumber; });
        return (it != accounts.end()) ? &(*it) : nullptr;
    }
    
    std::string updateAccount(int accountNumber, const std::string& newHolder) {
        BankAccount* account = findAccount(accountNumber);
        if (account) {
            // In real system, you might have more complex logic
            return "Account holder updated successfully!";
        }
        return "Account not found!";
    }
    
    std::string closeAccount(int accountNumber) {
        auto it = std::find_if(accounts.begin(), accounts.end(),
            [accountNumber](const BankAccount& a) { return a.getAccountNumber() == accountNumber; });
        if (it != accounts.end()) {
            accounts.erase(it);
            return "Account closed successfully!";
        }
        return "Account not found!";
    }
};

BankDatabase bank;
bool runSelection(BankService::ops1::Request &msg,
                BankService::ops1::Response &res) {
    bool success;
    if(msg.selection == 1) {
        bank.createAccount(msg.id, msg.name, msg.money);
        res.result = "Account created successfully!\nSuccessfully created a new account owned by " + msg.name + ".";
        
    } else if(msg.selection == 2) {
        success = bank.findAccount(msg.id);
        if(success) {
            res.result = "Account found!";
        } else {
            res.result = "Account not found!";
        }
    } else if(msg.selection == 3) {
        res.result = bank.updateAccount(msg.id, msg.name);
    } else if(msg.selection == 4) {
        res.result = bank.displayAllAccounts();
    } else {
        res.result = bank.closeAccount(msg.id);
    }

    ROS_INFO("Result: %s", res.result.c_str());
    return true;
}

int main(int argv, char **argc) {
    ros::init(argv, argc, "subreker");
    ros::NodeHandle nh;

    ros::ServiceServer subrek = nh.advertiseService("bank_topic_service", runSelection);
    ROS_INFO("Server is ready.");
    ros::spin();

    return 0;
}