# ALU Mathematics for Machine Learning Summative

## Task 1

- Guided project on building a univariate linear regression model to predict sales given marketing budget.
- Notebook for this task is available [here](summative/linear_regression/univariate.ipynb).

## Task 2

- Individual project to build a multivariate linear regression model and deploy to an API.
- Model built for this task predicts medical insurance cost given the following parameters
  - Age
  - BMI
  - Number of dependents/children
  - Whether someone is a smoker or not.
- The model was trained on [this dataset](https://www.kaggle.com/datasets/mirichoi0218/insurance)
- The notebook for this task is [in this repo](summative/linear_regression/multivariate.ipynb).
- The model was deployed to an API hosted on Render. The API is documented below.

### API Documentation

#### Endpoints

'/': Index route. Nothing useful goes on here. It is useful for pinging the server to check if it is running or not.

'/predict': Predict route. Makes a prediction given information. Expects the following parameters in the request body.

Request Body Parameters

- age (float) The age of the subject
- smoker (boolean) True if the person smokes and False if the person does not smoke.
- bmi (float) The body-mass index of the person.
- children (int) The number of children and/or dependents the person has.

```
{
    "age": <age here>
    "smoker": <smoker status here>
    "bmi": <bmi here>
    "children": <children here>
}
```

Request Response Body

- prediction(float) The predicted insurance cost

```
{
    "prediction": <prediction>
}
```

### Task 3

- A Flutter App that makes requests to the endpoints.
-
