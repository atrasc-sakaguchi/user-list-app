//
//  SyosaiViewController.swift
//  UserLostApp
//
//  Created by 坂口美月 on 2020/10/19.
//  Copyright © 2020 坂口美月. All rights reserved.
//

import UIKit

class SyosaiViewController: UIViewController {
    
    @IBOutlet weak var BackButton: UINavigationItem!
    //表示するデータ取得
    var Yakusyoku : String = ""
    var Name : String = ""
    var Busyo : String = ""
    var Renraku : String = ""

    @IBOutlet weak var YakusyokuLabel: UILabel!
    @IBOutlet weak var ShimeiLabel: UILabel!
    @IBOutlet weak var BusyoLabel: UILabel!
    @IBOutlet weak var RenrakuLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        //ラベルにセット
        YakusyokuLabel.text = Yakusyoku
        print(Yakusyoku)
        ShimeiLabel.text = Name
        BusyoLabel.text = Busyo
        RenrakuLabel.text = Renraku
    }


}
