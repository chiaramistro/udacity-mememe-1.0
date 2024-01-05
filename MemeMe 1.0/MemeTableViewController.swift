//
//  MemeTableViewController.swift
//  MemeMe 1.0
//
//  Created by Chiara Mistrorigo on 05/01/24.
//

import UIKit

class MemeTableViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addMeme))
    }
    
    @objc func addMeme() {
        var controller: AddMemeViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddMemeViewController") as! AddMemeViewController

        present(controller, animated: true, completion: nil)
    }
    
}
