# TeacherManagement Controller API Documentation

Base URL: `http://doublemapi-001-site1.ktempurl.com`

## [POST] /api/TeacherManagement

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Request Body
**Content-Type:** `multipart/form-data`
**Schema Type:** `object`

**Properties:**

| Name | Type | Description |
|---|---|---|
| email | string |  |
| fullName | string |  |
| password | string |  |
| phoneNumber | string |  |
| specialty | string |  |
| language | string |  |
| darkMode | boolean |  |
| profileImage | File (binary) |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK | UserDto |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/TeacherManagement"
```
---

## [GET] /api/TeacherManagement

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/TeacherManagement"
```
---

## [GET] /api/TeacherManagement/{teacherId}

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| teacherId | path | Yes | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK | UserDto |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/TeacherManagement/{teacherId}"
```
---

## [PUT] /api/TeacherManagement/{teacherId}

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| teacherId | path | Yes | string |  |

### Request Body
**Content-Type:** `multipart/form-data`
**Schema Type:** `object`

**Properties:**

| Name | Type | Description |
|---|---|---|
| fullName | string |  |
| specialty | string |  |
| email | string |  |
| phoneNumber | string |  |
| language | string |  |
| darkMode | boolean |  |
| isActive | boolean |  |
| profileImageUrl | string |  |
| profileImage | File (binary) |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X PUT "http://doublemapi-001-site1.ktempurl.com/api/TeacherManagement/{teacherId}"
```
---

## [DELETE] /api/TeacherManagement/{teacherId}

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| teacherId | path | Yes | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X DELETE "http://doublemapi-001-site1.ktempurl.com/api/TeacherManagement/{teacherId}"
```
---

## [POST] /api/TeacherManagement/{teacherId}/deactivate

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| teacherId | path | Yes | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/TeacherManagement/{teacherId}/deactivate"
```
---

## [POST] /api/TeacherManagement/{teacherId}/reactivate

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| teacherId | path | Yes | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/TeacherManagement/{teacherId}/reactivate"
```
---

## [POST] /api/TeacherManagement/{teacherId}/reset-password

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| teacherId | path | Yes | string |  |

### Request Body
**Content-Type:** `application/json`
**Schema Type:** `ResetTeacherPasswordDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| newPassword | string |  |
**Content-Type:** `text/json`
**Schema Type:** `ResetTeacherPasswordDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| newPassword | string |  |
**Content-Type:** `application/*+json`
**Schema Type:** `ResetTeacherPasswordDto`

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
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/TeacherManagement/{teacherId}/reset-password" -H "Content-Type: application/json" -d '{
  // Add request body here
}'
```
---

## [GET] /api/TeacherManagement/paged/{pageNumber}

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| pageNumber | path | Yes | integer |  |
| pageSize | query | No | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/TeacherManagement/paged/{pageNumber}"
```
---

