//
//  monthview.swift
//  test-calender
//
//  Created by 新保宙羅 on 2018/07/05.
//  Copyright © 2018年 mememe. All rights reserved.
//

import UIKit

//pprotocolとはクラスに対して、メゾットやプロパティの約束をさせる文
//delegateの詳細
protocol MonthViewDelegate : class {
    
    func didChangeMonth(monthIndex:Int,year: Int)
    
    
}

class MonthView: UIView {
    
    var monthsArr = ["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]
    
    var currentMonthIndex = 0
    var currentYear: Int = 0
    
    var delegate:MonthViewDelegate?
    
    //イニシャライザの使用
    override  init (frame:CGRect){
        
        super.init(frame: frame)
        
        //colorの設定
        self.backgroundColor = UIColor.clear
        
        currentMonthIndex = Calendar.current.component(.month, from: Date()) - 1
        currentYear = Calendar.current.component(.year, from: Date())
        
        setupViews()
        
        btnLeft.isEnabled = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //createitemes
    let btnRight: UIButton = {
        let btn = UIButton()
        btn.setTitle(">",for: .normal)
        btn.setTitleColor(Style.monthViewBtbRightCokor, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(btnLeftRightAction(sender:)), for: .touchUpInside)
        btn.setTitleColor(UIColor.blue, for: .disabled)
        return btn
    }()
    
    let btnLeft: UIButton = {
        let btn = UIButton()
        btn.setTitle("<", for: .normal)
        btn.setTitleColor(Style.monthViewBtnLeftColor, for: .normal)
        //translatesAutoresizingMaskIntoConstraints
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(btnLeftRightAction(sender:)), for:.touchUpInside)
        btn.setTitleColor(UIColor.blue, for: .disabled)
        return btn
    }()
    let lblName: UILabel = {
        
        let lbl = UILabel()
        lbl.text = "Default Month Year Text"
        lbl.textColor = Style.monthViewLblColor
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        //autolayoutを解除する
        lbl.translatesAutoresizingMaskIntoConstraints =  false
        return lbl
    }()
    
    @objc func btnLeftRightAction(sender: UIButton){
        
        if sender ==  btnRight{
            
            currentMonthIndex += 1
            if currentMonthIndex > 11 {
                
                currentMonthIndex = 0
                currentYear += 1
            }}
        if sender == btnLeft{
            currentMonthIndex -= 1
            
            if currentMonthIndex < 0{
                currentMonthIndex = 11
                currentYear -= 1
            }
            
        }
        lblName.text = "\(monthsArr[currentMonthIndex])\(currentYear)年"
        delegate?.didChangeMonth(monthIndex: currentMonthIndex, year: currentYear)
        
    }
    
    
    /*else{
     currentMonthIndex -= 1
     if currentMonthIndex < 0 {
     currentMonthIndex = 11
     currentYear -= 1
     }}}
     //逆/の書き方がわからん
     lblName.text = "\(monthsArr[currentMonthIndex]) \(currentYear)年"
     
     delegate?.didChangeMonth(monthIndex: currentMonthIndex, year: currentYear)
     
     
     }*/
    
    func setupViews(){
        self.addSubview(lblName)
        
        //button setting
        lblName.topAnchor.constraint(equalTo:  topAnchor).isActive = true
        lblName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        lblName.widthAnchor.constraint(equalToConstant: 150).isActive = true
        lblName.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        lblName.text = "\(monthsArr[currentMonthIndex])\(currentYear)年"//同じやつ
        
        self.addSubview(btnLeft)
        btnLeft.topAnchor.constraint(equalTo: topAnchor).isActive = true
        btnLeft.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        btnLeft.widthAnchor.constraint(equalToConstant: 50).isActive = true
        btnLeft.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        self.addSubview(btnRight)
        btnRight.topAnchor.constraint(equalTo: topAnchor).isActive = true
        btnRight.centerXAnchor.constraint(equalTo: rightAnchor).isActive = true
        btnRight.widthAnchor.constraint(equalToConstant: 50).isActive = true
        btnRight.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
    }
    
}
