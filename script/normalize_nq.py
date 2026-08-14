def normalize_data(data):
    data = data.copy()
    data.columns = data.columns.get_level_values("Price")
    data.columns = data.columns.str.lower()
    data = data.reset_index()
    return data


if __name__ == "__main__":
    from extract_nq import fetch_data

    data = fetch_data()
    data = normalize_data(data)

    print(data.tail())
