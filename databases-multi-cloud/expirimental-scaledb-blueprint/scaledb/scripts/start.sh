#!/bin/bash

RDIR=/root    # The root directory
curl http://install.bizkit.co.il/iscaledb  -o iscaledb -ucloudify:t1234
chmod 750 iscaledb

read -d '' KEY <<"EOF"
-----BEGIN RSA PRIVATE KEY-----
MIIEpgIBAAKCAQEAwLat8uxdcp4iexdxv+Yf0lhAeBJ13aoE4S/RIsYF/I0CpYbS
75vvNT/lhIsb9/vp1TZy1sOex5C4XrC2QyPZg4mfQPMfTIxJy4qrqkiPNb0cky4y
cVZUsyHCsPe5wt1ICXcT7+3dL2hAwMt09k5smjqZ3leujJkvB92Wzq2kIXCr4bIG
BiQ3xiVr2kS7ECE3uGf0aeGak5AlFZu76DDMmlQSD3yEyZIKeYsCC78bQ515/hez
go0Gz3IbmVqaaxDde0fThLjCl+yoGSCdky+uFyUy84gPKU58e5y2hl52PowN6UXD
jdEmzuxTwctp9ejoMnU2jZEwKu75M1XbUvFaGQIDAQABAoIBAQCCtCO8a8VhdJFM
TPVQQuL4RfTLuzGHusV+eXDtlcL/rB/MZmnwKyGNSx3+zF6WzZuliT1QHfM1xRjW
2CF13f2rsg55/asPvuJaE14kqvu+ZdnYlO+PYQ8nQ1GJtyqdWHmAOewiwYBPo/Sv
Dg7w8vXDkNVFMNDo+Qgl3Ito9+om5tYOqibPnZUEoj3VCxrr5zWKFAq09jvcuosf
9LqAPdgUI2SeCcgfz3kIRrBgj1TsLAJyPTD3S7xJtm1lIja+VCLkiO/pcw/gtSly
0r2CIDlhMqdLwGXgE6KqULA33Pq1Ywyy5WojzZcU5KkiqadtoVN0jd7Z8S1FtRAu
zfOoSwUBAoGBAPd5oLj4NUvWWu3TwWHIBqlm9PKDde/U6S/Vu+IFgkOyJvBgn9F+
xpTtuP633oZFCY2wx/wLQ9zH+Jmwh3Ut+T/JwW5sNiLAloFyAArDMHWw527OiM8F
4UvzZFmbbQRURcuQPV8kN7sZgKrrMF/VH+VKVEpH9bec9tTfIgMbtOi5AoGBAMda
ImXfgSHSCsmjm2rjXADZHszie0I6nA/iR3Lg7FTXi9FTRg/jd68GyocbdbOtfFii
k2Zqr5kBMtJUpKf9zAosgDlYVJZomCifZaNvVpxVj9REvqTFEqug1XcOeMg0zXdx
sCtdQikcHjlea2K8JY2VH0MLU+LPgmuS1de1IIxhAoGBAKH1HXQwLGEHVdbTgHmH
uKRg1ulnk2Vzx3Agxqbyx/+ZtdYWxkEKYNfShAFfP+hLgicSjK6siKsSy+V5HA1a
Gwbd+RNVClDQDS+F9fUVLL+5GJzx2aLyzDEyhngGOeBdbpf8O83qG/b8h7JT3QK6
rfcXH/bFBVA3D2rc5Jt4JHsxAoGBAJ7N957tuCGn//32/gTdD1qBm56dQJFWvSGO
IVqrQLipaHEdBC/+BUaBg26zekTjC65T/FXW4QFiyghxcyV78UGdh5um+ONEeQnL
SJ00QWuSYVw4UyJQ93mPSt1nwuHB5nejMjKpPN4gzxbmV2c0+DlcNKYk7PM+WOe2
9fC7Ei2hAoGBAIyBqOIfZ6tNcKRYCIVF57kU58eveptWkEK9dZX5NoGaTJCCfJmD
w4cm670VJLlwMPZR9H9NTSZZfgFPDbbwU5zuMbjWxtyv6k1bXUuhuNKhDTPoiKNK
fkJmVbNTbfETDs+TdZTd+AzyPd8bthrBks+gsc3b9Yyr52QZqBWeEIk7
-----END RSA PRIVATE KEY-----
EOF
echo "${KEY}" > /root/cloud.key
chmod 400 /root/cloud.key
perl iscaledb -install_all -cloudify
nohup perl iscaledb -install_all & 2>&1 </dev/null
exit 0
