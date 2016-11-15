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
    @IBOutlet weak var bioDescriptionCollectionView: UICollectionView!
  

    var mediaArray = [String]()
    var bioDescriptionDic = [[String: String]]()
    
    //To hide the status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.loadImages()
        self.loadBio()
        self.setupCollectionView()
        self.navigationController?.navigationBar.alpha = 0
        //print(self.navigationController?.navigationBar.frame.size.height) =44 //help set the position of the photoCollectionView
        //print(self.tabBarController?.tabBar.frame.size.height) =49 //help set the height of bioDescriptionCollectionView
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
    
    func loadBio(){
        let bioGroup_1 = ["Height":"6\'2\"", "Highest Degree":"Bachelor of Arts", "Short Bio":"I do #splits and catch peopl's attention to make them #laugh with my #vine and #youtube videos"]
        bioDescriptionDic.append(bioGroup_1)
        
        let bioGroup_2 = ["Body-type":"Athletic","Alma master":"Ohio University", "Hobbies and Interests":"#vine #acting #comedy #YouTubeRed #snorkeling"]
        bioDescriptionDic.append(bioGroup_2)
    }
    
    
    func setupCollectionView(){
        //must set different flowLayout to different collection view, otherwise it will cause trouble for the number of times of calling func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int. Like in this case, it calls it 3 times instead of 2.
        let photoFlowLayout = UICollectionViewFlowLayout()
        photoFlowLayout.scrollDirection = .horizontal
        photoFlowLayout.minimumLineSpacing = 0
        photoFlowLayout.minimumInteritemSpacing = 0
        
        let bioFlowLayout = UICollectionViewFlowLayout()
        bioFlowLayout.scrollDirection = .horizontal
        bioFlowLayout.minimumLineSpacing = 0
        bioFlowLayout.minimumInteritemSpacing = 0
        
        self.photoCollectionView.collectionViewLayout = photoFlowLayout
        self.bioDescriptionCollectionView.collectionViewLayout = bioFlowLayout
    }

    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.photoCollectionView{
            return self.mediaArray.count
        }
        else{
            return self.bioDescriptionDic.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.photoCollectionView{
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
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bioCell", for: indexPath) as! BioViewCell
            
            let bio = bioDescriptionDic[indexPath.row]   //bio is a dictionary.
            var keys = [String]()
            var values = [String]()
            for key in bio.keys{
                keys.append(key)
            }
            for value in bio.values{
                values.append(value)
            }
            cell.bio_1.text = keys[0]
            cell.bio_2.text = keys[1]
            cell.bio_3.text = keys[2]
            cell.answer_1.text = values[0]
            cell.answer_2.text = values[1]
            cell.answer_3.text = values[2]
            
            return cell
        }
        

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.photoCollectionView{
            return self.photoCollectionView.frame.size
        }
        else{
            return self.bioDescriptionCollectionView.frame.size
        }
        
    }
 
}
