# User Controller API Documentation

Base URL: `http://doublemapi-001-site1.ktempurl.com`

## [GET] /api/User/profile

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK | UserProfileDto |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/User/profile"
```
---

## [PUT] /api/User/profile

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Request Body
**Content-Type:** `application/json`
**Schema Type:** `UpdateUserDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| fullName | string |  |
| phoneNumber | string |  |
| specialty | string |  |
| language | string |  |
| darkMode | boolean |  |
**Content-Type:** `text/json`
**Schema Type:** `UpdateUserDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| fullName | string |  |
| phoneNumber | string |  |
| specialty | string |  |
| language | string |  |
| darkMode | boolean |  |
**Content-Type:** `application/*+json`
**Schema Type:** `UpdateUserDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| fullName | string |  |
| phoneNumber | string |  |
| specialty | string |  |
| language | string |  |
| darkMode | boolean |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X PUT "http://doublemapi-001-site1.ktempurl.com/api/User/profile" -H "Content-Type: application/json" -d '{
  // Add request body here
}'
```
---

## [POST] /api/User/profile-picture

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Request Body
**Content-Type:** `multipart/form-data`
**Schema Type:** `object`

**Properties:**

| Name | Type | Description |
|---|---|---|
| file | File (binary) |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/User/profile-picture"
```
---

## [POST] /api/User/change-password

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
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/User/change-password" -H "Content-Type: application/json" -d '{
  // Add request body here
}'
```
---

## [DELETE] /api/User/account

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X DELETE "http://doublemapi-001-site1.ktempurl.com/api/User/account"
```
---

