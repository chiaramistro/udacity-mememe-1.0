//
//  Meme.swift
//  MemeMe 1.0
//
//  Created by Chiara Mistrorigo on 06/11/23.
//

import Foundation
import UIKit

//The Meme model is a struct that includes:
//- two strings representing the top and bottom text
//- the original image
//- a memed image combining image and text

struct Meme {
    let topText: String
    let bottomText: String
    let orginalImage: UIImage
    let memedImage: UIImage
    
    init(topText: String!, bottomText: String!, orginalImage: UIImage!, memedImage: UIImage!) {
        self.topText = topText ?? ""
        self.bottomText = bottomText ?? ""
        self.orginalImage = orginalImage ?? UIImage()
        self.memedImage = memedImage ?? UIImage()
    }
}
