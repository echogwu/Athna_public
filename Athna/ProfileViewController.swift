//
//  ProfileViewController.swift
//  Athna
//
//  Created by WuGuihua on 11/12/16.
//  Copyright © 2016 Sherlock. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var photoCollectionView: UICollectionView! //in addition to creating a IBOutlet of UICollectionView, we still need to connect the UICollectionView object’s dataSource and delegate outlets to the File's Owner object.
    var mediaArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadImages()
        self.setupCollectionView()
        print(self.navigationController?.navigationBar.frame.size.height)

    }

    func loadImages(){
        let fm = FileManager.default
        let sourcePath = Bundle.main.resourcePath!
        let pics = try! fm.contentsOfDirectory(atPath: sourcePath)
        
        for pic in pics {
            if pic.hasPrefix("Logan Paul") {
                let path = sourcePath + "/" + pic
                mediaArray.append(path)
            }
        }
        
    }
    
    func setupCollectionView(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        
        self.photoCollectionView.collectionViewLayout = flowLayout
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.mediaArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoViewCell
        
        let pv = mediaArray[indexPath.row]   //pv means picture/video
        cell.imageView.image = UIImage(named: pv)
        cell.imageView.contentMode = .scaleAspectFill
        cell.imageView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        //cell.imageView.layer.borderWidth = 2
        //cell.imageView.layer.cornerRadius = 3
        //cell.layer.cornerRadius = 7
        
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.photoCollectionView.frame.size
    }
 
}
