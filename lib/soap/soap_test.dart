import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

class Soap {

  static const String PS_LISTENER = 'https://calidev.vub.be/PSIGW/PeopleSoftServiceListeningConnector';


  Future<List<String>> doSoapRequest() async {

    final String envelope = getEnvelope();

    // Send the POST request, with full SOAP envelope as the request body.
    http.Response response = await http.post (
        Uri.parse(PS_LISTENER),
        headers: <String, String>{
          'SoapAction': 'SCC_GET_LOV.v1',
          'From': 'PSFT_CS',
          'TO': 'PSFT_CS',
          'Content-Type': 'text/xml; charset=utf-8',
        },
        body: envelope
    );

    final String rawXmlResponse = response.body;

    return parseResponseToXml(rawXmlResponse);
  }

  List<String> parseResponseToXml(String rawResponse) {
    xml.XmlDocument parsedXml = xml.XmlDocument.parse(rawResponse);
    return parsedXml.findAllElements('DESC').map((xml.XmlElement e) => e.text).toList();
  }

  String getEnvelope() {
    return '''<?xml version="1.0" encoding="utf-8"?>
        <soapenv:Envelope xmlns:soapenv="http://www.w3.org/2003/05/soap-envelope" xmlns:serv="http://xmlns.oracle.com/Enterprise/HCM/services">
          <soapenv:Body>
            <serv:SCC_LOV_REQ.v1>
              <serv:LOVS>
                <serv:LOV>
                  <serv:FIELDNAME>SCC_SUBJECT_CLS</serv:FIELDNAME>
                  <serv:RECORDNAME>SSR_LOV_WRK</serv:RECORDNAME>
                  <serv:KEYS>
                    <serv:KEY>
                      <serv:FIELDNAME>INSTITUTION</serv:FIELDNAME>
                      <serv:FIELDVALUE>00001</serv:FIELDVALUE>
                    </serv:KEY>
                    <serv:KEY>
                      <serv:FIELDNAME>STRM</serv:FIELDNAME>
                      <serv:FIELDVALUE>2122</serv:FIELDVALUE>
                    </serv:KEY>
                    <serv:KEY>
                      <serv:FIELDNAME>ACAD_CAREER</serv:FIELDNAME>
                      <serv:FIELDVALUE>BA</serv:FIELDVALUE>
                    </serv:KEY>
                  </serv:KEYS>
                </serv:LOV>
              </serv:LOVS>
            </serv:SCC_LOV_REQ.v1>
          </soapenv:Body>
        </soapenv:Envelope>''';
  }
}