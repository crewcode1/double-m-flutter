# Section Controller API Documentation

Base URL: `http://doublemapi-001-site1.ktempurl.com`

## [POST] /api/courses/{courseId}/Section

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
| Title | string |  |
| CourseId | integer |  |
| DisplayOrder | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK | SectionDto |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/courses/{courseId}/Section"
```
---

## [GET] /api/courses/{courseId}/Section

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
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/courses/{courseId}/Section"
```
---

## [GET] /api/courses/{courseId}/Section/{sectionId}

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| courseId | path | Yes | integer |  |
| sectionId | path | Yes | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK | SectionDto |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/courses/{courseId}/Section/{sectionId}"
```
---

## [PUT] /api/courses/{courseId}/Section/{sectionId}

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| courseId | path | Yes | integer |  |
| sectionId | path | Yes | integer |  |

### Request Body
**Content-Type:** `multipart/form-data`
**Schema Type:** `object`

**Properties:**

| Name | Type | Description |
|---|---|---|
| Title | string |  |
| CourseId | integer |  |
| DisplayOrder | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X PUT "http://doublemapi-001-site1.ktempurl.com/api/courses/{courseId}/Section/{sectionId}"
```
---

## [DELETE] /api/courses/{courseId}/Section/{sectionId}

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| courseId | path | Yes | integer |  |
| sectionId | path | Yes | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X DELETE "http://doublemapi-001-site1.ktempurl.com/api/courses/{courseId}/Section/{sectionId}"
```
---

