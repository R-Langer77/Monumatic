import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var secondaryImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomButton: UIButton!
    
    
    // MARK: - Data Source
    let accountOptions: [AccountOption] = [
        AccountOption(title: "Profile", iconName: "profileIcon"),
        AccountOption(title: "Preferences", iconName: "preferencesIcon"),
        AccountOption(title: "Notifications", iconName: "notificationsIcon"),
        AccountOption(title: "Feedback", iconName: "feedbackIcon")
    ]
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the views
        setupProfileHeader()
        setupTableView()
        setupBottomButton()
    }
    
    
    
    // MARK: - Setup Methods
    func setupProfileHeader() {
        // Configure main image view
        mainImageView.image = UIImage(named: "Rectangle 124")
        mainImageView.contentMode = .scaleAspectFill
        
        // Configure secondary image view (e.g., profile picture)
        secondaryImageView.image = UIImage(named: "WhatsApp Image 2024-09-11 at 08.49.25") //
        secondaryImageView.contentMode = .scaleAspectFill
        secondaryImageView.layer.cornerRadius = secondaryImageView.frame.height / 2
        secondaryImageView.clipsToBounds = true
        
        // Configure name label
        nameLabel.text = "Account" // Replace with dynamic user data if available
        nameLabel.font = UIFont.boldSystemFont(ofSize: 28)
        nameLabel.textColor = .black
    }
    
    func setupTableView() {
        // Set up the table view data source and delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        // Register a reusable cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "AccountOptionCell")
    }
    
    func setupBottomButton() {
        // Configure the bottom button
        bottomButton.setTitle("Logout", for: .normal) // Or another action name
        bottomButton.backgroundColor = UIColor.systemYellow
        bottomButton.setTitleColor(.black, for: .normal)
        bottomButton.layer.cornerRadius = 30
        bottomButton.addTarget(self, action: #selector(bottomButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Button Actions
    @objc func bottomButtonTapped() {
        // Handle bottom button action
        print("Bottom button tapped")
        // Perform logout or navigate to another screen as needed
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountOptionCell", for: indexPath)
        
        // Configure the cell with account option data
        let option = accountOptions[indexPath.row]
        cell.textLabel?.text = option.title
        cell.accessoryType = .disclosureIndicator // Adds an arrow on the right
        
        // Add icon if available
        if let iconName = option.iconName {
            cell.imageView?.image = UIImage(named: iconName)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        // Perform the segue to navigate to PreferencesViewController
        if indexPath.row == 1 {
            performSegue(withIdentifier: "showPreferencesSegue", sender: self)
        }
        else if indexPath.row == 2{
            performSegue(withIdentifier: "showNotificationsSegue", sender: self)
        }
        else if indexPath.row == 3{
            performSegue(withIdentifier: "showFeedbackSegue", sender: self)
        }
        else if indexPath.row == 0{
            performSegue(withIdentifier: "showAccountSegue", sender: self)
        }
    }
}
