from flask import Flask, request, jsonify
import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.cluster import KMeans

app = Flask(__name__)

# Load data
df = pd.read_csv('doctors_data (2).csv')


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

    # Additional information to include in the response
    additional_info = ['Phone', 'Location', 'Price', 'Specialization', 'Picture']

    # Create a dictionary for each doctor including additional information
    doctors_list = []
    for _, row in top_doctors_in_cluster.iterrows():
        doctor_info = {key: row[key] for key in additional_info}
        doctor_info['Doctor_Name'] = row['Doctors_Names']
        doctor_info['Latitude'] = row['Latitude']
        doctor_info['Longitude'] = row['Longitude']
        doctor_info['Rating'] = row['Rating']
        doctors_list.append(doctor_info)

    return jsonify({'doctors': doctors_list})

if __name__ == '__main__':
    app.run(debug=True)
