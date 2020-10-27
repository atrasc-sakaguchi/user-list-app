//
//  InputViewController.swift
//  UserListApp
//
//  Created by 坂口美月 on 2020/10/22.
//  Copyright © 2020 坂口美月. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

    @IBOutlet weak var yakusyokuInputText: UITextField!
    @IBOutlet weak var nameInputText: UITextField!
    @IBOutlet weak var busyoInputText: UITextField!
    @IBOutlet weak var tellInputText: UITextField!
    
    
    @IBOutlet weak var yakusyokuLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var busyoLabel: UILabel!
    @IBOutlet weak var tellLabel: UILabel!
    
    @IBAction func saveButton(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

