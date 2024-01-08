//
//  MemeTableViewController.swift
//  MemeMe 1.0
//
//  Created by Chiara Mistrorigo on 05/01/24.
//

import UIKit

class MemeTableViewController: UITableViewController {
    
    let memeArray: [String] = [
        "Meme 1",
        "Meme 2",
        "Meme 3",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addMeme))
    }
    
    @objc func addMeme() {
        var controller: AddMemeViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddMemeViewController") as! AddMemeViewController

        present(controller, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memeArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeTableViewCell")!
        let meme = self.memeArray[(indexPath as NSIndexPath).row]
        
        // Set the name
        cell.textLabel?.text = meme

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Navigate on click item \((indexPath as NSIndexPath).row)")
    }

}
