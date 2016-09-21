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

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let tipValue = defaults.integerForKey(Constants.defaultTipKey)
        tipLabel.text = String(tipValue)
        tipPercentageValue.value = Double(tipValue)
        
        print(tipValue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeDefaultTip(sender: UIStepper) {
        let tipValue = Int(sender.value)
        tipLabel.text = String(tipValue)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipValue, forKey: Constants.defaultTipKey)
        defaults.synchronize()
    }
    

}
