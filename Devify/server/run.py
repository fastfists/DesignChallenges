from app import create_app

project = create_app()
project.run(port=5000, debug=True)
