### Configurar Cloud SDK

- Autentica la CLI de `gcloud` con la cuenta de Google que utilizaste para GCP

  {% if os == "macos" %}
  ```bash
  gcloud auth login
  ```
  {% elsif os == "linux" %}
  ```bash
  gcloud auth login
  ```
  {% elsif os == "windows" %}
  ```bash
  gcloud auth login --no-launch-browser
  ```
  {% endif %}

- Inicia sesión en tu cuenta de Google en la nueva pestaña que se abrió en tu navegador web

- Muestra tu cuenta activa y comprueba que aparece la dirección de correo electrónico que utilizaste para GCP

  ```bash
  gcloud auth list
  ```

- Establece tu proyecto actual (reemplaza `PROJECT_ID` por el `ID` de tu proyecto, por ejemplo, `wagon-bootcamp-123456`)

  ```bash
  gcloud config set project PROJECT_ID
  ```

- Muestra tu cuenta activa y tu proyecto actual, y comprueba que aparece tu proyecto

  ```bash
  gcloud config list
  ```

- Ahora vamos a configurar las credenciales predeterminadas de la aplicación para que tu código Python pueda acceder a GCP:

  ```bash
  gcloud auth application-default login
  ```

  Esto abrirá una ventana del navegador. Inicia sesión con la misma cuenta de Google que utilizaste para crear tu proyecto de GCP. Tus credenciales se guardarán automáticamente.

- Verifiquemos que tus credenciales predeterminadas de la aplicación funcionan:

  ```bash
  gcloud auth application-default print-access-token
  ```

  Deberías ver una cadena de token larga. Si aparece un error, vuelve a ejecutar `gcloud auth application-default login`.

  <details>
    <summary>Solución de problemas</summary>

  - `AccessDeniedException: 403 The project to be billed is associated with an absent billing account.`
    - Asegúrate de que la facturación esté habilitada para tu proyecto de Google Cloud Platform [https://cloud.google.com/billing/docs/how-to/modify-project](https://cloud.google.com/billing/docs/how-to/modify-project)
  </details>

🏁 ¡Has terminado la configuración de GCP!
