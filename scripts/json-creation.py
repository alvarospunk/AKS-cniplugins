import json
import random
import string

def generate_random_data():
    key_length = 10
    value_length = 100  # Elegimos 100 para que cada entrada tenga aproximadamente 110 bytes

    # Estimación de cuántas entradas necesitamos para 100 MB
    # 100 MB es aproximadamente 100,000,000 bytes.
    # Dividimos por el tamaño aproximado de cada entrada para obtener el número de entradas.
    num_entries = int(100_000_000 / (key_length + value_length))

    data = {}

    for _ in range(num_entries):
        key = ''.join(random.choice(string.ascii_lowercase) for _ in range(key_length))
        value = ''.join(random.choice(string.ascii_letters + string.digits) for _ in range(value_length))
        data[key] = value

    return data

def main():
    data = generate_random_data()
    with open("/tmp/large_file.json", "w") as json_file:
        json.dump(data, json_file)

if __name__ == "__main__":
    main()
