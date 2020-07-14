# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
# ゴシメイ！
### 求職者が自分にマッチする好きなエージェントを検索・直接やりとりすることができるサービスです。

## URL
https://goshimei-agent.com

![](2020-07-14-09-06-28.png)


## サービスの概要
求職者が自分にマッチする好きなエージェントを検索・直接やりとりすることが
できるアプリです。
企業からのスカウトを待つのではなく、求職者が主体的にエージェントを
探すことができます。
求職者は無料で使用でき、求職者とマッチングし自社に登録いただけた場合、企業側
から手数料を頂くビジネスモデルです。


## ターゲット

* 求職者側
  * 転職を本格的に考えているが、何から始めればいいのか分からない、初めての転職活動の方。
    相性の良さそうなエージェントから丁寧にサポートしてほしい。
  * 業界経験が長く、業種知識が豊富なミドル〜シニア層。
    業界情報やキーパーソンとのコネクションがあるエージェントにサポートしてほしい。

* 企業側
  * 自社の求人や担当業界にマッチする求職者を集客したい人材エージェント。


## 使用技術
* 言語
  * HTML5 CSS JavaScript Ruby2.5
* データベース
  * MySQL5.7
* フレームワーク
  * Ruby on Rails5.2 Bootstrap
* インフラ
  * AWS
    * EC2 RDS VPC Route53 ElasticIP ACM
  * Unicorn Nginx

## 構成図
* ER図

![](2020-07-14-09-32-30.png)

* インフラ図

![](2020-07-14-09-36-51.png)

## このサービスを考えたきっかけ

以下2点がきっかけとなります。
* 日本の転職エージェント会社は
Facebook　イギリス　指名料

## 苦労した点、学び
