//
//  ViewController.swift
//  FoodTracker
//
//  Created by apple on 2018/12/14.
//  Copyright © 2018年 mlj. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBAction func setDefaultLabelText(_ sender: Any) {
        mealNameLabel.text = "Default Text"
    }
    @IBOutlet weak var photoImageView: UIImageView!
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        //如果用户在文本子段中键入时轻触图像视图，则键盘将被正确解除
        nameTextField.resignFirstResponder()
        //创建图像选取器控制器
        let imagePickerController = UIImagePickerController()
        //设置图像选择器的源，或它获取图像的位置
        imagePickerController.sourceType = .photoLibrary
        //将图像选择器控制器的委托设置为ViewController
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else{
            fatalError("Expected a dictionary containing an image, but was proviced the following: \(info)")
        }
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    
    //在从storyboard创建和加载视图控制器的内容视图时调用。
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

