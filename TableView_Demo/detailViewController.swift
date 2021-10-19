//
//  detailViewController.swift
//  TableView_Demo
//
//  Created by 준수김 on 2021/10/19.
//

import UIKit

class detailViewController: UIViewController {

    @IBOutlet weak var detailItem: UILabel!
    override func viewDidLoad() {
            super.viewDidLoad()
        //선택한  cell의 타이틀은 전역변수를 이용해서 디테일 View에 전달
        detailItem.text = Detail.name
        detailItem.sizeToFit()
        
        }
        
        


}
