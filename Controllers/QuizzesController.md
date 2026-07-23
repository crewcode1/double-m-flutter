# Quizzes Controller API Documentation

Base URL: `http://doublemapi-001-site1.ktempurl.com`

## [GET] /api/courses/{courseId}/Quizzes

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
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/courses/{courseId}/Quizzes"
```
---

## [POST] /api/courses/{courseId}/Quizzes

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| courseId | path | Yes | integer |  |

### Request Body
**Content-Type:** `application/json`
**Schema Type:** `CreateQuizDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| courseId | integer |  |
| title | string |  |
| description | string |  |
| isActive | boolean |  |
| timeLimitMinutes | integer |  |
| passingScore | number |  |
| showCorrectAnswers | boolean |  |
| shuffleQuestions | boolean |  |
| shuffleOptions | boolean |  |
| questions | CreateQuestionDto[] |  |
**Content-Type:** `text/json`
**Schema Type:** `CreateQuizDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| courseId | integer |  |
| title | string |  |
| description | string |  |
| isActive | boolean |  |
| timeLimitMinutes | integer |  |
| passingScore | number |  |
| showCorrectAnswers | boolean |  |
| shuffleQuestions | boolean |  |
| shuffleOptions | boolean |  |
| questions | CreateQuestionDto[] |  |
**Content-Type:** `application/*+json`
**Schema Type:** `CreateQuizDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| courseId | integer |  |
| title | string |  |
| description | string |  |
| isActive | boolean |  |
| timeLimitMinutes | integer |  |
| passingScore | number |  |
| showCorrectAnswers | boolean |  |
| shuffleQuestions | boolean |  |
| shuffleOptions | boolean |  |
| questions | CreateQuestionDto[] |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK | QuizDetailDto |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/courses/{courseId}/Quizzes" -H "Content-Type: application/json" -d '{
  // Add request body here
}'
```
---

## [PATCH] /api/courses/{courseId}/Quizzes/{quizId}/status

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| courseId | path | Yes | integer |  |
| quizId | path | Yes | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X PATCH "http://doublemapi-001-site1.ktempurl.com/api/courses/{courseId}/Quizzes/{quizId}/status"
```
---

## [PUT] /api/courses/{courseId}/Quizzes/{quizId}

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| courseId | path | Yes | integer |  |
| quizId | path | Yes | integer |  |

### Request Body
**Content-Type:** `application/json`
**Schema Type:** `UpdateQuizDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| id | integer |  |
| title | string |  |
| description | string |  |
| isActive | boolean |  |
| timeLimitMinutes | integer |  |
| passingScore | number |  |
| showCorrectAnswers | boolean |  |
| shuffleQuestions | boolean |  |
| shuffleOptions | boolean |  |
| allowReentry | boolean |  |
| attemptsAllowed | integer |  |
| questions | UpdateQuestionDto[] |  |
**Content-Type:** `text/json`
**Schema Type:** `UpdateQuizDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| id | integer |  |
| title | string |  |
| description | string |  |
| isActive | boolean |  |
| timeLimitMinutes | integer |  |
| passingScore | number |  |
| showCorrectAnswers | boolean |  |
| shuffleQuestions | boolean |  |
| shuffleOptions | boolean |  |
| allowReentry | boolean |  |
| attemptsAllowed | integer |  |
| questions | UpdateQuestionDto[] |  |
**Content-Type:** `application/*+json`
**Schema Type:** `UpdateQuizDto`

**Properties:**

| Name | Type | Description |
|---|---|---|
| id | integer |  |
| title | string |  |
| description | string |  |
| isActive | boolean |  |
| timeLimitMinutes | integer |  |
| passingScore | number |  |
| showCorrectAnswers | boolean |  |
| shuffleQuestions | boolean |  |
| shuffleOptions | boolean |  |
| allowReentry | boolean |  |
| attemptsAllowed | integer |  |
| questions | UpdateQuestionDto[] |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X PUT "http://doublemapi-001-site1.ktempurl.com/api/courses/{courseId}/Quizzes/{quizId}" -H "Content-Type: application/json" -d '{
  // Add request body here
}'
```
---

## [GET] /api/courses/{courseId}/Quizzes/{quizId}

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| courseId | path | Yes | integer |  |
| quizId | path | Yes | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK | QuizDetailDto |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/courses/{courseId}/Quizzes/{quizId}"
```
---

## [POST] /api/courses/{courseId}/Quizzes/{quizId}/start

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| courseId | path | Yes | integer |  |
| quizId | path | Yes | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/courses/{courseId}/Quizzes/{quizId}/start"
```
---

## [POST] /api/courses/{courseId}/Quizzes/{quizId}/submit

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| courseId | path | Yes | integer |  |
| quizId | path | Yes | integer |  |

### Request Body
**Content-Type:** `application/json`
**Schema Type:** `Dictionary<string, integer[]>`
**Content-Type:** `text/json`
**Schema Type:** `Dictionary<string, integer[]>`
**Content-Type:** `application/*+json`
**Schema Type:** `Dictionary<string, integer[]>`

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/courses/{courseId}/Quizzes/{quizId}/submit" -H "Content-Type: application/json" -d '{
  // Add request body here
}'
```
---

## [POST] /api/courses/{courseId}/Quizzes/{quizId}/reset-for-student

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| courseId | path | Yes | integer |  |
| quizId | path | Yes | integer |  |
| studentId | query | No | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/courses/{courseId}/Quizzes/{quizId}/reset-for-student"
```
---

