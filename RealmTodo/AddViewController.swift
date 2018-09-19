

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var btn: UIButton!
    var id = Int()
    let todo = Todo() //インスタンス化
    override func viewDidLoad() {
        super.viewDidLoad()
//        idが初期状態だったら（上の変数）addを表示する
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
//        テキストが空だった場合
        if textField.text! == "" {
//            アラートを表示してあげると親切
            return //returnでここで処理を終える。つまりは画面は変わらない。だからアラートで表示してあげるとなお良い。他にはcontinueとかwhile文でのbreakとかt。
        }
        
        if id == Int() {
        //新規保存
        todo.create(title: textField.text!)
        } else {
        //更新処理
        todo.update(id: id, title: textField.text!)
        }
        
        //テンプレート。navigationControllerを使ったときに元の画面に戻る書き方
        self.navigationController?.popViewController(animated: true)
    }
    

}
