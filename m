Return-Path: <SRS0=sojL=SO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A74C10F0E
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 16:46:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2654D20850
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 16:46:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Ds49aYWi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726844AbfDLQqq (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Apr 2019 12:46:46 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:5461 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726327AbfDLQqq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 12 Apr 2019 12:46:46 -0400
Received: from hkpgpgate101.nvidia.com (Not Verified[10.18.92.100]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cb0c0f20000>; Sat, 13 Apr 2019 00:46:42 +0800
Received: from HKMAIL104.nvidia.com ([10.18.16.13])
  by hkpgpgate101.nvidia.com (PGP Universal service);
  Fri, 12 Apr 2019 09:46:42 -0700
X-PGP-Universal: processed;
        by hkpgpgate101.nvidia.com on Fri, 12 Apr 2019 09:46:42 -0700
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL104.nvidia.com
 (10.18.16.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Apr
 2019 16:46:42 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (104.47.41.58) by
 HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Fri, 12 Apr 2019 16:46:41 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.177.125.216) by
 BYAPR12MB3319.namprd12.prod.outlook.com (20.178.55.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.15; Fri, 12 Apr 2019 16:46:38 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::a1bb:f0d6:d9a5:64b6]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::a1bb:f0d6:d9a5:64b6%3]) with mapi id 15.20.1771.019; Fri, 12 Apr 2019
 16:46:37 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Ajay Gupta <ajaykuee@gmail.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v6 2/2] usb: typec: ucsi: ccg: add firmware flashing
 support
Thread-Topic: [PATCH v6 2/2] usb: typec: ucsi: ccg: add firmware flashing
 support
Thread-Index: AQHU8KGuIg4P3O0XIkeW7DZcOqJQ1qY4oCqAgAAZO8A=
Date:   Fri, 12 Apr 2019 16:46:37 +0000
Message-ID:
 <BYAPR12MB2727B8994A18CE86F3EB7668DC280@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20190411200310.9775-1-ajayg@nvidia.com>
 <20190411200310.9775-3-ajayg@nvidia.com>
 <20190412150215.GB5805@kuha.fi.intel.com>
