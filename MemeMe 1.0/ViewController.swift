//
//  ViewController.swift
//  MemeMe 1.0
//
//  Created by Chiara Mistrorigo on 25/10/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Actions

    @IBAction func pickFromGallery(_ sender: Any) {
        print("Pick from gallery")
    }
    
    @IBAction func shootFromCamera(_ sender: Any) {
        print("Shoot from camera")
    }

    
}

