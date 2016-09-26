//
//  DetailedViewController.swift
//  Lesson5_Kadai
//
//  Created by Toru Yoshihara on 2016/09/26.
//  Copyright © 2016年 tooru.yoshihara. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    var imageCount:Int = 0
    
    @IBOutlet weak var DetailedView: UIImageView!
    
    @IBOutlet weak var ShowImageCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("\(imageCount)")
        DetailedView.image = UIImage(named: "\(imageCount).jpg")
        ShowImageCount.text = "\(imageCount).jpg"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
