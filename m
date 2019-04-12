Return-Path: <SRS0=sojL=SO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 459A4C10F14
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 13:38:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 13D252084D
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 13:38:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NchDjrO4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="aqfSxdgF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbfDLNif (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Apr 2019 09:38:35 -0400
Received: from smtprelay4.synopsys.com ([198.182.47.9]:58268 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727021AbfDLNif (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Apr 2019 09:38:35 -0400
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com [10.12.135.162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay.synopsys.com (Postfix) with ESMTPS id 2E73B24E3AB2;
        Fri, 12 Apr 2019 06:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1555076315; bh=4otSVf7CNR/jSoJVB64NRcDq78RaNS4vLvZcpT5/eLY=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=NchDjrO4GpaHDcwTy3EIr4Tqd5ztTh6BAYOVnSI3Co9uszInWlCf5LxL9dPIRNXkt
         DM8vEhzyxsuAeC7a0n9ZKme+ZJBvrod++CoFWUdUK9PvJCBS4KOc4WY6Hw9c6wtYI3
         ZE9Cav7EA1Z4MWwO9Z+asmtn8n58+ka1Xn089ijtqw4ErjNx0wZNu/GGQbNW2xkQZu
         Vj82oD7FmdjrpcA+87YuFjKGnXscH6cV2IXORIVUlr1nUFQxnzGsctKOSQUr6IAAMo
         q2rjITvyzrijGwNLLgi4THSd32RF1z37Gzofo2O9JjzzPAGHrFaY1nlNRgA6Ufk2sd
         6hl9kkLQQYRRg==
Received: from US01WEHTC2.internal.synopsys.com (us01wehtc2.internal.synopsys.com [10.12.239.237])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id F0223A009D;
        Fri, 12 Apr 2019 13:38:34 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 12 Apr 2019 06:38:34 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 12 Apr 2019 06:38:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4otSVf7CNR/jSoJVB64NRcDq78RaNS4vLvZcpT5/eLY=;
 b=aqfSxdgF9lsFvydxYCI5j+zYcvdbbqE9bzcaKLzJhIdyVGBlbrDIRQmb61rt6MTd4GEbetexEe43l2yRPVEdlWNARjjcQZSqSBynp1zVLo4zqdRXWLL5oBslz4rWSiTr9za7ovI0AsFHPSNB1gW2xDvXMzXITqc2BRq91ctYe0g=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB2445.namprd12.prod.outlook.com (52.132.195.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.15; Fri, 12 Apr 2019 13:38:30 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a%4]) with mapi id 15.20.1771.021; Fri, 12 Apr 2019
 13:38:30 +0000
From:   Artur Petrosyan <arthur.petrosyan@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <minas.harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <john.youn@synopsys.com>,
        Artur Petrosyan <arthur.petrosyan@synopsys.com>
Subject: [PATCH 01/14] usb: dwc2: Fix dwc2_restore_device_registers()
 function.
Thread-Topic: [PATCH 01/14] usb: dwc2: Fix dwc2_restore_device_registers()
 function.
Thread-Index: AQHU8TUDZJfFc7UTyEqnLp2GuI6d2w==
Date:   Fri, 12 Apr 2019 13:38:30 +0000
Message-ID:
 <b4129291df7b2d061e93c03862c081b6a35b2e7f.1555075927.git.arturp@synopsys.com>
References: <cover.1555075927.git.arturp@synopsys.com>
In-Reply-To: <cover.1555075927.git.arturp@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0302CA0006.eurprd03.prod.outlook.com
 (2603:10a6:800:e9::16) To SN1PR12MB2431.namprd12.prod.outlook.com
 (2603:10b6:802:27::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [84.53.141.190]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32de0ec2-c7a2-414c-1f60-08d6bf4c2582
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(2017052603328)(7193020);SRVR:SN1PR12MB2445;
x-ms-traffictypediagnostic: SN1PR12MB2445:
x-microsoft-antispam-prvs: <SN1PR12MB2445B767D2C834CA35A3BE89A7280@SN1PR12MB2445.namprd12.prod.outlook.com>
x-forefront-prvs: 0005B05917
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(366004)(39850400004)(136003)(376002)(346002)(199004)(189003)(118296001)(256004)(5660300002)(14444005)(53936002)(86362001)(66066001)(6512007)(2906002)(7736002)(305945005)(4326008)(478600001)(6436002)(68736007)(6486002)(105586002)(316002)(186003)(386003)(6506007)(81166006)(81156014)(3846002)(36756003)(14454004)(107886003)(25786009)(6116002)(106356001)(71200400001)(71190400001)(2501003)(446003)(8936002)(486006)(52116002)(102836004)(476003)(26005)(99286004)(11346002)(110136005)(8676002)(2616005)(54906003)(76176011)(97736004);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB2445;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jOOMHKPFYw/M1tJCG9hG2NGAeuSaAB1APpD29wbmVGa42hCD/KHA6LrOrVXfpaWzZ2jVoaJbiHou+bIRnbURK6udl0S8s5oMLFkQP6TVatlBHSi1hi8O0dRg3FGTKI8NwtbwudQ7qeoEkd3IX+qymXUJyDthYIKFzh+5Uj6ucaBmgXCSErKN453sBX1WJ18XQekgtKxi+aVA2bvtNGwmRv0VM/8s8WGijPhmCn1DCouo3mWHz6wgiGk9F208IYIEw8+KLG2x65qOY4omHZap3FzZUCRogNYkmCQTyZHf/yTJbFwXFpZwx9vTksQsR5EZf8ItOYbWyKGb93KI+n/JespeZMbHbu1L17vCjaCIjBSvyvEmdDfHSzkFPukJ+XUV8XT3PyF5JJu02Mf98iowHNvJCTOhz9Qwat3PsQ8vK40=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 32de0ec2-c7a2-414c-1f60-08d6bf4c2582
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2019 13:38:30.0637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2445
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190412133830.lm2qIl-MfAISZvLVoUaTOctrhrq38UMiCBTC8gOXhmY@z>

LSBBZGRlZCBiYWNrdXAgb2YgRENGRyByZWdpc3Rlci4NCi0gQWRkZWQgU2V0IHRoZSBQb3dlci1P
biBQcm9ncmFtbWluZyBkb25lIGJpdC4NCg0KU2lnbmVkLW9mZi1ieTogQXJ0dXIgUGV0cm9zeWFu
IDxhcnR1cnBAc3lub3BzeXMuY29tPg0KLS0tDQogZHJpdmVycy91c2IvZHdjMi9nYWRnZXQuYyB8
IDEwICsrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQ0KDQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMi9nYWRnZXQuYyBiL2RyaXZlcnMvdXNiL2R3YzIvZ2Fk
Z2V0LmMNCmluZGV4IDY4MTJhOGEzYTk4Yi4uZGNiMGZiYjhiYzQyIDEwMDY0NA0KLS0tIGEvZHJp
dmVycy91c2IvZHdjMi9nYWRnZXQuYw0KKysrIGIvZHJpdmVycy91c2IvZHdjMi9nYWRnZXQuYw0K
QEAgLTUwMDQsNiArNTAwNCw3IEBAIGludCBkd2MyX3Jlc3RvcmVfZGV2aWNlX3JlZ2lzdGVycyhz
dHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcsIGludCByZW1vdGVfd2FrZXVwKQ0KIHsNCiAJc3RydWN0
IGR3YzJfZHJlZ3NfYmFja3VwICpkcjsNCiAJaW50IGk7DQorCXUzMiBkY3RsOw0KIA0KIAlkZXZf
ZGJnKGhzb3RnLT5kZXYsICIlc1xuIiwgX19mdW5jX18pOw0KIA0KQEAgLTUwMTksNiArNTAyMCwx
NSBAQCBpbnQgZHdjMl9yZXN0b3JlX2RldmljZV9yZWdpc3RlcnMoc3RydWN0IGR3YzJfaHNvdGcg
Kmhzb3RnLCBpbnQgcmVtb3RlX3dha2V1cCkNCiAJaWYgKCFyZW1vdGVfd2FrZXVwKQ0KIAkJZHdj
Ml93cml0ZWwoaHNvdGcsIGRyLT5kY3RsLCBEQ1RMKTsNCiANCisJaWYgKGhzb3RnLT5wYXJhbXMu
cG93ZXJfZG93biA9PSBEV0MyX1BPV0VSX0RPV05fUEFSQU1fUEFSVElBTCkgew0KKwkJZHdjMl93
cml0ZWwoaHNvdGcsIGRyLT5kY2ZnLCBEQ0ZHKTsNCisNCisJCS8qIFNldCB0aGUgUG93ZXItT24g
UHJvZ3JhbW1pbmcgZG9uZSBiaXQgKi8NCisJCWRjdGwgPSBkd2MyX3JlYWRsKGhzb3RnLCBEQ1RM
KTsNCisJCWRjdGwgfD0gRENUTF9QV1JPTlBSR0RPTkU7DQorCQlkd2MyX3dyaXRlbChoc290Zywg
ZGN0bCwgRENUTCk7DQorCX0NCisNCiAJZHdjMl93cml0ZWwoaHNvdGcsIGRyLT5kYWludG1zaywg
REFJTlRNU0spOw0KIAlkd2MyX3dyaXRlbChoc290ZywgZHItPmRpZXBtc2ssIERJRVBNU0spOw0K
IAlkd2MyX3dyaXRlbChoc290ZywgZHItPmRvZXBtc2ssIERPRVBNU0spOw0KLS0gDQoyLjExLjAN
Cg0K
