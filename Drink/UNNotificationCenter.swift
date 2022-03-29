//
//  UNNotificationCenter.swift
//  Drink
//
//  Created by 구희정 on 2022/03/28.
//

import Foundation
import UserNotifications

extension UNUserNotificationCenter {
    func addNotificationRequest(by alert :Alert) {
        let content = UNMutableNotificationContent()
        content.title = "물 마실 시간이에요!"
        content.body = "세계보건기구(WHO)가 권장하는 하루 물 섭취량은 1.5~2리터 입니다."
        content.sound = .default
        content.badge = 1
        
        //dateComponent를 지정해준다. alert의 날짜가 있기 때문에.
        let component = Calendar.current.dateComponents([.hour,.minute], from: alert.date)
        
        //반복 여부는 스위치의 isOn 상태로 반복 할지 말지 repeats 여부를 구성한다.
        let trigger = UNCalendarNotificationTrigger(dateMatching: component , repeats: alert.isOn)
        
        //UNNotification에 등록
        let request = UNNotificationRequest(identifier: alert.id, content: content, trigger: trigger)
        
        //UNUserNotificationCenter 에 Add를 해준다.
        self.add(request, withCompletionHandler: nil)
    }
}
