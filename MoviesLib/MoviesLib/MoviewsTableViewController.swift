//
//  MoviewsTableViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 04/09/17.
//  Copyright © 2017 EricBrito. All rights reserved.
//

import UIKit

class MoviewsTableViewController: UITableViewController {

    
    var movies:[Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 106
        tableView.rowHeight = UITableViewAutomaticDimension
        loadLocalJSON()
    }
    func loadLocalJSON(){
        
        if let jsonURL = Bundle.main.url(forResource: "movies", withExtension: "json"){
            let data = try! Data(contentsOf: jsonURL)
            let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [[String: Any]]
            for item in json{
                let title = item["title"] as! String
                let duration = item["duration"] as! String
                let summary = item["summary"] as! String
                let imageName = item["image_name"] as! String
                let rating = item["rating"] as! Double
                let categories = item["categories"] as! [String]
                let movie = Movie(title: title, rating: rating, sumary: summary, duration: duration, imageName: imageName)
                movie.categories = categories
                movies.append(movie)
                
            }
            movies.sort(by: {
                $0.rating > $1.rating
            })
            tableView.reloadData()
        }
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! MovieViewController
        vc.movie = movies[tableView.indexPathForSelectedRow!.row]
    }
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! MovieTableViewCell
        
        cell.ivPoster.image = UIImage(named: movies[indexPath.row].imageSmall)
        cell.lbTitle.text = movies[indexPath.row].title
        cell.lbSummary.text = movies[indexPath.row].sumary
        cell.lbRating.text = "⭐️ \(movies[indexPath.row].rating)/10"

        return cell
    }
 
 
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
