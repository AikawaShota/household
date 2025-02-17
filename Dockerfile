FROM golang:tip-alpine3.21
WORKDIR /app

# go.mod と go.sum をコンテナ内にコピー
COPY go.mod go.sum ./

# 依存関係をダウンロード（Gin もこのタイミングでインストールされる）
RUN go mod download

# アプリのコードをコピー
COPY . .

# アプリを実行
CMD ["go", "run", "main.go"]