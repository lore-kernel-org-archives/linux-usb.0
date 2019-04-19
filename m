Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5819C282DA
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:53:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4AEA220645
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:53:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="T9AHOllw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="AzOScjPl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728519AbfDSSxN (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:53:13 -0400
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]:37888 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728516AbfDSSxN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Apr 2019 14:53:13 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9939AC0BB7;
        Fri, 19 Apr 2019 11:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1555673010; bh=2fXSaggSSJRj3kAeqtkKdjfd4kyBHJPFoFaffhAYQGg=;
        h=From:To:CC:Subject:Date:From;
        b=T9AHOllwG3hD8bNcvxUy+1j9GR9Bw3aceMSaWciLfH21Wbl8ITLFcRCzYtnuyDltL
         0RE1Jjh3nOwwBygcwYpXCN1QHdAG0sWJv7Kmzl7kX2F3cfy5S/8sgcldhDgKnvt/YZ
         z2dyHujaY0Vl6CAFd5tVf0O9Wdfsghgf8LiZEIY3MNdiayOR4Q5/K+tZxIkgVQNIL5
         AHAeelP00taHw2Jzj7tUCieu4LBDOqM3OzrATn6PpzEjL80O9L6EnD6GR9hzDyH22i
         9rLecwWY+ye/3CmBz2h6fxujxEMbOraZnjTJrKI6CyeaaDuPe0Fd3XyOIj27SBlthw
         VDJaUSvpyeXfQ==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 524A7A008D;
        Fri, 19 Apr 2019 11:23:31 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 19 Apr 2019 04:23:31 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 19 Apr 2019 04:23:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fXSaggSSJRj3kAeqtkKdjfd4kyBHJPFoFaffhAYQGg=;
 b=AzOScjPl19pfvJ4T+o2sb6/lKlUWDWMdZ7icIuSJkbk1elISTq5SVzW+sPDol01abdRP3Q6Sgf8L6R+yQsRcZN/j2Zqe6SwPQF8QQPPG+gr1zRi9kKlPY2FTmAt0sJ8648KkFdrPGplrslsNPuy79DOyXZC4tlK+UoCO89u/bzU=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB2383.namprd12.prod.outlook.com (52.132.194.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.14; Fri, 19 Apr 2019 11:23:28 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a%4]) with mapi id 15.20.1813.013; Fri, 19 Apr 2019
 11:23:28 +0000
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: [PATCH v1 00/14] usb: dwc2: Fix and improve power saving modes.
Thread-Topic: [PATCH v1 00/14] usb: dwc2: Fix and improve power saving modes.
Thread-Index: AQHU9qJP9TPmzBH3xU6dprNhQakiQw==
Date:   Fri, 19 Apr 2019 11:23:28 +0000
Message-ID: <cover.1555672441.git.arturp@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR06CA0064.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::41) To SN1PR12MB2431.namprd12.prod.outlook.com
 (2603:10b6:802:27::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [209.107.194.169]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65f418fd-ce0d-40d3-9b8b-08d6c4b97191
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600141)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:SN1PR12MB2383;
x-ms-traffictypediagnostic: SN1PR12MB2383:
x-microsoft-antispam-prvs: <SN1PR12MB2383D598D8335E42505289C8A7270@SN1PR12MB2383.namprd12.prod.outlook.com>
x-forefront-prvs: 0012E6D357
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(39850400004)(346002)(136003)(366004)(31014005)(199004)(189003)(110136005)(316002)(2616005)(54906003)(68736007)(99286004)(478600001)(8936002)(2501003)(64756008)(52116002)(73956011)(66946007)(66446008)(3846002)(6116002)(66066001)(8676002)(36756003)(14454004)(386003)(186003)(305945005)(2906002)(4326008)(102836004)(6436002)(26005)(486006)(256004)(25786009)(53936002)(14444005)(476003)(71200400001)(71190400001)(6512007)(86362001)(107886003)(5660300002)(97736004)(81156014)(6506007)(7736002)(6486002)(66476007)(66556008)(81166006);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB2383;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UpMZkkFENUvV2z8aepgtYxH4cFMH3R5TWOq2cMrki6r2pFPihCk/Fv9gLD7yl0RkfzHrYp7JiPy4Ad3FGPvAWiy/ST9oqokBlP3O6kzS6DSmY4Eq+7mrLJEVxHVmuHCnXwd61Bz/pZ+WVgz51Fg1Tu0JI8LLR2zp9bWgndcE4Ys9j5zSr7Jhs4BeSGJavV6sIvB88OZCZ0f2BkMfDNOGtGvc+kSN/ctivr0VPlUpXLxg8IU1S+qSMeOIJEpqfPXqMmcrC+Xfsi1UhJP6kmCtljyOFnJgjKpoOO4q1Uh6C3wMNk34WP18S8Hr17uyLF4kIvMH3876YkB3igbC+98XY4UdhIRT5JcyYM1QwPLUpyzFodhN9LpgK9Dxdu42iB/urleNdxSSOfHOp8gvI43GsD2Q8y5VJ9NpUvA5yGL7sLc=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f418fd-ce0d-40d3-9b8b-08d6c4b97191
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2019 11:23:28.5094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2383
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

