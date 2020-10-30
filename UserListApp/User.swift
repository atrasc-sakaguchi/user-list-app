//
//  User.swift
//  UserListApp
//
//  Created by 坂口美月 on 2020/10/28.
//  Copyright © 2020 坂口美月. All rights reserved.
//

import Foundation


class User {
    var name:String;
    var title:String;
    var phone:String;
    var department:String;
    
    init(name:String, department:String, title:String, phone:String) {
        self.name = name;
        self.department = department;
        self.title = title;
        self.phone = phone;
    }
    
    func toArray()->[String] {
        return [self.name, self.department, self.title, self.phone];
    }

    func jikoshokai() {
        print("私の名前は\(self.name)です。")
    }
}
