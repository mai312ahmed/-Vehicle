import 'dart:ui';

//database
//posts
//5 field
const String posts = "posts";
const String userId = "user ID";
const String postPicsList = "pics";
const String postTime = "time";
const String postContent = "text";
const String postNumber = "post number";
// pic url ${FirebaseAuth.instance.currentUser!.uid}/posts/$postNo/i"

//workshop
const String workshops = "workshops";
//ownerId
const String workshopPicsList = "pics";
const String workshopName = "workshop name";
const String workshopPhone = "workshop phone";
const String workshopEmail = "workshop email";
const String workshopAddress = "workshop address";
const String workshopNumber = "workshop number";
const String mechanics = "Mechanics";
const String electricity = "Electricity";
const String refrigerationAndAirConditioning =
    "Refrigeration and Air conditioning";
const String generalServices = "General services";
const String additionInfo = "addition information";

//user
// 5 field
const String user = "users";
const String name = "name";
const String lastPostNumber = "last post number";
const String lastCarNumber = "last car number";
const String lastWorkshopNumber = "Last workshop number";
const String userPhone = "user phone";
const String userProfilePic = "user profile Pic";

//const String userID

//car
const String cars = "cars";
const String ownerId = "owner ID";
const String carNumber = "car number";
const String carPicsList = "pics";
const String carBrand = "brand";
const String carYear = "year";
const String carModel = "model";
const String carPrice = "price";
const String carType = "type";
const String carTrim = "trim";
const String carKm = "km";
const String carInteriorColor = "interior color";
const String carExteriorColor = "exterior color";
const String carTransmission = "transmission";
const String carFuelType = "fuel type";
const String carDoors = "doors";
const String carCylinder = "cylinder";
const String carWarranty = "warranty";
const String carDescriptin = "car descriptin";
const String exterior = "exterior";
const String interior = "interior";
const String comfort = "comfort";
const String safetyAndDriverAssistanceSystem =
    "safety and driver assistance system";
const String entertainment = "entertainment";
const String models = "models";

const Color KprimaryColor = Color(0xFF1b0b54);
const String Klogo = "assets/pic/1.jpg";

