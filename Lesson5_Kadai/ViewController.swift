//
//  ViewController.swift
//  Lesson5_Kadai
//
//  Created by Toru Yoshihara on 2016/09/22.
//  Copyright © 2016年 tooru.yoshihara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageCount:Int = 1
    var flag = 0
    
    @IBOutlet weak var Preview: UIImageView!
    
    
    @IBAction func TrigDetailView(_ sender: AnyObject) {
    }
    
    
    @IBAction func PlayPause(_ sender: AnyObject) {
        flag += 1
        let timer = Timer.scheduledTimer(timeInterval: 1.0,
                                         target: self,
                                         selector: #selector(ViewController.incrementAndDraw),
                                         userInfo: nil,
                                         repeats: true)
        if flag == 1 {
            RunLoop.current.add(timer, forMode: RunLoopMode.defaultRunLoopMode)
        }
        if flag == 2 {
            flag = 1
            timer.invalidate()
        }
        
    }
    
    
    @IBAction func Next(_ sender: AnyObject) {
        imageCount += 1
        if imageCount > 3 {
            imageCount = 1
        }
        drawImage(imageCount: imageCount)
    }
    
    
    @IBAction func Previous(_ sender: AnyObject) {
        imageCount -= 1
        if imageCount < 1 {
            imageCount = 3
        }
        drawImage(imageCount: imageCount)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        drawImage(imageCount: imageCount)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func incrementAndDraw() {
        imageCount += 1
        if imageCount > 3 {
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

