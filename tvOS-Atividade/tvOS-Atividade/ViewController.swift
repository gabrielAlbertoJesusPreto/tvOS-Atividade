//
//  ViewController.swift
//  tvOS-Atividade
//
//  Created by Gabriel Alberto de Jesus Preto on 02/05/16.
//  Copyright © 2016 Gabriel Alberto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // getting path to GameData.plist
        
        var myDict: NSDictionary?
        if let path = NSBundle.mainBundle().pathForResource("team", ofType: "plist") {
            myDict = NSDictionary(contentsOfFile: path)
        }
        
        //print(myDict)
        print(myDict!["Espanhol"])
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

