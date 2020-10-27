//
//  InputViewController.swift
//  UserListApp
//
//  Created by 坂口美月 on 2020/10/22.
//  Copyright © 2020 坂口美月. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

    var addUsers:[String] = []
    
    @IBOutlet weak var yakusyokuInputText: UITextField!
    @IBOutlet weak var nameInputText: UITextField!
    @IBOutlet weak var busyoInputText: UITextField!
    @IBOutlet weak var tellInputText: UITextField!
    
    @IBOutlet weak var yakusyokuLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var busyoLabel: UILabel!
    @IBOutlet weak var tellLabel: UILabel!
    
    
    //保存ボタンクリック
    @IBAction func saveButton(_ sender: UIButton) {

        //入力された値を取得
        let title = yakusyokuInputText.text!    //役職
        let name = nameInputText.text!      //氏名
        let department = busyoInputText.text!       //部署
        let phone = tellInputText.text!     //連絡先

        //追加
        TableViewController.users += [(title,name,department,phone)]
        
        //追加した行データの保存
        let defaults = UserDefaults.standard
        
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