In-Reply-To: <20190412150215.GB5805@kuha.fi.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-04-12T16:46:36.6429721Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic;
 Sensitivity=Unrestricted
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13a4de61-83ce-42a9-2499-08d6bf666e70
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(2017052603328)(7193020);SRVR:BYAPR12MB3319;
x-ms-traffictypediagnostic: BYAPR12MB3319:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR12MB33195D560E07CD4A897E81E5DC280@BYAPR12MB3319.namprd12.prod.outlook.com>
x-forefront-prvs: 0005B05917
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(346002)(136003)(39860400002)(376002)(366004)(199004)(13464003)(189003)(81166006)(4326008)(25786009)(6246003)(81156014)(74316002)(305945005)(7736002)(52536014)(76176011)(8936002)(66066001)(8676002)(2906002)(99286004)(229853002)(53546011)(86362001)(5660300002)(26005)(186003)(3846002)(478600001)(6116002)(102836004)(7696005)(68736007)(14454004)(110136005)(71200400001)(6306002)(71190400001)(11346002)(33656002)(6506007)(106356001)(966005)(97736004)(55016002)(6436002)(256004)(486006)(9686003)(105586002)(316002)(476003)(53936002)(14444005)(446003)(6606295002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB3319;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: L42mqRWm0Ln+X4fXxd6TdY4g9PoAeLyc8Vonj54V34XHFnq9B8jp6HDnkb9cL0bd2ep0ecAAsll4u8AuV/oGrvFGyEEColR10YOwoCWYVhilnqk/6lQz+hmKQnkynjl396x6j1VfP2dI7yGvUAFGjpVFLZZ4p+2rJSEdKdIn8nZMIzHg1pt0QX6QdkUL9EzNPbbnTSjkfkL+JG0DrC7wVO1bywObYy6VW2qGfcYIL6AGfwLVEUcuTKKackOCugR9ZRxnn3I6cK3SGlWIx7gnutqTmkZt2mhe4LJ4PTRQtPou5lkloXmsAlDn/YcSEN1wYOGCa1Fx9eHNF5aH6voXM5KcIqXqFOFJpycTQSZdJSFEuhHtvxA4bHpwWFk82nu/CrybpJajm6aTyJDM3jC99o+MbqkAit84I3z9SYRHtLE=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a4de61-83ce-42a9-2499-08d6bf666e70
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2019 16:46:37.8175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3319
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1555087602; bh=LFhxTw/HV8oqIhYh179QvpYd8dgRUTGfMPmYbbNjKag=;
        h=X-PGP-Universal:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
         Message-ID:References:In-Reply-To:Accept-Language:X-MS-Has-Attach:
         X-MS-TNEF-Correlator:msip_labels:authentication-results:
         x-originating-ip:x-ms-publictraffictype:
         x-ms-office365-filtering-correlation-id:x-microsoft-antispam:
         x-ms-traffictypediagnostic:x-ms-exchange-purlcount:
         x-microsoft-antispam-prvs:x-forefront-prvs:
         x-forefront-antispam-report:received-spf:
         x-ms-exchange-senderadcheck:x-microsoft-antispam-message-info:
         MIME-Version:X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
         Content-Language:Content-Type:Content-Transfer-Encoding;
        b=Ds49aYWiKuwPR0DBF01LwGWCTNir29dH1np321FV4PpsSH+cz/xqoMHz+h0ZTnS/l
         1x9rguJ+04quDL7ZmR/Ehw5pG+JZboIHIMSddH8QDPfJaw4X2p6ZKBj9DxTNbamxRA
         AQqt0RJZ3jeAVkr0ZOrLBaDX/y2XBSUwHZo19++9HaaPFmVhSc8Gle8YR4d2G4C9ig
         W0DnJtgpFX+gXbi2nIs4/ezDsTKP+c/kBp3/mFpkZXLBQMxCYx4t7v6kthFCQ0G0U1
         YCyMl0t7w4pG1piMEAAmQIFhoiOwkK1rN1EJdHspSeOMcdu6Ey09u8viuIB+9l74O3
         XrcHKk/f1SRuQ==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190412164637.b2JhdZcvl7hJBBQcXn89HW6JvyOffTVEdO03MtWQqjw@z>

Hi Heikki,

> -----Original Message-----
> From: linux-usb-owner@vger.kernel.org <linux-usb-owner@vger.kernel.org> O=
n
> Behalf Of Heikki Krogerus
> Sent: Friday, April 12, 2019 8:02 AM
> To: Ajay Gupta <ajaykuee@gmail.com>
> Cc: linux-usb@vger.kernel.org; Ajay Gupta <ajayg@nvidia.com>
> Subject: Re: [PATCH v6 2/2] usb: typec: ucsi: ccg: add firmware flashing =
support
>=20
> Hi Ajay,
>=20
> On Thu, Apr 11, 2019 at 01:03:10PM -0700, Ajay Gupta wrote:
> > +#define CCG_FW_VERSION_NVIDIA(b)	(le16_to_cpu(b) !=3D (('n' << 8) |
> 'v'))
>=20
> Does that remove the sparce warning?
Yes. I tested it with steps given at https://marc.info/?l=3Dlinux-usb&m=3D1=
55491396220133&w=3D2=20

> Now that I see that this version is specific to NVIDIA,
> I think we are going to
> want to get this detail from a device property. I'll prepare an example f=
or you
> right now so you can see how it can be done.
This version supports NVIDIA specific FW signature which is used to test it=
.=20
See 'n' and 'v' letters in it. Other vendors will have their own signature =
and=20
can just add macros to handle it.=20

There is also a comment " Add all supported vendors here " for this in func=
tion=20
ccg_check_vendor_version()
=20
Thanks
> nvpublic
> > +static bool ccg_check_vendor_version(struct ucsi_ccg *uc,
> > +				     struct version_format *app,
> > +				     struct fw_config_table *fw_cfg) {
> > +	struct device *dev =3D uc->dev;
> > +
> > +	/* Check if the fw build is for supported vendors.
> > +	 * Add all supported vendors here.
> > +	 */
> > +	if (CCG_FW_VERSION_NVIDIA(app->build)) {
> > +		dev_info(dev, "current fw is not from supported vendor\n");
> > +		return false;
> > +	}
> > +
> > +	/* Check if the new fw build is for supported vendors
> > +	 * Add all supported vendors here.
> > +	 */
> > +	if (CCG_FW_VERSION_NVIDIA(fw_cfg->app.build)) {
> > +		dev_info(dev, "new fw is not from supported vendor\n");
> > +		return false;
> > +	}
> > +	return true;
> > +}
>=20
> Br,
>=20
> --
> heikki
