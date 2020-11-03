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

        //入力画面の場合
        if input == nil{
            TableViewController.users += [User(name: name, department: department, title: title, phone: phone)]
        }
        //編集画面の場合
        else{
            input?.name = nameInputText.text!
            input?.department = departmentInputText.text!
            input?.title = titleInputText.text!
            input?.phone = phoneInputText.text!

            TableViewController.users[indexRow] = input!
        }

        //保存処理
        TableViewController().SaveData()

        //画面遷移
        self.navigationController?.popToRootViewController(animated: true);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if input != nil {
            //編集画面の場合詳細情報をテキストに表示
            departmentInputText.text = input!.department
            nameInputText.text = input!.name
            titleInputText.text = input!.title
            phoneInputText.text = input!.phone
        }
       
    }
    //画面遷移
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        //情報表示画面のビューコントローラを取得
        guard let table = segue.destination as? TableViewController else { return }
        //タップされたボタンを取得
        guard let button = sender as? UIButton else { return }
        //編集ボタンのtagプロパティの値(1)を遷移先ビューコントローラのプロパティに代入
        table.viewNum = button.tag
    }
}
