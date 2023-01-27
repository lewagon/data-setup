
<details>
  <summary>ℹ️ ¿Cómo encontrar la ruta absoluta de un archivo?</summary>
  Puedes arrastrar el archivo a tu terminal.
</details>

**Reinicia** tu terminal y ejecuta lo siguiente:

``` bash
echo $GOOGLE_APPLICATION_CREDENTIALS
```

Deberías obtener la siguiente información:

```bash
/some/absolute/path/to/your/gcp/SERVICE_ACCOUNT_JSON_FILE_CONTAINING_YOUR_SECRET_KEY.json
```

Ahora verifica si la ruta al archivo json de tu cuenta de servicio es el correcto:

``` bash
cat $(echo $GOOGLE_APPLICATION_CREDENTIALS)
```

👉 Este comando debería mostrar el contenido del archivo json de tu cuenta de servicio. Si no es el caso, pídele ayuda a un TA 🙏

Tu código y utilidades ahora pueden acceder a los recursos de tu cuenta GCP.

Continuemos con los últimos pasos de la configuración...

- Lista las cuentas de servicio asociadas a tu cuenta activa y a tu proyecto actual
```bash
gcloud iam service-accounts list
```
- Recupera el email de la cuenta de servicio e. g. `SERVICE_ACCOUNT_NAME@PROJECT_ID.iam.gserviceaccount.com`
- Lista los roles de la cuenta de servicio desde la cli (reemplaza el PROJECT_ID y el SERVICE_ACCOUNT_EMAIL)
```bash
gcloud projects get-iam-policy PROJECT_ID \
--flatten="bindings[].members" \
--format='table(bindings.role)' \
--filter="bindings.members:SERVICE_ACCOUNT_EMAIL"
```
- Ahora deberías ver que tu cuenta de servicio tiene el rol de `roles/owner`

<details>
  <summary>Resolución de problemas</summary>

- `AccessDeniedException: 403 The project to be billed is associated with an absent billing account.`. Esto significa que el proyecto a facturar está asociado a una cuenta de facturación que no está habilitada
  - Asegúrate de habilitar la facturación para tu proyecto https://cloud.google.com/billing/docs/how-to/modify-project
</details>

🏁 Listo. ¡Has terminado la configuración de GCP!
