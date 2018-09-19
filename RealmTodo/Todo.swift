

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
//    特定のデータのみ取得
    func getData(id :Int) -> Todo {
        //データに接続
        let realm = try! Realm()
        //データを取得
        let todo = realm.objects(Todo.self).filter("id = \(id)").first
        //取得したデータを返す
        return todo!
    }
//    更新
    func  update(id: Int, title: String) {
        //DBに接続
        let realm = try! Realm()
        //更新するデータを取得する
        let todo = realm.objects(Todo.self).filter("id = \(id)").first
        
        //更新する
        try! realm.write {
            todo!.title = title
        }
    }
//    削除
    func delete(id: Int) {
        //DBに接続
        let realm = try! Realm()
        
        //削除するデータを所得する
        let todo = realm.objects(Todo.self).filter("id = \(id)").first //firstで一個だけ取るという意味
//関数を呼び出すときにこのidという引数が指定される
        //所得したデータを削除する
        try! realm.write {
            realm.delete(todo!)
            }
        
    }
}
