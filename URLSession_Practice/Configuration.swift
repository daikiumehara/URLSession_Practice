//
//  Configuration.swift
//  URLSession_Practice
//
//  Created by daiki umehara on 2021/07/03.
//

import Foundation

struct Configurations {
    // デフォルトのセッション
    // ディスクの保存されるキャッシュ、認証情報、クッキーを使用する
    static func makeDefault() -> URLSessionConfiguration {
        let configuration = URLSessionConfiguration.default
        return configuration
    }

    // 一時セッション
    // キャッシュ、クッキー、認証情報を端末のディスクに書き込まず、メモリーに保存する。
    // セッションが破棄されるとキャッシュやクッキーも破棄される。
    static func makeEphemeral() -> URLSessionConfiguration {
        let configuration = URLSessionConfiguration.ephemeral
        return configuration
    }

    // バックグラウンドセッション
    // アップロード、ダウンロードをバックグラウンドで行う。
    static func makeBackground() -> URLSessionConfiguration {
        let configuration = URLSessionConfiguration.background(withIdentifier: "download")
        return configuration
    }
}
