//
//  ViewController.swift
//  web
//
//  Created by 성준모 on 2022/05/14.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    //url의 인수를 통해 웹 페이지ㅢ 주소를 전달받아 웹 페이지를 보여줌
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
        
        myWebView.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading),
            options: .new , context: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadWebPage("https://cafe.daum.net/VIVIZ") //앱 실행시 초기 홈페이지를 불러옴
    }
    
        override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
            if keyPath == "loading"{
                if myWebView.isLoading{
                    myActivityIndicator.startAnimating()
                    myActivityIndicator.isHidden = false
                } else {
                    myActivityIndicator.stopAnimating()
                    myActivityIndicator.isHidden = true
                }
            }
        }
    
    // "http//" 문자열이 없을 경우 자동으로 삽입
    func checkUrl(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag{
            strUrl = "http://" + strUrl
        }
        return strUrl
    }

    //텍스트 필드에 적힌 주소로 웹 뷰 로딩
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
    
    // [site1] 버튼 클릭시 아래의 주소로 이동
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("https://youtu.be/OF6tzAC0AJE")
    }
    
    // [site2] 버튼 클릭시 아래의 주소로 이동
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("https://youtu.be/9lC0kKObP0M")
    }
    
    //HTML 코드를 변수에 저장하고 [html]버튼을 클리가혐ㄴ
    //HTML 문법에 맞게 작성된 문자열 변수를 웹 뷰로 나타냄
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹 페이지 </p><p><a href=\"http:cafe.daum.net/VIVIZ\">daum cafe</a>으로 이동</p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    // htmlView.html을 웹 뷸로 나타냄
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading() // 웹 페이지의 로딩을 중지
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()  // 웹 페이지를 재로딩
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()  // 이전 웹 페이지로 이동
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()   // 다음 웹 페이지로 이동 
    }
    
    
}

