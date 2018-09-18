

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let todo = Todo()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
//        一覧表示
        todo.list.removeAll()
        todo.getAll()//インスタンス名.クラス名
        tableView.reloadData()
        print(todo.list)
    }
    
////    行数を決める
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return todo.list.count
    }

    

////    セルの中身を決める
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = todo.list[indexPath.row]["title"] as? String
        return cell
    }
//
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//    右にスワイプして消したいときのテンプレート
        if editingStyle == .delete {
//            databaseから削除するデータをしてするために書いている
            let id = todo.list[indexPath.row]["id"] as! Int
            //関数を呼び出す
            todo.delete(id: id)
            
//            画面からtodoを消している
            todo.list.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with:  .fade)
            
    }

}
}
