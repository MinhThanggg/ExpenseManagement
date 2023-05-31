//
//  InComeViewController.swift
//  ExpenseManagement
//
//  Created by CNTT on 5/30/23.
//  Copyright © 2023 fit.tdc. All rights reserved.
//

import UIKit

class InComeViewController: UITableViewController {

    private var inComeList = [InCome]()
    @IBOutlet weak var btnMenu: UIBarButtonItem!
    let arrName = ["Đồ ăn", "Thuốc lá", "Phương Tiện"]
    let arrImageCategory = ["meal", "cigarette", "car"]
    let arrNote = ["dở quá", "mua ở tạp hoá", "đi đến trường"]
    let arrImage = ["defaul", "thuoc", "xe"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0..<3 {
            if let inCome = InCome(money: 20000, category: Category(name: "\(arrName[i])", image: UIImage(named: "\(arrImageCategory[i])")), note: "\(arrNote[i])", image: UIImage(named: "\(arrImage[i])")) {
                inComeList += [inCome]
            }
        }
        
        
        
        btnMenu.target = self.revealViewController()
        btnMenu.action = Selector("revealToggle:")
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return inComeList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let name = "InComeViewCell"
        if let cell = tableView.dequeueReusableCell(withIdentifier: name, for: indexPath) as? InComeViewCell {
            // Do du lieu vao cell
            let inCome = inComeList[indexPath.row]
            
            cell.lbMoney.text = String(inCome.getMoney())
            cell.lbCategoryName.text = inCome.getCategory()!.getName()
            cell.imageCategory.image = inCome.getCategory()!.getImage()
            
            return cell
        }
        fatalError("Khong the tao cell!")
    }
    @IBAction func unWindToInComeController(sender: UIStoryboardSegue) {
        //        print("Quay ve tu CategoryDetailController")
        if let source = sender.source as? InComeDetailController {
            if let inCome = source.inCome {
                switch source.navigationType {
                case .newInCome:
                    let newIndexPath = IndexPath(row: inComeList.count, section: 0)
                    inComeList += [inCome]
                    tableView.insertRows(at: [newIndexPath], with: .none)
                case .editInCome:
                    if let selectedIndexPath = tableView.indexPathForSelectedRow {
                        inComeList[selectedIndexPath.row] = inCome
                        tableView.reloadRows(at: [selectedIndexPath], with: .none)
                    }
                    break
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        print("alo")
        if let destination = segue.destination as? InComeDetailController{
            // Xac dinh tao mon an moi hay edit mon an
            if let segueName = segue.identifier {
                if segueName == "newInCome"{
                    //print("Tao mon an moi")
                    destination.navigationType = .newInCome
                }
                else {
                    //print("Edit mon an cu")
                    destination.navigationType = .editInCome
                    // lay index path cua cell duoc chon
                    if let selectedIndexPath = tableView.indexPathForSelectedRow {
                        destination.inCome =  inComeList[selectedIndexPath.row]
                    }
                }
            }
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
