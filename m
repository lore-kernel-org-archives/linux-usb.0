Return-Path: <SRS0=PkR+=S6=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C5EC43219
	for <linux-usb@archiver.kernel.org>; Sun, 28 Apr 2019 02:51:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 22EB32077B
	for <linux-usb@archiver.kernel.org>; Sun, 28 Apr 2019 02:51:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Y0zdiFq+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbfD1CvU (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 27 Apr 2019 22:51:20 -0400
Received: from mail-eopbgr140045.outbound.protection.outlook.com ([40.107.14.45]:56290
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726388AbfD1CvU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 27 Apr 2019 22:51:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XtwyCDMEu0nxA+Dw5RaNY8UvK8ZN6UB2k/KxtW285cA=;
 b=Y0zdiFq+uQsiWBHl8SXFH/1mYua+gONHzxFaoHzAlrj51MhZ2/MGrbdX38Wv8nQ9Qruoq+/cmm0Nq2ZJXpz9jHKf8E7UjOXiGdHkirpskl7euqyAXJxeMEisPwVtVih11ABwI5jzlunqinxqsvC7if0XUlBFKdhCGAvtBCS04wM=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB3184.eurprd04.prod.outlook.com (10.170.229.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.15; Sun, 28 Apr 2019 02:51:16 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61%5]) with mapi id 15.20.1835.015; Sun, 28 Apr 2019
 02:51:16 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 2/7] usb: phy: phy-mxs-usb: add imx7ulp support
