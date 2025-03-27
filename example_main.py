import requests

def main():
    response = requests.get("https://www.google.com")
    assert response.status_code == 200
    print(response.text[:100] + " ...")


if __name__ == "__main__":
    main()
