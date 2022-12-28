//const baseURL = "http://10.0.2.2:8000/api/";
//const imageURL = "http://10.0.2.2:8000/storage/";

//------------------------------------------
const imageURL = "http://ec2-54-167-104-104.compute-1.amazonaws.com/storage/";

const baseURL = "https://sigweb.fly.dev/api/"; 
// const baseURL = "http://192.168.0.11:3000/api/"; 


// https://sigweb.fly.dev/api/all-lineas
// https://sigweb.fly.dev/api/una-linea/:linea
// https://sigweb.fly.dev/api/all-recorridos
// https://sigweb.fly.dev/api/un-recorrido/:recorrido
// https://sigweb.fly.dev/api/all-puntos
// https://sigweb.fly.dev/api/puntos-code/:code


const allLineasURL = baseURL + 'all-lineas';
const unaLineaURL = baseURL + 'una-linea'; // anadir al service /:linea


const allRecorridosURL = baseURL + 'all-recorridos';
const unRecorridoURL = baseURL + 'un-recorrido'; // anadir al service /:recorrido


const allPuntosURL = baseURL + 'all-puntos';
const puntosCodeURL = baseURL + 'puntos-code'; // anadir al service /:code



//---errors
const serverError = 'Error del servidor';
const unautorized = 'No autorizado';
const somethingWentWrong = '¡Algo salió mal, intenta de nuevo!';

//---headers
const Map<String, String> headers = {"Content-Type": "application/json"};