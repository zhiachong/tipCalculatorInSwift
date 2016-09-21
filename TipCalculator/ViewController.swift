//
//  ViewController.swift
//  TipCalculator
//
//  Created by Zhia Chong on 9/20/16.
//  Copyright © 2016 Zhia Chong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var curTipLabel: UILabel!
    
    @IBOutlet weak var billSplitView: UIView!
    @IBOutlet weak var onePersonBill: UILabel!
    @IBOutlet weak var twoPersonBill: UILabel!
    @IBOutlet weak var threePersonBill: UILabel!
    @IBOutlet weak var fourPersonBill: UILabel!
    
    var curTipValue: Int = 15

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        print("view will appear")
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTipValue = defaults.integerForKey(Constants.defaultTipKey)
        print ("default tipv aleu" )
        print(defaultTipValue)
        if (defaultTipValue > 0) {
            tipLabel.text = String(defaultTipValue)
            self.curTipValue = defaultTipValue
            calculate(Double(billText.text!) ?? 0, tip: defaultTipValue)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: UITapGestureRecognizer) {
        view.endEditing(true);
    }
    
    @IBAction func calculateTips(sender: AnyObject) {
        if (sender.text != nil) {
            
            let bill = Double(sender.text!) ?? 0
            self.calculate(bill, tip:curTipValue)
        }
    }
    
    
    private func calculate(bill: Double, tip: Int) {
        let tipFloat = Double(tip)/100.0
        let total = bill * (1+tipFloat);
        let tips = bill * tipFloat;
        
        tipLabel.text = self.formatMoney(tips)
        totalLabel.text = self.formatMoney(total)
        curTipLabel.text = "\(tip)%"
        self.updateBill(total)
        
        if (total > 0) {
            UIView.animateWithDuration(0.5, animations: {
                self.billSplitView.alpha = 1
            })
        }
        
    }
    
    private func updateBill(total: Double) {
        let onePerson = total
        let twoPerson = total / 2
        let threePerson = total / 3
        let fourPerson = total / 4
        
        onePersonBill.text = self.formatMoney(onePerson)
        twoPersonBill.text = self.formatMoney(twoPerson)
        threePersonBill.text = self.formatMoney(threePerson)
        fourPersonBill.text = self.formatMoney(fourPerson)
    }
    
    private func formatMoney(value: Double) -> String {
        return String(format: "$%.2f", value)
    }
}

