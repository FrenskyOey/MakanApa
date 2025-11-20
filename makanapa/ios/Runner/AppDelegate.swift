import Flutter
import UIKit
import Photos

@main
@objc class AppDelegate: FlutterAppDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // Must match the channel name in Dart
    let CHANNEL = "com.makanapa.app/image_channels"
    
    // To hold the result callback for MethodChannel
    private var methodResult: FlutterResult?
    
    override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
              let galleryChannel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: controller.binaryMessenger)
              
              galleryChannel.setMethodCallHandler({
                  (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
                  
                  // Store the result callback
                  self.methodResult = result
                  
                  if call.method == "openGallery" {
                      self.openGalleryIntent(viewController: controller)
                  } else if call.method == "openCamera" {
                      self.openCameraIntent(viewController: controller)
                  }else {
                      result(FlutterMethodNotImplemented)
                  }
    })
      
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    private func openGalleryIntent(viewController: UIViewController) {
            // Check for Photo Library authorization status
            // (Real-world apps should handle permissions gracefully)
            
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .photoLibrary // Specify the source (gallery)
            viewController.present(picker, animated: true, completion: nil)
        }

        // B. Handle the result of the image picker
        
        // Called when the user selects an image
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            picker.dismiss(animated: true) {
                guard let image = info[.originalImage] as? UIImage else {
                            // Handle error: Image not found in info dictionary
                            self.methodResult?(nil)
                            self.methodResult = nil
                            return
                        }

                        // 1. Convert the UIImage to JPEG data
                        // Setting compressionQuality to 0.8 is a good default for upload
                        guard let jpegData = image.jpegData(compressionQuality: 0.8) else {
                            self.methodResult?(nil)
                            self.methodResult = nil
                            return
                        }

                        // 2. Create a unique file name and temporary path
                        let fileName = UUID().uuidString + ".jpeg"
                        let tempDirectory = NSTemporaryDirectory()
                        let tempFilePath = (tempDirectory as NSString).appendingPathComponent(fileName)

                        // 3. Write the image data to the temporary path
                        do {
                            try jpegData.write(to: URL(fileURLWithPath: tempFilePath))
                            
                            // 4. Send the absolute path back to Flutter
                            // This path does NOT contain the 'file://' prefix and is ready for Dart's File()
                            self.methodResult?(tempFilePath)

                        } catch {
                            // Handle error: Failed to save file to temp directory
                            print("Error writing image to temporary file: \(error)")
                            self.methodResult?(nil)
                        }

                        // Reset the result callback
                        self.methodResult = nil
                    }
        }
        
        // Called when the user cancels the picker
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true) {
                // Send null to Flutter to indicate cancellation
                self.methodResult?(nil)
                // Reset the result callback
                self.methodResult = nil
            }
        }
    
    private func openCameraIntent(viewController: UIViewController) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .camera 
            picker.allowsEditing = false
            viewController.present(picker, animated: true, completion: nil)
        } else {
            self.methodResult?("CAMERA_UNAVAILABLE")
            self.methodResult = nil
        }
    }
}
