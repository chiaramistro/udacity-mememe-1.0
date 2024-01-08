//
//  MemeDetailViewController.swift
//  MemeMe 1.0
//
//  Created by Chiara Mistrorigo on 08/01/24.
//

import UIKit

class MemeDetailViewController: UIViewController {
    
    var meme: String = ""
    
    @IBOutlet weak var memeText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memeText.text = meme
    }
    
}
