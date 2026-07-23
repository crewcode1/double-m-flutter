# Parent Controller API Documentation

Base URL: `http://doublemapi-001-site1.ktempurl.com`

## [POST] /api/Parent/generate-link-code

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/Parent/generate-link-code"
```
---

## [GET] /api/Parent/student/{studentId}/quizzes

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| studentId | path | Yes | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/Parent/student/{studentId}/quizzes"
```
---

## [GET] /api/Parent/student/{studentId}/lessons

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| studentId | path | Yes | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/Parent/student/{studentId}/lessons"
```
---

## [GET] /api/Parent/student/{studentId}/teachers

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| studentId | path | Yes | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/Parent/student/{studentId}/teachers"
```
---

## [POST] /api/Parent/link-student

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Request Body
**Content-Type:** `application/json`
**Schema Type:** `ParentLinkDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| linkCode | string |  |
**Content-Type:** `text/json`
**Schema Type:** `ParentLinkDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| linkCode | string |  |
**Content-Type:** `application/*+json`
**Schema Type:** `ParentLinkDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| linkCode | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/Parent/link-student" -H "Content-Type: application/json" -d '{
  // Add request body here
}'
```
---

## [GET] /api/Parent/linked-students

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK | StudentInfoDto[] |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/Parent/linked-students"
```
---

## [GET] /api/Parent/student/{studentId}/progress

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| studentId | path | Yes | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/Parent/student/{studentId}/progress"
```
---

## [GET] /api/Parent/student/{studentId}/quiz-attempts

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| studentId | path | Yes | string |  |
| PageNumber | query | No | integer |  |
| PageSize | query | No | integer |  |
| SortBy | query | No | string |  |
| SortDescending | query | No | boolean |  |
| SearchTerm | query | No | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/Parent/student/{studentId}/quiz-attempts"
```
---

