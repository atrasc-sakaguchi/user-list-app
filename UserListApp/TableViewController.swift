//
//  TableViewController.swift
//  UserLostApp
//
//  Created by 坂口美月 on 2020/10/18.
//  Copyright © 2020 坂口美月. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var viewNum: Int = 0
    
    //テーブルに表示するデータ一覧
    static var users:[User] = [
        User(name: "山田　太郎", department: "システム開発部", title: "課長代理", phone: "090-9999-9999"),
        User(name: "川田　吾郎", department: "営業部", title: "一般", phone: "080-8888-8888"),
        User(name: "里田　舞", department: "人事部", title: "一般", phone: "070-7777-7777"),
        User(name: "道上　歩", department: "人事部", title: "部長", phone: "070-0000-0000"),
        User(name: "海川　泳三", department: "総務部", title: "係長", phone: "080-3333-3333"),
        User(name: "林　九郎", department: "システム開発部", title: "一般", phone: "090-9900-8877"),
        User(name: "土屋　草五郎", department: "システム開発部", title: "一般", phone: "090-4455-1133"),
        User(name: "竹下　大作", department: "人事部", title: "一般", phone: "070-7777-7777"),
        User(name: "木田　房枝", department: "運用部", title: "一般", phone: "070-2222-5533"),
        User(name: "砂川　黄太郎", department: "運用部", title: "次長", phone: "090-1212-3434"),
        User(name: "草加　平蔵", department: "総務部", title: "一般", phone: "080-1155-5511"),
        User(name: "水上　泉太郎", department: "総務部", title: "一般", phone: "090-0099-7722"),
        User(name: "畑山　耕史", department: "システム開発部", title: "本部長", phone: "090-2929-3535"),
        User(name: "浪江　乗太郎", department: "システム開発部", title: "係長代理補佐", phone: "080-8787-5454"),
    ];

    var users:[User] = [];
     
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.users = TableViewController.users;
        
        let defaults = UserDefaults.standard
        
        //編集または入力後の処理
        if viewNum == 1 || viewNum == 2{
            //保存
            //配列へ変換
            var users2:[[String]] = [];
            let saveUser = TableViewController.users
            saveUser.forEach { saveUser in
               users2.append(saveUser.toArray());
            }
            //print(users2);
            
            //配列を保存
            defaults.set(users2, forKey: "users")
            self.users = TableViewController.users
        }
        else{
            //取り出し
             //userDefaultsに保存された値の取得
             let a = defaults.array(forKey: "users") as! [[String]];
             print(a)

             //usersを空にする
             TableViewController.users.removeAll()
              
             //取り出した情報を変換
             a.forEach { userText in
                 let user = User(name: userText[0], department: userText[1], title: userText[2], phone: userText[3])
                 //tableViewへ格納
                 TableViewController.users.append(user)
             }
 
             //self.usersに設定
             self.users = TableViewController.users
             self.tableView.reloadData();
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.tableView.reloadData();
    }
    

    // MARK: - Table view data source
    
    //セクションの数を返す
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    //セクションごとの行数を返す
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return users.count+1
    }
    
    //セルを作成して返す
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row{
        case 0:
        //情報追加用のセル設定
        let secondCell = tableView.dequeueReusableCell(withIdentifier: "SecondCell", for: indexPath)
            
        //セルの内容を指定
        secondCell.textLabel?.text = "新規登録"
        
        return secondCell
            
        default:
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        //セルの内容を指定
        cell.textLabel?.text = users[indexPath.row-1].name  //氏名
        cell.detailTextLabel?.text = users[indexPath.row-1].department  //部署
        
        return cell
        }
        
    }
    
    //セル削除
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //削除
        if editingStyle == .delete{
            users.remove(at: indexPath.row-1)
            TableViewController.users.remove(at:  indexPath.row-1)
            print (indexPath.row-1)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        else {
        }
    }

    //画面遷移
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //詳細表示画面のビューコントローラー取得
        guard let Syosai = segue.destination as? SyosaiViewController else {return}
        //選択行のIndexPath取得
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
 
        //詳細表示画面へ行情報を渡す
        Syosai.user = users[indexPath.row - 1];
        //詳細表示画面へ選択行の情報を渡す
        Syosai.indexRow = indexPath.row - 1


    }
        
        
}
    
