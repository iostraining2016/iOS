//
//  ViewController.swift
//  Algorithms
//
//  Created by vCabrales on 9/14/16.
//  Copyright © 2016 Victor Cabrales. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func go(sender: AnyObject) {
        var array: [[Int]] = [[1,0,0],[1,0,1],[0,0,1]]
        
        print(find(&array))
        
    }
    
    
    
    func find(inout array: [[Int]]) -> Int{
        //a = array
        var count = 0
        for (i,row) in array.enumerate() {
            for (j, cell) in row.enumerate() {
                if(cell == 1){
                    mark(&array, i: i, j: j)
                    count += 1
                }
            }
        }
    
        return count;
    }
    
    
    func mark(inout array: [[Int]], i : Int, j : Int){
        if i<0 || j<0 || i==array.count || j==array[i].count {
            return;
        }
        if array[i][j] == 1 {
            array[i][j] = 2
            
            mark(&array, i:i,j: j+1) //right
            mark(&array, i:i,j: j-1) //left
            mark(&array, i:i+1,j: j) //down
            mark(&array, i:i-1,j: j) //up
    
            mark(&array, i:i+1,j: j-1) //lower left
            mark(&array, i:i+1,j: j+1) //lower right
            mark(&array, i:i-1,j: j-1) //upper left
            mark(&array, i:i-1,j: j+1) //upper right
        }
    
    }
    
}

