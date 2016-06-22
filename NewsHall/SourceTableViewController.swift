//
//  SourceTableViewController.swift
//  
//
//  Created by Ankit Kumar on 15/04/16.
//
//

import UIKit

class SourceTableViewController: UITableViewController {
    // MARK: Properties
    
    var sources = [Source]()
    var eventID = 1
    var headingData:[String] = [""]
    var sourceName:[String] = [""]
    var rating1:[String] = [""]
    var rating2:[String] = [""]
//    var rating3 = String()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        // Load the sample data.
        loadSources()
        
        var url = NSURL(string: "http://172.27.30.33:5013/page_images?num1=\(eventID)&num2=1" )
        var data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
        var tmpPhoto = UIImage(data: data!)
        
        var tmpSource = Source(heading: self.headingData[0].stringByReplacingOccurrencesOfString("\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil),
            photo: tmpPhoto,
            sourceName: self.sourceName[0].stringByReplacingOccurrencesOfString("\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil),
            rating1: self.rating1[0].stringByReplacingOccurrencesOfString("\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil),
            rating2: self.rating2[0].stringByReplacingOccurrencesOfString("\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil))
        
        for i in 1...4 {
            var url = NSURL(string: "http://172.27.30.33:5013/page_images?num1=\(eventID)&num2=\(i)" )
            var data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
            var tmpPhoto = UIImage(data: data!)
            
            println(self.sourceName)
            println(i)
            
            var tmpSource = Source(heading: self.headingData[i-1].stringByReplacingOccurrencesOfString("\'", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil),
                photo: tmpPhoto,
                sourceName: self.sourceName[i-1].stringByReplacingOccurrencesOfString("\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil),
                rating1: self.rating1[i-1].stringByReplacingOccurrencesOfString("\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil),
                rating2: self.rating2[i-1].stringByReplacingOccurrencesOfString("\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil))
            
            sources += [tmpSource]
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func loadSources() {
        
        var url = NSURL(string: "http://172.27.30.33:5013/page2_1?num1=\(eventID)")
        
        var task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            self.headingData = NSString(data: data, encoding: NSUTF8StringEncoding)!.componentsSeparatedByString("\", \"") as! [String]
            println(self.headingData)
        }
        task.resume()
        
        
        url = NSURL(string: "http://172.27.30.33:5013/page2_2?num1=\(eventID)")
        
        task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            self.sourceName = NSString(data: data, encoding: NSUTF8StringEncoding)!.componentsSeparatedByString("\", \"") as! [String]
//            println(self.sourceName)
        }
        task.resume()
        
        
        url = NSURL(string: "http://172.27.30.33:5013/page2_3?num1=\(eventID)")
        
        task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            self.rating1 = NSString(data: data, encoding: NSUTF8StringEncoding)!.componentsSeparatedByString("\", \"") as! [String]
            println(self.rating1)
        }
        task.resume()
        
        
        url = NSURL(string: "http://172.27.30.33:5013/page2_4?num1=\(eventID)")
        
        task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            self.rating2 = NSString(data: data, encoding: NSUTF8StringEncoding)!.componentsSeparatedByString("\", \"") as! [String]
            println(self.rating2)
        }
        task.resume()
        
}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return sources.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "SourceTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SourceTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let source = sources[indexPath.row]
        
        cell.sourceLabel.text = source.heading
        cell.sourceImageView.image = source.photo
        cell.sourceNameLabel.text = source.sourceName
        cell.rating1Label.text = source.rating1
        cell.rating2Label.text = source.rating2
//        cell.rating3Label.text = source.rating3

        return cell
    }
    
    
    let newsSegueIdentifier = "showNewsSegue"
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == newsSegueIdentifier {
            if let destination: ViewController =  segue.destinationViewController as? ViewController {
                if let newsIndex: Int = tableView.indexPathForSelectedRow()?.row {
                    destination.heading = sources[newsIndex].heading
                    destination.newsPhoto = sources[newsIndex].photo!
                    destination.sourceName = sources[newsIndex].sourceName
                    destination.rating1 = sources[newsIndex].rating1
                    destination.rating2 = sources[newsIndex].rating2
                    destination.sourceID = newsIndex+1
                    destination.eventID = eventID
//                    destination.rating3 = sources[newsIndex].rating3
                }
            }
        }
        
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
}
