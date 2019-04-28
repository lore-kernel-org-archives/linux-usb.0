Return-Path: <SRS0=PkR+=S6=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D49B0C43219
	for <linux-usb@archiver.kernel.org>; Sun, 28 Apr 2019 02:51:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A443D2077B
	for <linux-usb@archiver.kernel.org>; Sun, 28 Apr 2019 02:51:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="EtngdfWT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbfD1CvR (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 27 Apr 2019 22:51:17 -0400
Received: from mail-eopbgr140082.outbound.protection.outlook.com ([40.107.14.82]:39943
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726388AbfD1CvR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 27 Apr 2019 22:51:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yl19bRB4mWyuL+Qa/u3YbtakHATa4klj616O9FLmsl0=;
 b=EtngdfWTOJb/1aOqWDIaAsFeyztS0P5dkQ8BmMHHIqAyoyLDgK4Oj+N53drDIAbzJ+ilWBX2Azlu9ZM2GolpE5kyweB5eq2eNFSVSejxgwvKnmBjHiRwYGN0yANdDgrX/0ZojaBB2N27h5rjpGVitzAWbB7/KbK5fU7FLTA2dn4=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB3184.eurprd04.prod.outlook.com (10.170.229.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.15; Sun, 28 Apr 2019 02:51:13 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61%5]) with mapi id 15.20.1835.015; Sun, 28 Apr 2019
 02:51:13 +0000
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
Subject: [PATCH 1/7] doc: dt-binding: mxs-usb-phy: add compatible for 7ulp
Thread-Topic: [PATCH 1/7] doc: dt-binding: mxs-usb-phy: add compatible for
 7ulp
Thread-Index: AQHU/W09eJrHYL0gdESAVOM7ifqgCA==
Date:   Sun, 28 Apr 2019 02:51:13 +0000
Message-ID: <20190428024847.5046-2-peter.chen@nxp.com>
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
x-ms-office365-filtering-correlation-id: 40d5325d-9085-441a-6b26-08d6cb84600e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB3184;
x-ms-traffictypediagnostic: VI1PR04MB3184:
x-microsoft-antispam-prvs: <VI1PR04MB318492804F53C4DC3819396F8B380@VI1PR04MB3184.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(396003)(376002)(39860400002)(346002)(366004)(189003)(199004)(6436002)(5660300002)(8936002)(36756003)(6486002)(26005)(52116002)(14454004)(71200400001)(99286004)(71190400001)(6116002)(76176011)(186003)(2906002)(110136005)(1076003)(54906003)(316002)(102836004)(6506007)(386003)(81156014)(25786009)(2501003)(3846002)(73956011)(66946007)(4326008)(66446008)(66556008)(66476007)(64756008)(8676002)(81166006)(4744005)(305945005)(97736004)(68736007)(53936002)(6512007)(486006)(7736002)(66066001)(478600001)(50226002)(446003)(11346002)(256004)(2616005)(476003)(86362001)(44832011);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB3184;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: D8NeBCQ7+ARS2XcbTfAWU1sIpBTQzzRwbVNJNCOH9LZjpEX3cfrIFar18HVQVCV85wFtTJafPMeo1N/6kSfycpeumdDnkYXx+6EQbA52dhOAEj25j3X3JH7KNh8cpDPYXlXY6+BfEPGvAScNh9nd4qXi9BSfLj4mMgeiNLSZ7RAmpCmZAS9nR/7LBsl0sXUuvj58x427uHaVUzwMzKMV6/khsgCo6QiwwFxQy5R8iPNd4ITms5mhlkICCsXqN/ANPt0BAHXBBTDafW8aHpesGxdSipG0sKgDEHRdKKKy/U4VI9pkD7B/e/eFymzvx5YQf2TbM0MEwlPyCFi3ByJY52AqaxBjbQRyk6z6OO4GemEqTp4kNfHHCZ3pcbqZVuyk+0SX4JBjSgzqo5cpn0WQKxXQ1oiiptANC2H9/CxMKqI=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d5325d-9085-441a-6b26-08d6cb84600e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2019 02:51:13.2336
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3184
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190428025113.5iC_EDYE7c7w__cQS_dgpMIQoe4Zs8NFhjFJJDWMAK0@z>

QWRkIGNvbXBhdGlibGUgZm9yIDd1bHAgVVNCIFBIWS4NCg0KU2lnbmVkLW9mZi1ieTogUGV0ZXIg
Q2hlbiA8cGV0ZXIuY2hlbkBueHAuY29tPg0KLS0tDQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3BoeS9teHMtdXNiLXBoeS50eHQgfCAxICsNCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9waHkvbXhzLXVzYi1waHkudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3BoeS9teHMtdXNiLXBoeS50eHQNCmluZGV4IDZhYzk4YjNiNWY1Ny4uMzJkYThkMTc3NTlh
IDEwMDY0NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9teHMt
dXNiLXBoeS50eHQNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkv
bXhzLXVzYi1waHkudHh0DQpAQCAtNyw2ICs3LDcgQEAgUmVxdWlyZWQgcHJvcGVydGllczoNCiAJ
KiAiZnNsLGlteDZzbC11c2JwaHkiIGZvciBpbXg2c2wNCiAJKiAiZnNsLHZmNjEwLXVzYnBoeSIg
Zm9yIFZ5YnJpZCB2ZjYxMA0KIAkqICJmc2wsaW14NnN4LXVzYnBoeSIgZm9yIGlteDZzeA0KKwkq
ICJmc2wsaW14N3VscC11c2JwaHkiIGZvciBpbXg3dWxwDQogICAiZnNsLGlteDIzLXVzYnBoeSIg
aXMgc3RpbGwgYSBmYWxsYmFjayBmb3Igb3RoZXIgc3RyaW5ncw0KIC0gcmVnOiBTaG91bGQgY29u
dGFpbiByZWdpc3RlcnMgbG9jYXRpb24gYW5kIGxlbmd0aA0KIC0gaW50ZXJydXB0czogU2hvdWxk
IGNvbnRhaW4gcGh5IGludGVycnVwdA0KLS0gDQoyLjE0LjENCg0K
