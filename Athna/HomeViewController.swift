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
        
        let hangout_img = UIImage(named: "hangout.png")
        
        let img_width = hangout_img?.size.width
        let img_height = hangout_img?.size.height
        let button_width = hangout_btn.bounds.width
        let button_height = hangout_btn.bounds.height
        print("image_size=\(img_width),\(img_height)")
        print("button_size=\(button_width),\(button_height)")
 
        //let hangout_image = UIImage(ciImage: hangout_img?.cgImage, scale: hangout_img, orientation: <#T##UIImageOrientation#>)
        
    
        let romance_image = UIImage(named: "romance.png")
        //hangout.setBackgroundImage(hangout_image, for: )
 
    }
    
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

}

