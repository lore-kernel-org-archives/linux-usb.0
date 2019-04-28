Return-Path: <SRS0=PkR+=S6=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A8CC43219
	for <linux-usb@archiver.kernel.org>; Sun, 28 Apr 2019 02:51:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E62CA208CA
	for <linux-usb@archiver.kernel.org>; Sun, 28 Apr 2019 02:51:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="UyAnhn2M"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbfD1Cvj (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 27 Apr 2019 22:51:39 -0400
Received: from mail-eopbgr140075.outbound.protection.outlook.com ([40.107.14.75]:24224
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726388AbfD1Cvi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 27 Apr 2019 22:51:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqbiThrsXMmx0N2F2Ge8uwoab4J6wl843F8Yh7HGMnY=;
 b=UyAnhn2Me7EX8hSiB49geR4UBmbGFltq+Sd4PUAs9JkuRWyh8ciX0pUf8K4my1AD7SXw0ONQyK1GtpNE6I8e794htL0LpeoQGoYevMSkTT8iSucqMdjjHxIo442FlQa9sJLyVlnRRrBbez2fJPB3kE48C3DyCnWJ81+9oCBFldU=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB3184.eurprd04.prod.outlook.com (10.170.229.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.15; Sun, 28 Apr 2019 02:51:25 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61%5]) with mapi id 15.20.1835.015; Sun, 28 Apr 2019
 02:51:25 +0000
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
Subject: [PATCH 4/7] doc: dt-binding: usbmisc-imx: add compatible string for
 imx7ulp
Thread-Topic: [PATCH 4/7] doc: dt-binding: usbmisc-imx: add compatible string
 for imx7ulp
Thread-Index: AQHU/W1EXtDBOEmaeEC6X3A2mSZYxw==
Date:   Sun, 28 Apr 2019 02:51:23 +0000
Message-ID: <20190428024847.5046-5-peter.chen@nxp.com>
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
x-ms-office365-filtering-correlation-id: 372c5137-b3b2-4911-358f-08d6cb846671
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB3184;
x-ms-traffictypediagnostic: VI1PR04MB3184:
x-microsoft-antispam-prvs: <VI1PR04MB31844940236693FE6934B4938B380@VI1PR04MB3184.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(396003)(376002)(39860400002)(346002)(366004)(189003)(199004)(6436002)(5660300002)(8936002)(36756003)(6486002)(26005)(52116002)(14454004)(71200400001)(99286004)(71190400001)(6116002)(76176011)(186003)(2906002)(110136005)(1076003)(54906003)(316002)(102836004)(6506007)(386003)(81156014)(25786009)(2501003)(3846002)(73956011)(66946007)(4326008)(66446008)(66556008)(66476007)(64756008)(8676002)(81166006)(4744005)(305945005)(97736004)(68736007)(53936002)(6512007)(486006)(7736002)(66066001)(478600001)(50226002)(446003)(11346002)(256004)(2616005)(476003)(86362001)(44832011);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB3184;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iqnb0D1VAoX2VLRuzWsWuF0lJq2sblJRgRLvvIwtDnfTKS0vK44eV6EvrfQXJgvX4/ZYvp1AkTSmLQcQ1J4FMpVeEFRugfWQEOZ2kLpg5+7aU0MlSmd53EURGv41ZwX5/dM5Yppae64XS21qdd4g2fpBkmL2FwWjRBLL2F7e0zcGfRC1WdG9I87owNs2I18bVcf/M6mQRTNuFMCmKSZLeh4a7076d6noIesdCWhacZcbjusMnDc+CLpLAM7orssONrF+kk0gjV7tCeCX6bon7Lh+4UvKmkLE8m9T2CU0TqZGkQ28GlT1pz189fao26YUrM7wIZ2ZY/8WbFlgl+B8nNCcmMLyZczXuXNgtX9oB6T+kabxevPD4rHyNlyHaYuJQVBpeaP0uuRbBoi/Djrf+MBA7KgoIFKKXcNTVRdpJwo=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 372c5137-b3b2-4911-358f-08d6cb846671
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2019 02:51:23.8743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3184
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190428025123.UrLA3pjwKX1Rq8SMkILn6_CXstJEZZJJ-DS2I8Oi-e0@z>

QWRkIGNvbXBhdGlibGUgc3RyaW5nIGZvciBpbXg3dWxwDQoNClNpZ25lZC1vZmYtYnk6IFBldGVy
IENoZW4gPHBldGVyLmNoZW5AbnhwLmNvbT4NCi0tLQ0KIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy91c2IvdXNibWlzYy1pbXgudHh0IHwgMSArDQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspDQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdXNiL3VzYm1pc2MtaW14LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy91c2IvdXNibWlzYy1pbXgudHh0DQppbmRleCBhODVhNjMxZWM0MzQuLmIzNTNiOTgxNjQ4
NyAxMDA2NDQNCi0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvdXNi
bWlzYy1pbXgudHh0DQorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNi
L3VzYm1pc2MtaW14LnR4dA0KQEAgLTcsNiArNyw3IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6DQog
CSJmc2wsdmY2MTAtdXNibWlzYyIgZm9yIFZ5YnJpZCB2ZjYxMA0KIAkiZnNsLGlteDZzeC11c2Jt
aXNjIiBmb3IgaW14NnN4DQogCSJmc2wsaW14N2QtdXNibWlzYyIgZm9yIGlteDdkDQorCSJmc2ws
aW14N3VscC11c2JtaXNjIiBmb3IgaW14N3VscA0KIC0gcmVnOiBTaG91bGQgY29udGFpbiByZWdp
c3RlcnMgbG9jYXRpb24gYW5kIGxlbmd0aA0KIA0KIEV4YW1wbGVzOg0KLS0gDQoyLjE0LjENCg0K
