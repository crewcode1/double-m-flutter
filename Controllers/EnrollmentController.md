# Enrollment Controller API Documentation

Base URL: `http://doublemapi-001-site1.ktempurl.com`

## [POST] /api/Enrollment/enroll-by-code

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Request Body
**Content-Type:** `application/json`
**Schema Type:** `EnrollByCourseCodeDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| courseCode | string |  |
**Content-Type:** `text/json`
**Schema Type:** `EnrollByCourseCodeDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| courseCode | string |  |
**Content-Type:** `application/*+json`
**Schema Type:** `EnrollByCourseCodeDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| courseCode | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/Enrollment/enroll-by-code" -H "Content-Type: application/json" -d '{
  // Add request body here
}'
```
---

## [GET] /api/Enrollment/my-enrollments

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
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/Enrollment/my-enrollments"
```
---

## [GET] /api/Enrollment/course/{courseId}

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| courseId | path | Yes | integer |  |
| pageNumber | query | No | integer |  |
| pageSize | query | No | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/Enrollment/course/{courseId}"
```
---

## [POST] /api/Enrollment/unenroll/{courseId}

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
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/Enrollment/unenroll/{courseId}"
```
---

