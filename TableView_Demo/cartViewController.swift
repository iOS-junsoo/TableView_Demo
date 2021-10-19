//
//  cartViewController.swift
//  TableView_Demo
//
//  Created by 준수김 on 2021/10/19.
//

// 이 View는 ViewController와 TableView를 활용해서 만들었다.
import UIKit


var items = ["당근", "카레", "고구마"]
class cartViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    

    override func viewWillAppear(_ animated: Bool) {
            tableView.reloadData()
    }
    @IBAction func exitBtn(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension cartViewController: UITableViewDataSource, UITableViewDelegate { //extension으로 따로 필수 메서드를 정리
    
    //Cell 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    //Cell 구성 -> cell의 개수만큼 호출된다.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell1", for: indexPath)
        cell.selectionStyle = .none //셀이 선택되지 않도록
        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        return cell
    }
    
    // Override to support editing the table view.
        // 목록 삭제 함수
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            items.remove(at: (indexPath as NSIndexPath).row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // 삭제 시 "Delete" 대신 "삭제"로 표시
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
        
    }
    
    // Override to support rearranging the table view.
    // 목록 순서 바꾸기
    func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let itemToMove = items[(fromIndexPath as NSIndexPath).row]
        items.remove(at: (fromIndexPath as NSIndexPath).row)
        items.insert(itemToMove, at: (to as NSIndexPath).row)
        
    }
    
    
 
    
}
