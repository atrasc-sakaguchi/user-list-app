    //
    //  TableViewController.swift
    //  UserLostApp
    //
    //  Created by 坂口美月 on 2020/10/18.
    //  Copyright © 2020 坂口美月. All rights reserved.
    //

    import UIKit
    import Alertift

class TableViewController: UITableViewController {

    //テーブルに表示するデータ一覧
    static var users:[User] = [];
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    //Editボタンクリック
    @IBAction func editButton(_ sender: Any) {
       //編集モード
       if isEditing {
            super.setEditing(false, animated: true)
            tableView.setEditing(false, animated: true)
       }
       else {
            super.setEditing(true, animated: true)
            tableView.setEditing(true, animated: true)
       }
       //保存処理
       TableViewController.SaveData()
    }

    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        //読み込み処理
        ReadData()
    }
        
    //データ保存処理
    static func SaveData() {
        //配列へ変換
        var users2:[[String]] = [];
        let saveUser = TableViewController.users
        saveUser.forEach { saveUser in
           users2.append(saveUser.toArray());
        }
        
        //配列を保存
        UserDefaults.standard.set(users2, forKey: "users")
    }

    //データ読み込み処理
    func ReadData(){
        //保存していた情報を取得
        guard let a = UserDefaults.standard.array(forKey: "users") as? [[String]] else
            //情報が空だった場合、初期設定
            {
                TableViewController.users = [
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
            return }
        
        //保存していた情報が取得できた場合
        //usersを空にする
        TableViewController.users.removeAll()
        //取り出した情報を変換
        a.forEach { userText in
            let user = User(name: userText[0], department: userText[1], title: userText[2], phone: userText[3])
            //tableViewへ格納
            TableViewController.users.append(user)
        }
        //リロード
        self.tableView.reloadData()
    }

    
    // MARK: - Table view data source

    //セクションの数を返す
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    //セクションごとの行数を返す
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableViewController.users.count+1
    }

    //セルを作成して返す
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //tableviewのセル設定
        switch indexPath.row{
            //情報追加用のセル設定（最終行に固定）
            case TableViewController.users.count:
                let secondCell = tableView.dequeueReusableCell(withIdentifier: "SecondCell", for: indexPath)
                //セルの内容を指定
                secondCell.textLabel?.text = "新規登録"
            return secondCell
            
            //情報表示用のセル設定
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
                //セルの内容を指定
                cell.textLabel?.text = TableViewController.users[indexPath.row].name  //氏名
                cell.detailTextLabel?.text = TableViewController.users[indexPath.row].department  //部署
            return cell
            }
    }

    //セルの編集制御
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        //新規登録セル(最終行のセル)だった場合、削除不可
        if indexPath.row == TableViewController.users.count { return false }
        //それ以外は削除可能
        else { return true }
    }

    // セルの並び替えを有効にする(canMoveRowAt)
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool { return true }

    //セルの並び替えを有効にする(moveRowAt)
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var moveData:User? = nil;
        //移動されたデータを取得
        moveData = TableViewController.users[sourceIndexPath.row]
        //元の位置のデータを配列から削除
        TableViewController.users.remove(at: sourceIndexPath.row)
        //移動先の位置に保持中のデータ（moveData）を配列に挿入
        if let moveData = moveData{
            TableViewController.users.insert(moveData, at: destinationIndexPath.row) }
        //保存処理
        TableViewController.SaveData()
    }

    //セルの並び替え範囲を指定
    override func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
            //新規登録セルで並び替えをしようとした場合
            if proposedDestinationIndexPath.row == TableViewController.users.count {
                //移動元のセル位置に戻る
                let indexPath = IndexPath(row: sourceIndexPath.row, section: 0)
                return indexPath as IndexPath
            }
        return proposedDestinationIndexPath
    }

    //セル削除
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //削除確認アラート作成
        if editingStyle == .delete{
            Alertift.actionSheet(title: "確認", message: "本当に削除しますか？")
            //削除実行ボタン
            .action(.default("削除実行")){
                //削除処理
                TableViewController.users.remove(at:  indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            //キャンセルボタン
            .action(.cancel("キャンセル"))
            .show()
            //保存処理
            TableViewController.SaveData()
        }
    }

    //削除ボタンの名前設定
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? { return "削除" }

    //画面遷移
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //詳細表示画面のビューコントローラー取得
        guard let Syosai = segue.destination as? SyosaiViewController else { return }
        //選択行のIndexPath取得
        guard let indexPath = tableView.indexPathForSelectedRow else { return }

        //詳細表示画面へ行情報を渡す
        Syosai.user = TableViewController.users[indexPath.row];
        //詳細表示画面へ選択行の情報を渡す
        Syosai.indexRow = indexPath.row
    }
            
}

