# Use a imagem oficial do Python 3.13.5 com Alpine Linux para um tamanho de imagem menor.
FROM python:3.13.5-alpine3.22

# Define o diretório de trabalho dentro do contêiner.
WORKDIR /app

# Copia o arquivo de requirements para o diretório de trabalho.
COPY requirements.txt .

# Instala as dependências do projeto sem usar cache para reduzir o tamanho da imagem.
RUN pip install --no-cache-dir -r requirements.txt

# Copia todo o código do projeto para o diretório de trabalho.
COPY . .

Expose 8000

# Define o comando para iniciar a aplicação usando Uvicorn.
# Uvicorn executará o arquivo app.py, acessando o objeto app.
# A aplicação estará acessível em todas as interfaces (0.0.0.0) na porta 8000.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