Thread-Topic: [PATCH 2/7] usb: phy: phy-mxs-usb: add imx7ulp support
Thread-Index: AQHU/W0/DVgsqs2UH0uHVFe4Vd0CVQ==
Date:   Sun, 28 Apr 2019 02:51:16 +0000
Message-ID: <20190428024847.5046-3-peter.chen@nxp.com>
References: <20190428024847.5046-1-peter.chen@nxp.com>
In-Reply-To: <20190428024847.5046-1-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.14.1
x-clientproxiedby: HK0PR01CA0015.apcprd01.prod.exchangelabs.com
 (2603:1096:203:92::27) To VI1PR04MB5327.eurprd04.prod.outlook.com
 (2603:10a6:803:60::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5e6ef6b-075d-460b-c256-08d6cb846232
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB3184;
x-ms-traffictypediagnostic: VI1PR04MB3184:
x-microsoft-antispam-prvs: <VI1PR04MB3184F1AC3F0EA28F77E9E28A8B380@VI1PR04MB3184.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(396003)(376002)(39860400002)(346002)(366004)(189003)(199004)(6436002)(5660300002)(8936002)(36756003)(6486002)(26005)(52116002)(14454004)(71200400001)(99286004)(71190400001)(6116002)(76176011)(186003)(2906002)(110136005)(1076003)(54906003)(316002)(102836004)(6506007)(386003)(81156014)(25786009)(2501003)(3846002)(73956011)(66946007)(4326008)(66446008)(66556008)(66476007)(64756008)(8676002)(81166006)(305945005)(97736004)(68736007)(53936002)(6512007)(486006)(7736002)(66066001)(478600001)(50226002)(446003)(11346002)(14444005)(256004)(2616005)(476003)(86362001)(44832011);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB3184;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qxxj0mFgdhooNgwmVMMWUpRYssy9xlMUVmrLhzMGWzcORHQ+ycInxSlzSy+9oXZsXgG1ew3nWVg88aL7AQb4psw85JjB1Jh74UAWnwilMG+LogQSqrVDwmqoUDTnJY3STMJkJ2Cg1MUSODdhFp9AuoScN7MUPNKaxriEuj6Pb3NLXN0zKE44i++To6vCaYvmj5yDn4FndziFVV0fX4/QBJPSsp7KhzeZnbqJu4yCRKQQXl1Q6qe1qfJCEeBgJeodGQLbiJjBlKrvNsBmY/LRshIoXxwAZ/JN8hYDrn1JyuWEBIFMvOyQn+O/RjOHaKUILn/OXsIGq0JhjZ9vCzk1Ov0KTKrVJu9YRPP+QSWSVzm/4RBj/xCE39xlq246ITJmCeMKuxDvedWHXf4YWJJ4YeIIgbS4ez6PF3A7RlBxPzQ=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e6ef6b-075d-460b-c256-08d6cb846232
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2019 02:51:16.7502
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3184
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190428025116.dd-Euf_s-mN5s0iVR5bkJhelblH79kAdtYDG3ZktFTQ@z>

QXQgaW14N3VscCwgdGhlIFVTQiByZWxhdGVkIGFuYWxvZyByZWdpc3RlciBpcyBsb2NhdGVkIGlu
IFBIWSByZWdpc3Rlcg0KcmVnaW9uIHRvbywgc28gd2UgbmVlZCB0byBjb250cm9sIFBMTCBhdCBQ
SFkgZHJpdmVyIGRpcmVjdGx5Lg0KDQpTaWduZWQtb2ZmLWJ5OiBQZXRlciBDaGVuIDxwZXRlci5j
aGVuQG54cC5jb20+DQotLS0NCiBkcml2ZXJzL3VzYi9waHkvcGh5LW14cy11c2IuYyB8IDc2ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCiAxIGZpbGUgY2hhbmdl
ZCwgNzUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy91c2IvcGh5L3BoeS1teHMtdXNiLmMgYi9kcml2ZXJzL3VzYi9waHkvcGh5LW14cy11c2IuYw0K
aW5kZXggMWIxYmIwYWQ0MGMzLi45MGM5NmE4ZTkzNDIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3Vz
Yi9waHkvcGh5LW14cy11c2IuYw0KKysrIGIvZHJpdmVycy91c2IvcGh5L3BoeS1teHMtdXNiLmMN
CkBAIC0yMCw2ICsyMCw3IEBADQogDQogI2RlZmluZSBEUklWRVJfTkFNRSAibXhzX3BoeSINCiAN
CisvKiBSZWdpc3RlciBNYWNybyAqLw0KICNkZWZpbmUgSFdfVVNCUEhZX1BXRAkJCQkweDAwDQog
I2RlZmluZSBIV19VU0JQSFlfVFgJCQkJMHgxMA0KICNkZWZpbmUgSFdfVVNCUEhZX0NUUkwJCQkJ
MHgzMA0KQEAgLTM3LDYgKzM4LDExIEBADQogI2RlZmluZSBHTV9VU0JQSFlfVFhfVFhDQUw0NURO
KHgpICAgICAgICAgICAgKCgoeCkgJiAweGYpIDw8IDgpDQogI2RlZmluZSBHTV9VU0JQSFlfVFhf
RF9DQUwoeCkgICAgICAgICAgICAgICAgKCgoeCkgJiAweGYpIDw8IDApDQogDQorLyogaW14N3Vs
cCAqLw0KKyNkZWZpbmUgSFdfVVNCUEhZX1BMTF9TSUMJCQkweGEwDQorI2RlZmluZSBIV19VU0JQ
SFlfUExMX1NJQ19TRVQJCQkweGE0DQorI2RlZmluZSBIV19VU0JQSFlfUExMX1NJQ19DTFIJCQkw
eGE4DQorDQogI2RlZmluZSBCTV9VU0JQSFlfQ1RSTF9TRlRSU1QJCQlCSVQoMzEpDQogI2RlZmlu
ZSBCTV9VU0JQSFlfQ1RSTF9DTEtHQVRFCQkJQklUKDMwKQ0KICNkZWZpbmUgQk1fVVNCUEhZX0NU
UkxfT1RHX0lEX1ZBTFVFCQlCSVQoMjcpDQpAQCAtNTUsNiArNjEsMTIgQEANCiAjZGVmaW5lIEJN
X1VTQlBIWV9JUF9GSVggICAgICAgICAgICAgICAgICAgICAgIChCSVQoMTcpIHwgQklUKDE4KSkN
CiANCiAjZGVmaW5lIEJNX1VTQlBIWV9ERUJVR19DTEtHQVRFCQkJQklUKDMwKQ0KKy8qIGlteDd1
bHAgKi8NCisjZGVmaW5lIEJNX1VTQlBIWV9QTExfTE9DSwkJCUJJVCgzMSkNCisjZGVmaW5lIEJN
X1VTQlBIWV9QTExfUkVHX0VOQUJMRQkJQklUKDIxKQ0KKyNkZWZpbmUgQk1fVVNCUEhZX1BMTF9C
WVBBU1MJCQlCSVQoMTYpDQorI2RlZmluZSBCTV9VU0JQSFlfUExMX1BPV0VSCQkJQklUKDEyKQ0K
KyNkZWZpbmUgQk1fVVNCUEhZX1BMTF9FTl9VU0JfQ0xLUwkJQklUKDYpDQogDQogLyogQW5hdG9w
IFJlZ2lzdGVycyAqLw0KICNkZWZpbmUgQU5BRElHX0FOQV9NSVNDMAkJCTB4MTUwDQpAQCAtMTY3
LDYgKzE3OSw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXhzX3BoeV9kYXRhIGlteDZ1bF9waHlf
ZGF0YSA9IHsNCiAJLmZsYWdzID0gTVhTX1BIWV9ESVNDT05ORUNUX0xJTkVfV0lUSE9VVF9WQlVT
LA0KIH07DQogDQorc3RhdGljIGNvbnN0IHN0cnVjdCBteHNfcGh5X2RhdGEgaW14N3VscF9waHlf
ZGF0YSA9IHsNCit9Ow0KKw0KIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG14c19w
aHlfZHRfaWRzW10gPSB7DQogCXsgLmNvbXBhdGlibGUgPSAiZnNsLGlteDZzeC11c2JwaHkiLCAu
ZGF0YSA9ICZpbXg2c3hfcGh5X2RhdGEsIH0sDQogCXsgLmNvbXBhdGlibGUgPSAiZnNsLGlteDZz
bC11c2JwaHkiLCAuZGF0YSA9ICZpbXg2c2xfcGh5X2RhdGEsIH0sDQpAQCAtMTc0LDYgKzE4OSw3
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG14c19waHlfZHRfaWRzW10gPSB7
DQogCXsgLmNvbXBhdGlibGUgPSAiZnNsLGlteDIzLXVzYnBoeSIsIC5kYXRhID0gJmlteDIzX3Bo
eV9kYXRhLCB9LA0KIAl7IC5jb21wYXRpYmxlID0gImZzbCx2ZjYxMC11c2JwaHkiLCAuZGF0YSA9
ICZ2ZjYxMF9waHlfZGF0YSwgfSwNCiAJeyAuY29tcGF0aWJsZSA9ICJmc2wsaW14NnVsLXVzYnBo
eSIsIC5kYXRhID0gJmlteDZ1bF9waHlfZGF0YSwgfSwNCisJeyAuY29tcGF0aWJsZSA9ICJmc2ws
aW14N3VscC11c2JwaHkiLCAuZGF0YSA9ICZpbXg3dWxwX3BoeV9kYXRhLCB9LA0KIAl7IC8qIHNl
bnRpbmVsICovIH0NCiB9Ow0KIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG14c19waHlfZHRfaWRz
KTsNCkBAIC0xOTgsNiArMjE0LDExIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBpc19pbXg2c2xfcGh5
KHN0cnVjdCBteHNfcGh5ICpteHNfcGh5KQ0KIAlyZXR1cm4gbXhzX3BoeS0+ZGF0YSA9PSAmaW14
NnNsX3BoeV9kYXRhOw0KIH0NCiANCitzdGF0aWMgaW5saW5lIGJvb2wgaXNfaW14N3VscF9waHko
c3RydWN0IG14c19waHkgKm14c19waHkpDQorew0KKwlyZXR1cm4gbXhzX3BoeS0+ZGF0YSA9PSAm
aW14N3VscF9waHlfZGF0YTsNCit9DQorDQogLyoNCiAgKiBQSFkgbmVlZHMgc29tZSAzMksgY3lj
bGVzIHRvIHN3aXRjaCBmcm9tIDMySyBjbG9jayB0bw0KICAqIGJ1cyAoc3VjaCBhcyBBSEIvQVhJ
LCBldGMpIGNsb2NrLg0KQEAgLTIyMSwxNCArMjQyLDU5IEBAIHN0YXRpYyB2b2lkIG14c19waHlf
dHhfaW5pdChzdHJ1Y3QgbXhzX3BoeSAqbXhzX3BoeSkNCiAJfQ0KIH0NCiANCitzdGF0aWMgaW50
IHdhaXRfZm9yX3BsbF9sb2NrKGNvbnN0IHZvaWQgX19pb21lbSAqYmFzZSkNCit7DQorCWludCBs
b29wX2NvdW50ID0gMTAwOw0KKw0KKwkvKiBXYWl0IGZvciBQTEwgdG8gbG9jayAqLw0KKwlkbyB7
DQorCQlpZiAocmVhZGwoYmFzZSArIEhXX1VTQlBIWV9QTExfU0lDKSAmIEJNX1VTQlBIWV9QTExf
TE9DSykNCisJCQlicmVhazsNCisJCXVzbGVlcF9yYW5nZSgxMDAsIDE1MCk7DQorCX0gd2hpbGUg
KGxvb3BfY291bnQtLSA+IDApOw0KKw0KKwlyZXR1cm4gcmVhZGwoYmFzZSArIEhXX1VTQlBIWV9Q
TExfU0lDKSAmIEJNX1VTQlBIWV9QTExfTE9DSw0KKwkJCT8gMCA6IC1FVElNRURPVVQ7DQorfQ0K
Kw0KK3N0YXRpYyBpbnQgbXhzX3BoeV9wbGxfZW5hYmxlKHZvaWQgX19pb21lbSAqYmFzZSwgYm9v
bCBlbmFibGUpDQorew0KKwlpbnQgcmV0ID0gMDsNCisNCisJaWYgKGVuYWJsZSkgew0KKwkJd3Jp
dGVsKEJNX1VTQlBIWV9QTExfUkVHX0VOQUJMRSwgYmFzZSArIEhXX1VTQlBIWV9QTExfU0lDX1NF
VCk7DQorCQl3cml0ZWwoQk1fVVNCUEhZX1BMTF9CWVBBU1MsIGJhc2UgKyBIV19VU0JQSFlfUExM
X1NJQ19DTFIpOw0KKwkJd3JpdGVsKEJNX1VTQlBIWV9QTExfUE9XRVIsIGJhc2UgKyBIV19VU0JQ
SFlfUExMX1NJQ19TRVQpOw0KKwkJcmV0ID0gd2FpdF9mb3JfcGxsX2xvY2soYmFzZSk7DQorCQlp
ZiAocmV0KQ0KKwkJCXJldHVybiByZXQ7DQorCQl3cml0ZWwoQk1fVVNCUEhZX1BMTF9FTl9VU0Jf
Q0xLUywgYmFzZSArDQorCQkJCUhXX1VTQlBIWV9QTExfU0lDX1NFVCk7DQorCX0gZWxzZSB7DQor
CQl3cml0ZWwoQk1fVVNCUEhZX1BMTF9FTl9VU0JfQ0xLUywgYmFzZSArDQorCQkJCUhXX1VTQlBI
WV9QTExfU0lDX0NMUik7DQorCQl3cml0ZWwoQk1fVVNCUEhZX1BMTF9QT1dFUiwgYmFzZSArIEhX
X1VTQlBIWV9QTExfU0lDX0NMUik7DQorCQl3cml0ZWwoQk1fVVNCUEhZX1BMTF9CWVBBU1MsIGJh
c2UgKyBIV19VU0JQSFlfUExMX1NJQ19TRVQpOw0KKwkJd3JpdGVsKEJNX1VTQlBIWV9QTExfUkVH
X0VOQUJMRSwgYmFzZSArIEhXX1VTQlBIWV9QTExfU0lDX0NMUik7DQorCX0NCisNCisJcmV0dXJu
IHJldDsNCit9DQorDQogc3RhdGljIGludCBteHNfcGh5X2h3X2luaXQoc3RydWN0IG14c19waHkg
Km14c19waHkpDQogew0KIAlpbnQgcmV0Ow0KIAl2b2lkIF9faW9tZW0gKmJhc2UgPSBteHNfcGh5
LT5waHkuaW9fcHJpdjsNCiANCisJaWYgKGlzX2lteDd1bHBfcGh5KG14c19waHkpKSB7DQorCQly
ZXQgPSBteHNfcGh5X3BsbF9lbmFibGUoYmFzZSwgdHJ1ZSk7DQorCQlpZiAocmV0KQ0KKwkJCXJl
dHVybiByZXQ7DQorCX0NCisNCiAJcmV0ID0gc3RtcF9yZXNldF9ibG9jayhiYXNlICsgSFdfVVNC
UEhZX0NUUkwpOw0KIAlpZiAocmV0KQ0KLQkJcmV0dXJuIHJldDsNCisJCWdvdG8gZGlzYWJsZV9w
bGw7DQogDQogCS8qIFBvd2VyIHVwIHRoZSBQSFkgKi8NCiAJd3JpdGVsKDAsIGJhc2UgKyBIV19V
U0JQSFlfUFdEKTsNCkBAIC0yNTMsNiArMzE5LDExIEBAIHN0YXRpYyBpbnQgbXhzX3BoeV9od19p
bml0KHN0cnVjdCBteHNfcGh5ICpteHNfcGh5KQ0KIAlteHNfcGh5X3R4X2luaXQobXhzX3BoeSk7
DQogDQogCXJldHVybiAwOw0KKw0KK2Rpc2FibGVfcGxsOg0KKwlpZiAoaXNfaW14N3VscF9waHko
bXhzX3BoeSkpDQorCQlteHNfcGh5X3BsbF9lbmFibGUoYmFzZSwgZmFsc2UpOw0KKwlyZXR1cm4g
cmV0Ow0KIH0NCiANCiAvKiBSZXR1cm4gdHJ1ZSBpZiB0aGUgdmJ1cyBpcyB0aGVyZSAqLw0KQEAg
LTM3NCw2ICs0NDUsOSBAQCBzdGF0aWMgdm9pZCBteHNfcGh5X3NodXRkb3duKHN0cnVjdCB1c2Jf
cGh5ICpwaHkpDQogCXdyaXRlbChCTV9VU0JQSFlfQ1RSTF9DTEtHQVRFLA0KIAkgICAgICAgcGh5
LT5pb19wcml2ICsgSFdfVVNCUEhZX0NUUkxfU0VUKTsNCiANCisJaWYgKGlzX2lteDd1bHBfcGh5
KG14c19waHkpKQ0KKwkJbXhzX3BoeV9wbGxfZW5hYmxlKHBoeS0+aW9fcHJpdiwgZmFsc2UpOw0K
Kw0KIAljbGtfZGlzYWJsZV91bnByZXBhcmUobXhzX3BoeS0+Y2xrKTsNCiB9DQogDQotLSANCjIu
MTQuMQ0KDQo=
