//
//  MemeCollectionViewController.swift
//  MemeMe 1.0
//
//  Created by Chiara Mistrorigo on 05/01/24.
//

import UIKit

class MemeCollectionViewController: UICollectionViewController {
    
    var memeArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addMeme))
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.memeArray = appDelegate.memes
        print(self.memeArray)
    }
    
    @objc func addMeme() {
        var controller: AddMemeViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddMemeViewController") as! AddMemeViewController

        present(controller, animated: true, completion: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.memeArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionViewCell", for: indexPath) as! MemeCollectionViewCell
        let meme = self.memeArray[(indexPath as NSIndexPath).row]

        // Set the name
        cell.memeText.text = meme

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Navigate on click item \((indexPath as NSIndexPath).row)")
        // TODO navigation to details
    }
}
