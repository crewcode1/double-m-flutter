# AdminUserManagement Controller API Documentation

Base URL: `http://doublemapi-001-site1.ktempurl.com`

## [POST] /api/admin/users/create

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Request Body
**Content-Type:** `application/json`
**Schema Type:** `CreateAdminUserDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| email | string |  |
| password | string |  |
| fullName | string |  |
| phoneNumber | string |  |
**Content-Type:** `text/json`
**Schema Type:** `CreateAdminUserDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| email | string |  |
| password | string |  |
| fullName | string |  |
| phoneNumber | string |  |
**Content-Type:** `application/*+json`
**Schema Type:** `CreateAdminUserDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| email | string |  |
| password | string |  |
| fullName | string |  |
| phoneNumber | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/admin/users/create" -H "Content-Type: application/json" -d '{
  // Add request body here
}'
```
---

## [PUT] /api/admin/users/update/{userId}

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| userId | path | Yes | string |  |

### Request Body
**Content-Type:** `application/json`
**Schema Type:** `UpdateAdminUserDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| email | string |  |
| fullName | string |  |
| phoneNumber | string |  |
| isActive | boolean |  |
**Content-Type:** `text/json`
**Schema Type:** `UpdateAdminUserDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| email | string |  |
| fullName | string |  |
| phoneNumber | string |  |
| isActive | boolean |  |
**Content-Type:** `application/*+json`
**Schema Type:** `UpdateAdminUserDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| email | string |  |
| fullName | string |  |
| phoneNumber | string |  |
| isActive | boolean |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X PUT "http://doublemapi-001-site1.ktempurl.com/api/admin/users/update/{userId}" -H "Content-Type: application/json" -d '{
  // Add request body here
}'
```
---

## [GET] /api/admin/users/all

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| role | query | No | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK | UserDto[] |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/admin/users/all"
```
---

## [GET] /api/admin/users/paged

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| pageNumber | query | No | integer |  |
| pageSize | query | No | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/admin/users/paged"
```
---

## [GET] /api/admin/users/{userId}

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| userId | path | Yes | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK | UserDetailsDto |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/admin/users/{userId}"
```
---

## [DELETE] /api/admin/users/{userId}

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| userId | path | Yes | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X DELETE "http://doublemapi-001-site1.ktempurl.com/api/admin/users/{userId}"
```
---

## [POST] /api/admin/users/{userId}/deactivate

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| userId | path | Yes | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/admin/users/{userId}/deactivate"
```
---

## [POST] /api/admin/users/{userId}/reactivate

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| userId | path | Yes | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/admin/users/{userId}/reactivate"
```
---

## [POST] /api/admin/users/{userId}/reset-password

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| userId | path | Yes | string |  |

### Request Body
**Content-Type:** `application/json`
**Schema Type:** `ResetPasswordRequestDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| newPassword | string |  |
**Content-Type:** `text/json`
**Schema Type:** `ResetPasswordRequestDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| newPassword | string |  |
**Content-Type:** `application/*+json`
**Schema Type:** `ResetPasswordRequestDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| newPassword | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/admin/users/{userId}/reset-password" -H "Content-Type: application/json" -d '{
  // Add request body here
}'
```
---

## [GET] /api/admin/users/{userId}/status

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| userId | path | Yes | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/admin/users/{userId}/status"
```
---

