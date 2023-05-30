//
//  CategoryController.swift
//  ExpenseManagement
//
//  Created by CNTT on 5/29/23.
//  Copyright © 2023 fit.tdc. All rights reserved.
//

import UIKit

class CategoryController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var btnMenu: UIBarButtonItem!
    @IBOutlet weak var myTable: UITableView!
    
    private var categoryList = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.delegate = self
        myTable.dataSource = self
        
        btnMenu.target = self.revealViewController()
        btnMenu.action = Selector("revealToggle:")
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        // Do any additional setup after loading the view.
        if let category = Category(name: "Do an", image: UIImage(named: "meal")) {
            categoryList += [category]
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let name = "CategoryTableViewCell"
        if let cell = tableView.dequeueReusableCell(withIdentifier: name, for: indexPath) as? CategoryTableViewCell {
            // Do du lieu vao cell
            let category = categoryList[indexPath.row]
//            cell.lblMealName.text = meal.getName()
//            cell.ratingControl.ratingValue = meal.getRatingValue()
//            cell.imgMeal.image = meal.getimgMeal()
            cell.txtCategoryName.text = category.getName()
            cell.imgCategory.image = category.getImage()
            
            return cell
        }
        fatalError("Khong the tao cell!")
    }
    @IBAction func unWindToCategoryController(sender: UIStoryboardSegue) {
//        print("Quay ve tu CategoryDetailController")
        if let source = sender.source as? CategoryDetailController {
            if let category = source.category {
                switch source.navigationType {
                case .newCategory:
                    let newIndexPath = IndexPath(row: categoryList.count, section: 0)
                    categoryList += [category]
                    myTable.insertRows(at: [newIndexPath], with: .none)
                case .editCategory:
                    if let selectedIndexPath = myTable.indexPathForSelectedRow {
                        categoryList[selectedIndexPath.row] = category
                        myTable.reloadRows(at: [selectedIndexPath], with: .none)
                    }
                    break
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        print("alo")
        if let destination = segue.destination as? CategoryDetailController{
            // Xac dinh tao mon an moi hay edit mon an
            if let segueName = segue.identifier {
                if segueName == "newCategory"{
                    //print("Tao mon an moi")
                    destination.navigationType = .newCategory
                }
                else {
                    //print("Edit mon an cu")
                    destination.navigationType = .editCategory
                    // lay index path cua cell duoc chon
                    if let selectedIndexPath = myTable.indexPathForSelectedRow {
                        destination.category =  categoryList[selectedIndexPath.row]
                    }
                }
            }
        }
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
