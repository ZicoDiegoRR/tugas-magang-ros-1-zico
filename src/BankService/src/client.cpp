#include <string>
#include <algorithm>
#include <iostream>
#include "ros/ros.h"
#include "BankService/ops1.h"

int main(int argc, char **argv) {
    ros::init(argc, argv, "bank_pub");
    ros::NodeHandle nh;

    ros::ServiceClient pub = nh.serviceClient<BankService::ops1>("bank_topic_service");
    ros::Rate loop_rate(10);

    std::cout << "<> Main Menu <>" << std::endl;
    while(ros::ok()) {
        bool continue_publish = true;
        int select;
        std::string name;
        BankService::ops1 op;

        op.request.get_display = false;
        std::cout << std::endl << "Select one of the following options:" << std::endl;
        std::cout << "1. Add an account" << std::endl << "2. Find an account" << std::endl;
        std::cout << "3. Change an account holder" << std::endl;
        std::cout << "4. Display all accounts" << std::endl << "5. Close an account" << std::endl;
        std::cin >> select;
        op.request.selection = static_cast<int8_t>(select);
        if(select == 2 ||select == 5) {
            std::cout << "Input any ID: ";
            std::cin >> op.request.id;
        } else if(select == 1) {
            std::cout << "Input an ID, the name of the account holder, and the initial balance:" << std::endl;
            std::cout << "(Input them in three lines)" << std::endl;
            std::cin >> op.request.id;
            std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');

            std::getline(std::cin, name);
            std::cin >> op.request.money;

            op.request.name = name;
        } else if(select == 3) {
            std::cout << "Input an ID and the name of the account holder:" << std::endl;
            std::cout << "(Input them in two lines)" << std::endl;
            std::cin >> op.request.id;

            std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
            std::getline(std::cin, name);

            op.request.name = name;
        } else if(select == 4) {
            op.request.get_display = true;
        } else {
            continue_publish = false;
        }

        if(continue_publish) {
            ROS_INFO("Contacting the server...");
            if(pub.call(op)) {
                std::cout << op.response.result << std::endl;
            } else {
                ROS_ERROR("Unable to contact the server.");
            }
        } else {
            ROS_ERROR("Invalid input!");
        }
    }

    return 0;
}