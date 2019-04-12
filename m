Return-Path: <SRS0=sojL=SO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3182C10F0E
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 13:38:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 668D12084D
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 13:38:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fRuCwrvR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="SIZiYAfJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbfDLNiX (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Apr 2019 09:38:23 -0400
Received: from smtprelay4.synopsys.com ([198.182.47.9]:58258 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726911AbfDLNiX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Apr 2019 09:38:23 -0400
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com [10.13.135.209])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay.synopsys.com (Postfix) with ESMTPS id 9606C24E3AB9;
        Fri, 12 Apr 2019 06:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1555076302; bh=QsLsZJHrX/FrxhCukge3lYNSfLI45lF5ymMLdkGpmPA=;
        h=From:To:CC:Subject:Date:From;
        b=fRuCwrvRpdVByBlwo/jDmAuUNBWQRhlbfeQ5OSkndmXK/+Kq6/XDwk1jsKGxuMZ0+
         3LjAqvzBUpgyKWoHogYyLXhO4BWzAviLMcOjUt8fiHj6/CVytZrVtm/WA/jTqYs6op
         1K5oF/jMFRGiqdDEeYFjPvmNJVxJepQ2oVfGZfCi5X83s90pC4HyIMyPG6QOXuSBDf
         prXeudn591Vgq3Pgkxi/X20DiijZNQUpiAKSrJThh9jVCDCEEcfV2Sde7EOzsH/Ds8
         dLhTSrjjnbdIIJdNCvj2fB5VWs9Cu8T4KDg/0ExWXUkFlyWbRbvzSqvj6RZkfNU0yB
         IfdBd6BVx2htg==
Received: from US01WEHTC2.internal.synopsys.com (us01wehtc2.internal.synopsys.com [10.12.239.237])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 46130A006A;
        Fri, 12 Apr 2019 13:38:22 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 12 Apr 2019 06:38:22 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 12 Apr 2019 06:38:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QsLsZJHrX/FrxhCukge3lYNSfLI45lF5ymMLdkGpmPA=;
 b=SIZiYAfJMyYBMfMIHlIOo06kGQzTEtyb0Et/x6Rv7lVik6DU5oe2Pq94p0OCkO/z6l/9yfDuRIpKuerFYYzn2hmkyQJ+l4BsHsi+a+AyJAJf2c3F1cp52N1TWPXyEnfzG7TS5SqtNmZX++t/UxDi8lSItx9kofD9oTEuwqb/EWQ=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB2445.namprd12.prod.outlook.com (52.132.195.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.15; Fri, 12 Apr 2019 13:38:19 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a%4]) with mapi id 15.20.1771.021; Fri, 12 Apr 2019
 13:38:19 +0000
From:   Artur Petrosyan <arthur.petrosyan@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <minas.harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <john.youn@synopsys.com>,
        Artur Petrosyan <arthur.petrosyan@synopsys.com>
