//
//  ViewController.swift
//  Notes
//
//  Created by vCabrales on 9/10/16.
//  Copyright © 2016 ios team. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
  
    @IBOutlet weak var myTable: UITableView!
    
    
    var dictionary : NSDictionary = [
        "White Belt" : ["Conceptos basicos", "Conceptos basicos II", "Frank no vino", "Navegacion basica"]
        //,"Section 2"  : ["Title_1","Title_2"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



extension ViewController : UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //let currentCell : customTVC = tableView.cellForRowAtIndexPath(indexPath) as! customTVC
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let sectionName : String = self.dictionary.allKeys[indexPath.section] as! String
        let cellTitle: String = (self.dictionary[sectionName] as! [String])[indexPath.row]

        print("Seleccione celda \(indexPath.row) en la seccion \(cellTitle) ")

        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let controller : CustomTextViewController = storyBoard.instantiateViewControllerWithIdentifier("CustomTextViewController") as! CustomTextViewController
        controller.titleString = cellTitle
        
        let filepath = NSBundle.mainBundle().pathForResource(cellTitle, ofType: "strings")
        controller.filePath = filepath
        
        self.presentViewController(controller, animated: true, completion: nil)

    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionName : String = self.dictionary.allKeys[section] as! String
        return sectionName
    }
}

extension ViewController : UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.dictionary.allKeys.count
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionKey : String = self.dictionary.allKeys[section] as! String //
        let arrayForSection = self.dictionary[sectionKey] //White belt, etc...

        return arrayForSection!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.myTable.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! customTableViewCell
        let sectionKey : String = self.dictionary.allKeys[indexPath.section] as! String
        
        let arrayForSection : [String] = self.dictionary[sectionKey] as! [String]
        
        //cell.myImage.image = UIImage(named : "icon")
        cell.myTitle.text = arrayForSection[indexPath.row]
        //cell.mySubtitle.text = ""
        
        return cell
    }
    
}

