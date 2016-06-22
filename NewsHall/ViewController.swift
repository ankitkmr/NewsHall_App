//
//  ViewController.swift
//  NewsHall
//
//  Created by Ankit Kumar on 15/04/16.
//  Copyright (c) 2016 Ankit Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsHeadingLabel: UILabel!
    @IBOutlet weak var rating1Label: UILabel!
    @IBOutlet weak var rating2Label: UILabel!
    @IBOutlet weak var sourceNameLabel: UILabel!
    @IBOutlet weak var newsBodyView: UITextView!
  
    var heading = String()
    var newsPhoto = UIImage()
    var sourceName = String()
    var rating1 = String()
    var rating2 = String()
    var newsBody = String()
    var sourceID = 0
    var eventID = 0
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        let url = NSURL(string: "http://172.27.30.33:5013/page3_data?num1=\(eventID)&num2=\(sourceID)")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            var news = NSString(data: data, encoding: NSUTF8StringEncoding) as! String
            println(news)
            dispatch_async(dispatch_get_main_queue(),{
                self.newsBodyView.text = news
            });
                    }
        task.resume()
        dispatch_async(dispatch_get_main_queue(),{
            self.newsHeadingLabel.text = self.heading
            self.newsImageView.image = self.newsPhoto
            self.sourceNameLabel.text = self.sourceName
            self.rating1Label.text = self.rating1
            self.rating2Label.text = self.rating2
        });
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // rating3Label.text = rating3
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

