//
//  TableViewController.swift
//  TableView_Demo
//
//  Created by 준수김 on 2021/10/19.
//

//이 View는 TableViewController 자체를 이용해서 만들었다.
import UIKit

var itmes1 = ["비회원 주문 조회", "알림 설정", "컬리소개", "배송안내", "공지사항", "자주하는 질문", "고객센터", "이용안내"]

class TableViewController: UITableViewController {

    @IBOutlet var firsttableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Table view data source
        // 테이블 안의 섹션 개수를 1로 설정함
        override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }
     
        // 섹션당 열의 개수를 전달
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return itmes1.count
        }
     
        // items와 itemsImageFile의 값을 셀에 삽입함
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
            // Configure the cell...
//            cell.textLabel?.text = itmes1[indexPath.row]
            cell.textLabel?.text = itmes1[(indexPath as NSIndexPath).row]
            //위의 코드를 작성해도 무방하다. 
            return cell
        }
    
    // Override to support editing the table view.
        // 목록 삭제 함수
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                // Delete the row from the data source
                itmes1.remove(at: (indexPath as NSIndexPath).row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            } else if editingStyle == .insert {
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            }
        }
        
        // 삭제 시 "Delete" 대신 "삭제"로 표시
        override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
            return "삭제"
            
        }
        
        // Override to support rearranging the table view.
        // 목록 순서 바꾸기
        override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
            let itemToMove = itmes1[(fromIndexPath as NSIndexPath).row]
            items.remove(at: (fromIndexPath as NSIndexPath).row)
            items.insert(itemToMove, at: (to as NSIndexPath).row)
        }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        Detail.name = itmes1[indexPath.row]
    }

  

}
