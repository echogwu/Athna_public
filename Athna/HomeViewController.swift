//
//  HomeViewController.swift
//  Athna
//
//  Created by WuGuihua on 11/7/16.
//  Copyright © 2016 Sherlock. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {


    @IBOutlet weak var hangout_btn: UIButton!
    @IBOutlet weak var romance_btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(UIApplication.shared.statusBarFrame.size.height)   //to get the height of the status bar: 20.0
 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? PeopleViewController
        if segue.identifier == "hangout"{
            vc?.navigationItem.title = "Hangout"
        }
        if segue.identifier == "romance"{
            vc?.navigationItem.title = "Romance"
        }
    }
}
