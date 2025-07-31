# ベースイメージ
FROM python:3.11-slim

# 作業ディレクトリの作成
WORKDIR /app

# 依存関係ファイルのコピーとインストール
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# アプリケーションのコピー
COPY . .

# ポート解放
EXPOSE 8000

# FastAPIアプリを起動（Uvicorn）
CMD ["uvicorn", "api.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
