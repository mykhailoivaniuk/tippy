//
//  SettingsViewController.swift
//  tip
//
//  Created by Mykhailo Ivaniuk on 7/30/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var customTipLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func onButtonTap()
    {
       
        

        
    }
    @IBAction func sliderValueChanged(_ sender: Any) {
        let defaults = UserDefaults.standard
        let value = Double(slider.value)*Double(100)
        defaults.set(value, forKey:"dataFromSettings")
        let value1 = defaults.double(forKey:"dataFromSettings")
        customTipLabel.text = String(format: "%.0f%%", value1)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
