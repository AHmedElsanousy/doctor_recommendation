from flask import Flask, request, jsonify
import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.cluster import KMeans

app = Flask(__name__)

# Load data
df = pd.read_csv('doctors_data (2).csv')

# Remove the 'years_of_experience' column
df.drop(columns=['years_of_experince'], inplace=True)

# Replace NaN values with 'notfound'
df.fillna('notfound', inplace=True)

# Fit clustering model
vectorizer = TfidfVectorizer()
city = vectorizer.fit_transform(df['City'])
kmeans = KMeans(n_clusters=14, init='k-means++')
kmeans.fit(city)
df['cluster'] = kmeans.predict(city)

@app.route('/recommend_top_doctors', methods=['POST'])
def recommend_top_doctors():
    user_city = request.json['city'].lower()  # Convert user input to lowercase
    df['lowercase_city'] = df['City'].str.lower()  # Convert city names in DataFrame to lowercase
    filtered_df = df[df['lowercase_city'] == user_city]
    if filtered_df.empty:
        return jsonify({'message': 'City not found'}), 404
    cluster_num = filtered_df['cluster'].values[0]  # Retrieve cluster number
    doctors_in_cluster = df[df['cluster'] == cluster_num]
    top_doctors_in_cluster = doctors_in_cluster.sort_values(by='Rating', ascending=False)
    return jsonify(top_doctors_in_cluster.to_dict(orient='records'))

if __name__ == '__main__':
    app.run(debug=True)
