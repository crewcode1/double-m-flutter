# Group Controller API Documentation

Base URL: `http://doublemapi-001-site1.ktempurl.com`

## [POST] /api/Group

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Request Body
**Content-Type:** `application/json`
**Schema Type:** `CreateGroupRequestDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| name | string |  |
| description | string |  |
| schedules | GroupScheduleRequestDto[] |  |
**Content-Type:** `text/json`
**Schema Type:** `CreateGroupRequestDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| name | string |  |
| description | string |  |
| schedules | GroupScheduleRequestDto[] |  |
**Content-Type:** `application/*+json`
**Schema Type:** `CreateGroupRequestDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| name | string |  |
| description | string |  |
| schedules | GroupScheduleRequestDto[] |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/Group" -H "Content-Type: application/json" -d '{
  // Add request body here
}'
```
---

## [GET] /api/Group

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/Group"
```
---

## [PUT] /api/Group/{id}

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| id | path | Yes | integer |  |

### Request Body
**Content-Type:** `application/json`
**Schema Type:** `UpdateGroupRequestDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| name | string |  |
| description | string |  |
| isActive | boolean |  |
| schedules | GroupScheduleRequestDto[] |  |
**Content-Type:** `text/json`
**Schema Type:** `UpdateGroupRequestDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| name | string |  |
| description | string |  |
| isActive | boolean |  |
| schedules | GroupScheduleRequestDto[] |  |
**Content-Type:** `application/*+json`
**Schema Type:** `UpdateGroupRequestDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| name | string |  |
| description | string |  |
| isActive | boolean |  |
| schedules | GroupScheduleRequestDto[] |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X PUT "http://doublemapi-001-site1.ktempurl.com/api/Group/{id}" -H "Content-Type: application/json" -d '{
  // Add request body here
}'
```
---

## [DELETE] /api/Group/{id}

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| id | path | Yes | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X DELETE "http://doublemapi-001-site1.ktempurl.com/api/Group/{id}"
```
---

## [GET] /api/Group/{id}

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| id | path | Yes | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/Group/{id}"
```
---

## [GET] /api/Group/my-groups

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/Group/my-groups"
```
---

## [POST] /api/Group/{id}/students/{studentId}

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| id | path | Yes | integer |  |
| studentId | path | Yes | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/Group/{id}/students/{studentId}"
```
---

## [DELETE] /api/Group/{id}/students/{studentId}

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| id | path | Yes | integer |  |
| studentId | path | Yes | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X DELETE "http://doublemapi-001-site1.ktempurl.com/api/Group/{id}/students/{studentId}"
```
---

## [GET] /api/Group/{id}/students

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| id | path | Yes | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/Group/{id}/students"
```
---

