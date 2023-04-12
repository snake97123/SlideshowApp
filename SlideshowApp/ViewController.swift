//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Wataru Yamashita on 2023/04/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var flowerImage: UIImageView!
    var imageIndex = 0
    var timer: Timer?
    let images = ["flower1.jpeg", "flower2.jpeg", "flower3.jpeg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateImage()
        
    }
    
    @objc func updateImage() {
        imageIndex += 1
        if imageIndex >= images.count {
            imageIndex = 0
        }
        flowerImage.image = UIImage(named: images[imageIndex])
    }

    @IBAction func forwardButtonTapped(_ sender: Any) {
        updateImage()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        imageIndex -= 1
        if imageIndex < 0 {
            imageIndex = images.count - 1
        }
        flowerImage.image = UIImage(named: images[imageIndex])
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateImage), userInfo: nil, repeats: true)
            playButton.setTitle("停止", for: .normal)
            forwardButton.isEnabled = false
            backButton.isEnabled = false
        } else {
            timer?.invalidate()
            self.timer = nil
            playButton.setTitle("再生", for: .normal)
            forwardButton.isEnabled = true
            backButton.isEnabled = true
        }
    }
    @IBAction func tapImage(_ sender: Any) {
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let closeUpImageViewController: CloseUpImageViewController = segue.destination as! CloseUpImageViewController
        closeUpImageViewController.loadViewIfNeeded()
        closeUpImageViewController.closeUpImageView.image = UIImage(named: images[imageIndex])
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
    }
}