VGhpcyBwYXRjaCBzZXQsIGZpeGVzIGFuZCBpbXByb3ZlcyBwYXJ0aWFsIHBvd2VyIGRvd24gYW5k
IGhpYmVybmF0aW9uIHBvd2VyDQpzYXZpbmcgbW9kZXMuIEFsc28sIGFkZHMgc3VwcG9ydCBmb3Ig
ZW50ZXJpbmcvZXhpdGluZyBoaWJlcm5hdGlvbiBieQ0Kc3lzdGVtIGlzc3VlZCBzdXNwZW5kL3Jl
c3VtZS4NCg0KVGhpcyBzZXJpZXMgY29udGFpbnMgcGF0Y2hlcyB3aGljaCB3ZXJlIHN1Ym1pdHRl
ZCB0byBMS01MLiBIb3dldmVyLCBhIHBhcnQNCm9mIHRob3NlIHBhdGNoZXMgZGlkbid0IHJlYWNo
IHRvIExLTUwgYmVjYXVzZSBvZiBsb2NhbCBpc3N1ZSByZWxhdGVkIHRvDQpzbXRwIHNlcnZlci4N
Cg0KVGhlIHBhdGNoZXMgd2hpY2ggcmVhY2hlZCB0byBMS01MIGFyZToNCg0KLSB1c2I6IGR3YzI6
IEFkZCBwYXJ0LiBwb3dlciBkb3duIGV4aXQgZnJvbSBkd2MyX2Nvbm5faWRfc3RhdHVzX2NoYW5n
ZSgpLg0KLSB1c2I6IGR3YzI6IEFkZCBwb3J0IGNvbm4uIHN0cy4gY2hlY2tpbmcgaW4gX2R3YzJf
aGNkX3Jlc3VtZSgpIGZ1bmN0aW9uLg0KLSB1c2I6IGR3YzI6IEZpeCBzdXNwZW5kIHN0YXRlIGlu
IGhvc3QgbW9kZSBmb3IgcGFydGlhbCBwb3dlciBkb3duLg0KLSB1c2I6IGR3YzI6IEZpeCB3YWtl
dXAgZGV0ZWN0ZWQgYW5kIHNlc3Npb24gcmVxdWVzdCBpbnRlcnJ1cHQgaGFuZGxlcnMuDQotIHVz
YjogZHdjMjogQWRkIGRlc2NyaXB0aXZlIGRlYnVnIG1lc3NhZ2VzIGZvciBQYXJ0aWFsIFBvd2Vy
IERvd24gbW9kZS4NCi0gdXNiOiBkd2MyOiBGaXggZHdjMl9yZXN0b3JlX2RldmljZV9yZWdpc3Rl
cnMoKSBmdW5jdGlvbi4NCg0KVGhlIHBhdGNoZXMgd2hpY2ggZGlkbid0IHJlYWNoIHRvIExLTUwg
YXJlOg0KDQotIHVzYjogZHdjMjogQWRkIGVudGVyL2V4aXQgaGliZXJuYXRpb24gZnJvbSBzeXN0
ZW0gaXNzdWVkIHN1c3BlbmQvcmVzdW1lDQotIHVzYjogZHdjMjogQ2xlYXIgR0lOVFNUU19SRVNU
T1JFRE9ORSBiaXQgYWZ0ZXIgcmVzdG9yZSBpcyBnZW5lcmF0ZWQuDQotIHVzYjogZHdjMjogQ2xl
YXIgZmlmb19tYXAgd2hlbiByZXNldHRpbmcgY29yZS4NCi0gdXNiOiBkd2MyOiBBbGxvdyBleGl0
aW5nIGhpYmVybmF0aW9uIGZyb20gZ3B3cmRuIHJzdCBkZXRlY3QNCi0gdXNiOiBkd2MyOiBGaXgg
aGliZXJuYXRpb24gYmV0d2VlbiBob3N0IGFuZCBkZXZpY2UgbW9kZXMuDQotIHVzYjogZHdjMjog
VXBkYXRlIGR3YzJfaGFuZGxlX3VzYl9zdXNwZW5kX2ludHIgZnVuY3Rpb24uDQotIHVzYjogZHdj
MjogQWRkIGRlZmF1bHQgcGFyYW0gdG8gY29udHJvbCBwb3dlciBvcHRpbWl6YXRpb24uDQotIHVz
YjogZHdjMjogUmVzZXQgREVWQUREUiBhZnRlciBleGl0aW5nIGdhZGdldCBoaWJlcm5hdGlvbi4N
Cg0KU3VibWl0dGluZyBhbGwgb2YgdGhlIHBhdGNoZXMgdG9nZXRoZXIgaW4gdGhpcyB2ZXJzaW9u
Lg0KDQpDaGFuZ2VzIGZyb20gVjA6DQogLSBSZXBsYWNlZCAxIHdpdGggRFdDMl9QT1dFUl9ET1dO
X1BBUkFNX1BBUlRJQUwgaW4gY29tbWl0DQogICAiOWVlZDAyYjlmZTk2IHVzYjogZHdjMjogRml4
IHdha2V1cCBkZXRlY3RlZCBhbmQgc2Vzc2lvbiByZXF1ZXN0DQogICBpbnRlcnJ1cHQgaGFuZGxl
cnMuDQoNCg0KQXJ0dXIgUGV0cm9zeWFuICgxNCk6DQogIHVzYjogZHdjMjogRml4IGR3YzJfcmVz
dG9yZV9kZXZpY2VfcmVnaXN0ZXJzKCkgZnVuY3Rpb24uDQogIHVzYjogZHdjMjogQWRkIGRlc2Ny
aXB0aXZlIGRlYnVnIG1lc3NhZ2VzIGZvciBQYXJ0aWFsIFBvd2VyIERvd24gbW9kZS4NCiAgdXNi
OiBkd2MyOiBGaXggd2FrZXVwIGRldGVjdGVkIGFuZCBzZXNzaW9uIHJlcXVlc3QgaW50ZXJydXB0
IGhhbmRsZXJzLg0KICB1c2I6IGR3YzI6IEZpeCBzdXNwZW5kIHN0YXRlIGluIGhvc3QgbW9kZSBm
b3IgcGFydGlhbCBwb3dlciBkb3duLg0KICB1c2I6IGR3YzI6IEFkZCBwb3J0IGNvbm4uIHN0cy4g
Y2hlY2tpbmcgaW4gX2R3YzJfaGNkX3Jlc3VtZSgpDQogICAgZnVuY3Rpb24uDQogIHVzYjogZHdj
MjogQWRkIHBhcnQuIHBvd2VyIGRvd24gZXhpdCBmcm9tDQogICAgZHdjMl9jb25uX2lkX3N0YXR1
c19jaGFuZ2UoKS4NCiAgdXNiOiBkd2MyOiBSZXNldCBERVZBRERSIGFmdGVyIGV4aXRpbmcgZ2Fk
Z2V0IGhpYmVybmF0aW9uLg0KICB1c2I6IGR3YzI6IEFkZCBkZWZhdWx0IHBhcmFtIHRvIGNvbnRy
b2wgcG93ZXIgb3B0aW1pemF0aW9uLg0KICB1c2I6IGR3YzI6IFVwZGF0ZSBkd2MyX2hhbmRsZV91
c2Jfc3VzcGVuZF9pbnRyIGZ1bmN0aW9uLg0KICB1c2I6IGR3YzI6IEZpeCBoaWJlcm5hdGlvbiBi
ZXR3ZWVuIGhvc3QgYW5kIGRldmljZSBtb2Rlcy4NCiAgdXNiOiBkd2MyOiBBbGxvdyBleGl0aW5n
IGhpYmVybmF0aW9uIGZyb20gZ3B3cmRuIHJzdCBkZXRlY3QNCiAgdXNiOiBkd2MyOiBDbGVhciBm
aWZvX21hcCB3aGVuIHJlc2V0dGluZyBjb3JlLg0KICB1c2I6IGR3YzI6IENsZWFyIEdJTlRTVFNf
UkVTVE9SRURPTkUgYml0IGFmdGVyIHJlc3RvcmUgaXMgZ2VuZXJhdGVkLg0KICB1c2I6IGR3YzI6
IEFkZCBlbnRlci9leGl0IGhpYmVybmF0aW9uIGZyb20gc3lzdGVtIGlzc3VlZA0KICAgIHN1c3Bl
bmQvcmVzdW1lDQoNCiBkcml2ZXJzL3VzYi9kd2MyL2NvcmUuYyAgICAgIHwgIDIwICsrKysrDQog
ZHJpdmVycy91c2IvZHdjMi9jb3JlLmggICAgICB8ICAgMyArDQogZHJpdmVycy91c2IvZHdjMi9j
b3JlX2ludHIuYyB8IDE3OSArKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
LS0tDQogZHJpdmVycy91c2IvZHdjMi9kZWJ1Z2ZzLmMgICB8ICAgMiArDQogZHJpdmVycy91c2Iv
ZHdjMi9nYWRnZXQuYyAgICB8ICAxNiArKystDQogZHJpdmVycy91c2IvZHdjMi9oY2QuYyAgICAg
ICB8IDE1MSArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0NCiBkcml2ZXJzL3Vz
Yi9kd2MyL3BhcmFtcy5jICAgIHwgIDE5ICsrKy0tDQogNyBmaWxlcyBjaGFuZ2VkLCAyNjkgaW5z
ZXJ0aW9ucygrKSwgMTIxIGRlbGV0aW9ucygtKQ0KDQotLSANCjIuMTEuMA0KDQo=
