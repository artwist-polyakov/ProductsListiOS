//
//  ViewController.swift
//  products list
//
//  Created by Александр Поляков on 29.04.2023.
//
 
import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    
    let words = [
        ["Apple", "Pear", "Watermelon"],
        ["Carrot", "Pickle", "Potato", "Tomato"],
        ["Strawberry","Raspberry", "Blackberry","Blueberry"]
    ]
    let headers = ["Fruits", "Vegetables", "Ягоды"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.sectionHeaderHeight = 32 
    }


}

// MARK: UITableViewDataSource
@available(iOS 14.0, *)
extension ViewController: UITableViewDataSource {
    // Здесь будут наши методы dataSource
    
    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        let vegOrFruitArray = words[section]
        return vegOrFruitArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if let reusedCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = reusedCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        var content = cell.defaultContentConfiguration()
        
        content.text = words[indexPath.section][indexPath.row]
        cell.contentConfiguration = content
//        cell.selectionStyle = .gray
        return cell
    }

    
    
}

// MARK: UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: nil, message: "Вы нажали на \(words[indexPath.section][indexPath.row])", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            tableView.deselectRow(at: indexPath, animated: true) // снимаем выделение
            alert.dismiss(animated: true)}
        alert.addAction(okAction)
        present(alert, animated: true)
    
    }
}

