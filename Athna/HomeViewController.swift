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
 
    }
/*
    @IBAction func gotoHangoutPeople(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "people") as? PeopleViewController {
            vc.navigationItem.title = "Hangout"
            navigationController?.pushViewController(vc, animated: true)
        }
    }
   
    @IBAction func gotoRomance(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "people") as? PeopleViewController {
            vc.navigationItem.title = "Romance"
            navigationController?.pushViewController(vc, animated: true)
        }
    }
 */
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
