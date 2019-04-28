Return-Path: <SRS0=PkR+=S6=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A82E9C43219
	for <linux-usb@archiver.kernel.org>; Sun, 28 Apr 2019 02:51:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 761C82077B
	for <linux-usb@archiver.kernel.org>; Sun, 28 Apr 2019 02:51:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="V9621sem"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbfD1Cvp (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 27 Apr 2019 22:51:45 -0400
Received: from mail-eopbgr140075.outbound.protection.outlook.com ([40.107.14.75]:24224
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726388AbfD1Cvp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 27 Apr 2019 22:51:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YBqfCsjoL6wR1l2lsj0O0OvFYc8c7GsY65CrM3bgos=;
 b=V9621semGw8bv2wIsiTOC8ROCRQDdEk5557BrKnXDMrGfdePoRMUGdv8knofH6Xu3VeUEt4gT1CM3kz8g+a+j9JCe3F454/sB21K1FTt2CdctDsxKzXiFw71N80YudSesVta8IgyolGZUj+OlHeU1d4FNwT9Q6JqGxMyhZMWdnY=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB3184.eurprd04.prod.outlook.com (10.170.229.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.15; Sun, 28 Apr 2019 02:51:36 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61%5]) with mapi id 15.20.1835.015; Sun, 28 Apr 2019
 02:51:36 +0000
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
Subject: [PATCH 6/7] ARM: dts: imx7ulp: add imx7ulp USBOTG1 support
Thread-Topic: [PATCH 6/7] ARM: dts: imx7ulp: add imx7ulp USBOTG1 support
Thread-Index: AQHU/W1IxN9UeWE440ehfCRd3nlpng==
Date:   Sun, 28 Apr 2019 02:51:30 +0000
Message-ID: <20190428024847.5046-7-peter.chen@nxp.com>
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
x-ms-office365-filtering-correlation-id: 1b1fc417-22b4-4f70-76ce-08d6cb846a96
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB3184;
x-ms-traffictypediagnostic: VI1PR04MB3184:
x-microsoft-antispam-prvs: <VI1PR04MB3184E6F8FA165E18B918E5E98B380@VI1PR04MB3184.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(396003)(376002)(39860400002)(346002)(366004)(189003)(199004)(6436002)(5660300002)(8936002)(36756003)(6486002)(26005)(52116002)(14454004)(71200400001)(99286004)(71190400001)(6116002)(76176011)(186003)(2906002)(110136005)(1076003)(54906003)(316002)(102836004)(6506007)(386003)(81156014)(25786009)(2501003)(3846002)(6666004)(73956011)(66946007)(4326008)(66446008)(66556008)(66476007)(64756008)(8676002)(81166006)(305945005)(97736004)(68736007)(53936002)(6512007)(486006)(7736002)(66066001)(478600001)(50226002)(446003)(11346002)(14444005)(256004)(2616005)(476003)(86362001)(44832011);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB3184;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KLTQ9SpAwnWlUVYa7SFS/q50nW+Ee/4hDw68Vu6uUzQOO3wc4jVnWLpAWoojqS2RM/GCv8tT6Uxfv7VabnFQCzIL4B/e7DeMuBeCHkh7O0GNMNnBVjaalJ6zR6vYsGeOZaOZB08McEpmqxunVj5N6w9rS+WIHQhxzti1uqgfnMxBRDPg3++yAFzBHwyGLNNMTGQ90URvYUxN8JutiNZP/qT+Dqk8W0BVLqfmECRNz+FudLovriX52ONb/L3PY9AGiYM/Alsw4zPhoR304863qqsDxvZ5UUbFhlIQQGtzaiUSlnMuJlbQ9LrEp2tIiQ674r9DN/w0X4LQn2F9D3Ocopk2lYTC1tDkl2D9b7MC9gvsH4zH6yQVsQxECUGwBJ7b0KuIhp5Aclzkw76cGk8YE42pONR7Qidi9ab/GA0jdBw=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1fc417-22b4-4f70-76ce-08d6cb846a96
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2019 02:51:30.7303
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3184
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190428025130.bwBfpSU-mEB_TJlNgMEhNkFMJxSBxic5HvAfGKqxoqY@z>

QWRkIGlteDd1bHAgVVNCT1RHMSBzdXBwb3J0Lg0KDQpTaWduZWQtb2ZmLWJ5OiBQZXRlciBDaGVu
IDxwZXRlci5jaGVuQG54cC5jb20+DQotLS0NCiBhcmNoL2FybS9ib290L2R0cy9pbXg3dWxwLmR0
c2kgfCAzMCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwg
MzAgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14N3Vs
cC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14N3VscC5kdHNpDQppbmRleCBmY2E2ZTUwZjM3
YzguLmUyOTQ0Zjk4ZWFjNiAxMDA2NDQNCi0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDd1bHAu
ZHRzaQ0KKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14N3VscC5kdHNpDQpAQCAtMzAsNiArMzAs
NyBAQA0KIAkJc2VyaWFsMSA9ICZscHVhcnQ1Ow0KIAkJc2VyaWFsMiA9ICZscHVhcnQ2Ow0KIAkJ
c2VyaWFsMyA9ICZscHVhcnQ3Ow0KKwkJdXNicGh5MCA9ICZ1c2JwaHkxOw0KIAl9Ow0KIA0KIAlj
cHVzIHsNCkBAIC0xMzMsNiArMTM0LDM1IEBADQogCQkJY2xvY2stbmFtZXMgPSAiaXBnIiwgInBl
ciI7DQogCQl9Ow0KIA0KKwkJdXNib3RnMTogdXNiQDQwMzMwMDAwIHsNCisJCQljb21wYXRpYmxl
ID0gImZzbCxpbXg3dWxwLXVzYiIsICJmc2wsaW14NnVsLXVzYiIsDQorCQkJCSJmc2wsaW14Mjct
dXNiIjsNCisJCQlyZWcgPSA8MHg0MDMzMDAwMCAweDIwMD47DQorCQkJaW50ZXJydXB0cyA9IDxH
SUNfU1BJIDQwIElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KKwkJCWNsb2NrcyA9IDwmcGNjMiBJTVg3
VUxQX0NMS19VU0IwPjsNCisJCQlmc2wsdXNicGh5ID0gPCZ1c2JwaHkxPjsNCisJCQlmc2wsdXNi
bWlzYyA9IDwmdXNibWlzYzEgMD47DQorCQkJYWhiLWJ1cnN0LWNvbmZpZyA9IDwweDA+Ow0KKwkJ
CXR4LWJ1cnN0LXNpemUtZHdvcmQgPSA8MHg4PjsNCisJCQlyeC1idXJzdC1zaXplLWR3b3JkID0g
PDB4OD47DQorCQkJc3RhdHVzID0gImRpc2FibGVkIjsNCisJCX07DQorDQorCQl1c2JtaXNjMTog
dXNibWlzY0A0MDMzMDIwMCB7DQorCQkJI2luZGV4LWNlbGxzID0gPDE+Ow0KKwkJCWNvbXBhdGli
bGUgPSAiZnNsLGlteDd1bHAtdXNibWlzYyIsICJmc2wsaW14N2QtdXNibWlzYyIsDQorCQkJCSJm
c2wsaW14NnEtdXNibWlzYyI7DQorCQkJcmVnID0gPDB4NDAzMzAyMDAgMHgyMDA+Ow0KKwkJfTsN
CisNCisJCXVzYnBoeTE6IHVzYnBoeUAweDQwMzUwMDAwIHsNCisJCQljb21wYXRpYmxlID0gImZz
bCxpbXg3dWxwLXVzYnBoeSIsDQorCQkJCSJmc2wsaW14NnVsLXVzYnBoeSIsICJmc2wsaW14MjMt
dXNicGh5IjsNCisJCQlyZWcgPSA8MHg0MDM1MDAwMCAweDEwMDA+Ow0KKwkJCWludGVycnVwdHMg
PSA8R0lDX1NQSSAzOSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCisJCQljbG9ja3MgPSA8JnBjYzIg
SU1YN1VMUF9DTEtfVVNCX1BIWT47DQorCQl9Ow0KKw0KIAkJdXNkaGMwOiBtbWNANDAzNzAwMDAg
ew0KIAkJCWNvbXBhdGlibGUgPSAiZnNsLGlteDd1bHAtdXNkaGMiLCAiZnNsLGlteDZzeC11c2Ro
YyI7DQogCQkJcmVnID0gPDB4NDAzNzAwMDAgMHgxMDAwMD47DQotLSANCjIuMTQuMQ0KDQo=
