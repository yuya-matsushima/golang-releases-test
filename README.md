# ghr を使った github releases へのバイナリアップロード処理

- 同一バージョン, 同一ファイル名で再アップロードする場合 ghr の `--delete` オプションを使う
- `GITHUB_TOKEN` を circleci の `Environment Variables` から登録しておく
