# Questions Controller API Documentation

Base URL: `http://doublemapi-001-site1.ktempurl.com`

## [POST] /api/quizzes/{quizId}/questions

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| quizId | path | Yes | integer |  |

### Request Body
**Content-Type:** `application/json`
**Schema Type:** `CreateQuestionDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| text | string |  |
| questionType | string |  |
| points | number |  |
| displayOrder | integer |  |
| explanation | string |  |
| options | CreateOptionDto[] |  |
**Content-Type:** `text/json`
**Schema Type:** `CreateQuestionDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| text | string |  |
| questionType | string |  |
| points | number |  |
| displayOrder | integer |  |
| explanation | string |  |
| options | CreateOptionDto[] |  |
**Content-Type:** `application/*+json`
**Schema Type:** `CreateQuestionDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| text | string |  |
| questionType | string |  |
| points | number |  |
| displayOrder | integer |  |
| explanation | string |  |
| options | CreateOptionDto[] |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/quizzes/{quizId}/questions" -H "Content-Type: application/json" -d '{
  // Add request body here
}'
```
---

## [PUT] /api/questions/{questionId}

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| questionId | path | Yes | integer |  |

### Request Body
**Content-Type:** `application/json`
**Schema Type:** `UpdateQuestionDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| id | integer |  |
| text | string |  |
| questionType | string |  |
| points | number |  |
| displayOrder | integer |  |
| explanation | string |  |
| options | UpdateOptionDto[] |  |
**Content-Type:** `text/json`
**Schema Type:** `UpdateQuestionDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| id | integer |  |
| text | string |  |
| questionType | string |  |
| points | number |  |
| displayOrder | integer |  |
| explanation | string |  |
| options | UpdateOptionDto[] |  |
**Content-Type:** `application/*+json`
**Schema Type:** `UpdateQuestionDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| id | integer |  |
| text | string |  |
| questionType | string |  |
| points | number |  |
| displayOrder | integer |  |
| explanation | string |  |
| options | UpdateOptionDto[] |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X PUT "http://doublemapi-001-site1.ktempurl.com/api/questions/{questionId}" -H "Content-Type: application/json" -d '{
  // Add request body here
}'
```
---

## [DELETE] /api/questions/{questionId}

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| questionId | path | Yes | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X DELETE "http://doublemapi-001-site1.ktempurl.com/api/questions/{questionId}"
```
---

