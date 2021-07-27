//
//  SignUpController.swift
//  Booking Test App
//
//  Created by Geek on 15/06/2021.
//


import UIKit

class SignUpController: UIViewController {

    @IBOutlet weak var email_textView: UITextField!
    @IBOutlet weak var password_textView: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
     desginSignUpView()
     KeyboardMove()
    
    }
    
    
    func desginSignUpView(){
        let designableView: DesignableView = DesignableView()
        designableView.customTextView(uiTextField: email_textView)
        designableView.customTextView(uiTextField: password_textView)
    }
    
    


}


extension SignUpController{
    func KeyboardMove(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name:UIResponder.keyboardWillShowNotification,
                                               object: nil)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name:UIResponder.keyboardWillHideNotification,
                                               object: nil)
        
    }
    
    
    
    func desginSignInView(){
        var designableView: DesignableView = DesignableView()
        designableView.customTextView(uiTextField: email_textView)
        designableView.customTextView(uiTextField: password_textView)
    }
    

    
    @objc func keyboardWillShow(sender: NSNotification) {
         self.view.frame.origin.y = -150 // Move view 150 points upward
    }

    @objc func keyboardWillHide(sender: NSNotification) {
         self.view.frame.origin.y = 0 // Move view to original position
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}

