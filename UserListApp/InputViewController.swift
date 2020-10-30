//
//  InputViewController.swift
//  UserListApp
//
//  Created by 坂口美月 on 2020/10/22.
//  Copyright © 2020 坂口美月. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {
    
    //表示する画面の情報を受け取るためのプロパティ
    var viewNum: Int = 0  //ボタンtag
    var indexRow:Int = 0  //編集対象行
    var input:User? = nil;
    var addUsers:[String] = []
    
    @IBOutlet weak var titleInputText: UITextField!
    @IBOutlet weak var nameInputText: UITextField!
    @IBOutlet weak var departmentInputText: UITextField!
    @IBOutlet weak var phoneInputText: UITextField!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    //保存ボタンクリック
    @IBAction func saveButton(_ sender: UIButton) {
        //入力された値を取得
        let title = titleInputText.text!    //役職
        let name = nameInputText.text!      //氏名
        let department = departmentInputText.text!       //部署
        let phone = phoneInputText.text!     //連絡先

        //入力画面だった場合、１行追加
        if viewNum == 0 {
            TableViewController.users += [User(name: name, department: department, title: title, phone: phone)]
        }
        //編集画面だった場合、情報を上書き
        else if viewNum == 1 {
            TableViewController.users[indexRow].name = nameInputText.text!
            TableViewController.users[indexRow].department = departmentInputText.text!
            TableViewController.users[indexRow].title = titleInputText.text!
            TableViewController.users[indexRow].phone = phoneInputText.text!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if viewNum == 1 {
            //編集画面の場合詳細情報をテキストに表示
            departmentInputText.text = input!.department
            nameInputText.text = input!.name
            titleInputText.text = input!.title
            phoneInputText.text = input!.phone
        }
       
    }
}
