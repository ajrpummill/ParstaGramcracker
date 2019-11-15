//
//  feedViewController.swift
//  ParstaGramcracker
//
//  Created by Anthony Pummill on 11/10/19.
//  Copyright © 2019 ajrpummill@gmail.com. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage
import Alamofire

class feedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    
    var posts = [PFObject]()
    let myRefreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DataRequest.addAcceptableImageContentTypes(["application/octet-stream"])
        tableView.delegate = self
        tableView.dataSource = self
        myRefreshControl.addTarget(self, action: (#selector(viewDidAppear(_:))), for: .valueChanged)
        tableView.refreshControl = myRefreshControl
       
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return posts.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell  =  tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
           let post = posts[indexPath.row]
           let user = post["author"] as! PFUser
           cell.usernameLabel.text = user.username
           cell.captionLabel.text = (post["caption"] as! String)
          
           
           let imageFile = post["image"] as! PFFileObject
           let urlString = imageFile.url!
           let url = URL(string: urlString)!
           cell.photoView.af_setImage(withURL: url)
           
           return cell
       }
       
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let query = PFQuery(className: "Posts")
        query.includeKey("author")
        query.limit = 20
        query.order(byDescending: "createdAt")
        query.findObjectsInBackground { (posts, error) in
            if posts != nil {
                self.posts = posts!
                self.tableView.reloadData()
                self.myRefreshControl.endRefreshing()
            }
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
