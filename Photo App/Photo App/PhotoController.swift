//
//  PhotoController.swift
//  Photo App
//
//  Created by GWC on 7/12/19.
//  Copyright © 2019 GWC. All rights reserved.
//

import UIKit

class PhotoController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var mainImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .camera
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        guard mainImage.image != nil else {return}
        saveImage(imageName: "test.png")
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        mainImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
    }
    
    func saveImage (imageName: String) {
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask,true)[0] as NSString).appendingPathComponent(imageName)
        let image = mainImage.image!
        let imageData = image.pngData()
        fileManager.createFile(atPath: imagePath as String, contents: imageData, attributes: nil)
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
