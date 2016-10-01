//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Zhia Chong on 9/20/16.
//  Copyright © 2016 Zhia Chong. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipPercentageValue: UIStepper!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print ("view did load") 

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        
        let tipValue = defaults.integer(forKey: Constants.defaultTipKey)
        tipLabel.text = String(tipValue)
        tipPercentageValue.value = Double(tipValue)
        
        print("Tip value is: ")
        print(tipValue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeDefaultTip(_ sender: UIStepper) {
        let tipValue = Int(sender.value)
        tipLabel.text = String(tipValue)
        
        let defaults = UserDefaults.standard
        defaults.set(tipValue, forKey: Constants.defaultTipKey)
        defaults.synchronize()
    }
    

}
