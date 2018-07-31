//
//  login.swift
//  calender
//
//  Created by 葛上海翔 on 2018/07/31.
//  Copyright © 2018年 ccr. All rights reserved.
//

import Firebase
import UIKit
import FirebaseAuth


class login:UIViewController,UITextFieldDelegate{
    

    @IBOutlet var mailtext: UITextField!
    
    @IBOutlet var passwordtext: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mailtext.delegate = self
        passwordtext.delegate = self
        passwordtext.isSecureTextEntry = true
    }
    
    @IBAction func loginbutton(_ sender: Any) {
      
        let alertviewcontroller = UIAlertController(title: "error", message: "間違っています！", preferredStyle: .alert)
        let okaction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        Auth.auth().signIn(withEmail: mailtext.text!, password: passwordtext.text!, completion: {(user,error) in
            if error == nil {
                print("成功")
          
            }else{
              
                
                    alertviewcontroller.addAction(okaction)
                    self.present(alertviewcontroller,animated: true,completion: nil)
            
            }
            } )
    }
    
    @IBAction func createbutton(_ sender: Any) {
        
        if mailtext.text == nil || passwordtext.text == nil{
            let alertviewcontroller = UIAlertController(title: "error", message: "入力欄が空です！", preferredStyle: .alert)
            let okaction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertviewcontroller.addAction(okaction)
            self.present(alertviewcontroller,animated: true,completion: nil)
            
        }else{
            
            Auth.auth().createUser(withEmail: mailtext.text!, password: passwordtext.text!, completion:{(user,error) in
           
            if error == nil {
                //成功
                
                UserDefaults.standard.set("check", forKey: "check")
                self.dismiss(animated: true, completion: nil)
                
              
            }else{
                //shippai
                let alertviewcontroller = UIAlertController(title: "error", message:error?.localizedDescription, preferredStyle: .alert)
                let okaction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertviewcontroller.addAction(okaction)
                self.present(alertviewcontroller,animated: true,completion: nil)
                }
                
        }) }}
    
    
}
