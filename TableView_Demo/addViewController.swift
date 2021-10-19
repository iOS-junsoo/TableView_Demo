//
//  ViewController.swift
//  TableView_Demo
//
//  Created by 준수김 on 2021/10/19.
//

import UIKit

class addViewController: UIViewController {

    @IBOutlet weak var addItemName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func addItemBtn(_ sender: UIButton) {
        items.append(addItemName.text!)
        addItemName.text = ""
                _ = navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    

}

