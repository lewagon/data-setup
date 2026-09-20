
### Configuración del proyecto

- Ve a [Google Cloud](https://console.cloud.google.com/) y crea una cuenta si aún no tienes una
- En Cloud Console, en la lista de proyectos, selecciona o crea un proyecto de Cloud

⚠️ **Importante:** Al crear un proyecto nuevo, verás un campo **Organization**. Déjalo como **"No organization"**. No selecciones ni crees una organización. Elegir una organización aplica restricciones que pueden impedirte utilizar los servicios de Google Cloud durante el bootcamp.

![](images/gcp-create-project.png)

- Asígnale un nombre, por ejemplo, `Wagon Bootcamp`
- Observa el `ID` que se crea automáticamente para el proyecto, por ejemplo, `wagon-bootcamp-123456`

![](images/gcp_project.png)

ℹ️ Anota el **Project ID** (por ejemplo, `wagon-bootcamp-123456`), que **no** es lo mismo que el nombre del proyecto que elegiste (por ejemplo, `Wagon Bootcamp`). Necesitarás el ID más adelante al ejecutar comandos en la terminal, pero no te preocupes: siempre puedes encontrarlo en Google Cloud.

### Idioma de la cuenta

Para facilitar el seguimiento de las instrucciones durante el bootcamp, abre las preferencias de tu cuenta de Google Cloud:

[https://myaccount.google.com/language](https://myaccount.google.com/language)

Si el *idioma preferido* no es:

- **English**
- **United States**

Entonces cambia el idioma a inglés:

- Haz clic en el icono del lápiz de edición
- Selecciona **English**
- Selecciona **United States**
- Haz clic en **Select**

### Cuenta de facturación

Ahora vincularás tu cuenta a tu tarjeta de crédito. Este paso es obligatorio; de lo contrario, no podrás utilizar los servicios proporcionados por Google Cloud. No te preocupes: podrás utilizar la mayoría de los servicios de Google Cloud mediante créditos gratuitos durante el bootcamp.

⚠️ En algunos casos, Google puede hacer un cargo en tu tarjeta (de unos 10 €) para verificar que es válida. Desafortunadamente, no se reembolsará una vez aprobada, pero se añadirá como crédito en Google Cloud que podrás utilizar cuando hayas usado o hayan caducado tus créditos gratuitos.

![](images/gcp-billing.png)

- Haz clic en **Billing**
- Haz clic en **MANAGE BILLING ACCOUNTS**
- Haz clic en **ADD BILLING ACCOUNT**
- Ponle un nombre a tu cuenta de facturación, por ejemplo, `My Billing Account`
- Haz clic en "I have read..." y acepta las condiciones del servicio
- Haz clic en **CONTINUE**
- Selecciona el tipo de cuenta: `Individual`
- Introduce tu nombre y dirección

Deberías ver que tienes un crédito gratuito de "$300 credits over the next 90days".

- Haz clic en los datos de la tarjeta
- Introduce los datos de tu tarjeta de crédito
- Haz clic en **START MY FREE TRIAL**

Una vez hecho esto, verifica que tu cuenta de facturación esté vinculada a tu proyecto de Google Cloud.

- Selecciona tu proyecto
- Ve a **Billing**
- Selecciona **LINK A BILLING ACCOUNT**
- Selecciona `My Billing Account`
- Haz clic en **SET ACCOUNT**

Ahora deberías ver:

```bash
Free trial status: $300 credit and 91 days remaining - with a full account, you'll get unlimited access to all of Google Cloud Platform.
```

<details>
  <summary>👉 Si no tienes una tarjeta de crédito 👈</summary>

Si no tienes una tarjeta de crédito, una alternativa es crear una cuenta de **Revolut**.
Revolut es una aplicación financiera que te permite crear una tarjeta de crédito virtual vinculada a tu cuenta de facturación del teléfono móvil.

Omite este paso si tienes una tarjeta de crédito y la utilizas para la configuración.

Descarga la aplicación Revolut o visita [revolut](https://www.revolut.com/a-radically-better-account) y sigue los pasos para descargar la aplicación (introduce tu número de teléfono móvil y haz clic en Get Started).

- Abre la aplicación Revolut
- Introduce tu número de teléfono móvil
- Introduce el código de verificación recibido por SMS
- La aplicación te pedirá tu país, dirección, nombre y apellidos, fecha de nacimiento y dirección de correo electrónico
- La aplicación también te pedirá un selfie y tu profesión
- La aplicación requerirá una foto de tu documento de identidad o pasaporte

Una vez hecho esto, selecciona el plan estándar (gratuito). No es necesario añadir la tarjeta a Apple Pay, solicitar el envío de una tarjeta física ni añadir dinero.

Ahora tienes una tarjeta virtual que utilizaremos para configurar Google Cloud.

En la vista principal de la aplicación Revolut

- Haz clic en Ready to use
- Haz clic en la tarjeta
- Haz clic en Show card details
- Anota los datos de la tarjeta de crédito virtual y utilízalos para continuar con la configuración de Google Cloud

</details>

<details>
  <summary>👉 Si recibes un correo de Google que dice "Urgent: your billing account XXXXXX-XXXXXX-XXXXXX has been suspended" 👈</summary>

Esto puede ocurrir especialmente si acabas de configurar una cuenta de Revolut.

- Haz clic en PROCEED TO VERIFICATION
- Se te pedirá que envíes una foto de tu tarjeta de crédito (solo los últimos 4 dígitos, sin ninguna otra información)
- Si utilizaste **Revolut**, puedes enviar una captura de pantalla de tu tarjeta de crédito virtual (no olvides eliminar la fecha de caducidad de la captura)
- Explica que estás asistiendo al bootcamp de Le Wagon, que no tienes una tarjeta de crédito y que acabas de crear una cuenta de Revolut para configurar Google Cloud para el bootcamp mediante una tarjeta de crédito virtual

Puedes recibir una validación o solicitudes de más información en un plazo de 30 minutos.

Una vez completada la verificación, deberías recibir un correo que indique: "Your Google Cloud Platform billing account XXXXXX-XXXXXX-XXXXXX has been fully reinstated and is ready to use.".

</details>

### Activación de los servicios de Google Cloud

- Asegúrate de que la facturación esté activada para tu proyecto de Google Cloud

ℹ️ Tienes un **crédito de 300 $** para utilizar en recursos de Google Cloud, más que suficiente para el bootcamp.

- [Activa las API de BigQuery y Compute Engine](https://console.cloud.google.com/flows/enableapi?apiid=bigquery,compute) (Este paso puede tardar unos minutos)

¡Eso es todo para la configuración en el navegador! La configuración de la terminal aparece más adelante en esta guía.
