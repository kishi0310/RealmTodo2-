

import Foundation
import RealmSwift
//コードがあってるはずなのにエラーが出る時、、、
//command shift K
//⬇︎
//command b
//データの新規登録、取得、更新、削除
class Todo: Object {
//カラム名を決める
    @objc dynamic var id = Int()
    @objc dynamic var title = String()
    @objc dynamic var date = String()
    
    var list = [NSDictionary]()//tableViewに表示するために書いている
    
//    新規登録
    func create(title: String) {
        let realm = try! Realm()//データベース接続の時はこれをかく DB接続
        
//        データのかきこみ
        try! realm.write {
            let todo = Todo()
            let now = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd"
            todo.id = (realm.objects(Todo.self).max(ofProperty: "id") as Int? ?? 0) + 1 //次の行に書くよということ
            todo.title = title
            todo.date = formatter.string(from: now as Date)
            
            realm.add(todo)
            
        }
    }
//    データの取得
    func getAll() {
        let realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        let list = realm.objects(Todo.self)
        for value in list {
            let todo = ["id":value.id, "title":value.title, "date": value.date] as NSDictionary
            self.list.append(todo)
            
        }
    }
//    更新
//    削除
    
}
