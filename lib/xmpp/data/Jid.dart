import 'package:quiver/core.dart';

class Jid {
  String? _local = '';
  String? _domain = '';
  String? _resource = '';

  Jid(String? local, String? domain, String? resource) {
    _local = local;
    _domain = domain;
    _resource = resource;
  }

  @override
  bool operator ==(other) {
    return other is Jid && local == other.local && domain == other.domain && resource == other.resource;
  }

  String? get local => _local;

  String? get domain => _domain;

  String? get resource => _resource;

  String? get fullJid {
    if (local != null &&
        domain != null &&
        resource != null &&
        local?.isNotEmpty == true &&
        domain?.isNotEmpty == true &&
        resource?.isNotEmpty == true) {
      return '$_local@$_domain/$_resource';
    }
    if (local == null || local?.isEmpty == true) {
      return _domain;
    }
    if (resource == null || resource?.isEmpty == true) {
      return '$_local@$_domain';
    }
    return '';
  }

  String get userAtDomain {
    if (local != null && local?.isNotEmpty == true) return '$_local@$_domain';
    return _domain ?? "";
  }

  bool isValid() {
    return local != null && local?.isNotEmpty == true && domain != null && domain?.isNotEmpty == true;
  }

  static Jid fromFullJid(String fullJid) {
    var exp = RegExp(r'^((.*?)@)?([^/@]+)(/(.*))?$');
    Iterable<Match> matches = exp.allMatches(fullJid);
    var match = matches.isNotEmpty ? matches.first : null;
    if (match != null) {
      return Jid(match[2], match[3], match[5]);
    } else {
      return InvalidJid();
    }
  }

  @override
  int get hashCode {
    return hash3(_local, _domain, _resource);
  }
}

class InvalidJid extends Jid {
  InvalidJid() : super('', '', '');
}
