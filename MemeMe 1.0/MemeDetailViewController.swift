//
//  MemeDetailViewController.swift
//  MemeMe 1.0
//
//  Created by Chiara Mistrorigo on 08/01/24.
//

import UIKit

class MemeDetailViewController: UIViewController {
    
    var meme: Meme!
    
    @IBOutlet weak var memeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memeImage.image = meme.memedImage
    }
    
}
