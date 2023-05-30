//
//  CategoryDetailController.swift
//  ExpenseManagement
//
//  Created by CNTT on 5/29/23.
//  Copyright © 2023 fit.tdc. All rights reserved.
//

import UIKit

class CategoryDetailController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var category:Category?

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var imgCategory: UIImageView!
    @IBOutlet weak var btnSave: UIBarButtonItem!
    
    @IBAction func imageProccessing(_ sender: UITapGestureRecognizer) {
        print("chuyen man hinh")
        let image = UIImagePickerController()
        image.sourceType = .photoLibrary
        image.delegate = self
        present(image, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageSelected = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imgCategory.image = imageSelected
        }
        // Quay ve man hinh truoc do
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnCancel(_ sender: UIBarButtonItem) {
          dismiss(animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let button = sender as? UIBarButtonItem, button === btnSave {
            let name = txtName.text ?? ""
            let img = imgCategory.image
            category = Category(name: name, image: img)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
