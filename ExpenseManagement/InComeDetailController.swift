//
//  InComeDetailController.swift
//  ExpenseManagement
//
//  Created by CNTT on 5/31/23.
//  Copyright © 2023 fit.tdc. All rights reserved.
//

import UIKit

class InComeDetailController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

//    @IBOutlet weak var btnSave: UIBarButtonItem!
//
//    @IBAction func btnCancel(_ sender: UIBarButtonItem) {
//        dismiss(animated: true, completion: nil)
//    }
//    @IBOutlet weak var image: UIImageView!
//    @IBOutlet weak var txtNote: UITextField!
//    @IBOutlet weak var txtMoney: UITextField!
//    @IBOutlet weak var imgCategory: UIImageView!
    var inCome:InCome?
    var cname:String?
    var dropdownItems = [Category]()
    let listt = ["Tùy chọn 1", "Tùy chọn 2", "Tùy chọn 3"]
    let arrName = ["Đồ ăn", "Thuốc lá", "Phương Tiện"]
    let arrImage = ["meal", "cigarette", "car"]
    enum NavigationType {
        case newInCome
        case editInCome
    }
    var navigationType:NavigationType = .newInCome
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var txtNote: UITextField!
    @IBOutlet weak var txtMoney: UITextField!
    @IBOutlet weak var imgCategory: UIImageView!
    
    @IBOutlet weak var myTable: UITableView!
    
    @IBOutlet weak var btnName: UIButton!
    
    @IBOutlet weak var btnSave: UIBarButtonItem!
    
    @IBAction func btnCancel(_ sender: UIBarButtonItem) {
        switch navigationType {
        case .newInCome:
            dismiss(animated: true, completion: nil)
        case .editInCome:
            if let navigationController = navigationController {
                navigationController.popViewController(animated: true)
            }
        }
    }
    
    @IBAction func btnSelect(_ sender: UIButton) {
        self.myTable.isHidden = !self.myTable.isHidden
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        if let inCome = inCome {
            txtNote.text = inCome.getNote()
            txtMoney.text = String(inCome.getMoney())
            image.image = inCome.getImage()
            imgCategory.image = inCome.getCategory()?.getImage()
        }
        // Do any additional setup after loading the view.
        for i in 0..<3 {
            if let category = Category(name: "\(arrName[i])", image: UIImage(named: "\(arrImage[i])")) {
                dropdownItems += [category]
            }
        }
        self.myTable.isHidden = true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropdownItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let name = "InComeCategoryViewCell"
        if let cell = tableView.dequeueReusableCell(withIdentifier: name, for: indexPath) as? InComeCategoryViewCell {
            // Do du lieu vao cell
            let category = dropdownItems[indexPath.row]
            cell.lbName.text = category.getName()
            cell.categoryImg.image = category.getImage()
            
            return cell
        }
        fatalError("Khong the tao cell!")
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? InComeCategoryViewCell {
            btnName.setTitle(cell.lbName.text, for: .normal)
            //            cname = cell.lbName.text!
            if let ten = cell.lbName.text {
                cname = ten
            }
            imgCategory.image = cell.categoryImg.image
            self.myTable.isHidden = true
        }
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageSelected = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            image.image = imageSelected
        }
        // Quay ve man hinh truoc do
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func imageProcessing(_ sender: UITapGestureRecognizer) {
        let image = UIImagePickerController()
        image.sourceType = .photoLibrary
        image.delegate = self
        present(image, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        //        print("Chuyen man hinh")
        if let button = sender as? UIBarButtonItem, button === btnSave {
            let money = txtMoney.text ?? ""
            let note = txtNote.text ?? ""
            let img = image.image
            let imageCategory = imgCategory.image
            inCome = InCome(money: Double(money) ?? 0, category: Category(name: cname ?? inCome?.getCategory()?.getName() ?? "", image: imageCategory), note: note, image: img)
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
