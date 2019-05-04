import face_recognition
import numpy as np
from flask import Flask, jsonify, request, redirect
from signal import signal, SIGPIPE, SIG_DFL

app = Flask(__name__)

knownFaceEncodings = []
knownFaceNames = []


@app.route('/upload-face', methods=['POST', 'GET'])
def uploadFace():
	if request.method == 'POST':
		file = request.files['file']
		name = request.form['name']
		known_image = face_recognition.load_image_file(file)
		if len(known_image) > 0: 
			faceEncodings = face_recognition.face_encodings(known_image)
			if len(faceEncodings) > 0: 
				knownImageEncondig = faceEncodings[0] #get first face detected
				knownFaceEncodings.append(knownImageEncondig)
				knownFaceNames.append(name)
				return jsonify({"face_uploaded": True})
			else:
				return jsonify({"face_uploaded": False})
		else:
			return jsonify({"face_found": False})

	else:
			return '''
	<!doctype html>
	<title>Selfie?</title>
	<h1>Upload a picture!</h1>
	<form method="POST" enctype="multipart/form-data">
	  <input type="file" name="file">
	  <input type="text" name="name"> 
	  <input type="submit" value="Upload">
	</form>
	'''
@app.route('/detect-face', methods=['POST', 'GET'])
def detectFace():
	if len(request.files) > 0: 
		file = request.files['file']
		capturePhoto = face_recognition.load_image_file(file)
		
		faceEncodings = face_recognition.face_encodings(capturePhoto)

		faceNames = []
		for faceEncoding in faceEncodings: 
			matches = face_recognition.compare_faces(knownFaceEncodings, faceEncoding)
			name = "Unknown"
			faceDistances = face_recognition.face_distance(knownFaceEncodings, faceEncoding)
			bestMatchIndex = np.argmin(faceDistances)

			if matches[bestMatchIndex]:
				name = knownFaceNames[bestMatchIndex]
			
			faceNames.append(name)

		result = {"face_names": faceNames }
		return jsonify(result)
	else: 
		return '''
	<!doctype html>
	<title>Selfie?</title>
	<h1>Upload a picture!</h1>
	<form method="POST" enctype="multipart/form-data">
	  <input type="file" name="file">
	  <input type="submit" value="Upload">
	</form>
	'''
		# return jsonify({"file_found": False})


if __name__ == '__main__':
	signal(SIGPIPE, SIG_DFL)
	app.run(host='0.0.0.0', port=5001, debug=True, threaded=True)	