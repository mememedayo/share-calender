//
//  eventcalendar.swift
//  GoogleCalendarAPISwift
//
//  Created by 葛上海翔 on 2018/08/15.
//  Copyright © 2018年 Jcodee SAC. All rights reserved.
//FSCalendar -> カレンダー機能を実装する
//CalculateCalendarLogic -> 土日・祝日の判定機能を実装する
import Foundation
import RealmSwift

//レルムのデータベース
class Event: Object {
    
    @objc dynamic var date: String = ""
    @objc dynamic var event: String = ""
    
}
