import UIKit
import WebKit
class DetalleViewController: UIViewController, WKUIDelegate, WKNavigationDelegate{

    
    var url : String!
    var web : WKWebView!
    
    override func loadView() {
        let webConfiguracion = WKWebViewConfiguration()
        web = WKWebView(frame: .zero, configuration: webConfiguracion)
        web.uiDelegate = self
        web.navigationDelegate = self
        view = web
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(url)
        let urlCargar = URL(string: url)
        let request = URLRequest(url: urlCargar!)
        web.load(request)
        
        
    }
    
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if let server = challenge.protectionSpace.serverTrust {
            completionHandler(.useCredential, URLCredential(trust: server))
        }
    }



}
