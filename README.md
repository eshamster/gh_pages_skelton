# Gh-Pages-Skelton

GithubでリポジトリごとのHPを作るための`gh-pages`ブランチをコマンド一発で作成するためのスクリプト。

## create.sh

第1引数に対象のディレクトリ（git repositoryのルート）を指定することで、jekyll向けに初期化した`gh-pages`ブランチを作成します。

- **注意：ブランチ作成後、`git rm -rf .`を実行します。念のため、事前にバックアップ（pushしておくなど）をとってください**
- README.mdまたは、README.markdownがある場合は、`gh-pages`ブランチのデフォルトのREADMEとしてコピーします

作成後、下記のコマンドで（Githubにpushする前に）確認できます。

```bash
$ gem install jekyll
$ jekyll # -> http://localhost:4000/ にアクセス
$ jekyll serve --host 0.0.0.0 # -> localhost以外から参照できるようにする場合
```

## 参考にしたサイト

- リポジトリごとのHPを作る方法
  - [Githubを使って3分でHPを公開する。](http://qiita.com/budougumi0617/items/221bb946d1c90d6769e9)
- markdownでGithubのHPを作る方法
  - [Githubページを作ってjekyll+Markdownで更新する方法](http://leko.jp/archives/371)

## ライセンス

MIT License
