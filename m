Return-Path: <SRS0=xlna=ST=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AAD5C282DA
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 10:51:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0E78A20821
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 10:51:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com header.i=@dialogsemiconductor.onmicrosoft.com header.b="e5rjkjQf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731499AbfDQKvF (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 17 Apr 2019 06:51:05 -0400
Received: from mail1.bemta26.messagelabs.com ([85.158.142.116]:62224 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731108AbfDQKvE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Apr 2019 06:51:04 -0400
Received: from [85.158.142.201] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-b.eu-central-1.aws.symcld.net id D3/4F-23469-41507BC5; Wed, 17 Apr 2019 10:51:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSWUwTYRSF+WdjbKgZCoRrpQI1xCi0UhUt8cU
  QH+qDARN8MbhMYaBNylCnbUTjA0qIsSoiYJSSyipEMSokAi6pCi6FCLgrChG0uIAbKhpjNM50
  wOXtzD3fnXPvn0vjqjuUmuYKnZzAszYtpSAsi6lUXSTZkZV8/bvCWNxwhjK+vXkEM7pbzhNG3
  +RpzFjfVIIbA3W3sFWUqbbNZTrWs8502Xsq1PTB94Aynf9WFGr63DYvg9pAWnlzQeEW0uLzek
  h7cXhheY1QhLyz3WgWTTBncOi+aXYjBa1iDmNQ1d5Dyh+jCF6NDxESRTFGqPCPUJKOZFoReAJ
  JEoQzBxH8vD+KS0YEsxF+1PXjMrQJBtuPkrJeAiNjvZQclwD9u1qDdSXDws/SiiCvYnKgevAa
  kvQsMexG+7dgMGI08GVXS5DBmWh4EqjBJA0MA42XBnBZR8GbF79ImeegZ/djJNeToO9RQNS0q
  OPhwAghlzVwt2bfNLIWTpfUBhcGZgjBZHUFOdPbPOifzjJC476S6WY7XL33ipJ1DLifX8Xk5r
  ckfJ7yYfIy2fDR2xcqQ/Pg5IFRQoZu4zA81UvK2yRB7cVPVBla6PlnOc8/lqwToaluAvcEHyw
  ceqoCRC0iTqJUs2DNszjzWatNZ0hO1hkMS3UpOsOyZXp2h86s51y6bI53Cqzo6tltDr1je362
  LUfPc842JJ5XzlayrBM1Nud1oTk0po1S/ppsz1LNNhfkbLewDstmwWXjHF0ohqa1oBzGO7JU4
  QKXxxXmWm3ijc7YQIdpI5XphGgrHXY232HNk61epKOv1I96cRXBF/CcOlpZJ0GMBFlc/J9fzF
  z6XaRRRyhRSEiIKszOCflW5//+OIqmkTZC2SBNEmblnX+SxsUhMHGIyqQWaQgn+9dSFyHVwJX
  uvkuZJ+wl+zPmP8zd6w+Erhg7V/ruZV/82TdzvXxcGp+QVpF5bUj7NWq55uLrgH0qITx2eLxT
  wBak3FoiNK9ZqXhcX574LO76fsvqSt+c5j2xDe9bY0I2Jx5ypddMrLyQ2/2JPu53P1zoUz952
  rUTi1esb+ys7qhmq75M1Pu0hMPCGhbhgoP9DYTrnIPkAwAA
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-13.tower-246.messagelabs.com!1555498259!277536!1
X-Originating-IP: [104.47.6.57]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2459 invoked from network); 17 Apr 2019 10:51:00 -0000
Received: from mail-ve1eur02lp2057.outbound.protection.outlook.com (HELO EUR02-VE1-obe.outbound.protection.outlook.com) (104.47.6.57)
  by server-13.tower-246.messagelabs.com with AES256-SHA256 encrypted SMTP; 17 Apr 2019 10:51:00 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com; s=selector1-diasemi-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JXPe0hW7B9p6vYmCoSWSZgNqoX8hnZcJEiedrfW1Do=;
 b=e5rjkjQfpaa5pJCXOafnEXBWNyAhhGTdhpce8W/6wzHZ02/duvGgsszyA1GidPoK1UIrHqqoSADObU3FR40guBEMN5DA2+gbS/QRJvzchy/nRJ6aECcHMJtZKbzmRV+uRl1z8oy6jbooo0Ppdgh3iIvJWD6N0fIE9vnWlUge38Y=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB0996.EURPRD10.PROD.OUTLOOK.COM (10.169.154.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.11; Wed, 17 Apr 2019 10:50:58 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::45b2:d8a8:e1c:b971]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::45b2:d8a8:e1c:b971%5]) with mapi id 15.20.1813.011; Wed, 17 Apr 2019
 10:50:58 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Kyle Tso <kyletso@google.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v2 2/3] usb: typec: fusb302: Implement start_toggling for
 all port-types
Thread-Topic: [PATCH v2 2/3] usb: typec: fusb302: Implement start_toggling for
 all port-types
Thread-Index: AQHU9JAaR1u5W70d+0O76XJquRw116ZALWog
Date:   Wed, 17 Apr 2019 10:50:58 +0000
Message-ID:
 <AM5PR1001MB09942E8A9B85AD4409B24F4980250@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20190416200754.2826-1-hdegoede@redhat.com>
 <20190416200754.2826-2-hdegoede@redhat.com>
