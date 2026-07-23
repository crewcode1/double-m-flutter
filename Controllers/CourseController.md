# Course Controller API Documentation

Base URL: `http://doublemapi-001-site1.ktempurl.com`

## [GET] /api/Course

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/Course"
```
---

## [POST] /api/Course

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Request Body
**Content-Type:** `multipart/form-data`
**Schema Type:** `object`

**Properties:**

| Name | Type | Description |
|---|---|---|
| title | string | Form field title |
| description | string | Form field description |
| category | string | Form field category |
| level | string | Form field level |
| durationHours | string | Form field durationHours |
| isPublished | string | Form field isPublished |
| teacherId | string | Form field teacherId |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/Course"
```
---

## [GET] /api/Course/{courseId}

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
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/Course/{courseId}"
```
---

## [PUT] /api/Course/{courseId}

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| courseId | path | Yes | integer |  |

### Request Body
**Content-Type:** `multipart/form-data`
**Schema Type:** `object`

**Properties:**

| Name | Type | Description |
|---|---|---|
| title | string | Form field title |
| description | string | Form field description |
| category | string | Form field category |
| level | string | Form field level |
| durationHours | string | Form field durationHours |
| isPublished | string | Form field isPublished |
| teacherId | string | Form field teacherId |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X PUT "http://doublemapi-001-site1.ktempurl.com/api/Course/{courseId}"
```
---

## [DELETE] /api/Course/{courseId}

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
curl -X DELETE "http://doublemapi-001-site1.ktempurl.com/api/Course/{courseId}"
```
---

