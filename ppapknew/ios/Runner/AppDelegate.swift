import Flutter
import UIKit
import Contacts

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller = window?.rootViewController as! FlutterViewController
    let contactsChannel = FlutterMethodChannel(
      name: "com.example.ppapknew/contacts",
      binaryMessenger: controller.binaryMessenger
    )
    
    contactsChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
      switch call.method {
      case "getContacts":
        result(self.getContacts())
      default:
        result(FlutterMethodNotImplemented)
      }
    }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  private func getContacts() -> [[String: String]] {
    var contacts: [[String: String]] = []
    let store = CNContactStore()
    let keysToFetch = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
    
    let request = CNContactFetchRequest(keysToFetch: keysToFetch as [CNKeyDescriptor])
    request.sortOrder = .givenName
    
    do {
      try store.enumerateContacts(with: request) { (contact, _) in
        let firstName = contact.givenName
        let lastName = contact.familyName
        let fullName = "\(firstName) \(lastName)".trimmingCharacters(in: .whitespaces)
        
        for phoneNumber in contact.phoneNumbers {
          let phone = phoneNumber.value.stringValue
          if !fullName.isEmpty && !phone.isEmpty {
            contacts.append([
              "name": fullName,
              "phone": phone
            ])
          }
        }
      }
    } catch {
      print("Error fetching contacts: \(error)")
    }
    
    return contacts
  }
}
