//
//  InputViewController.swift
//  UserListApp
//
//  Created by 坂口美月 on 2020/10/22.
//  Copyright © 2020 坂口美月. All rights reserved.
//

import UIKit
import Alertift

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
        
        guard let title = titleInputText.text else { return }
        guard let name = nameInputText.text else { return }
        guard let department = departmentInputText.text else { return }
        guard let phone = phoneInputText.text else { return }
        
        //項目が一つでも未入力の場合(スペース入力も含む)はエラーメッセージ表示（そのまま保存か、再入力を選択）
        if title.isEmpty || name.isEmpty || department.isEmpty || phone.isEmpty || title != " " || name != " " || department != " " || phone != " "{
          //アラートメッセージを表示
            Alertift.alert(title: "入力エラー",
            message: "入力されていない項目があります。")
            //キャンセルボタン
            .action(.default("キャンセル")) {
               //アラートダイアログを閉じる
            }
            //そのまま保存ボタン
            .action(.cancel("そのまま保存")){
                //登録処理
                self.saveInput()
            }
            .show()
        }
        //全ての項目が入力されていた場合、そのまま保存
        else{
            //登録処理
            self.saveInput()
        }
    }
    
    //登録処理
    func saveInput() {
        
         guard let name = nameInputText.text else { return }
         guard let department = departmentInputText.text else { return }
         guard let title = titleInputText.text else { return }
         guard let phone = phoneInputText.text else { return }
        
        //入力画面の場合
        if input == nil{
            TableViewController.users += [User(name: name, department: department, title: title, phone: phone)]
        }
        //編集画面の場合
        else{
            if let input = input{
                input.name = name
                input.department = department
                input.title = title
                input.phone = phone
                
                TableViewController.users[self.indexRow] = input
            }
        }
        //保存処理
        TableViewController.SaveData();
        //画面遷移
        self.navigationController?.popToRootViewController(animated: true);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //inputの内容がnilじゃなかった場合（編集画面に遷移した場合）
        if let input = input{
            //詳細情報をテキストに表示
            departmentInputText.text = input.department
            nameInputText.text = input.name
            titleInputText.text = input.title
            phoneInputText.text = input.phone
        }
       
    }

}
