//
//  ViewController.swift
//  Lesson5_Kadai
//
//  Created by Toru Yoshihara on 2016/09/22.
//  Copyright © 2016年 tooru.yoshihara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Count for images to be displayed
    var imageCount:Int = 1
    //Flag to detect play or pause, flag = 1: Play, flag = 2: Pause
    var flag = 1
    var timer:Timer? = nil
    let maxImageCount = 13
    
    @IBOutlet weak var Preview: UIImageView!
    
    @IBOutlet weak var PlayPause: UIButton!
    
    @IBOutlet weak var Next: UIButton!
    
    @IBOutlet weak var Previous: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        drawImage(imageCount: imageCount)
        PlayPause.setTitle("再生", for: .normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        let detailedViewController:DetailedViewController = segue.destination as! DetailedViewController
        detailedViewController.imageCount = imageCount
    }
    
    
    @IBAction func TrigDetailView(_ sender: AnyObject) {
        
    }
    
    
    @IBAction func PlayPause(_ sender: AnyObject) {
        
    
        //Play: flag = 1
        if flag == 1 {
            timer = Timer.scheduledTimer(timeInterval: 2.0,
                                         target: self,
                                         selector: #selector(ViewController.incrementAndDraw),
                                         userInfo: nil,
                                         repeats: true)
            PlayPause.setTitle("停止", for: .normal)
            Previous.isEnabled = false
            Next.isEnabled = false
            flag = 2
        }
        
        //Pause: flag = other
        else {
            if (timer !=  nil) {
            timer?.invalidate()
            }
            PlayPause.setTitle("再生", for: .normal)
            flag = 1
            Previous.isEnabled = true
            Next.isEnabled = true
        }
        
    }
    
    
    @IBAction func Next(_ sender: AnyObject) {
        imageCount += 1
        if imageCount > maxImageCount {
            imageCount = 1
        }
        drawImage(imageCount: imageCount)
    }
    
    
    @IBAction func Previous(_ sender: AnyObject) {
        imageCount -= 1
        if imageCount < 1 {
            imageCount = maxImageCount
        }
        drawImage(imageCount: imageCount)
    }

    func incrementAndDraw() {
        imageCount += 1
        if imageCount > maxImageCount {
            imageCount = 1
        }
        drawImage(imageCount: imageCount)
    }
    
    func drawImage(imageCount:Int) {
        Preview.image = UIImage(named: "\(imageCount).jpg")
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }

}

