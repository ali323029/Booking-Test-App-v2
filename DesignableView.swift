//
//  DesignableView.swift
//  
//
//  Created by Geek on 14/06/2021.
//

import UIKit

@IBDesignable
class DesignableView {
    
    
    func customTextView(uiTextField: UITextField){
        
        uiTextField.layer.shadowColor = #colorLiteral(red: 0.5450980392, green: 0, blue: 0.4745098039, alpha: 1)
        uiTextField.layer.shadowOpacity = 0.5
        uiTextField.layer.shadowRadius = 30
        uiTextField.layer.cornerRadius = uiTextField.frame.height/2
        
        uiTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: uiTextField.frame.height))
        uiTextField.leftViewMode = .always
        uiTextField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: uiTextField.frame.height))
        uiTextField.rightViewMode = .always
        
    }
    
    func ImageRoundCornor(imageview: UIImageView,cRadius: CGFloat){

        imageview.layer.masksToBounds = false
        imageview.layer.cornerRadius = cRadius
        imageview.clipsToBounds = true
        
//        imageview.frame = CGRect(x: 0, y: 0, width: 350, height: 200)
    }

}
//
//extension UIImageView{
//
//    func sliderImageRoundCornor(imageview: UIImageView){
//        imageview.layer.borderWidth = 1
//        imageview.layer.masksToBounds = false
//        imageview.layer.borderColor = UIColor.black.cgColor
//        imageview.layer.cornerRadius = imageview.frame.height / 2
//        imageview.clipsToBounds = true
//
//    }
//}




