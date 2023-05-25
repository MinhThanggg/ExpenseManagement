//
//  ProfileController.swift
//  ExpenseManagement
//
//  Created by CNTT on 5/24/23.
//  Copyright © 2023 fit.tdc. All rights reserved.
//

import UIKit

class ProfileController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageAvatar: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    
    @IBAction func imageProcessing(_ sender: UITapGestureRecognizer) {
        print("chuyen man hinh")
        let image = UIImagePickerController()
        image.sourceType = .photoLibrary
        image.delegate = self
        present(image, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageSelected = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageAvatar.image = imageSelected
        }
        // Quay ve man hinh truoc do
        dismiss(animated: true, completion: nil)
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
