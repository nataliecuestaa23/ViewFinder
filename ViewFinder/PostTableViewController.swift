//
//  PostTableViewController.swift
//  ViewFinder
//
//  Created by Apple on 7/15/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class PostTableViewController: UITableViewController {

    var photos : [Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        func getPhotos() {
//            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
//                // now we need to search through Core Data to find our photos/captions
//                if let coreDataPhoto = try? context.fetch(Photo.fetchRequest()) as? [Photo] {
//                    photos = coreDataPhoto
//                    tableView.reloadData()
//                    }
        
                }
            

    func getPhotos() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            // now we need to search through Core Data to find our photos/captions
            if let coreDataPhoto = try? context.fetch(Photo.fetchRequest()) as? [Photo] {
                photos = coreDataPhoto
                tableView.reloadData()
            }
            
        }
    }

        // Uncomment the following line to preserve selection between presentations
//        self.clearsSelectionOnViewWillAppear = false
//
//        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        self.navigationItem.rightBarButtonItem = self.editButtonItem


    // MARK: - Table view data source

    override func viewWillAppear(_ animated: Bool) {
    getPhotos()
}

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell ()
        cell.textLabel?.text = "This is a Photo"
        cell.imageView?.image = UIImage(named: "Unknown")
            
            let cellPhoto = photos[indexPath.row]
            
            cell.textLabel?.text = cellPhoto.caption
            
            if let cellPhotoImageData = cellPhoto.imagedata {
                if let cellPhotoImage = UIImage(data: cellPhotoImageData) {
                    cell.imageView?.image = cellPhotoImage
                }
            }
            
            return cell
        }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: photos[indexPath.row])
    }
    
//        tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

    
    //Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    
//        // Return false if you do not want the specified item to be editable.
        return true
    
    }
//

    
    // Override to support editing the table view.
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
        let photoToDelete = photos[indexPath.row]
            context.delete(photoToDelete)
            // Delete the row from the data source
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            getPhotos()
          }
     }
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



