//
//  ViewController.swift
//  test-calender
//
//  Created by 新保宙羅 on 2018/07/05.
//  Copyright © 2018年 mememe. All rights reserved.
//

import UIKit

//enumとは
//caseとは
enum MyTheme {
    case light
    case dark
}

class ViewController: UIViewController {
    var theme = MyTheme.dark
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = UIButton()
        self.title = "My Calendar"
        self.navigationController?.navigationBar.isTranslucent = false
        self.view.backgroundColor = Style.bgColor
        
        /*  let k: UIView = CalenderView()
         view.addSubview(k)
         
         k.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
         k.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
         k.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
         k.heightAnchor.constraint(equalToConstant: 365).isActive = true*/
        
        view.addSubview(Calenderview)
        
        Calenderview.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        Calenderview.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        Calenderview.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        Calenderview.heightAnchor.constraint(equalToConstant: 365).isActive = true
        
        //26;58
        let rightBarBtn = UIBarButtonItem(title: "Light", style: .plain, target: self, action: #selector(rightBarBtnAction))
        self.navigationItem.rightBarButtonItem = rightBarBtn
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        
        Calenderview.myCollectionView.collectionViewLayout.invalidateLayout()
    }
    @objc func rightBarBtnAction(sender: UIBarButtonItem){
        
        if theme == .dark{
            sender.title = "Dark"
            theme = .light
            Style.themeLight()
        } else {
            sender.title = "LIght"
            theme = .dark
            Style.thmeDark()
        }
        self.view.backgroundColor = Style.bgColor
        // CalendarView.changeTheme()
        
        Calenderview.changeTheme()
        
    }
    let Calenderview: CalenderView = {
        
        let v = CalenderView(theme: MyTheme.dark)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
}


