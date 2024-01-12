//
//  MemeCollectionViewController.swift
//  MemeMe 1.0
//
//  Created by Chiara Mistrorigo on 05/01/24.
//

import UIKit

class MemeCollectionViewController: UICollectionViewController {
    
    @IBOutlet var collectionViewEl: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addMeme))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionViewEl.reloadData()
    }
    
    @objc func addMeme() {
        var controller: AddMemeViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddMemeViewController") as! AddMemeViewController

        present(controller, animated: true, completion: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionViewCell", for: indexPath) as! MemeCollectionViewCell
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let meme = appDelegate.memes[(indexPath as NSIndexPath).row]

        // Set the name
        cell.memeText.text = meme.topText + " " + meme.bottomText

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Navigate on click item \((indexPath as NSIndexPath).row)")
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        detailController.meme = appDelegate.memes[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
}
