//
//  ScheduleViewController.swift
//  calender
//
//  Created by 新保宙羅 on 2018/08/07.
//  Copyright © 2018年 ccr. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController,UITextFieldDelegate {
    
    var Schedule:String?
    
    
    @IBOutlet weak var ScheduleTextField: UITextField!
   // @IBOutlet weak var saveButton: UIBarButtonItem!
    
  //  @IBOutlet var cancelbutton: UIBarButtonItem!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let button = sender as? UIBarButtonItem, button === self.saveButton else  {
            
            return
        }
        self.Schedule = self.ScheduleTextField.text ?? ""
    }*/

    
    @IBAction func save(_ sender: Any) {
       
        
        self.Schedule = self.ScheduleTextField.text ?? ""
        let storybord: UIStoryboard = self.storyboard!
        let nextview =  storyboard?.instantiateViewController(withIdentifier: "main")
        present(nextview!, animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: Any) {
        
        
    }
    
}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

