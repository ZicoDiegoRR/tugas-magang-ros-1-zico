#include <string>
#include <algorithm>
#include <iostream>
#include "ros/ros.h"
#include "Bank/ops.h"

int main(int argc, char **argv) {
    ros::init(argc, argv, "bank_pub");
    ros::NodeHandle nh;

    ros::Publisher pub = nh.advertise<Bank::ops>("bank_topic", 10);
    ros::Rate loop_rate(10);

    std::cout << "<> Main Menu <>" << std::endl;
    while(ros::ok()) {
        bool continue_publish = true;
        int select;
        std::string name;
        Bank::ops op;

        op.get_display = false;
        std::cout << std::endl << "Select one of the following options:" << std::endl;
        std::cout << "1. Add an account" << std::endl << "2. Find an account" << std::endl;
        std::cout << "3. Change an account holder" << std::endl;
        std::cout << "4. Display all accounts" << std::endl << "5. Close an account" << std::endl;
        std::cin >> select;
        op.selection = static_cast<int8_t>(select);
        if(op.selection == 2 || op.selection == 5) {
            std::cout << "Input any ID: ";
            std::cin >> op.id;
        } else if(op.selection == 1) {
            std::cout << "Input an ID, the name of the account holder, and the initial balance:" << std::endl;
            std::cout << "(Input them in three lines)" << std::endl;
            std::cin >> op.id;
            std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');

            std::getline(std::cin, name);
            std::cin >> op.money;

            op.name = name;
        } else if(op.selection == 3) {
            std::cout << "Input an ID and the name of the account holder:" << std::endl;
            std::cout << "(Input them in two lines)" << std::endl;
            std::cin >> op.id;

            std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
            std::getline(std::cin, name);

            op.name = name;
        } else if(op.selection == 4) {
            op.get_display = true;
        } else {
            continue_publish = false;
        }

        if(continue_publish) {
            pub.publish(op);
            ROS_INFO("Publishing to subscriber...");
        } else {
            ROS_ERROR("Invalid input!");
        }

        ros::spinOnce();
        loop_rate.sleep();
    }

    return 0;
}