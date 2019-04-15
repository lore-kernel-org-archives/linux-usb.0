Return-Path: <SRS0=TXFt=SR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288EDC10F0E
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 10:31:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DC62E2070D
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 10:31:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com header.i=@dialogsemiconductor.onmicrosoft.com header.b="dNgxc9zt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbfDOKbk (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 15 Apr 2019 06:31:40 -0400
Received: from mail1.bemta26.messagelabs.com ([85.158.142.1]:54452 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725779AbfDOKbk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Apr 2019 06:31:40 -0400
Received: from [85.158.142.104] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 1C/60-22995-78D54BC5; Mon, 15 Apr 2019 10:31:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1VSe0hTcRTeb/fu7k5cXKfD03KSI4NyW5ohtyI
  IAltUUFAEZtRVr97R3GybOIvCiqH5QCMhGs1XapaSaUVFYllgWorRU60/XM3hC+yFSWF17+7s
  8d/3O993vvOdH4fEVC8IDcm6nKzdylh0RBjOrZGsMxQfuJme+HZCS5++1E7QM4/PS+nS1rs43
  f3pmpRuaHZjtL9+QLqZMNV15ptq+neb7nvb5KbZ7leE6e63IrnpS2fsLiJNZrZm2FyHZNxQ7R
  Usr0Hjmnt1UV6ExtWlKIzEqXYMvI/KMOGhoqql0B44JRcfPgSV34dlpUhBEhQN5/rGCAFHUR0
  IPH69IMKoSgQLL32YQERSe+C6p00uivbCGfd5XMRrYXJ6NKjBqXhovH8BCVhJMXCr/FcQq/gB
  l29UBwcoqPXg8z6VChhRWvh6sjXYi1HRMOqvDdaBoqCxawgTsRomP/yUiXoW+k8NI7Guh8E3f
  h6TPI6DijFcLGvheW1ZSLIT5tt+IGEXoN4hqL88KF/s/X6pJ+RPQ2OZO9ScB3MN70MZYqCkdy
  HUPCPjnWZk4jKZ8NG7aBQLVyt8uCh6hsHYxYBU3EYPdfc+E1Voleef5Tz/UCJOgOb6acwT/LA
  I6L/gx+sQfhWtz7CbczhnLmO2GJISEw1JScmGZB7RRuaogTGy+YZM1uq0MzxrZAocRkdhbqYl
  y2hlnZ2IP7CsI5jlDpprynmIlpJSnVq5Hb+ZrlqSYcsq5BgHd9Ceb2EdD1EMSepA6drPcxF2N
  od1ZZst/JUu0kCG66KULek8rXTkMbkOc45IPUEG8kGDz4upcKvNymqilWOCByWIuHzrH4vFW3
  +OtJpIJZJIJKrwPNaea3b+z0+haBLpIpUDgku42er8M2mKDyHlQ1TrW4UQTuYvpSlCZVk71F8
  KWrauPLvQm1IVu2z+SlNxTWTJs70nUpeXjMduXNGGp94bUfS4d99uSbcpuEBluWIDEVWrjlPY
  2if6DupvnHwtOXSsz1y8b0EViDqe7amaqg/AYc7yaNO3/RnLE7q7SG3mdMe2rpTZ5tnAFvcvS
  fxApzd+eL7jNZs2UqzDHRyTtBqzO5jfrO8bWOYDAAA=
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-28.tower-229.messagelabs.com!1555324294!4361441!1
X-Originating-IP: [104.47.0.52]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25207 invoked from network); 15 Apr 2019 10:31:35 -0000
Received: from mail-he1eur01lp2052.outbound.protection.outlook.com (HELO EUR01-HE1-obe.outbound.protection.outlook.com) (104.47.0.52)
  by server-28.tower-229.messagelabs.com with AES256-SHA256 encrypted SMTP; 15 Apr 2019 10:31:35 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com; s=selector1-diasemi-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3KYnPWMlUuTKLe+fvCb7jDRrA2Uyum4MWe0RrTNCpc=;
 b=dNgxc9ztAoNEVLG2Rh/jL7Up2t9JnP7MJJLrnvDTEVbf+kXg/cUJt2LHBhPEELCEs8ryDykl1T97+1Uq03nym0ndsfHyyW9WdP2ZNQ9TsMGktjKxBBuPt9l3aMlFhI782QpCbEfcTw0KqZE3zj9NkjuAo9OF96+tXqJ7a4VlTLA=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1137.EURPRD10.PROD.OUTLOOK.COM (10.169.148.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.19; Mon, 15 Apr 2019 10:31:32 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::45b2:d8a8:e1c:b971]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::45b2:d8a8:e1c:b971%4]) with mapi id 15.20.1792.018; Mon, 15 Apr 2019
 10:31:32 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Kyle Tso <kyletso@google.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH 1/3] usb: typec: tcpm: Add start_srp_connection_detect
 callback
Thread-Topic: [PATCH 1/3] usb: typec: tcpm: Add start_srp_connection_detect
 callback
Thread-Index: AQHU8jkUQ4gr3hBo80qiT37u564Y7KY9CBxg
Date:   Mon, 15 Apr 2019 10:31:32 +0000
Message-ID:
 <AM5PR1001MB0994B21356503AC1041171E7802B0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20190413203955.10788-1-hdegoede@redhat.com>
