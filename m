Return-Path: <SRS0=PkR+=S6=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB06BC43219
	for <linux-usb@archiver.kernel.org>; Sun, 28 Apr 2019 02:51:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B0F07212F5
	for <linux-usb@archiver.kernel.org>; Sun, 28 Apr 2019 02:51:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="j0UoMD5I"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbfD1Cvs (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 27 Apr 2019 22:51:48 -0400
Received: from mail-eopbgr140075.outbound.protection.outlook.com ([40.107.14.75]:24224
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726473AbfD1Cvr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 27 Apr 2019 22:51:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6obrrsZ3MZjOxH5eUE6YoGJ6t4sgXDau2XwbkCnODg=;
 b=j0UoMD5IBBq7Bw+vBLyoPGR9WfmDMJMOyOPV7lk1h8cHYBje6f+Z+ZhcD351DGBt39+yEY56FPIEkb4noyB+w3c0u0I/rKuWyIb9mVwXfRMdzBsRRQUJ0dQHwhCTnSPoelLoni4IqzycuEpflQW86DhuAsXOGN/I7x9Bp2mTt08=
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
Subject: [PATCH 7/7] ARM: dts: imx7ulp-evk: enable USBOTG1 support
Thread-Topic: [PATCH 7/7] ARM: dts: imx7ulp-evk: enable USBOTG1 support
Thread-Index: AQHU/W1KDse2wTopTEeZG0ORLjRYqw==
Date:   Sun, 28 Apr 2019 02:51:34 +0000
Message-ID: <20190428024847.5046-8-peter.chen@nxp.com>
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
x-ms-office365-filtering-correlation-id: 311e4d6e-eefd-40f6-899a-08d6cb846ca0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB3184;
x-ms-traffictypediagnostic: VI1PR04MB3184:
x-microsoft-antispam-prvs: <VI1PR04MB318472E1A51E700C2582C9038B380@VI1PR04MB3184.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(396003)(376002)(39860400002)(346002)(366004)(189003)(199004)(6436002)(5660300002)(8936002)(36756003)(6486002)(26005)(52116002)(14454004)(71200400001)(99286004)(71190400001)(6116002)(76176011)(186003)(2906002)(110136005)(1076003)(54906003)(316002)(102836004)(6506007)(386003)(81156014)(25786009)(2501003)(3846002)(73956011)(66946007)(4326008)(66446008)(66556008)(66476007)(64756008)(8676002)(81166006)(305945005)(97736004)(68736007)(53936002)(6512007)(486006)(7736002)(66066001)(478600001)(50226002)(446003)(11346002)(256004)(2616005)(476003)(86362001)(44832011)(473944003)(414714003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB3184;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ypdYbzetxt8FqEGFFQmayP9vrydhRw0hz3tdFaAPDGpBTU7ghIW116RWWUMXNZljYb4R9U8VR5yxVAb394eIFK4Qbwidd3CZYnudh55U3+ZUApSQRkvAC9dosWc6WqKz+OA3hR2YuQiVICoYXLhl33Fg+VlXtK1a2CVBlHEr0CJpWUO3Fl8pyW773UPUaZBTvjuRXnQGglgjearh8N6acUkrkCIYdxqrFykt08Y+Ojg2fFUH8G2qoCeVbtb1w1A2Eh8Nqp7Nr+u+KuSbj+jAeJJMN4I5TRSOHkQ8BSJsR1RkKnX0iTOokNdLsqSRKtE1+o2kU4dniGYcchy2XIKmfOHyfUobxSdcg+pGxA3bg5zW9OmH6sFbF5AulJtc1mNBfHE6v05kUbrFB0NiNVBhCG+sdTc0KHMZ73877A8Qsac=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 311e4d6e-eefd-40f6-899a-08d6cb846ca0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2019 02:51:34.0597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3184
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190428025134.7ctLb4z9iolylDEp6joOUUe3-Fm8s-LtxuweUikKwXk@z>

RW5hYmxlIFVTQk9URzEgc3VwcG9ydCBmb3IgZXZrIGJvYXJkLCBpdCBpcyBkdWFsLXJvbGUgZnVu
Y3Rpb24NCnBvcnQuDQoNClNpZ25lZC1vZmYtYnk6IFBldGVyIENoZW4gPHBldGVyLmNoZW5Abnhw
LmNvbT4NCi0tLQ0KIGFyY2gvYXJtL2Jvb3QvZHRzL2lteDd1bHAtZXZrLmR0cyB8IDM1ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDM1IGluc2Vy
dGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDd1bHAtZXZrLmR0
cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDd1bHAtZXZrLmR0cw0KaW5kZXggYTA5MDI2YTZkMjJl
Li5jOGE1NmEyYWU5YTUgMTAwNjQ0DQotLS0gYS9hcmNoL2FybS9ib290L2R0cy9pbXg3dWxwLWV2
ay5kdHMNCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDd1bHAtZXZrLmR0cw0KQEAgLTIyLDYg
KzIyLDE3IEBADQogCQlyZWcgPSA8MHg2MDAwMDAwMCAweDQwMDAwMDAwPjsNCiAJfTsNCiANCisJ
cmVnX3VzYl9vdGcxX3ZidXM6IHJlZ3VsYXRvci11c2Itb3RnMS12YnVzIHsNCisJCWNvbXBhdGli
bGUgPSAicmVndWxhdG9yLWZpeGVkIjsNCisJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQor
CQlwaW5jdHJsLTAgPSA8JnBpbmN0cmxfdXNib3RnMV92YnVzPjsNCisJCXJlZ3VsYXRvci1uYW1l
ID0gInVzYl9vdGcxX3ZidXMiOw0KKwkJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8NTAwMDAw
MD47DQorCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDw1MDAwMDAwPjsNCisJCWdwaW8gPSA8
JmdwaW9fcHRjIDAgR1BJT19BQ1RJVkVfSElHSD47DQorCQllbmFibGUtYWN0aXZlLWhpZ2g7DQor
CX07DQorDQogCXJlZ192c2RfM3YzOiByZWd1bGF0b3ItdnNkLTN2MyB7DQogCQljb21wYXRpYmxl
ID0gInJlZ3VsYXRvci1maXhlZCI7DQogCQlyZWd1bGF0b3ItbmFtZSA9ICJWU0RfM1YzIjsNCkBA
IC00MCw2ICs1MSwxNyBAQA0KIAlzdGF0dXMgPSAib2theSI7DQogfTsNCiANCismdXNib3RnMSB7
DQorCXZidXMtc3VwcGx5ID0gPCZyZWdfdXNiX290ZzFfdmJ1cz47DQorCXBpbmN0cmwtbmFtZXMg
PSAiZGVmYXVsdCI7DQorCXBpbmN0cmwtMCA9IDwmcGluY3RybF91c2JvdGcxX2lkPjsNCisJc3Jw
LWRpc2FibGU7DQorCWhucC1kaXNhYmxlOw0KKwlhZHAtZGlzYWJsZTsNCisJb3Zlci1jdXJyZW50
LWFjdGl2ZS1sb3c7DQorCXN0YXR1cyA9ICJva2F5IjsNCit9Ow0KKw0KICZ1c2RoYzAgew0KIAlw
aW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KIAlwaW5jdHJsLTAgPSA8JnBpbmN0cmxfdXNkaGMw
PjsNCkBAIC01Nyw2ICs3OSwxOSBAQA0KIAkJYmlhcy1wdWxsLXVwOw0KIAl9Ow0KIA0KKwlwaW5j
dHJsX3VzYm90ZzFfdmJ1czogb3RnMXZidXNncnAgew0KKwkJZnNsLHBpbnMgPSA8DQorCQkJSU1Y
N1VMUF9QQURfUFRDMF9fUFRDMAkJMHgyMDAwMA0KKwkJPjsNCisJfTsNCisNCisJcGluY3RybF91
c2JvdGcxX2lkOiBvdGcxaWRncnAgew0KKwkJZnNsLHBpbnMgPSA8DQorCQkJSU1YN1VMUF9QQURf
UFRDMTNfX1VTQjBfSUQJMHgxMDAwMw0KKwkJCUlNWDdVTFBfUEFEX1BUQzE2X19VU0IxX09DMgkw
eDEwMDAzDQorCQk+Ow0KKwl9Ow0KKw0KIAlwaW5jdHJsX3VzZGhjMDogdXNkaGMwZ3JwIHsNCiAJ
CWZzbCxwaW5zID0gPA0KIAkJCUlNWDdVTFBfUEFEX1BURDFfX1NESEMwX0NNRAkweDQzDQotLSAN
CjIuMTQuMQ0KDQo=
