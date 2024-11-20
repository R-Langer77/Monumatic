//
//  PreferencesViewController 2.swift
//  ProfilePage
//
//  Created by Ankit on 14/11/24.
//


import UIKit

class PreferencesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Outlets
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var preferencesTableView: UITableView!

    // Data source for preferences options
    let preferences = [
        PreferencesModel(title: "Language", detail: "", showDisclosure: true),
        PreferencesModel(title: "Units", detail: "Km", showDisclosure: true),
        PreferencesModel(title: "Temperature", detail: "°C", showDisclosure: true),
        PreferencesModel(title: "Theme", detail: "Light", showDisclosure: true)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up table view
        preferencesTableView.dataSource = self
        preferencesTableView.delegate = self
        preferencesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "PreferenceCell")
        
        // Set up background image and heading label
        backgroundImageView.image = UIImage(named: "Rectangle 124")
        headingLabel.text = "Preferences"
    }

    // MARK: - Table View Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return preferences.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PreferenceCell", for: indexPath)
        let preference = preferences[indexPath.row]
        
        cell.textLabel?.text = preference.title
        cell.detailTextLabel?.text = preference.detail
        cell.accessoryType = preference.showDisclosure ? .disclosureIndicator : .none
        
        return cell
    }
    
    // MARK: - Table View Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle selection
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
