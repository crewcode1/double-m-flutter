# Teacher Controller API Documentation

Base URL: `http://doublemapi-001-site1.ktempurl.com`

## [GET] /api/Teacher/all

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/Teacher/all"
```
---

## [GET] /api/Teacher/{teacherId}

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
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/Teacher/{teacherId}"
```
---

## [GET] /api/Teacher/courses

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK | CourseDto[] |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/Teacher/courses"
```
---

## [POST] /api/Teacher/courses/{courseId}/generate-code

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
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/Teacher/courses/{courseId}/generate-code"
```
---

## [POST] /api/Teacher/courses/{courseId}/generate-codes

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| courseId | path | Yes | integer |  |
| quantity | query | No | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/Teacher/courses/{courseId}/generate-codes"
```
---

## [GET] /api/Teacher/courses/{courseId}/active-codes

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
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/Teacher/courses/{courseId}/active-codes"
```
---

## [POST] /api/Teacher/codes/{code}/disable

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| code | path | Yes | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/Teacher/codes/{code}/disable"
```
---

## [GET] /api/Teacher/courses/{courseId}/statistics

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
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/Teacher/courses/{courseId}/statistics"
```
---

## [GET] /api/Teacher/courses/{courseId}/grades

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| courseId | path | Yes | integer |  |
| quizId | query | No | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/Teacher/courses/{courseId}/grades"
```
---