In-Reply-To: <20190413203955.10788-1-hdegoede@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.50]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2ef4b00-2c90-42ab-a60e-08d6c18d8795
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:AM5PR1001MB1137;
x-ms-traffictypediagnostic: AM5PR1001MB1137:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-microsoft-antispam-prvs: <AM5PR1001MB1137EE9C6461276CAD60EB1BA72B0@AM5PR1001MB1137.EURPRD10.PROD.OUTLOOK.COM>
x-forefront-prvs: 000800954F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(39850400004)(136003)(366004)(396003)(199004)(189003)(97736004)(476003)(66066001)(486006)(7696005)(33656002)(446003)(11346002)(6506007)(53546011)(7736002)(6436002)(186003)(256004)(55236004)(71200400001)(71190400001)(86362001)(478600001)(68736007)(99286004)(6246003)(5660300002)(14444005)(102836004)(26005)(8676002)(9686003)(81156014)(81166006)(316002)(14454004)(4326008)(8936002)(76176011)(52536014)(72206003)(54906003)(53936002)(110136005)(3846002)(6116002)(74316002)(25786009)(229853002)(305945005)(106356001)(55016002)(105586002)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB1137;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ii9Oye5CSsLHn/OL1R0criZlmmTuVi+8aCOXualG2KnidvDcLoH4N1H9VVfZnkEYeiRlyYvWwBaDPteK0xs8nECiqofAzK2SDFtFHmOMQfUhgKNSLvt0w41h6J+3lFaI95mRccvmpw99saIpR7KFB4yVpRopl7itj2KyYdMbJ9LzWSz/sGFcI/6hAin/AITpE4ZgSjA2iDvZ13twCHoX13OSu8R9oEpBu9Z8mILScQQZZfgwKfjIRua8eFOwdWySipSEC1jXf9JKTrmABgNE84YF0TPz5bLj2Hv4X+UONrmmwRP+6zlfIEutmF28uTrFXTo2qFJ+OIh4vrHKC2lyYhMa/Pzv1BAloTK0tqNcddRr4FTxBeOs0KaWAHRmllJGC5RO2pjfjwC5XeBkuDraSq78iV57pxsB6JQJJ17dZN0=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ef4b00-2c90-42ab-a60e-08d6c18d8795
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2019 10:31:32.7153
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1137
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190415103132.wmyYHCY50FzTDOaYUSINllABsnr88OG8qKycp3vo1Js@z>

On 13 April 2019 21:40, Hans de Goede wrote:

> Some tcpc device-drivers need to explicitly be told to watch for connecti=
on
> events, otherwise the tcpc will not generate any TCPM_CC_EVENTs and devic=
es
> being plugged into the Type-C port will not be noticed.
>=20
> For dual-role ports tcpm_start_drp_toggling() is used to tell the tcpc to=
 watch for
> connection events. But for single-role ports we've so far been falling ba=
ck to just
> calling tcpm_set_cc(). For some tcpc-s such as the
> fusb302 this is not enough and no TCPM_CC_EVENT will be generated.
>=20
> This commit adds a new start_srp_connection_detect callback to tcpc_dev a=
nd
> when this is implemented calls this in place of start_drp_toggling for SR=
P devices.
>=20
> Fixes: ea3b4d5523bc("usb: typec: fusb302: Resolve fixed power role ...")
> Cc: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 8 ++++++++
>  include/linux/usb/tcpm.h      | 6 ++++++
>  2 files changed, 14 insertions(+)
>=20
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.=
c
> index a2233d72ae7c..1af54af90b50 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -2553,6 +2553,14 @@ static bool tcpm_start_drp_toggling(struct tcpm_po=
rt
> *port,
>  			return true;
>  	}
>=20
> +	if (port->tcpc->start_srp_connection_detect &&
> +	    port->port_type !=3D TYPEC_PORT_DRP) {
> +		tcpm_log_force(port, "Start SRP connection detection");
> +		ret =3D port->tcpc->start_srp_connection_detect(port->tcpc, cc);
> +		if (!ret)
> +			return true;
> +	}
> +

Is it a little misleading when reading the state machine code that we're ca=
lling
tcpm_start_drp_toggling() to actually start SRP detection? Maybe we could r=
ename
this function and the associated state to cover both SRP and DRP, or
alternatively add a new state for SRP_DETECTION, just to keep logging and c=
ode
readability clear and then move the above code to a different function just=
 for
SRP?

Functionally though, the change makes sense to me.

>  	return false;
>  }
>=20
> diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h index
> 0c532ca3f079..bf2bbbf2e2b2 100644
> --- a/include/linux/usb/tcpm.h
> +++ b/include/linux/usb/tcpm.h
> @@ -125,6 +125,10 @@ struct tcpc_config {
>   *		Optional; if supported by hardware, called to start DRP
>   *		toggling. DRP toggling is stopped automatically if
>   *		a connection is established.
> + * @start_srp_connection_detect:
> + *		Optional; if supported by hardware, called to start connection
> + *		detection for single role ports. Connection detection is stopped
> + *		automatically if a connection is established.
>   * @try_role:	Optional; called to set a preferred role
>   * @pd_transmit:Called to transmit PD message
>   * @mux:	Pointer to multiplexer data
> @@ -149,6 +153,8 @@ struct tcpc_dev {
>  			 enum typec_role role, enum typec_data_role data);
>  	int (*start_drp_toggling)(struct tcpc_dev *dev,
>  				  enum typec_cc_status cc);
> +	int (*start_srp_connection_detect)(struct tcpc_dev *dev,
> +					   enum typec_cc_status cc);
>  	int (*try_role)(struct tcpc_dev *dev, int role);
>  	int (*pd_transmit)(struct tcpc_dev *dev, enum tcpm_transmit_type
> type,
>  			   const struct pd_message *msg);
> --
> 2.21.0
