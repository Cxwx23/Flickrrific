//
//  WebKitView.swift
//  Flickrrific
//
//  Created by Cole Warner on 9/25/24.
//


import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var htmlContent: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.loadHTMLString(htmlContent, baseURL: nil)
    }
}
