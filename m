Return-Path: <SRS0=u5rC=SN=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84629C10F13
	for <linux-usb@archiver.kernel.org>; Thu, 11 Apr 2019 20:06:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3B0B820850
	for <linux-usb@archiver.kernel.org>; Thu, 11 Apr 2019 20:06:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="qkbIObnU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbfDKUGR (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 11 Apr 2019 16:06:17 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:17527 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726797AbfDKUGP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Apr 2019 16:06:15 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5caf9e330002>; Thu, 11 Apr 2019 13:06:12 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 11 Apr 2019 13:06:14 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 11 Apr 2019 13:06:14 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 11 Apr
 2019 20:06:14 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (104.47.44.52) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 11 Apr 2019 20:06:14 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.177.125.216) by
 BYAPR12MB2951.namprd12.prod.outlook.com (20.179.91.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.19; Thu, 11 Apr 2019 20:06:10 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::a1bb:f0d6:d9a5:64b6]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::a1bb:f0d6:d9a5:64b6%3]) with mapi id 15.20.1771.019; Thu, 11 Apr 2019
 20:06:10 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     kbuild test robot <lkp@intel.com>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH 2/4] usb: typec: ucsi: ccg: add firmware flashing support
Thread-Topic: [PATCH 2/4] usb: typec: ucsi: ccg: add firmware flashing support
Thread-Index: AQHU73WpNJkcXFJeH0yy9femJdhs4KY1ltqAgAD9u4CAAM/mkA==
Date:   Thu, 11 Apr 2019 20:06:10 +0000
Message-ID:
 <BYAPR12MB2727C6487CD7C279DA0256BEDC2F0@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20190410081545.78464-3-heikki.krogerus@linux.intel.com>
 <201904110046.Bx46coK1%lkp@intel.com>
 <20190411073953.GI20058@kuha.fi.intel.com>
