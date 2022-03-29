//
//  AlertListCell.swift
//  Drink
//
//  Created by 구희정 on 2022/03/27.
//

import UIKit
import UserNotifications

class AlertListCell: UITableViewCell {
    let userNotifiCationCenter = UNUserNotificationCenter.current()
    
    @IBOutlet weak var meridiemLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var alertSwich: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //값 변경을 하였을 때
    @IBAction func alertSwitchValueChanged(_ sender: UISwitch) {
        guard let data = UserDefaults.standard.value(forKey: "alerts") as? Data,
              var alerts = try? PropertyListDecoder().decode([Alert].self, from: data) else { return }
        
        //값이 변경 될 때마다 sender.tag의 값에 indexPath.row의 값을 할당 해두었기 때문에
        //그 indexPath.row의 isOn 값을 변경 시켜준다.
        alerts[sender.tag].isOn = sender.isOn
        UserDefaults.standard.set(try? PropertyListEncoder().encode(alerts), forKey: "alerts")
        
        if sender.isOn {
            userNotifiCationCenter.addNotificationRequest(by: alerts[sender.tag])
            print("Switch On")
        } else {
            userNotifiCationCenter.removePendingNotificationRequests(withIdentifiers: [alerts[sender.tag].id])
            print("Switch Off")
        }
    }
}
