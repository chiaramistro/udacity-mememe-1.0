//
//  ViewController.swift
//  MemeMe 1.0
//
//  Created by Chiara Mistrorigo on 25/10/23.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // The app has a social share button that uses the “Action” icon built into iOS.
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    @IBOutlet weak var shootButton: UIBarButtonItem!
    @IBOutlet weak var imageView: UIImageView!
    
    // Text fields are provided for top and bottom text.
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    
    // The font and style used to display the meme text is easy to read: bold, all caps, white with a black outline, and shrink to fit.
    let memeTextAttributes: [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.strokeColor: UIColor.black,
        NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSAttributedString.Key.strokeWidth: 2.0,
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topTextField.text = "TOP"
        bottomTextField.text = "BOTTOM"
        
        toggleImageEditorUi(isHidden: true)
        
        topTextField.defaultTextAttributes = memeTextAttributes
        bottomTextField.defaultTextAttributes = memeTextAttributes
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear()")
        
        // The Camera button is disabled when app is run on devices without a camera, such as the simulator.
        shootButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
    }
    
    func toggleImageEditorUi(isHidden: Bool) {
        topTextField.isHidden = isHidden
        bottomTextField.isHidden = isHidden
        shareButton.isHidden = isHidden
    }
    
    // MARK: Camera actions

    // The app displays the image picker when the Album button is pressed.
    @IBAction func pickFromGallery(_ sender: Any) {
        print("Pick from gallery")
        openPicker(source: .photoLibrary)
    }
    
    // The app displays the camera when the Camera button is pressed on a phone.
    @IBAction func shootFromCamera(_ sender: Any) {
        print("Shoot from camera")
        openPicker(source: .camera)
    }

    
    func openPicker(source: UIImagePickerController.SourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = source
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    // The chosen image from the camera or the photo album is displayed and scaled properly with AspectFit to fit the device screen.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("imagePickerController()")
        if let image = info[.originalImage] as? UIImage {
            print("Image is present")
            imageView.image = image
            toggleImageEditorUi(isHidden: false)
        } else {
            print("Some error occurred")
        }
        
        dismiss(animated: true, completion: nil)
    }

    // MARK: Share actions
    
    // The share button launches the Activity View.
    @IBAction func shareImage(_ sender: Any) {
        print("shareImage()")
        
        let newMeme = generateMemedImage()

        let nextController = UIActivityViewController(
        activityItems: [newMeme], applicationActivities: nil)
        present(nextController, animated: true, completion: nil)
        
        // The meme is saved in the activity view controller’s completionWithItemsHandler. The meme is not saved if the user cancels the activity view controller.
        nextController.completionWithItemsHandler = {
            (activityType: UIActivity.ActivityType?,
             completed: Bool,
             returnedItems: [Any]?,
             error: Error?) in
            if let shareError = error {
                print("Share Error: \(shareError.localizedDescription)")
                return
            }
            if completed {
                print("Share completed")
                self.saveMeme(memeImage: newMeme)
                self.dismiss(animated: true, completion: nil)
                return
            } else {
                print("Share canceled")
                return
            }
        }
    }
    
    func generateMemedImage() -> UIImage {
        UIGraphicsBeginImageContext(imageView.frame.size)

        view.drawHierarchy(in: imageView.frame, afterScreenUpdates: true)

        // Snapshot Image From My View
        let memedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!

        UIGraphicsGetImageFromCurrentImageContext()
        
        return memedImage
    }
    
    func saveMeme(memeImage: UIImage) {
        let meme = Meme(topText: topTextField.text, bottomText: bottomTextField.text, orginalImage: imageView.image, memedImage: memeImage)
    }
    
}

