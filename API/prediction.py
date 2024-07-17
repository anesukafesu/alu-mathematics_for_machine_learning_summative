from fastapi import FastAPI
from pydantic import BaseModel
from joblib import load


class PredictionRequestBody(BaseModel):
    age: float
    smoker: bool
    bmi: float
    children: int


app = FastAPI()

multivariate_model = load('multivariate_model.joblib')
multivariate_scaler = load('multivariate_scaler.joblib')

@app.get('/')
async def root():
    return { 'message': 'Hello, Mundo!' }


@app.post('/predict')
async def predict(body: PredictionRequestBody):
    smoker = 1 if body.smoker == True else 0

    # Extract features from request body
    features = [[body.age, smoker, body.bmi, body.children]]

    # Scale the features
    scaled_features = multivariate_scaler.transform(features)

    # Use model to make prediction
    prediction = multivariate_model.predict(scaled_features)

    # Return the predicted value
    return {'prediction': prediction[0]}
