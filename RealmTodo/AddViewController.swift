

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var btn: UIButton!
    var id = Int()
    let todo = Todo() //インスタンス化
    override func viewDidLoad() {
        super.viewDidLoad()
        if id == Int() {
            btn.setTitle("add", for: .normal)
        } else {
            btn.setTitle("update", for: .normal)
            let selectedTodo = self.todo.getData(id: id)
            textField.text! = selectedTodo.title
        }
        
        btn.setTitle("add", for: .normal)//新規登録の時はaddにしたい
        btn.setTitle("update", for: .normal)//更新の時はupdateにしたい
        
    }
    
    @IBAction func tapBtn(_ sender: UIButton) {
        //新規保存
        todo.create(title: textField.text!)
        //更新処理
        
        //テンプレート。navigationControllerを使ったときに元の画面に戻る書き方
        self.navigationController?.popViewController(animated: true)
    }
    


    

}
