# CourseAccessCodes Controller API Documentation

Base URL: `http://doublemapi-001-site1.ktempurl.com`

## [POST] /api/CourseAccessCodes/generate

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| courseId | query | No | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK | CourseAccessCodeDto |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/CourseAccessCodes/generate"
```
---

## [POST] /api/CourseAccessCodes/bulk-generate

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| courseId | query | No | integer |  |
| quantity | query | No | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK | CourseAccessCodeDto[] |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/CourseAccessCodes/bulk-generate"
```
---

## [GET] /api/CourseAccessCodes/{code}

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| code | path | Yes | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK | CourseAccessCodeDto |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/CourseAccessCodes/{code}"
```
---

## [GET] /api/CourseAccessCodes/course/{courseId}/active

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| courseId | path | Yes | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK | CourseAccessCodeDto[] |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/CourseAccessCodes/course/{courseId}/active"
```
---

## [POST] /api/CourseAccessCodes/redeem

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| code | query | No | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/CourseAccessCodes/redeem"
```
---

## [GET] /api/CourseAccessCodes/{code}/stats

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| code | path | Yes | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK | CourseAccessCodeStatsDto |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/CourseAccessCodes/{code}/stats"
```
---

## [GET] /api/CourseAccessCodes/course/{courseId}/paged

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
| 200 | OK | CourseAccessCodeDto[] |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/CourseAccessCodes/course/{courseId}/paged"
```
---

## [POST] /api/CourseAccessCodes/{code}/disable

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| code | path | Yes | string |  |
| disabledBy | query | No | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/CourseAccessCodes/{code}/disable"
```
---

