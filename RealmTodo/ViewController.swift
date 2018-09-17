

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
        todo.getAll()
        tableView.reloadData()
   
    }
    
////    行数を決める
    func tableview(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo.list.count
    }

////    セルの中身を決める
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = todo.list[indexPath.row]["title"] as? String
        return cell
    }

}
