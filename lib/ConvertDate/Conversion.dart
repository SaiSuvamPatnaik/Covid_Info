String converteddate(List<dynamic> monthsinwords, decodedJson, int j) {

    String date;
    String updateddate;
    String newdate;
    if (decodedJson["data"][j]["day"][5] == "0") {
      date = decodedJson["data"][j]["day"][6];
    }
    else {
      date =
          decodedJson["data"][j]["day"][5] + decodedJson["data"][j]["day"][6];
    }
    for (int i = 1; i <= monthsinwords.length; i++) {
      if (date == i.toString()) {
        updateddate = monthsinwords[i - 1];
      }
    }
    if (decodedJson["data"][j]["day"][8] == "0") {
      newdate = updateddate + decodedJson["data"][j]["day"][9] +
          decodedJson["data"][j]["day"][0]
          + decodedJson["data"][j]["day"][1] +
          decodedJson["data"][j]["day"][2] + decodedJson["data"][j]["day"][3];
    }
    else {
      newdate = updateddate + decodedJson["data"][j]["day"][8] +
          decodedJson["data"][j]["day"][9] +
          decodedJson["data"][j]["day"][0]
          + decodedJson["data"][j]["day"][1] +
          decodedJson["data"][j]["day"][2] + decodedJson["data"][j]["day"][3];
    }
    return newdate;

}