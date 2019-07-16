//
//  AddPhotoViewController.swift
//  ViewFinder
//
//  Created by Apple on 7/15/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController,
    UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
       var imagePicker = UIImagePickerController()

    @IBOutlet weak var newImage: UIImageView!
    
    @IBOutlet weak var captionText: UITextField!
    
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

    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
        //this allows me to open my camera
        
        present(imagePicker, animated:
            true, completion: nil)
    }
    

    @IBAction func uploadImagesTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated:
            true, completion: nil)

    }
    
    @IBAction func savePhotoTapped(_ sender: UIButton) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                
            let savePhoto = (entity: Photo.entity(), insertInto: context)
                
            }
            
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                
                let photoToSave = Photo(entity: Photo.entity(), insertInto: context)
             
                photoToSave.caption = captionText.text
                
            if let userImage = newImage.image {
                if let userImageData = userImage.pngData() {
                    photoToSave.imagedata = userImageData
                }
            }
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
              navigationController?.popViewController(animated: true)

            
    }


}
}
}
