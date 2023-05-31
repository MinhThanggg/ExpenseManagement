//
//  SpendingDetailController.swift
//  ExpenseManagement
//
//  Created by CNTT on 5/31/23.
//  Copyright © 2023 fit.tdc. All rights reserved.
//

import UIKit

class SpendingDetailController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var btnSave: UIBarButtonItem!
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var txtNote: UITextField!
    @IBOutlet weak var txtMoney: UITextField!
   
    
    
    var dropdownItems = [Category]()
//    let dropdownItems = ["Tùy chọn 1", "Tùy chọn 2", "Tùy chọn 3"]
    

    @IBOutlet weak var tableViewCategory: UITableView!
    @IBOutlet weak var btnNameCategory: UIButton!
    @IBAction func btnSelcetCategory(_ sender: UIButton) {
         self.tableViewCategory.isHidden = !self.tableViewCategory.isHidden
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//                    if let category = Category(name: "Do an", image: UIImage(named: "meal")) {
//                        dropdownItems += [category]
//                    }

        // Do any additional setup after loading the view.
        for _ in 0..<3 {
            if let category = Category(name: "Do an", image: UIImage(named: "meal")) {
                dropdownItems += [category]
            }
        }
        self.tableViewCategory.isHidden = true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropdownItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let name = "SpendingCategoryViewCell"
       
        if let cell = tableView.dequeueReusableCell(withIdentifier: name, for: indexPath) as? SpendingCategoryViewCell {
            // Do du lieu vao cell
            let category = dropdownItems[indexPath.row]
           cell.lbName.text = category.getName()
            cell.categoryImg.image = category.getImage()

            return cell
        }
        fatalError("Khong the tao cell!")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? SpendingCategoryViewCell {
            btnNameCategory.setTitle(cell.lbName.text, for: .normal)
            self.tableViewCategory.isHidden = true
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        //        print("Chuyen man hinh")
        if let button = sender as? UIBarButtonItem, button === btnSave {
//            let name = txtName.text ?? ""
//            let img = imgCategory.image
//            category = Category(name: name, image: img)
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
    //    private func updateSaveState() {
//        let name = txtName.text ?? ""
//        if name.isEmpty {
//            // khong cho phep btn save
//            btnSave.isEnabled = false
//        }
//        else {
//            //cho phep btn save
//            btnSave.isEnabled = true
//        }
//    }
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//
//        txtName.resignFirstResponder()
//        return true
//    }
//
//    //vua ket thuc trinh soan thao thi goi ham nay
//    func textFieldDidEndEditing(_ textField: UITextField) {
//
//        navigationItem.title = txtName.text
//
//        updateSaveState()
//    }
//
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        btnSave.isEnabled = false
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
