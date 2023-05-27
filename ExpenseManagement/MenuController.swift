//
//  MenuController.swift
//  ExpenseManagement
//
//  Created by CNTT on 5/27/23.
//  Copyright © 2023 fit.tdc. All rights reserved.
//

import UIKit

class MenuController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTable: UITableView!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var money: UILabel!
    
    var arrStr:[String] = ["Trang chủ", "Danh mục", "Hồ sơ","Đăng xuất"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        myTable.delegate = self
        myTable.dataSource = self
        
        if let accout = User(email: "thang@gmail.com", password: "123123", username: "minhthang", money: 200000, avatar: UIImage(named: "Image")) {
            avatar.image = accout.getAvatar()
            username.text = accout.getUsername()
            money.text = String(accout.getMoney())
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: arrStr[indexPath.row], for: indexPath)
        cell.textLabel?.text = arrStr[indexPath.row]
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
