//
//  ViewController.swift
//  Tipster
//
//  Created by Betalantz on 9/10/17.
//  Copyright © 2017 Betalantz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var numbButtonCollection: [UIButton]!
    @IBOutlet weak var billAmt: UILabel!
    @IBOutlet var TipPercCollection: [UILabel]!
    
    var billAmount = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numbButtonCollection.sort { $0.tag < $1.tag }
        TipPercCollection.sort { $0.tag < $1.tag }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func numbButtonPressed(_ sender: UIButton) {
        print("Number \(sender.tag) pressed")
        let addition = numbButtonCollection[sender.tag].titleLabel?.text
        
        let build: String = billAmount + addition!
        print(build)
        let newBill = Double(build)
        if newBill!.truncatingRemainder(dividingBy: 1.0) != 0.0 {
            let numberOfPlaces = 2.0
            let multiplier = Double(pow(10.0, numberOfPlaces))
            let floored = String(floor(newBill! * multiplier) / multiplier)
            print(floored)
            billAmount = floored
        } else {
            billAmount = build
        }
        updateUI()
    }
    @IBAction func changeTipPerc(_ sender: UISlider) {
        let currTipPerc = Int(sender.value)
        print("Tip Percentage changing to \(currTipPerc)")
        var multiplier = 0
        for i in 0..<TipPercCollection.count {
            var TipPercMultiplied = currTipPerc
            TipPercMultiplied += multiplier
            TipPercCollection[i].text = "\(TipPercMultiplied)%"
            multiplier += 5
        }
    }
    func updateUI() {
        billAmt.text = billAmount
    }
}