List<String> years = [
  "1980",
  "1981",
  "1982",
  "1983",
  "1984",
  "1985",
  "1986",
  "1987",
  "1988",
  "1989",
  "1990",
  "1991",
  "1992",
  "1993",
  "1994",
  "1995",
  "1996",
  "1997",
  "1998",
  "1999",
  "2000",
  "2001",
  "2002",
  "2003",
  "2004",
  "2005",
  "2006",
  "2007",
  "2008",
  "2009",
  "2010",
  "2011",
  "2012",
  "2013",
  "2014",
  "2015",
  "2016",
  "2017",
  "2018",
  "2019",
  "2020",
  "2021",
  "2022"
];
List<String> carsBrand = [
  "ABARTH", // ["124 Spider","500","595" ,"695","Punto"]
  "ABD", //[]
  "ABT", //[]
  "AC", //["ACE","ACECA","COBRA"]
  "ACC", //[]
  "ACURA", //["CL","CSX","ELILX","INTEGRA","MDX","NSX","RDX","RL","RLX","RSX","SLX","TL","TLX","TSX","ZDX",]
  "Adler", //[]
  "ADRENALINE", //[]
  "AEON", //[]
  "AION", //[]
  "AITO", //["M5","M7",]
  "AIWAYS", //["U5",]
  "AIXAM", //["eAIXAM","EMOTION","MINAUTO","SENSATION",]
  "ALAN MANN", //[]
  "ALBA", //[]
  "ALFA ROMEO", //["145","146","147","155","156","159","164","166","33","AC","6","75","8C COMPETIZIONE","90","ALFASUD","ALFETTA","ARNA","BREBA","GIULIA","GIULIETTA","GT","GTA COUPE","GTV","MITO","MONTREAL","RZ","SPIDER","STELVIO","SZ","TONALE",]
  "ALLARD", //[]
  "ALPINA", //["D10","D3","D4","D5","RLE ROADSTER","ROADSTER S","ROADSTER V8","XB7","XD3","XD4",]
  "ALPINE", //["1300","1600","A110","A310","A610","BERLINETTE","GTA",]
  "ALVIS", //[]
  "AMG", //[]
  "APOLLO", //["IE",]
  "ARCFOX", //["ALPHA-S","ALPHA-T","ECF","GT",]
  "ARDEN", //[]
  "ARIA", //["FXE"]
  "ARIEL", //["ATOM","NOMAD",]
  "ARO", //["10","24","SPARTANA",]
  "ARTEGA", //["GT","SCALO",]
  "ASCARI", //[]
  "ASIA MOTORS", //["HI-TOPIC","RETONA","ROCSTA",]
  "ASPARK", //["OWL",]
  "ASTON MARTIN", //["AMV8","BULLDOG","CYGNET","DB11","DB4","DB5","DB6","DB7","DB9","DBS","DBX","LAGONDA","ONE-77","RAPIDE","TICKFORD CAPRI","V12 VANTAGE","V8 VANTAGE","VALHALLA","VALKYRIE","VANQUISH","VIRAGE","ZAGATO",]
  "ASTRO", //["11301",]
  "AUBURN", //[]
  "AUDI", //["100","200","50","5000","80","90","A1","A2","A3","A4","A5","A6","A6 E-TRON","A7","A8","AICON","CABRIOLET","COUPE","E-TRON","E-TRON GT","FOX","NANUK QUATTRO CONCEPT","NSU RO 80","PB18","Q2","Q3","Q4 E-TRON","Q5","QQ7","Q8","Q8 E-TRON","QUATTRO","R8","RS 2","RS 3","RS 4","RS 5","RS 6","RS 7","RS E-TRON GT","RS Q3","RS Q8","S1","S2","S3","S4","S5","S6","S7","S8","SKYSPHERE","SQ 2","SQ 5","SQ 7","SQ 8","SQ 8 ETRON","TT","V8 (D11)",]
  "AURUS", //["Senat"]
  "AUSTIN", //["ALLEGRO","AMBASSADOR","MAESTRO","MAXI","METRO","MINI","PRINCESS",]
  "AUSTIN-HEALEY" //["100",]
      "AUTOBIANCHI", //["A 112",]
  "AUTO UNION", //[]
  "BENTLEY", //[]
  "B.ENGINEERIN", //["EDONIS",]
  "BAC", //["MONO",]
  "BAIC MOTOR", //["BJ 2020","SENOVA D50","SENOVA X55",]
  "BALTASAR" //["REVOLT"]
      "BALTIJAS DZIPS", //[BD]
  "BAOJUN", //["730","E100","RC-5","RM-5","RS-3","RS-5",]
  "BEE BEE", //["XS",]
  "BENTLEY", //["ARNAGE","AZURE","BACALAR","BATUR","BENTAYGA","BROOKLANDS","CONTINENTAL","FLYING SPUR","MARK VI","MULSANNE","TURBO R",]
  "BERTONE" //["FREECLIMBER",]
      "BESTUNE", //["T77",]
  "BISU", //["M3","T3",]
  "BITTER", //["TYPE 3","VERO",]
  "BIZZARRINI", //["1900 GT EUROPA","5300 GT STRADA","P538",]
  "BLONELL", //["TF 2   MK1",]
  "BMW", //["02","1 SERIES","2 SERIES","3 SERIES","3.0 CSL","4 SERIES","5 SERIES","6 SERIES","7 SERIES","700","8 SERIES","E9","I3","I4","I7","I8","ISETTA","IX","IX 1","IX 3","IX 5","M1","M2","M3","M4","M5","M6","M8","NEW CLASS","X1","X2","X3","X3 M","X4","X4 M","X5","X5 M","X6","X6 M","X7","XM","Z1","Z3","Z4","Z8",]
  "BOLLINGER", //["B1",]
  "BORDRIN", //["IV6",]
  "BORGWARD", //["BX5","BX6","BX7","BXI7","ISABELLA",]
  "BRABHAM", //["BT62",]
  "BREMACH", //["SUV",]
  "BRILLIANCE", //["A1","BS4","BS6","M1","N2","M3","V3",]
  "BRISTOL", //["BLENHEIM","BULLET","FIGHTER","SPEEDSTER",]
  "BUFORI", //["GENEVA","LA JOYA",]
  "BUGATTI", //["BOLIDE","CENTODIECI","CHIRON","DIVO","EB 110","EB 112","LA VOITURE NOIRE","TYPE 57","VEYRON",]
  "BUICK", //["CASCADA","CENTURY","ELECTRA","ENCLAVE","ENCORE","ENCORE GX","ENVISION","EXCELLE","EXCELLE GT","GL 6","GL 8","HRV EXCELLE","LACROSSE","LE SABRE","LUCERNE","PARK AVENUE","RAINIER","REATTA","REGAL","RENDEZVOUS","RIVIERA","ROADMASTER","SKYLARK","SUPER","TERRAZA","VELITE 6",]
  "BYD", //["ATTO 3","DOLPHIN","E2","E3","E6","F0","F3","F6","F8","FLYER II","HAN","M3E","SONG","SONG MAX","T3","TANG","YUAN",]
  "CADILLAC", //["ALLANTE","ATS","BLS","BROUGHAM","CATERA","CELESTIQ","CT4","CT5","CT6","CTS","DEVILLE",""DTS,"ELDORSDO","ELR","ESCALADE","FLEETWOOD","LSE","LYRIQ","SEVILLE","SIXTEEN","SRX","STS","XLR","XT4","XT5","XT6","XTS", ]
  "CALLAWAY", //["C12",]
  "CAMPAGNA", //["T-REX","V13R",]
  "CARBODIES", //["TAXI"]
  "CARVER", //[]
  "CATERHAM", //["21","CSR","SEVEN",]
  "CHANGAN", //["BENBEN","CS15","CS35","CS55","CS85","CS95","CX70","EADO","LINMAX","LUMIN","RAETON","SM-8","UNI-K","UNI-T","UNI-V","Z-CHINE",]
  "CHANGFENG", //["FLYING","SUV",]
  "CHERY", //["A3","AMULET","ARRIZO 3","ARRIZO 5","ARRIZO 7","E5","FORA","KIMO(A1)","QQ6(S21)","SWEET(QQ)","TIGGO","TIGGO 3","TIGGO 5","TIGGO 5X",]
  "CHEVROLET", //["Agile", "Alero", "Astra", "Astro", "Avalanche", "Aveo," "Bel Air" "Beretta" "Blazer", "Bolt EUV", "Bolt EV","C-10", "Camaro", "Caprice", "Captiva", "Cavalier", "Celebrity", "Celta", "Classic", "Cobalt", "Colorado", "Corsa", "Corsica", "Corvette", "Cruze", "Epica", "Equinox","Evanda",
  // "Geo Storm" ,"Groove," "HHR," "Impala," "Lacetti," "Lanos," "Lova," "Lumina", "LUV D-MAX", "Malibu," "Menlo", "Metro", "Monte Carlo", "Monza", "Niva", "Nubira", "Omega", "Orlando", "Prizm", "Rezzo", "S-10 Pickup", "Sail/S-RV",
// "C-10", "Camaro", "Caprice", "Captiva", "Cavalier", "Celebrity", "Celta", "Classic", "Cobalt", "Colorado", "Corsa", "Corsica", "Corvette", "Cruze", "Epica", "Equinox", "Evanda",
// "Geo Storm", "Groove", "HHR", "Impala", "Lacetti", "Lanos", "Lova", "Lumina", "LUV D-MAX", "Malibu", "Menlo", "Metro", "Monte Carlo", "Monza", "Niva", "Nubira", "Omega", "Orlando", "Prizm", "Rezzo", "S-10 Pickup", "Sail/S-RV", "Silverado", "Sonic", "Spark", "Spin", "SS", "SSR", "Starcraft", "Suburban", "Tahoe", "Tavera", "Tracker", "Trailblazer", "Trans Sport", "Traverse", "TraX", "Uplander", "Van", "Vectra", "Venture", "Viva", "Volt", "Zafira",]
  "CHRYSLER", //[]
  "CITROEN", //[]
  "CIZETA", //[]
  "CORBELLATI", //[]
  "CORVETTE", //[]
  "CUPRA", //[]
  "CZINGER", //[]
  "DACIA", //[]
  "DADI", //[]
  "DAEWOO", //[]
  "DAF", //[]
  "DAIHATSU", //[]
  "DAIMLER", //[]
  "DALLARA", //[]
  "DALLAS", //[]
  "DATSUN", //[]
  "DAVID", //[]
  "DC", //[]
  "DeLorean", //[]
  "DETOMASO", //[]
  "DERWAYS", //[]
  "DESOTO", //[]
  "DFSK", //[]
  "DONINVEST", //[]
  "DODGE", //[]
  "DONKERVOORT", //[]
  "DR MOTOR", //[]
  "DRAKO", //[]
  "DS AUTOMOBILES",
  "E.GO",
  "EADON GREEN",
  "EAGLE",
  "ELEMENTAL",
  "ENGLER",
  "EVO",
  "FAW",
  "FELINO",
  "FERRARI",
  "FIAT",
  "FISKER",
  "FITTIPALDI",
  "FOMM",
  "FORCE MOTORS",
  "FORD",
  "FSO",
  "FUQI",
  "GALLOPER",
  "GAZ",
  "GEELY",
  "GENESIS",
  "GEO",
  "GFG STYLE",
  "GINETTA",
  "GLEAGLE",
  "GMC",
  "GORDON MURRAY",
  "GREET WALL",
  "GTA Motor",
  "HAFEI",
  "HAIMA",
  "HAVAL",
  "HENNESSEY",
  "HINDUSTAN",
  "HISPANO SUIZA",
  "HOLDEN",
  "HONDA",
  "HONGQI",
  "HSV",
  "HUANGHAI",
  "HUMMER",
  "HURTAN",
  "HYUNDAI",
  "IMSA",
  "INEOS",
  "INFINITI",
  "INNOCENTI",
  "INVICTA",
  "IRAN KHODRO",
  "IRAN KHODRO",
  "IRMSCHER",
  "ISDERA",
  "ISORIVOLTA",
  "ISUZU",
  "IYALDESIGN",
  "IVECO",
  "IZH",
  "JAC",
  "JAGUAR",
  "JEEP",
  "JIANGLING",
  "JOSSE",
  "KARLMANN KING",
  "KARMA",
  "KIA",
  "KIMERA",
  "KOENIGSEGG",
  "KTM",
  "LADA",
  "LAMBORGHINI",
  "LANCIA",
  "LAND ROVER",
  "LANDWIND",
  "LEXUS",
  "LINCOLN",
  "LISTER",
  "LOTUS",
  "LTI",
  "LUAZ",
  "Lucid Motors",
  "LUXGEN",
  "LVCHI",
  "MAHINDRA",
  "MARCOS",
  "MARUSSIA",
  "MARUTI SUZUKI",
  "MASERATI",
  "MAXUS",
  "MAYBACH",
  "MAZDA",
  "MAZZANTI",
  "MCC",
  "MCLAREN",
  "MEGA",
  "MELKUS"
      "MERCEDES-BENZ",
  "MERCEDES-AMG",
  "MERCURY",
  "METROCAB",
  "MG",
  "MICRO",
  "MILAN",
  "MINELLI",
  "MINEMOBILITY",
  "MINI",
  "MITSUBISHI",
  "MITSUOKA",
  "MONTE CARLO",
  "MORGAN",
  "MORRIS",
  "MOSKNICH",
  "MUNRO",
  "MW MOTORS",
  "NIO",
  "NISSAN",
  "NOBLE",
  "O.S.C.A",
  "OLDSMOBILE",
  "OPEL",
  "ORA",
  "PAGANI",
  "PANOZ",
  "PARISS",
  "PAYKAN",
  "PERODUA",
  "PEUGEOT",
  "PICASSO",
  "PININFARINA",
  "PGO",
  "PLYMOUTH",
  "POLARIS",
  "POLESTAR",
  "PONTIAC",
  "PORSCHE",
  "PRAGA",
  "PREMIER",
  "PRINCESS",
  "PROTON",
  "PUCH",
  "PUMA",
  "PURITSLIA",
  "QIANTU",
  "QOROS",
  "QVALE",
  "RAM Trucks",
  "RAVON",
  "RENAULT",
  "RENSULT SAMSUNG",
  "RIMAC",
  "RINSPEED",
  "RIVIAN",
  "ROEWE",
  "ROLLS-ROYCE",
  "RONART",
  "ROVER",
  "RUF",
  "SAAB",
  "SALEEN",
  "SAMSUNG",
  "SANTANA",
  "SATURN",
  "SBARRO",
  "SCG",
  "SCION",
  "SEAT",
  "SEAZ",
  "SERES",
  "SHUANGHUAN",
  "SIN CARS",
  "SKODA",
  "SMA",
  "SMART",
  "SONO MOTORS",
  "SONY",
  "SOUEAST",
  "SPECTRE",
  "SPYKER",
  "SPYROS PANOPOULOS",
  "SSANGYONG",
  "SSC",
  "SUBARU",
  "SUDA",
  "SUZUKI",
  "TAGAZ",
  "TALBOT",
  "TATA MOTORS",
  "TATRA",
  "TECHRULES",
  "TESLA",
  "THINK",
  "TINMA",
  "TIANYE",
  "TOFAS",
  "TONGGONG",
  "TOYOTA",
  "TRABANT",
  "TRAMONTANA",
  "TRIUMPH",
  "TRUMPCHI",
  "TVR",
  "UAZ",
  "UNITI",
  "VANDERHALL",
  "VAUXHALL",
  "VECTOR",
  "VENCER",
  "VENTURI",
  "VESPA",
  "VinFast",
  "VOLKSWAGEN",
  "VOLVO",
  "VUHL",
  "VW-PORSCHE",
  "W MOTORS",
  "WARTBURG",
  "WESTFIELD",
  "WEY",
  "WIESMANN",
  "XIN KAI",
  "XPENG",
  "YUGA",
  "ZACUA",
  "ZASTAVA",
  "ZAZ",
  "ZENDER",
  "Zenvo",
  "ZHIDOU",
  "ZIL",
  "ZOTYE",
  "ZX",
];
List<String> modelsList = [];

List safetyAndDriverAssistanceSystemList = [
  "rear sensor",
  "cruise control",
  "Auto hold "
];
List exteriorList = ["LED lights", "rear fog lights"];
List entertainmentList = ["rear camera", "screan"];
List comfortList = ["bluetooth", "leather seat"];
List interiorList = [];
List<String> trimList = [];
List<String> carTypeList = [
  "SUV",
  "Hatchback",
  "Crossover",
  "Convertible",
  "Sedan",
  "Sports Car",
  "Coupe",
  "Minivan",
  "Station Wagon",
  "Pickup Truck",
];
List<String> interiorColorList = [];
List<String> exteriorColorList = [];
List<String> transmissionList = [
  "Automatic",
  "Manual",
];
List<String> fuelTypeList = [
  "Petrol",
  "Diesel",
  "Compressed Natural Gas",
  "Bio-Diesel",
  "Liquid Petroleum Gas",
  "Ethanol or Methanol",
];
List<String> doorsList = [
  "1",
  "2",
  "3",
  "4",
];

List<String> workshopServicesList = [
  "Mechanics",
  "Electricity",
  "Refrigeration and Air conditioning",
  "General services",
];
