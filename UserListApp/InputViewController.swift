//
//  InputViewController.swift
//  UserListApp
//
//  Created by 坂口美月 on 2020/10/22.
//  Copyright © 2020 坂口美月. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var YakusyokuLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var BusyoLabel: UILabel!
    @IBOutlet weak var TellLabel: UILabel!
    //役職入力テキストボックス
    @IBAction func YakusyokuText(_ sender: UITextField) {
        
    }
    //氏名入力テキストボックス
    @IBAction func NameInputText(_ sender: UITextField) {
    }
    //部署入力テキストボックス
    @IBAction func BusyoInoutText(_ sender: UITextField) {
    }
    //連絡先入力テキストボックス
    @IBAction func TelInputText(_ sender: UITextField) {
    }
    //保存ボタン
    @IBAction func SaveButton(_ sender: UIButton) {
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
