//
//  ViewController.swift
//  HitApiSimple
//
//  Created by Mansi Mahajan on 6/25/18.
//  Copyright © 2018 Mansi Mahajan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableOutlet: UITableView!
    var items: [String] = [""]
    var users = [ModelForJson]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        hitApiAction()
    }

    func hitApiAction() {
        let url : String = "http://192.168.0.3/OGBM2/minimart/miniapi/productlist?cstore=1&cust_id=1&salt=&cat_id=3&sort=&page_id=0"
        
        ServiceClass().ApiHitFunction(url: url) { jsonData in
            DispatchQueue.main.async {
                self.users = jsonData
                print(jsonData)
                self.tableOutlet.reloadData()
                return
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.users.count)
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print(users)
        let myUser = self.users[indexPath.row]
        let vc = tableView.dequeueReusableCell(withIdentifier: "TableViewCellShow") as! TableViewCellShow
        vc.setValueOfLabels(value1: myUser.created!, value2: myUser.name!, value3: String(myUser.rating!))
        return vc
    }
    
    
}


