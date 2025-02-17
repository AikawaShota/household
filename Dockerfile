FROM golang:latest
WORKDIR /app

# go.mod と go.sum をコンテナ内にコピー
COPY go.mod go.sum ./

# 依存関係の解決
RUN go mod tidy
RUN go mod download

# アプリのコードをコピー
COPY . .

# アプリをビルド
RUN go build -o main .

# アプリを実行
CMD ["./main"]