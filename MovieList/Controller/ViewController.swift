//
//  ViewController.swift
//  MovieList
//
//  Created by Sergei Tsybulya on 31.08.2022.
//

import UIKit
import OrderedCollections

class ViewController: UIViewController {
    
    @IBOutlet weak private var titleTextField: UITextField!
    @IBOutlet weak private var yearTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var movies = OrderedSet<Description>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        titleTextField.placeholder = "Title"
        yearTextField.placeholder = "Year"
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        guard let text = titleTextField.text, !text.isEmpty, let year = yearTextField.text, !year.isEmpty else { return }
        let newMovie = Description(title: text, year: Int(year) ?? 0)
        if movies.contains(newMovie) {
            let alert = UIAlertController(title: "Oops!", message: "The movie is allready in list", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
                self.movies.append(newMovie)
                self.tableView.beginUpdates()
                self.tableView.insertRows(at: [IndexPath(row: self.movies.count-1, section: 0)], with: .automatic)
                self.tableView.endUpdates()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        cell.textLabel?.text = "\(movies[indexPath.row].title)" + " " + "\(movies[indexPath.row].year)"
        return cell
    }
}

