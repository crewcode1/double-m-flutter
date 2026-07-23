# ExtraSession Controller API Documentation

Base URL: `http://doublemapi-001-site1.ktempurl.com`

## [POST] /api/ExtraSession

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Request Body
**Content-Type:** `application/json`
**Schema Type:** `CreateExtraSessionRequestDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| courseId | integer |  |
| title | string |  |
| description | string |  |
| sessionDate | string |  |
| startTime | string |  |
| endTime | string |  |
| capacity | integer |  |
| meetingLink | string |  |
**Content-Type:** `text/json`
**Schema Type:** `CreateExtraSessionRequestDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| courseId | integer |  |
| title | string |  |
| description | string |  |
| sessionDate | string |  |
| startTime | string |  |
| endTime | string |  |
| capacity | integer |  |
| meetingLink | string |  |
**Content-Type:** `application/*+json`
**Schema Type:** `CreateExtraSessionRequestDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| courseId | integer |  |
| title | string |  |
| description | string |  |
| sessionDate | string |  |
| startTime | string |  |
| endTime | string |  |
| capacity | integer |  |
| meetingLink | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/ExtraSession" -H "Content-Type: application/json" -d '{
  // Add request body here
}'
```
---

## [DELETE] /api/ExtraSession/{id}

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
curl -X DELETE "http://doublemapi-001-site1.ktempurl.com/api/ExtraSession/{id}"
```
---

## [GET] /api/ExtraSession/teacher-sessions

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/ExtraSession/teacher-sessions"
```
---

## [POST] /api/ExtraSession/book

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Request Body
**Content-Type:** `application/json`
**Schema Type:** `BookSessionRequestDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| extraSessionId | integer |  |
**Content-Type:** `text/json`
**Schema Type:** `BookSessionRequestDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| extraSessionId | integer |  |
**Content-Type:** `application/*+json`
**Schema Type:** `BookSessionRequestDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| extraSessionId | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/ExtraSession/book" -H "Content-Type: application/json" -d '{
  // Add request body here
}'
```
---

## [DELETE] /api/ExtraSession/book/{sessionId}

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| sessionId | path | Yes | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X DELETE "http://doublemapi-001-site1.ktempurl.com/api/ExtraSession/book/{sessionId}"
```
---

## [GET] /api/ExtraSession/my-bookings

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/ExtraSession/my-bookings"
```
---

## [GET] /api/ExtraSession/course/{courseId}

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| courseId | path | Yes | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/ExtraSession/course/{courseId}"
```
---

