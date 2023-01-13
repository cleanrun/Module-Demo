//
//  ViewController.swift
//  Module-Demo
//
//  Created by cleanmac on 13/01/23.
//

import UIKit

class ViewController: UIViewController {

    /// The Table View object to show all of the data.
    @IBOutlet weak var tableView: UITableView!
    
    /// An array to store the retrieved post data from the internet.
    private var postList: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getPostData()
    }
    
    /// Setting up the table view
    ///
    /// Call this function to set up the table view's delegate,  data source, and register the cell needed to show the data.
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "PostCell")
    }
    
    /// Getting the post data from the internet and reloads the table view to show the retrieved data.
    private func getPostData() {
        Webservice.shared.getAllPosts(onSuccess: { [weak self] data in
            self?.postList = data
            self?.tableView.reloadData()
        }, onFailed: { error in
            // Handle the error here
            // For example: Show an alert, show a custom cell, etc.
        })
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    /// This function is implemented to indicate how many data will be displayed in the table view.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postList.count
    }
    
    /// This function is implemented to configure the table view cell for each row displayed in the table view.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
        cell.setupContents(model: postList[indexPath.row])
        return cell
    }
    
    /// This function is implemented to configure the height of each table view cell.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    /// This function is implemented to configure an action when a cell is tapped.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