In-Reply-To: <20190411073953.GI20058@kuha.fi.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-04-11T20:06:09.3871839Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic;
 Sensitivity=Unrestricted
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08661729-8927-4017-6928-08d6beb92448
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(2017052603328)(7193020);SRVR:BYAPR12MB2951;
x-ms-traffictypediagnostic: BYAPR12MB2951:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <BYAPR12MB2951FA47BEA3096643667FF8DC2F0@BYAPR12MB2951.namprd12.prod.outlook.com>
x-forefront-prvs: 00046D390F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(136003)(346002)(39860400002)(376002)(396003)(13464003)(189003)(199004)(55016002)(6436002)(76176011)(3846002)(81156014)(105586002)(106356001)(8676002)(81166006)(9686003)(71190400001)(229853002)(6306002)(68736007)(53546011)(71200400001)(6116002)(14454004)(33656002)(478600001)(25786009)(86362001)(966005)(6506007)(102836004)(446003)(11346002)(52536014)(2906002)(97736004)(7696005)(186003)(6246003)(4326008)(26005)(74316002)(8936002)(6916009)(476003)(256004)(14444005)(53936002)(99286004)(7736002)(66066001)(316002)(54906003)(305945005)(5660300002)(486006)(6606295002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB2951;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iCYLj8O2o1kYIghU6zMeR8sju0BBWe2fRepNagKrWLhheTjl4J3eoyxpTvSPZAti42PZoj7UjCDrA1/TZv1NTwiIpRMzFrRJQF9SxT2O8Ml3WYQR5sXIhrPoXUoJx5HtQjX9D7QEvVbDZjRMGZSDKQ+Od9oYy1lI7gAp29rjVJAlYFjzx+I/qAfjvtwuo4AJW+71NEWSxg+nXiUbwfjrYQ/Oii9jsLLbfAcFmew8w+pPYMTE6kE+rYVx95UGXykA6ql30mrR6jCtvt+4LF+Sy9cIIg8z2jfclyfzPIDNo/Ix/jM+cE49zEj98b2xtxYtHdmFXhg1nHZ2ZHW9O4zAWLY+HbYKlMSlwMszTZV5XR3m6y3OlhGryXg8dDMeYJ7LMyBVBowcq669OPGMBIdwnEe7zE5Tzj3CNWHkWFPgXps=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 08661729-8927-4017-6928-08d6beb92448
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2019 20:06:10.4885
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2951
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1555013172; bh=w4ACW0LA3HqA5AEVY1PXBdifIbFeEEw4v7P0EKzxjXE=;
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
        b=qkbIObnUFcAT1gg62FRILRFwqMJq3SvZZIHQV2H5FCrBLHMMVWOXLs/4QgAaJzvLD
         36q0HdEVQavF8zGuyTC398UYcOXyWqfptIhspBJb4v0LCFWZtarFoY8oYtpfwlTXkG
         tV56+oix9/tL1PfDhHClWO4CveqUTVMhWpZkL+jHY+seNrS73Lp4/LYWmUupMyQ4Kg
         xr5+go/Ykp55BQLT0CZ1IFpg27KV/YS1Bj9zKboU/wZUUcf4WZOoVJEPPNkvSVMaR3
         ogXdWw5/8TEg71Ro7sMtcGcnHw7PK9j1oK5nO7QbUdhSw9fHnMWQTziGzHbPYIWA8c
         VCPlRrHUsem7g==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190411200610.WUQl7mBJRj32X1XOoG9y0NQ4tdvHZgJLIpJTgrkCa2M@z>

Hi Heikki,

> -----Original Message-----
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Sent: Thursday, April 11, 2019 12:40 AM
> To: Ajay Gupta <ajayg@nvidia.com>
> Cc: kbuild test robot <lkp@intel.com>; kbuild-all@01.org; Greg Kroah-Hart=
man
> <gregkh@linuxfoundation.org>; linux-usb@vger.kernel.org
> Subject: Re: [PATCH 2/4] usb: typec: ucsi: ccg: add firmware flashing sup=
port
>=20
> Hi Ajay,
>=20
> On Thu, Apr 11, 2019 at 12:31:45AM +0800, kbuild test robot wrote:
> > Hi Heikki,
> >
> > I love your patch! Perhaps something to improve:
> >
> > [auto build test WARNING on usb/usb-testing] [also build test WARNING
> > on v5.1-rc4 next-20190410] [if your patch is applied to the wrong git
> > tree, please drop us a note to help improve the system]
> >
> > url:    https://github.com/0day-ci/linux/commits/Heikki-Krogerus/usb-ty=
pec-
> ucsi-Remaining-changes-for-v5-2/20190410-221455
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git =
usb-
> testing
> > reproduce:
> >         # apt-get install sparse
> >         make ARCH=3Dx86_64 allmodconfig
> >         make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
> >
> >
> > sparse warnings: (new ones prefixed by >>)
> >
> >    drivers/usb/typec/ucsi/ucsi_ccg.c:212:24: sparse: expression using
> sizeof(void)
> >    drivers/usb/typec/ucsi/ucsi_ccg.c:212:24: sparse: expression using
> > sizeof(void)
> > >> drivers/usb/typec/ucsi/ucsi_ccg.c:690:16: sparse: restricted __le16
> > >> degrades to integer
> >    drivers/usb/typec/ucsi/ucsi_ccg.c:698:24: sparse: restricted __le16 =
degrades
> to integer
> >    drivers/usb/typec/ucsi/ucsi_ccg.c:735:26: sparse: restricted __le16 =
degrades
> to integer
> >    drivers/usb/typec/ucsi/ucsi_ccg.c:737:33: sparse: restricted __le16 =
degrades
> to integer
> >    drivers/usb/typec/ucsi/ucsi_ccg.c:777:37: sparse: restricted __le16
> > degrades to integer
> >
> > vim +690 drivers/usb/typec/ucsi/ucsi_ccg.c
> >
> >    680
> >    681	static bool ccg_check_vendor_version(struct ucsi_ccg *uc,
> >    682					     struct version_format *app,
> >    683					     struct fw_config_table *fw_cfg)
> >    684	{
> >    685		struct device *dev =3D uc->dev;
> >    686
> >    687		/* Check if the fw build is for supported vendors.
> >    688		 * Add all supported vendors here.
> >    689		 */
> >  > 690		if (app->build !=3D (('n' << 8) | 'v')) {
>=20
> How about a macro for these?
>=20
>         #define CCG_VERSION_BUILD       (__le16)(...)
Sure, I have fixed them and posted version-6 of patches at
https://marc.info/?l=3Dlinux-usb&m=3D155501300619846&w=3D2=20

Please help review.

Thanks
> nvpublic
>=20
> >    691			dev_info(dev, "current fw is not from supported
> vendor\n");
> >    692			return false;
> >    693		}
> >    694
> >    695		/* Check if the new fw build is for supported vendors
> >    696		 * Add all supported vendors here.
> >    697		 */
> >    698		if (fw_cfg->app.build !=3D (('n' << 8) | 'v')) {
> >    699			dev_info(dev, "new fw is not from supported
> vendor\n");
> >    700			return false;
> >    701		}
> >    702		return true;
> >    703	}
> >    704
>=20
> thanks,
>=20
> --
> heikki