In-Reply-To: <20190416200754.2826-2-hdegoede@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.50]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34dbca81-639e-46c1-a070-08d6c3229309
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600140)(711020)(4605104)(2017052603328)(7193020);SRVR:AM5PR1001MB0996;
x-ms-traffictypediagnostic: AM5PR1001MB0996:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-microsoft-antispam-prvs: <AM5PR1001MB0996D32FDC5E4F25970DB986A7250@AM5PR1001MB0996.EURPRD10.PROD.OUTLOOK.COM>
x-forefront-prvs: 0010D93EFE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(39850400004)(136003)(366004)(376002)(396003)(199004)(189003)(8676002)(86362001)(25786009)(7736002)(81166006)(76176011)(305945005)(97736004)(53546011)(102836004)(14454004)(74316002)(7696005)(55236004)(2906002)(4326008)(81156014)(99286004)(8936002)(6506007)(486006)(229853002)(316002)(256004)(52536014)(26005)(54906003)(186003)(66066001)(6436002)(14444005)(6246003)(3846002)(6116002)(446003)(33656002)(106356001)(55016002)(9686003)(68736007)(53936002)(72206003)(110136005)(71200400001)(5660300002)(71190400001)(11346002)(105586002)(478600001)(476003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB0996;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kCvce8c6LhHIcz4bMRTg/cFRktzIlnY+G3QpVWxG6ElqJhe5JprXRCMbSIHdmUXSeUxAzYw7bj5vNLmiBmigBA5Ta0WDhoGQQ2l4PWlYcdAhad0cTszhIZTOFMpFMm6ZuQmIM6sqdypftssQ2VTyw4eSgJs+WtVUblvFWjcRI1UYisuLNzZ+om6O96wiyQi9tPwCosfUJBBVAePTq3q/QpIAOg+vlSz2FrhbZ9gKEAjMzHcy6doWcf5IkapyTdXr0Dyo1KtC3SfsyAQNNfFe1alpO+ObHPxDxzOYQCsozhH+VrLsPnXRxe43gKbp6vQSlMZvBaEoX0Ofv7W65ahjHDH6ZKyVrfheqasKV2I9C9gJ48bY065GWTJy0QXXqcKTeL00YV7j2s02060HX8zLYAHc1wqEjZ+emtIKqCERODQ=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34dbca81-639e-46c1-a070-08d6c3229309
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2019 10:50:58.0938
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB0996
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190417105058.q8xMf_7M4UXMXmheMR9y4AucSD4VDsGlar4y-JU6xqk@z>

On 16 April 2019 21:08, Hans de Goede wrote:

> When in single-role port mode, we must start single-role toggling to
> get an interrupt when a device / cable gets plugged into the port.
>=20
> This commit modifies the fusb302 start_toggling implementation to
> start toggling for all port-types, so that connection-detection works
> on single-role ports too.
>=20
> Fixes: ea3b4d5523bc("usb: typec: fusb302: Resolve fixed power role ...")
> Cc: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

For DRP & Sink only toggling scenarios, with FUSB302 TCPC:

Tested-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

> ---
> Changes in v2:
> -Adjust for the tcpm core renaming start_drp_toggling to start_toggling,
>  instead of adding a new start_srp_connection_detect callback
> ---
>  drivers/usb/typec/tcpm/fusb302.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/usb/typec/tcpm/fusb302.c
> b/drivers/usb/typec/tcpm/fusb302.c
> index 6d83891cc895..ba030b03d156 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -882,10 +882,20 @@ static int tcpm_start_toggling(struct tcpc_dev *dev=
,
>  {
>  	struct fusb302_chip *chip =3D container_of(dev, struct fusb302_chip,
>  						 tcpc_dev);
> +	enum toggling_mode mode =3D TOGGLING_MODE_OFF;
>  	int ret =3D 0;
>=20
> -	if (port_type !=3D TYPEC_PORT_DRP)
> -		return -EOPNOTSUPP;
> +	switch (port_type) {
> +	case TYPEC_PORT_SRC:
> +		mode =3D TOGGLING_MODE_SRC;
> +		break;
> +	case TYPEC_PORT_SNK:
> +		mode =3D TOGGLING_MODE_SNK;
> +		break;
> +	case TYPEC_PORT_DRP:
> +		mode =3D TOGGLING_MODE_DRP;
> +		break;
> +	}
>=20
>  	mutex_lock(&chip->lock);
>  	ret =3D fusb302_set_src_current(chip, cc_src_current[cc]);
> @@ -894,7 +904,7 @@ static int tcpm_start_toggling(struct tcpc_dev *dev,
>  			    typec_cc_status_name[cc], ret);
>  		goto done;
>  	}
> -	ret =3D fusb302_set_toggling(chip, TOGGLING_MODE_DRP);
> +	ret =3D fusb302_set_toggling(chip, mode);
>  	if (ret < 0) {
>  		fusb302_log(chip,
>  			    "unable to start drp toggling, ret=3D%d", ret);
> --
> 2.21.0

