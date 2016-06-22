//
//  EventTableViewController.swift
//  
//
//  Created by Ankit Kumar on 15/04/16.
//
//

import UIKit

class EventTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var events = [Event]()
    var responseData:[String] = [""]
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        // Load the sample data.
        loadEvents()
        
        for i in 1...10 {
            var url = NSURL(string: "http://172.27.30.33:5013/page_images?num1=\(i)&num2=1" )
            var data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
            var tmpPhoto = UIImage(data: data!)
            
            var tmpEvent = Event(heading: self.responseData[i-1].stringByReplacingOccurrencesOfString("\'", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil), photo: tmpPhoto)
            events += [tmpEvent]
        }

    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func loadEvents() {
        
        var url = NSURL(string: "http://172.27.30.33:5013/page1_topics")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            self.responseData = NSString(data: data, encoding: NSUTF8StringEncoding)!.componentsSeparatedByString("\", \"") as! [String]
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
        return events.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "EventTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! EventTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let event = events[indexPath.row]
        
        cell.eventLabel.text = event.heading
        cell.eventImageView.image = event.photo
        
        return cell
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

    let sourcesSegueIdentifier = "showSourcesSegue"
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == sourcesSegueIdentifier {
            if let destination: SourceTableViewController =  segue.destinationViewController as? SourceTableViewController {
                if let eventIndex: Int = tableView.indexPathForSelectedRow()?.row {
                    destination.eventID = eventIndex+1
                    
                }
            }
        }
        
    }

    
    
}
