class Env {
  static const hostname = String.fromEnvironment("hostname",
      defaultValue: "https://api.carsnoop.com/");
  static const stage = String.fromEnvironment("stage", defaultValue: "prd");
  static const baseUrl =
      String.fromEnvironment("baseUrl", defaultValue: "$hostname$stage");
  static const apiFileUrl = String.fromEnvironment("apiFileUrl",
      defaultValue: "$hostname$stage/data");
  static const apiKey = String.fromEnvironment('apiKey',
      defaultValue: 'h3JOCaQ1Gq256Cs4YGnRC8fuAvmov23E1SiQppWb');
}
