//
//  ViewController.swift
//  RxSwiftSPMCocoaPodsTest
//
//  Created by takahashi_hidemune on 2022/09/20.
//

import UIKit
import WebKit
import RxSwift
import RxCocoa
import RxWebKit

class ViewController: UIViewController {
    let disposeBag = DisposeBag()

    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        webView.rx.loading
            .asDriver(onErrorJustReturn: false)
            .drive(onNext: { isLoading in
                print("DEBUG: \(isLoading)")
            })
            .disposed(by: disposeBag)

        webView.load(
            URLRequest(
                url: URL(string: "https://www.google.com")!
            )
        )
    }
}

