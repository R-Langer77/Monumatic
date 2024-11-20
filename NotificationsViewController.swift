import UIKit

class NotificationsViewController: UIViewController {
    
    // Outlets for top UI elements
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    
    // Outlets for notification labels and switches
    @IBOutlet weak var pushNotificationLabel: UILabel!
    @IBOutlet weak var emailNotificationLabel: UILabel!
    @IBOutlet weak var pushNotificationSwitch: UISwitch!
    @IBOutlet weak var emailNotificationSwitch: UISwitch!
    
    // Data model to store notification settings
    var notificationSettings = NotificationSettings(isPushNotificationsEnabled: true, isEmailNotificationsEnabled: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the top UI elements
        backgroundImageView.image = UIImage(named: "Rectangle 124") // Set the image name here
        headerLabel.text = "Notifications"
        headerLabel.font = UIFont.boldSystemFont(ofSize: 24)
        headerLabel.textColor = .black
        
        // Set initial switch states based on the model
        pushNotificationSwitch.isOn = notificationSettings.isPushNotificationsEnabled
        emailNotificationSwitch.isOn = notificationSettings.isEmailNotificationsEnabled
        
        // Set text for notification labels
        pushNotificationLabel.text = "Push notifications"
        emailNotificationLabel.text = "Email notifications"
        
        // Add target actions for switches
        pushNotificationSwitch.addTarget(self, action: #selector(didTogglePushNotificationSwitch), for: .valueChanged)
        emailNotificationSwitch.addTarget(self, action: #selector(didToggleEmailNotificationSwitch), for: .valueChanged)
    }
    
    // Method called when the push notification switch is toggled
    @objc func didTogglePushNotificationSwitch(_ sender: UISwitch) {
        notificationSettings.isPushNotificationsEnabled = sender.isOn
        print("Push notifications enabled: \(sender.isOn)")
        
        // Optional: Save the setting to UserDefaults
        UserDefaults.standard.set(sender.isOn, forKey: "isPushNotificationsEnabled")
    }
    
    // Method called when the email notification switch is toggled
    @objc func didToggleEmailNotificationSwitch(_ sender: UISwitch) {
        notificationSettings.isEmailNotificationsEnabled = sender.isOn
        print("Email notifications enabled: \(sender.isOn)")
        
        // Optional: Save the setting to UserDefaults
        UserDefaults.standard.set(sender.isOn, forKey: "isEmailNotificationsEnabled")
    }
    
    // Optional: Load saved settings from UserDefaults
    func loadNotificationSettings() {
        let isPushEnabled = UserDefaults.standard.bool(forKey: "isPushNotificationsEnabled")
        let isEmailEnabled = UserDefaults.standard.bool(forKey: "isEmailNotificationsEnabled")
        
        notificationSettings = NotificationSettings(isPushNotificationsEnabled: isPushEnabled, isEmailNotificationsEnabled: isEmailEnabled)
    }
}

