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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func numbButtonPressed(_ sender: UIButton) {
        print("Number \(sender.tag) pressed")
    }
    
}

