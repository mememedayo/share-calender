//
//  login.swift
//  ycalendar
//
//  Created by 葛上海翔 on 2018/07/06.
//  Copyright © 2018年 kaito kuzukami. All rights reserved.
//

import UIKit
import  Firebase

class loginview : UIViewController,UITextFieldDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //textfieldを出す
        mailtext.becomeFirstResponder()
        passtext.becomeFirstResponder()
        //firebaseとの連携
        
        
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        mailtext.resignFirstResponder()
        passtext.resignFirstResponder()
        
        return true
    }
    //login テキスト（mail,）
    let mailtext : UITextField = {
        
        let mtt =  UITextField()
        mtt.backgroundColor = UIColor.white
        mtt.translatesAutoresizingMaskIntoConstraints = false
        mtt.textAlignment = .center
        mtt.textColor = UIColor.black
        //fontは後でええや
        //入力されたテキストの保存
        return mtt
    }()
    
    let passtext : UITextField = {
        let ptt = UITextField()
        ptt.backgroundColor = UIColor.white
        ptt.translatesAutoresizingMaskIntoConstraints = false
        ptt.textColor = UIColor.black
        ptt.textAlignment = .center
        
        //fontは後でええか
        //保存
        return ptt
    }()
    //画面遷移のためのボタン
    
    //key値の設定
    
    //clearbuttonの処理
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("clear")
        return true
    }
    
    //signinbutton
    let signinbutton : UIButton = {
        let sbtn = UIButton()
        
        sbtn.setTitle("サインイン", for: .normal)
        sbtn.setTitleColor(UIColor.blue, for: .normal)
        sbtn.translatesAutoresizingMaskIntoConstraints = false
        
        return sbtn
    }()
    let newAccountButton:UIButton = {
        let NABtn = UIButton()
        NABtn.setTitle("新規登録", for: .normal)
        NABtn.setTitleColor(UIColor.blue, for:.normal)
        NABtn.translatesAutoresizingMaskIntoConstraints = false
        
        return NABtn
    }()
    //buttonをおした時の処理(ユーザー登録や新規アカウント作成)
    @objc func btnAcountAction(sender:UIButton){
        if sender == newAccountButton{
            
            
        }
        if sender == signinbutton {
            
            
        }
        
    }
    
    //textfieldとbuttonの設定
    func setupview(){
        view.addSubview(passtext)
        passtext.frame.size.width = self.view.frame.width*2/3
        passtext.frame.size.height = 45
        //setting potion
        passtext.center.x = self.view.center.x
        passtext.center.y = 240
        passtext.placeholder = "password"
        passtext.returnKeyType = .done
        passtext.clearButtonMode = .always
        //余白いる？
        view.addSubview(mailtext)
        mailtext.frame.size.width = self.view.frame.width * 2/3
        mailtext.frame.size.height = 45
        mailtext.center.x = self.view.center.x
        mailtext.center.y = passtext.center.y + 25
        mailtext.placeholder = "mail"
        mailtext.returnKeyType = .done
        //setting buttons
        
    }
    
}

