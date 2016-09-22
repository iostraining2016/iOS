//
//  ViewController.swift
//  Excercises
//
//  Created by Victor Cabrales on 9/13/16.
//  Copyright © 2016 iOS Team. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func getRanges(sender: AnyObject) {
        var entry : String
        entry = self.myTextField.text!
        
        var array : [String]
        array = entry.componentsSeparatedByString(" ")
        
        var index = 0
        var range : String
        var rangeStarted = false
        var rangeIni = 0
        //print(self.myTextField.text!)
        while index < array.count-1 {
            if rangeStarted == false {
                rangeStarted = true
                rangeIni = index
            }
            var num1 = Int(array[index])! + 1
            var num2 = Int(array[index+1])
            if num1 != num2{
                if rangeIni != index {
                    
                    print("\(array[rangeIni]) - \(array[index])")
                    
                }
                rangeStarted = false
                index += 1
            } else {
                index += 1
            }
        }
        if rangeIni != index && rangeStarted{
            //index += 1
            print("\(array[rangeIni]) - \(array[index])")
        }
        
        
    }
  
}

