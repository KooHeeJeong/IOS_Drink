//
//  AddAlertViewController.swift
//  Drink
//
//  Created by 구희정 on 2022/03/28.
//

import UIKit

class AddAlertViewController : UIViewController {
    var pickedDate : ((_ date: Date) -> Void)?
    
    @IBOutlet weak var datePiker: UIDatePicker!
    
    @IBAction func dismissButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        self.pickedDate?(datePiker.date)
        self.dismiss(animated: true, completion: nil)
    }
}
