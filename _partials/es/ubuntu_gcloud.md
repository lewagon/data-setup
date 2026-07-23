## CLI de Google Cloud

Instala la CLI de `gcloud` para comunicar con [Google Cloud Platform](https://cloud.google.com/) a través de la terminal:
```bash
sudo apt-get update && sudo apt-get install ca-certificates gnupg curl
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get update && sudo apt-get install google-cloud-cli
```
👉 [Documentación para la instalación](https://cloud.google.com/sdk/docs/install#deb)
