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

        // セッション内の全てのタスクに追加される追加のヘッダを指定する。
        // デフォルトは空の配列
        configuration.httpAdditionalHeaders = [:]

        // どのようなデータを扱うか(基本的なトラフィックが何に使用されているか)をOSに教えることで、
        // トラフィックの優先順位付などを行い、パフォーマンスを最適に保つことができる。
        configuration.networkServiceType = .voice

        // セルラーネットワークで通信を行うかを設定する。
        // デフォルトはtrueで、falseにするとwi-fi接続時しか通信を行わないようにする。
        configuration.allowsCellularAccess = false

        // 追加データを待つときに使用するタイムアウト間隔
        // タスクが追加データを待ってから諦めるまでの時間を制御する。デフォルトが60
        configuration.timeoutIntervalForRequest = 60

        // リソース要求にかかる時間の最大値
        // セッション内の全てのタスクのリソース・タイムアウト間隔を決定する。
        // リソース・タイムアウト間隔はリソース全体が転送されるのを(秒単位で)どれだけ待つかを制御する。デフォルトは7日
        configuration.timeoutIntervalForResource = 10000

        // アプリの拡張機能で使用するURLセッションを作成する際に使用する、
        // 共有されるコンテナの有効な識別子を設定する
        configuration.sharedContainerIdentifier = "download"

        // セッションが接続可能になるのを待つべきか、すぐに失敗するべきかを示すブール値。
        // このプロパティの値がtrueで十分な接続性が得られない場合、
        // URLSessionTaskDelegateのurlSession(_: taskIsWaitingForConnectivity)メソッドを呼び出し、
        // 接続性を待つ。接続が可能になるとタスクは作業を開始し、通常通りDelegateまたはcompletion Handlerが呼ばれる。
        configuration.waitsForConnectivity = true

        // バックグラウンド時に有効になるプロパティで、trueにすることで実行タイミングをシステムに任せ、
        // 最適なタイミングでタスクを実行する。
        configuration.isDiscretionary = true

        // ユーザが省エネモードをONにしているときに、接続がネットワークを使用できるかどうかを示すブール値。
        // このプロパティがfalseで、利用可能な制約のないネットワークインタフェースがない時はタスクが失敗する。
        // waitForConnectivityをtrueにすることで、適切なインタフェースが利用可能になるのを待つ。
        configuration.allowsConstrainedNetworkAccess = false

        // システムが効果だと考えるネットワークインタフェースを使用した接続を許可するかどうかを示すブール値。
        configuration.allowsExpensiveNetworkAccess = false

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
