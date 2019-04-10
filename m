Return-Path: <SRS0=X9rV=SM=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8838C10F11
	for <linux-usb@archiver.kernel.org>; Wed, 10 Apr 2019 09:27:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 744842083E
	for <linux-usb@archiver.kernel.org>; Wed, 10 Apr 2019 09:27:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Q56R4jgq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="fybR+11q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729067AbfDJJ07 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 10 Apr 2019 05:26:59 -0400
Received: from smtprelay4.synopsys.com ([198.182.47.9]:34444 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727964AbfDJJ05 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Apr 2019 05:26:57 -0400
Received: from mailhost.synopsys.com (unknown [10.12.135.161])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay.synopsys.com (Postfix) with ESMTPS id 3C64524E1F56;
        Wed, 10 Apr 2019 02:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1554888417; bh=xlPF2y0ukcxQdg+kpvwkkIzyImJDc8zZB3OlpE7l320=;
        h=From:To:CC:Subject:Date:References:From;
        b=Q56R4jgql+0LuGUYz4yUJLR+r0bvpZYbhaXfr6HR/142efZIZaVUXrE8rmb79qLIa
         YWQbKbVTJBqnqxNf6hGakyPW/cE4NwwVcIZud35iuKlfJxJmzZy0C/+hZoDwfgO1U9
         7OoquGfGg9tdFt5HfbO33wnXgg05a5am1KWZOHiop6aVUKXtgwPh35y6iueLYhiLw7
         UQIrPhZm7cWW8SSG2dSDiFsTM7rwGFmi2t0NUEULhsELu5ZL3WEHfDuxg5hhpiVIjv
         GxDaS7jbj0nhaEOjYGArnpMOFaN9ccrreSlnGJ3vblZWM2xkGrln9+UdfK8OZC9LwB
         0Wv52EVtzYyjg==
Received: from us01wehtc1.internal.synopsys.com (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id D058EA0070;
        Wed, 10 Apr 2019 09:26:56 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 us01wehtc1.internal.synopsys.com (10.12.239.235) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 10 Apr 2019 02:26:55 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 10 Apr 2019 02:26:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=evcef4uYE2HEZ9E/NEmRyUJPIgfvQSerNpzrMUe3kDA=;
 b=fybR+11qs++ccoucMS9nSwuObW6bcua4JtExVvV9eRd3DFHqYsxcRuH0BBuc8JBT6eLO/cK80ZAmEC8NSSfL1iXP5WmOY27FTo82FNszs9IteZMAAEnIB15O62fF3vkS3ryODu+IFbOFelUGTBUTB6y8G7OS4steBN7tjk/NeMk=
Received: from BN6PR1201MB0082.namprd12.prod.outlook.com (10.174.113.147) by
 BN6PR1201MB0020.namprd12.prod.outlook.com (10.174.115.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.16; Wed, 10 Apr 2019 09:26:50 +0000
Received: from BN6PR1201MB0082.namprd12.prod.outlook.com
 ([fe80::4d0f:ceb2:da99:6777]) by BN6PR1201MB0082.namprd12.prod.outlook.com
 ([fe80::4d0f:ceb2:da99:6777%9]) with mapi id 15.20.1771.016; Wed, 10 Apr 2019
 09:26:50 +0000
From:   Minas Harutyunyan <minas.harutyunyan@synopsys.com>
To:     Jules Maselbas <jmaselbas@kalray.eu>,
        Minas Harutyunyan <minas.harutyunyan@synopsys.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pierre-Yves Kerbrat <pkerbrat@kalray.eu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2 0/5] usb: dwc2: Improve gadget phy init
Thread-Topic: [PATCH v2 0/5] usb: dwc2: Improve gadget phy init
Thread-Index: AQHU67SG2UXNk26azk+p5XYALoeY6Q==
Date:   Wed, 10 Apr 2019 09:26:50 +0000
Message-ID: <BN6PR1201MB008245A3406CEB4B692ECCBFA72E0@BN6PR1201MB0082.namprd12.prod.outlook.com>
References: <20190405133533.2203-1-jmaselbas@kalray.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hminas@synopsys.com; 
x-originating-ip: [92.123.244.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c2d8c7b7-9d51-4340-a3db-08d6bd96a9aa
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:BN6PR1201MB0020;
x-ms-traffictypediagnostic: BN6PR1201MB0020:
x-microsoft-antispam-prvs: <BN6PR1201MB00209B74661A647DFCF272EDA72E0@BN6PR1201MB0020.namprd12.prod.outlook.com>
x-forefront-prvs: 00032065B2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(376002)(396003)(346002)(39850400004)(136003)(189003)(199004)(53936002)(478600001)(305945005)(229853002)(71200400001)(186003)(55016002)(66066001)(5660300002)(106356001)(86362001)(6246003)(476003)(105586002)(26005)(446003)(71190400001)(7736002)(2906002)(68736007)(74316002)(6436002)(9686003)(76176011)(4326008)(33656002)(99286004)(110136005)(102836004)(97736004)(316002)(486006)(3846002)(7696005)(52536014)(81156014)(6116002)(8936002)(256004)(14444005)(6506007)(53546011)(54906003)(6636002)(8676002)(14454004)(81166006)(25786009);DIR:OUT;SFP:1102;SCL:1;SRVR:BN6PR1201MB0020;H:BN6PR1201MB0082.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hwS31nDvqRk05XpaKX4KPE2hbmHYRCJ9EmU9EdtdUCYozr79nYrBDe5EpC6Fcs6H0Iwf3P0ljZwaB4XLwn6sWEeiwVuG0Vwte5LaKR1a5u+JMdXr1OxHl477MKbwuhUH4bUStQNqWNTHxO87MrAx7j6pTWPC4sxVazrRQiilJJNrvHiRNKQixCyr+BOEbIggSrk2h5mCg8mAoXeH/vwKvHwrOssGkHoThCrFIL+ulkKfGfOn8Lhkv3aHFbHuxgjZ9KeDJwkU/yThKZPe2SNFAO9VayrCw7ds5Abm4+XQoSqHumrUohfhzVc/0Fyfay5ahq8n/fCCrgeDnL3ph9n3QCHrm4gs1IaXs8KDyt7vwNXjFgzKOVbSUgjo3EE0sGgDnCeGx6VIcoGJ6rXwC1ZE03QxPTm0+FRpIJmYED+yF7s=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d8c7b7-9d51-4340-a3db-08d6bd96a9aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2019 09:26:50.7259
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0020
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/5/2019 5:36 PM, Jules Maselbas wrote:=0A=
> Hi,=0A=
> =0A=
> Theses patches tries to clean a bit dwc2's phy initialization and=0A=
> fix an issue in gadget mode where the utmi phy width is set=0A=
> regardless of utmi being used or not.=0A=
> =0A=
> I believe that when using ulpi a phy width of 8 bits must be used,=0A=
> but this wasn't the case as the variable phyif was set by default=0A=
> to 16 bits.=0A=
> =0A=
> In this second patch-set version the last two patches are optionnal,=0A=
> from my point of view they are not essential for me but I hope they=0A=
> can improve this driver.=0A=
> =0A=
> Best regards,=0A=
> Jules=0A=
> ---=0A=
> Changes in v2:=0A=
>    - Changed patches order=0A=
>    - dwc2_init_fs_ls_pclk_sel is now declared in core.h (to be used in hc=
d.c)=0A=
>    - Fix patch `Replace phyif with phy_utmi_width` (wrong value set to us=
bcfg)=0A=
>    - Add check for utmi phy type in patch `Replace phyif with phy_utmi_wi=
dth`=0A=
> =0A=
> ---=0A=
> Jules Maselbas (5):=0A=
>    usb: dwc2: Move UTMI_PHY_DATA defines closer=0A=
>    usb: dwc2: gadget: Remove duplicated phy init=0A=
>    usb: dwc2: gadget: Replace phyif with phy_utmi_width=0A=
>    usb: dwc2: Move phy init into core=0A=
>    usb: dwc2: gadget: Move gadget phy init into core phy init=0A=
> =0A=
>   drivers/usb/dwc2/core.c     | 199 ++++++++++++++++++++++++++++++++++++=
=0A=
>   drivers/usb/dwc2/core.h     |   4 +-=0A=
>   drivers/usb/dwc2/gadget.c   |  36 ++-----=0A=
>   drivers/usb/dwc2/hcd.c      | 190 ----------------------------------=0A=
>   drivers/usb/dwc2/hw.h       |   6 +-=0A=
>   drivers/usb/dwc2/platform.c |   5 +-=0A=
>   6 files changed, 213 insertions(+), 227 deletions(-)=0A=
> =0A=
Acked-by: Minas Harutyunyan <hminas@synopsys.com>=0A=
