//
//  weekdays.swift
//  test-calender
//
//  Created by 新保宙羅 on 2018/07/05.
//  Copyright © 2018年 mememe. All rights reserved.
//

import UIKit
class WeekDaysView :  UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        setupViews()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews(){
        
        
        addSubview(myStackView)
        myStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        myStackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        myStackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        myStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        var daysArr = ["にち","げつ","かー","スイ","モク","きん","どー"]
        
        /*
        for i in 0..<7 {
            let button = UIButton()
            button.frame = CGRect()
            button.backgroundColor = UIColor.cyan
            button.setTitle("daysArr[i]", for: UIControlState.normal)
            button.addTarget(self, action: #selector(ViewController.changeColor(sender:)), for: .touchUp)
            view.addSubview(button)
            myStackView.addArrangedSubview(button)
        }
        
       @ objc funcchangeColor(sender: Any) do {
            button.backgroundColor = UIColor.darkGray
         func didReceiveMemoryWarning() {
         super.didReceiveMemoryWarning()
         
         }
        }
 */
        for i in 0..<7 {
            let lbl = UILabel()
            lbl.text = daysArr[i]
            lbl.textAlignment = .center
            lbl.textColor = Style.weekdaysLblColor
            myStackView.addArrangedSubview(lbl)
        }
        
       
        
    }
    let myStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    
    
}
