# Auth Controller API Documentation

Base URL: `http://doublemapi-001-site1.ktempurl.com`

## [POST] /api/Auth/register

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK | AuthResponseDto |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/Auth/register"
```
---

## [POST] /api/Auth/login

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Request Body
**Content-Type:** `application/json`
**Schema Type:** `LoginDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| email | string |  |
| password | string |  |
**Content-Type:** `text/json`
**Schema Type:** `LoginDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| email | string |  |
| password | string |  |
**Content-Type:** `application/*+json`
**Schema Type:** `LoginDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| email | string |  |
| password | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK | AuthResponseDto |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/Auth/login" -H "Content-Type: application/json" -d '{
  // Add request body here
}'
```
---

## [POST] /api/Auth/verify-email

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Request Body
**Content-Type:** `application/json`
**Schema Type:** `VerifyEmailDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| email | string |  |
| otp | string |  |
**Content-Type:** `text/json`
**Schema Type:** `VerifyEmailDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| email | string |  |
| otp | string |  |
**Content-Type:** `application/*+json`
**Schema Type:** `VerifyEmailDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| email | string |  |
| otp | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/Auth/verify-email" -H "Content-Type: application/json" -d '{
  // Add request body here
}'
```
---

## [POST] /api/Auth/resend-verification-otp

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Request Body
**Content-Type:** `application/json`
**Schema Type:** `ResendOtpDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| email | string |  |
**Content-Type:** `text/json`
**Schema Type:** `ResendOtpDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| email | string |  |
**Content-Type:** `application/*+json`
**Schema Type:** `ResendOtpDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| email | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/Auth/resend-verification-otp" -H "Content-Type: application/json" -d '{
  // Add request body here
}'
```
---

## [POST] /api/Auth/refresh-token

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Request Body
**Content-Type:** `application/json`
**Schema Type:** `RefreshTokenDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| token | string |  |
| refreshToken | string |  |
**Content-Type:** `text/json`
**Schema Type:** `RefreshTokenDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| token | string |  |
| refreshToken | string |  |
**Content-Type:** `application/*+json`
**Schema Type:** `RefreshTokenDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| token | string |  |
| refreshToken | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK | AuthResponseDto |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/Auth/refresh-token" -H "Content-Type: application/json" -d '{
  // Add request body here
}'
```
---

## [POST] /api/Auth/logout

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/Auth/logout"
```
---

## [POST] /api/Auth/confirm-email

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| userId | query | No | string |  |
| token | query | No | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/Auth/confirm-email"
```
---

## [POST] /api/Auth/change-password

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Request Body
**Content-Type:** `application/json`
**Schema Type:** `ChangePasswordDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| currentPassword | string |  |
| newPassword | string |  |
| confirmPassword | string |  |
**Content-Type:** `text/json`
**Schema Type:** `ChangePasswordDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| currentPassword | string |  |
| newPassword | string |  |
| confirmPassword | string |  |
**Content-Type:** `application/*+json`
**Schema Type:** `ChangePasswordDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| currentPassword | string |  |
| newPassword | string |  |
| confirmPassword | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/Auth/change-password" -H "Content-Type: application/json" -d '{
  // Add request body here
}'
```
---

## [POST] /api/Auth/forgot-password

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Request Body
**Content-Type:** `application/json`
**Schema Type:** `ForgotPasswordDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| email | string |  |
| redirectUrl | string |  |
**Content-Type:** `text/json`
**Schema Type:** `ForgotPasswordDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| email | string |  |
| redirectUrl | string |  |
**Content-Type:** `application/*+json`
**Schema Type:** `ForgotPasswordDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| email | string |  |
| redirectUrl | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/Auth/forgot-password" -H "Content-Type: application/json" -d '{
  // Add request body here
}'
```
---

## [POST] /api/Auth/reset-password

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Request Body
**Content-Type:** `application/json`
**Schema Type:** `ResetPasswordDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| userId | string |  |
| token | string |  |
| newPassword | string |  |
| confirmPassword | string |  |
**Content-Type:** `text/json`
**Schema Type:** `ResetPasswordDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| userId | string |  |
| token | string |  |
| newPassword | string |  |
| confirmPassword | string |  |
**Content-Type:** `application/*+json`
**Schema Type:** `ResetPasswordDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| userId | string |  |
| token | string |  |
| newPassword | string |  |
| confirmPassword | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/Auth/reset-password" -H "Content-Type: application/json" -d '{
  // Add request body here
}'
```
---

## [POST] /api/Auth/biometric-login

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Request Body
**Content-Type:** `application/json`
**Schema Type:** `BiometricLoginDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| biometricToken | string |  |
| deviceId | string |  |
**Content-Type:** `text/json`
**Schema Type:** `BiometricLoginDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| biometricToken | string |  |
| deviceId | string |  |
**Content-Type:** `application/*+json`
**Schema Type:** `BiometricLoginDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| biometricToken | string |  |
| deviceId | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK | AuthResponseDto |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/Auth/biometric-login" -H "Content-Type: application/json" -d '{
  // Add request body here
}'
```
---

