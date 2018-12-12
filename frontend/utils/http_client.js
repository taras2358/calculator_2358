import ReactOnRails from "react-on-rails";

export default class HttpClient {
  static async post(path, body) {
    const settings = {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": ReactOnRails.authenticityToken()
      },
      body
    };

    const response = await fetch(path, settings);
    // if (response.status === 201) {
      // return Promise.resolve(response.status);
    // }

    const json = await response.json();
    if (!response.ok) {
      return Promise.reject(json);
    }

    return json;
  }
}

