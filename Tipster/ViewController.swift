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
    @IBOutlet var tipAmtCollection: [UILabel]!
    @IBOutlet var finalAmtCollection: [UILabel]!
    @IBOutlet weak var grpSize: UILabel!
    @IBOutlet weak var tipPercSlider: UISlider!
    @IBOutlet weak var grpSizeSlider: UISlider!
    
    var billDisplay = ""
    var tipPercent = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numbButtonCollection.sort { $0.tag < $1.tag }
        TipPercCollection.sort { $0.tag < $1.tag }
        tipAmtCollection.sort { $0.tag < $1.tag }
        finalAmtCollection.sort { $0.tag < $1.tag }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func numbButtonPressed(_ sender: UIButton) {
        print("Number \(sender.tag) pressed")
        let addition = numbButtonCollection[sender.tag].titleLabel?.text
        
        let build: String = billDisplay + addition!
        print(build)
        let newBill = Double(build)
        //TODO: needs to handle inputs starting with decimals and display final '0' in hundreths place
        if newBill!.truncatingRemainder(dividingBy: 1.0) != 0.0 {
            let numberOfPlaces = 2.0
            let multiplier = Double(pow(10.0, numberOfPlaces))
            let floored = String(floor(newBill! * multiplier) / multiplier)
            print(floored)
            billDisplay = floored
        } else {
            billDisplay = build
        }
        updateUI()
    }
    @IBAction func changeTipPerc(_ sender: UISlider) {
        let currTipPerc = Int(sender.value)
        tipPercent = currTipPerc
        print("Tip Percentage changing to \(currTipPerc)")
        var multiplier = 0
        for i in 0..<TipPercCollection.count {
            var TipPercMultiplied = currTipPerc
            TipPercMultiplied += multiplier
            TipPercCollection[i].text = "\(TipPercMultiplied)%"
            multiplier += 5
        }
        outputCalcs()
    }
    @IBAction func changeGrpSize(_ sender: UISlider) {
        let currGrpSize = Int(sender.value)
        grpSize.text = "\(currGrpSize)"
        outputCalcs()
    }
    func outputCalcs() {
        let billAmount = Float(billDisplay)
        let grpSize = Int(grpSizeSlider.value)
        let tipAmount = (billAmount! / Float(tipPercent)) / Float(grpSize)
        let finalAmount = (billAmount! + tipAmount) / Float(grpSize)

        
        
        
        var multiplier = 0
        for i in 0..<tipAmtCollection.count {
            for x in 0..<finalAmtCollection.count {
                var tipAmtMultiplied = tipAmount
                tipAmtMultiplied += Float(multiplier)
                let tipFormat = String.localizedStringWithFormat("%.2f", tipAmtMultiplied)
                tipAmtCollection[i].text = (tipFormat)
                var finalAmtMultiplied = finalAmount
                finalAmtMultiplied += Float(multiplier)
                let finalFormat = String.localizedStringWithFormat("%.2f", finalAmtMultiplied)
                finalAmtCollection[x].text = finalFormat
                multiplier += 5
            }
        }
                
//        print(tipFormat)
//        print(finalFormat)
    }
    
    func updateUI() {
        billAmt.text = billDisplay
    }
}

