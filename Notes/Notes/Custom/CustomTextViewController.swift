//
//  CustomTextViewController.swift
//  Notes
//
//  Created by vCabrales on 9/10/16.
//  Copyright © 2016 ios team. All rights reserved.
//

import UIKit

class CustomTextViewController: UIViewController {

    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var myText: UITextView!
    
    var titleString : String?
    var filePath : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myTitle.text = titleString
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
