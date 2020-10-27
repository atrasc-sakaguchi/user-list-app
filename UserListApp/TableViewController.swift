//
//  TableViewController.swift
//  UserLostApp
//
//  Created by 坂口美月 on 2020/10/18.
//  Copyright © 2020 坂口美月. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    //テーブルに表示するデータ一覧
    var users:[(name: String, department: String, Yaku: String, phone: String )] = [
    ("山田　太郎","システム開発部","課長代理","090-9999-9999"),
    ("川田　吾郎","営業部","一般","080-8888-8888"),
    ("里田　舞","人事部","一般","070-7777-7777"),
    ("道上　歩","人事部","部長","070-0000-0000"),
    ("海川　泳三","総務部","係長","080-3333-3333"),
    ("林　九郎","システム開発部","課長","080-3333-3333"),
    ("土屋　草五郎","システム開発部","一般","０090-9900-8877"),
    ("竹下　大作","システム開発部","一般","090-4455-1133"),
    ("木田　房枝","運用部","一般","070-2222-5533"),
    ("砂川　黄太郎","運用部","次長","090-1212-3434"),
    ("草加　平蔵","総務部","一般","080-1155-5511"),
    ("水上　泉太郎","総務部","一般","090-0099-7722"),
    ("畑山　耕史","システム開発部","本部長","090-2929-3535"),
    ("浪江　乗太郎","システム開発部","係長代理補佐","080-8787-5454")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source
    
    //セクションの数を返す
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    //セクションごとの行数を返す
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return users.count
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
        
        case 1:
        //情報表示用のセル設定
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
            
        //セルの内容を指定
        cell.textLabel?.text = users[indexPath.row].name
        cell.detailTextLabel?.text = users[indexPath.row].department
            
        return cell
        
            
        default:
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        //セルの内容を指定
        cell.textLabel?.text = users[indexPath.row].name
        cell.detailTextLabel?.text = users[indexPath.row].department
        
        return cell
        }
        
    }
    
    //セル削除
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            users.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }

        else{
            
        }
    }

//画面遷移
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let Syosai = segue.destination as? SyosaiViewController else {return}
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        
        Syosai.Yakusyoku = users[indexPath.row].Yaku
        print(users[indexPath.row].Yaku)
        Syosai.Name = users[indexPath.row].name
        Syosai.Busyo = users[indexPath.row].department
        Syosai.Renraku = users[indexPath.row].phone
    }
        
        
}
    