Subject: [PATCH 00/14] usb: dwc2: Fix and improve power saving modes.
Thread-Topic: [PATCH 00/14] usb: dwc2: Fix and improve power saving modes.
Thread-Index: AQHU8TT9YyLmb6DF6UOdUElpqIrMTw==
Date:   Fri, 12 Apr 2019 13:38:19 +0000
Message-ID: <cover.1555075927.git.arturp@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR08CA0063.namprd08.prod.outlook.com
 (2603:10b6:a03:117::40) To SN1PR12MB2431.namprd12.prod.outlook.com
 (2603:10b6:802:27::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [209.107.194.164]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1bc6816e-dbec-4a87-23d5-08d6bf4c1f4f
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(2017052603328)(7193020);SRVR:SN1PR12MB2445;
x-ms-traffictypediagnostic: SN1PR12MB2445:
x-microsoft-antispam-prvs: <SN1PR12MB2445D2D52E8B661F98F89821A7280@SN1PR12MB2445.namprd12.prod.outlook.com>
x-forefront-prvs: 0005B05917
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(366004)(39850400004)(136003)(376002)(346002)(199004)(189003)(256004)(5660300002)(14444005)(53936002)(86362001)(66066001)(6512007)(2906002)(7736002)(305945005)(4326008)(478600001)(6436002)(68736007)(6486002)(105586002)(316002)(186003)(386003)(6506007)(81166006)(81156014)(3846002)(36756003)(14454004)(107886003)(25786009)(6116002)(106356001)(71200400001)(71190400001)(2501003)(8936002)(486006)(52116002)(102836004)(476003)(26005)(99286004)(110136005)(8676002)(2616005)(54906003)(97736004);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB2445;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7WybwE+9QlkF2Wdmpy+AKyztanbUfCtMxqokZ0HSc5LA40CoXi7VMf4/KxcVIirUOdtjpgsTBjJPtGyd8NHMk5GP8RoiTuaJgyGbeZ5z0ImnEeeyZkP/isRhRbRQFOjaKpHZBzDlQN4rXQsho9ZuVocdbppQITE3DMNIpxCMQp5vfq3WGF+W7hx9rPlD9JlVfc2TaSCAsgCFZjfyuO7U5GFC0/hGnZPsF7QJNQ8ukbW26UDiF8YJGj+EtXWUoMXSXrQrOIilXtIo5o1O5AxZAoxirs7I3G5Y1xcHnV2kw3xUGxxXb0xMFuUdO1C9fI46RDEEsoctGR486veroyu81ciHER03WnkbXLQij/q/zP24IPGnvmdZ1iu+/iR5ELjEJzmDuV1TeIXKx9acqckT65Ylk0tKiwCbzvGjlnZNXRo=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc6816e-dbec-4a87-23d5-08d6bf4c1f4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2019 13:38:19.7163
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

VGhpcyBwYXRjaCBzZXQsIGZpeGVzIGFuZCBpbXByb3ZlcyBwYXJ0aWFsIHBvd2VyIGRvd24gYW5k
IGhpYmVybmF0aW9uIHBvd2VyDQpzYXZpbmcgbW9kZXMuIEFsc28sIGFkZHMgc3VwcG9ydCBmb3Ig
ZW50ZXJpbmcvZXhpdGluZyBoaWJlcm5hdGlvbiBmcm9tDQpzeXN0ZW0gaXNzdWVkIHN1c3BlbmQv
cmVzdW1lLg0KDQoNCkFydHVyIFBldHJvc3lhbiAoMTQpOg0KICB1c2I6IGR3YzI6IEZpeCBkd2My
X3Jlc3RvcmVfZGV2aWNlX3JlZ2lzdGVycygpIGZ1bmN0aW9uLg0KICB1c2I6IGR3YzI6IEFkZCBk
ZXNjcmlwdGl2ZSBkZWJ1ZyBtZXNzYWdlcyBmb3IgUGFydGlhbCBQb3dlciBEb3duIG1vZGUuDQog
IHVzYjogZHdjMjogRml4IHdha2V1cCBkZXRlY3RlZCBhbmQgc2Vzc2lvbiByZXF1ZXN0IGludGVy
cnVwdCBoYW5kbGVycy4NCiAgdXNiOiBkd2MyOiBGaXggc3VzcGVuZCBzdGF0ZSBpbiBob3N0IG1v
ZGUgZm9yIHBhcnRpYWwgcG93ZXIgZG93bi4NCiAgdXNiOiBkd2MyOiBBZGQgcG9ydCBjb25uLiBz
dHMuIGNoZWNraW5nIGluIF9kd2MyX2hjZF9yZXN1bWUoKQ0KICAgIGZ1bmN0aW9uLg0KICB1c2I6
IGR3YzI6IEFkZCBwYXJ0LiBwb3dlciBkb3duIGV4aXQgZnJvbQ0KICAgIGR3YzJfY29ubl9pZF9z
dGF0dXNfY2hhbmdlKCkuDQogIHVzYjogZHdjMjogUmVzZXQgREVWQUREUiBhZnRlciBleGl0aW5n
IGdhZGdldCBoaWJlcm5hdGlvbi4NCiAgdXNiOiBkd2MyOiBBZGQgZGVmYXVsdCBwYXJhbSB0byBj
b250cm9sIHBvd2VyIG9wdGltaXphdGlvbi4NCiAgdXNiOiBkd2MyOiBVcGRhdGUgZHdjMl9oYW5k
bGVfdXNiX3N1c3BlbmRfaW50ciBmdW5jdGlvbi4NCiAgdXNiOiBkd2MyOiBGaXggaGliZXJuYXRp
b24gYmV0d2VlbiBob3N0IGFuZCBkZXZpY2UgbW9kZXMuDQogIHVzYjogZHdjMjogQWxsb3cgZXhp
dGluZyBoaWJlcm5hdGlvbiBmcm9tIGdwd3JkbiByc3QgZGV0ZWN0DQogIHVzYjogZHdjMjogQ2xl
YXIgZmlmb19tYXAgd2hlbiByZXNldHRpbmcgY29yZS4NCiAgdXNiOiBkd2MyOiBDbGVhciBHSU5U
U1RTX1JFU1RPUkVET05FIGJpdCBhZnRlciByZXN0b3JlIGlzIGdlbmVyYXRlZC4NCiAgdXNiOiBk
d2MyOiBBZGQgZW50ZXIvZXhpdCBoaWJlcm5hdGlvbiBmcm9tIHN5c3RlbSBpc3N1ZWQNCiAgICBz
dXNwZW5kL3Jlc3VtZQ0KDQogZHJpdmVycy91c2IvZHdjMi9jb3JlLmMgICAgICB8ICAyMCArKysr
Kw0KIGRyaXZlcnMvdXNiL2R3YzIvY29yZS5oICAgICAgfCAgIDMgKw0KIGRyaXZlcnMvdXNiL2R3
YzIvY29yZV9pbnRyLmMgfCAxNzggKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0tLS0tLQ0KIGRyaXZlcnMvdXNiL2R3YzIvZGVidWdmcy5jICAgfCAgIDIgKw0KIGRyaXZlcnMv
dXNiL2R3YzIvZ2FkZ2V0LmMgICAgfCAgMTYgKysrLQ0KIGRyaXZlcnMvdXNiL2R3YzIvaGNkLmMg
ICAgICAgfCAxNTEgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tDQogZHJpdmVy
cy91c2IvZHdjMi9wYXJhbXMuYyAgICB8ICAxOSArKystLQ0KIDcgZmlsZXMgY2hhbmdlZCwgMjY4
IGluc2VydGlvbnMoKyksIDEyMSBkZWxldGlvbnMoLSkNCg0KLS0gDQoyLjExLjANCg0K
