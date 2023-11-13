import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate, WKNavigationDelegate {

    @IBOutlet var bookMarkSegmentedControl: UISegmentedControl!
    
    @IBOutlet var urlTextField: UITextField!
    
    @IBOutlet var mainWebView: WKWebView!
    
    @IBOutlet var spinningActivityindicatorView: UIActivityIndicatorView!
    
    @IBAction func bookMarkAction(_ sender: Any) {
        
        let bookMarkUrl = bookMarkSegmentedControl.titleForSegment(at: bookMarkSegmentedControl.selectedSegmentIndex)
        
        let urlString = "http://www.\(bookMarkUrl!).com"
        
        mainWebView.load(URLRequest(url: URL(string: urlString)!))
        
        // 버튼을 누를 때마다, 해당 url이 나오도록 설정
        urlTextField.text = urlString
    }
    
    // return key 영역 부분이 눌렸을 때 해당 Url로 이동
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        var urlString = "\(urlTextField.text!)"
        
        // 만일 사용자가 url을 입력할 떄, http를 입력하지 않았다면 자동으로 추가해주기
        if !urlString.hasPrefix("http://") {
            urlString = "http://\(urlTextField.text!)"
        }
        
        mainWebView.load(URLRequest(url: URL(string: urlString)!))
        
        // 키보드가 비활성화 되면서 내려가도록 함
        textField.resignFirstResponder()
        
        return true
    }

    // webView가 frame을 로딩하게 되면(통신을 하게 되면) webView 메소드에게 이벤트를 전달하여 처리하는 부분
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        spinningActivityindicatorView.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        spinningActivityindicatorView.stopAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "http://www.facebook.com"
        mainWebView.load(URLRequest(url: URL(string: urlString)!))
        urlTextField.text = urlString
    }
        
}
