{ config, lib, pkgs, ... }:
{
 users.mutableUsers = false;
 security.sudo.wheelNeedsPassword = false;
 users.users = {
   blender = {
     isNormalUser = true;
     createHome = true;
     uid = 1000;
   };
   sgo = {
     isNormalUser = true;
     createHome = true;
     uid = 2000;
     extraGroups = ["wheel"];
     openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCuOj3f2CIbZO+1yL3H+C6ZJYlKUF3F5ok6i6sEnYdv99WZR7Q4Ip/9x7XT2IpqsA8ayaDeEZEeuN6U/A5cIkJJ8YNrej+pvLV7AMxaRDe0FVdZBYfoRzyRXlqe3vJl6wiVYp1owAnIMUz+df/Qt8/IjenZAmY7ga30GJfmSDULAkfeyMP40dFl/wVQJobOmiyooRxMGDECt+xKZ8cOGTxvaqkEgUtY+pWpRO7cCZBygdnnMU+DNqFNF3PedRBhRMd+DOyXh0OBLmrO6m1sFAjrBqEFeWv/JMlRCimxe3JMkgDU4uqlSdXmPx+wCqFQEATYn+wMzy+7TwRP7PNNDGZiKoH12j+WjkqndDiP5xjNDdz6ompqRZ0D/SInag03lwzFGx+XMTWDwhcwOuR8XeByVPXhXIgDXbf7OMIsUwjFnoKrovvjUXFktWGFOzvakFFKGJsuYdCxMphlXiIIxzFalZ4WyG0Ci8Xj/2tcS1PMcQWWInzrZJNDe5SK/i7ao4TuLSLTg+4OIT+USl6SaEO/sPYRIro7Jd4p+lKEITD5KFLiKMTzsUeeq7CHd7t5BeauMfsShf8J3Y55qLXAWzvgyNefZwz9mRa+yz34D54+MNTgTUZa2Mb2Xx0mYTlGu/cPVnASeMRf0hXd/rentmEtG0XTzpbBZrB4u3JryUdmKQ== stig+x@stig.io"];
   };
 };
}
