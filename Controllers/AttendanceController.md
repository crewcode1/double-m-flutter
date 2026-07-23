# Attendance Controller API Documentation

Base URL: `http://doublemapi-001-site1.ktempurl.com`

## [POST] /api/Attendance/teacher

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Request Body
**Content-Type:** `application/json`
**Schema Type:** `TeacherAttendanceRequestDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| lessonId | integer |  |
| students | TeacherAttendanceItemDto[] |  |
**Content-Type:** `text/json`
**Schema Type:** `TeacherAttendanceRequestDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| lessonId | integer |  |
| students | TeacherAttendanceItemDto[] |  |
**Content-Type:** `application/*+json`
**Schema Type:** `TeacherAttendanceRequestDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| lessonId | integer |  |
| students | TeacherAttendanceItemDto[] |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/Attendance/teacher" -H "Content-Type: application/json" -d '{
  // Add request body here
}'
```
---

## [POST] /api/Attendance/student

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Request Body
**Content-Type:** `application/json`
**Schema Type:** `StudentAttendanceRequestDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| lessonId | integer |  |
**Content-Type:** `text/json`
**Schema Type:** `StudentAttendanceRequestDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| lessonId | integer |  |
**Content-Type:** `application/*+json`
**Schema Type:** `StudentAttendanceRequestDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| lessonId | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/Attendance/student" -H "Content-Type: application/json" -d '{
  // Add request body here
}'
```
---

## [GET] /api/Attendance/lesson/{lessonId}

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| lessonId | path | Yes | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/Attendance/lesson/{lessonId}"
```
---

## [GET] /api/Attendance/lesson/{lessonId}/student/{studentId}

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| lessonId | path | Yes | integer |  |
| studentId | path | Yes | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/Attendance/lesson/{lessonId}/student/{studentId}"
```
---

