//
//  SyosaiViewController.swift
//  UserLostApp
//
//  Created by 坂口美月 on 2020/10/19.
//  Copyright © 2020 坂口美月. All rights reserved.
//

import UIKit

class SyosaiViewController: UIViewController {
    
    var user:User? = nil;
    var indexRow:Int = 0;
    
    @IBOutlet weak var YakusyokuLabel: UILabel!
    @IBOutlet weak var ShimeiLabel: UILabel!
    @IBOutlet weak var BusyoLabel: UILabel!
    @IBOutlet weak var RenrakuLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = user{
            //ラベルにユーザーの詳細情報をセット
            YakusyokuLabel.text = user.title;
            ShimeiLabel.text = user.name;
            BusyoLabel.text = user.department;
            RenrakuLabel.text = user.phone;
        }
    }
    
    //画面遷移
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //入力画面のビューコントローラを取得
        guard let Input = segue.destination as? InputViewController else { return }
        //入力画面へユーザー情報を渡す
        Input.input = user
        //入力画面へ編集行を渡す
        Input.indexRow = indexRow
    }
}
