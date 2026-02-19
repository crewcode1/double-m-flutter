import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {

  private var blurView: UIVisualEffectView?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    // Listen for screen recording start/stop
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(screenCaptureChanged),
      name: UIScreen.capturedDidChangeNotification,
      object: nil
    )

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  @objc private func screenCaptureChanged() {
    if UIScreen.main.isCaptured {
      showBlur()
    } else {
      hideBlur()
    }
  }

  private func showBlur() {
    guard blurView == nil else { return }

    let blurEffect = UIBlurEffect(style: .dark)
    let blurEffectView = UIVisualEffectView(effect: blurEffect)
    blurEffectView.frame = UIScreen.main.bounds
    blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    blurEffectView.tag = 999

    UIApplication.shared.windows.first?.addSubview(blurEffectView)
    blurView = blurEffectView
  }

  private func hideBlur() {
    blurView?.removeFromSuperview()
    blurView = nil
  }
}
