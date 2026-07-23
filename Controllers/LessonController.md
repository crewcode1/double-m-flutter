# Lesson Controller API Documentation

Base URL: `http://doublemapi-001-site1.ktempurl.com`

## [POST] /api/sections/{sectionId}/Lesson

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| sectionId | path | Yes | integer |  |

### Request Body
**Content-Type:** `multipart/form-data`
**Schema Type:** `object`

**Properties:**

| Name | Type | Description |
|---|---|---|
| title | string | Form field title |
| description | string | Form field description |
| displayOrder | string | Form field displayOrder |
| durationMinutes | string | Form field durationMinutes |
| videoUrl | string | Form field videoUrl |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK | LessonDto |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/sections/{sectionId}/Lesson"
```
---

## [GET] /api/sections/{sectionId}/Lesson

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| sectionId | path | Yes | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK | LessonDto[] |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/sections/{sectionId}/Lesson"
```
---

## [GET] /api/sections/{sectionId}/Lesson/{lessonId}

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| sectionId | path | Yes | integer |  |
| lessonId | path | Yes | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK | LessonDto |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/sections/{sectionId}/Lesson/{lessonId}"
```
---

## [PUT] /api/sections/{sectionId}/Lesson/{lessonId}

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| sectionId | path | Yes | integer |  |
| lessonId | path | Yes | integer |  |

### Request Body
**Content-Type:** `multipart/form-data`
**Schema Type:** `object`

**Properties:**

| Name | Type | Description |
|---|---|---|
| title | string | Form field title |
| description | string | Form field description |
| displayOrder | string | Form field displayOrder |
| durationMinutes | string | Form field durationMinutes |
| videoUrl | string | Form field videoUrl |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X PUT "http://doublemapi-001-site1.ktempurl.com/api/sections/{sectionId}/Lesson/{lessonId}"
```
---

## [DELETE] /api/sections/{sectionId}/Lesson/{lessonId}

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| sectionId | path | Yes | integer |  |
| lessonId | path | Yes | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X DELETE "http://doublemapi-001-site1.ktempurl.com/api/sections/{sectionId}/Lesson/{lessonId}"
```
---

## [POST] /api/sections/{sectionId}/Lesson/{lessonId}/complete

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| sectionId | path | Yes | integer |  |
| lessonId | path | Yes | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/sections/{sectionId}/Lesson/{lessonId}/complete"
```
---

