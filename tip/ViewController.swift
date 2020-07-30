//
//  ViewController.swift
//  tip
//
//  Created by Mykhailo Ivaniuk on 7/24/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var smallerOne: UILabel!
    @IBOutlet weak var smallOne: UILabel!
    @IBOutlet weak var bigOne: UILabel!
    @IBOutlet weak var biggerOne: UILabel!
    @IBOutlet weak var trayView: UIView!
    
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    var trayOriginalCenter: CGPoint!
    var trayDownOffset: CGFloat!
    var trayUp: CGPoint!
    var trayDown: CGPoint!
    override func viewDidLoad() {
        super.viewDidLoad()
        billAmountTextField.becomeFirstResponder()
        trayDownOffset = 400
        trayUp = trayView.center
        trayDown = CGPoint(x: trayView.center.x ,y: trayView.center.y + trayDownOffset)
        // Do any additional setup after loading the view.
    }
    var number = Double(10)
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func didPanTray(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)
        if sender.state == UIGestureRecognizer.State.began {
                    trayOriginalCenter = trayView.center
        } else if sender.state == UIGestureRecognizer.State.changed {
            self.trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
           
        } else if sender.state == UIGestureRecognizer.State.ended {
                  if velocity.y > 0 {
                    UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options:[] ,
                    animations: { () -> Void in
                        self.trayView.center = self.trayDown
                    }, completion: nil)
                  } else {
                    UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options:[] ,
                    animations: { () -> Void in
                        self.trayView.center = self.trayUp
                    }, completion: nil)
                  }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
           let userDefaults = UserDefaults()
           if let data = userDefaults.object(forKey: "dataFromSettings"){
               if let message = data as? Double{
                   tipPercentageLabel.text = String(format: "%.0f%%", message)
                   number = message
               }
           }
           
       }
    @IBAction func calculateTip(_ sender: Any) {
       
        let bill = Double(billAmountTextField.text!) ?? 0
        let tip = bill * number * Double(0.01)
        let total = bill + tip
        //tipPercentageLabel.text = String(format: "$%.0f", tip)
        biggerOne.text = String(format: "$%.0f", total)
        bigOne.text = String(format: "$%.0f", total/2)
        smallOne.text = String(format: "$%.0f", total/3)
        smallerOne.text = String(format: "$%.0f", total/4)
    }


  
  
}

