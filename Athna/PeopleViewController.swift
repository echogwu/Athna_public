//
//  PeopleViewController.swift
//  Athna
//
//  Created by WuGuihua on 11/11/16.
//  Copyright © 2016 Sherlock. All rights reserved.
//

import UIKit

class PeopleViewController: UICollectionViewController {
    
    var hangoutPeople = [Person]()
    var romancePeople = [Person]()
    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let pics = try! fm.contentsOfDirectory(atPath: path)
        
        for pic in pics {
            if pic.hasPrefix("Casual") {
                hangoutPeople.append(Person(name: pic.components(separatedBy: "-")[1], image: pic))
            }
            if pic.hasPrefix("Date"){
                romancePeople.append(Person(name: pic.components(separatedBy: "-")[1], image: pic))
            }
        }
        if navigationItem.title == "Hangout"{
            people = hangoutPeople
        }
        else{
            people = romancePeople
        }

    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
        }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "person", for: indexPath) as! PersonViewCell
        
        let person = people[indexPath.item]
        
        cell.nameLabel.text = person.name
        cell.imageView.image = UIImage(named: person.image)
        
        cell.imageView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        cell.imageView.layer.borderWidth = 2
        cell.imageView.layer.cornerRadius = 3
        cell.layer.cornerRadius = 7
        
        return cell
    }
    /*
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let person = people[indexPath.item]
        
        let ac = UIAlertController(title: "Rename person", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        ac.addAction(UIAlertAction(title: "OK", style: .default) { [unowned self, ac] _ in
            let newName = ac.textFields![0]
            person.name = newName.text!
            
            self.collectionView?.reloadData()
        })
        
        present(ac, animated: true)
    }
    */
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}

