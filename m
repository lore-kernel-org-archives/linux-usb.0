Return-Path: <SRS0=xlna=ST=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A3EC10F12
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 10:53:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B022F20821
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 10:53:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com header.i=@dialogsemiconductor.onmicrosoft.com header.b="G98ABKMr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731472AbfDQKxN (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 17 Apr 2019 06:53:13 -0400
Received: from mail1.bemta25.messagelabs.com ([195.245.230.2]:34801 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730926AbfDQKxM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Apr 2019 06:53:12 -0400
Received: from [46.226.52.104] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-a.eu-west-1.aws.symcld.net id FE/53-23457-49507BC5; Wed, 17 Apr 2019 10:53:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1VSa0wTWRjtnZkOAzJ6LRA+KxBtYtZVplLIJmP
  84w+zabIaH4nRIK5O6dh2U0rttAIaI2jqA6PrrhoeyhtxBbIG0EWCPP1Ba5bVRQ1KcJdiE3yQ
  1fpMCBI7TFH33/nOOfee8yUfQ2r+orWMmO8WXQ7BrqNjKOsqeg13Tt2eldbwKIk/UneV5icHS
  gi+uKmD4rtDvxN8bYOX5IM1fxJraWN1q8dY6d9s7KlojjK+7H5AGzs+FEYZ37SmbKIz1TaHKT
  d/t9p68UiIcpasyPdNjqBCVKorRjEMha+SMD1QGSUPGnyegHcPKghlCCD42F4WVqIZGvNw1jd
  GyzgetyAoD6bKJhL/HDbdD5DFiGHisAk6e2IUTzZ4b16iZToep0PT0wSZpvAyuF5aT8g0iwUo
  ubZepjXYDOenbpAyjg4nBbqezaYinAxvi5pmeRInwkiwipAxYAz1N++QCk6AZ09m1IpfBP/hh
  0jhU2FwOIjkKMBL4dQYpdDJMFR1MmLZAE/vDM1uC3gUQWPoKDn39peLxyMPeKg/6Y1gJ7zvGY
  3gJCge74v0mVRDbdFiZZdseFUxGKXwKdB4KkApAXdJaKgaoJRlUqG68zV9Bn1b/tVu5V9JCl4
  JDTUvSBmzeCH4y4JUNaIaEW9y2SxWd45gs3OGtDTOYEjnDKu/49IzeL2wnxP0oofLEyU3Z9AL
  eZJeKsjJtpv1DtHdisK3ZXbe+u8GGrps6UeLGEKXwM6E/sjSzDflmgusgmTd5fLYRakfJTGMD
  tjHZHuWZqFLtIj5e2z28IHOycDE6uLZjVRYZiWnkCPZLIp0G3FMb22ggtRQjlyHqE1ka2QTlk
  1Wj+PzF3NnPoSStXEsUqlUmlin6Mqxuf+vP0eJDNLFsXVyk1ibw/056Xm4BBEucS61SS7hFr5
  I2kKkvrWjS+v70Htl+JvT0XfFf73byxKX/Gj+u/23V10Liup2TLUcOBjrzes7cbvUMfwD91PK
  6IWjjRmDpkxxWpXgi743OdE88mad4B6fObGsrK25oHsizYOrJ+Zl+v/ZfmVXYdX32/LUh/ouH
  xNUmezW0PKZnb6dHb/uy+7c4n+UYWne26ajJKtgWEG6JOET4UoWJeEDAAA=
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-9.tower-268.messagelabs.com!1555498387!5523604!1
X-Originating-IP: [104.47.6.59]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25918 invoked from network); 17 Apr 2019 10:53:08 -0000
Received: from mail-ve1eur02lp2059.outbound.protection.outlook.com (HELO EUR02-VE1-obe.outbound.protection.outlook.com) (104.47.6.59)
  by server-9.tower-268.messagelabs.com with AES256-SHA256 encrypted SMTP; 17 Apr 2019 10:53:08 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com; s=selector1-diasemi-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRIoi4ExiBOWAwLZtuXjbRxNh3UgluhzFkMFxP4LlNs=;
 b=G98ABKMrs8FT15y96STBwEhQfBB+5r6tTKVIiIXQoCY+h08TedkjAmFFB/72KSuEplsO6IY1GfPIOaec93yQ/OhCZ4T18+bbta9oumiKvGTdxHuuxYrjEa2Vi2hsJOQmi4OeeEAzrnMMyyvYqRQZoLx5tfvRYHe4VLBF16UFq88=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1124.EURPRD10.PROD.OUTLOOK.COM (10.169.155.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.12; Wed, 17 Apr 2019 10:53:02 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::45b2:d8a8:e1c:b971]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::45b2:d8a8:e1c:b971%5]) with mapi id 15.20.1813.011; Wed, 17 Apr 2019
 10:53:02 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Kyle Tso <kyletso@google.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v2 3/3] usb: typec: fusb302: Revert "Resolve fixed power
 role contract setup"
Thread-Topic: [PATCH v2 3/3] usb: typec: fusb302: Revert "Resolve fixed power
 role contract setup"
Thread-Index: AQHU9JAbDWar11dBHEmG59yGPE9eaKZALhXQ
Date:   Wed, 17 Apr 2019 10:53:02 +0000
Message-ID:
 <AM5PR1001MB0994FCC6577712F0C38EE37480250@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20190416200754.2826-1-hdegoede@redhat.com>
 <20190416200754.2826-3-hdegoede@redhat.com>
In-Reply-To: <20190416200754.2826-3-hdegoede@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.50]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ca1584d-3224-4383-9d69-08d6c322dd27
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600140)(711020)(4605104)(2017052603328)(7193020);SRVR:AM5PR1001MB1124;
x-ms-traffictypediagnostic: AM5PR1001MB1124:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-microsoft-antispam-prvs: <AM5PR1001MB1124199BE1B240C4477B3F23A7250@AM5PR1001MB1124.EURPRD10.PROD.OUTLOOK.COM>
x-forefront-prvs: 0010D93EFE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(376002)(366004)(396003)(39850400004)(346002)(199004)(189003)(106356001)(476003)(486006)(11346002)(446003)(55016002)(6436002)(9686003)(97736004)(316002)(71200400001)(71190400001)(53936002)(86362001)(8936002)(4326008)(229853002)(52536014)(6246003)(5660300002)(74316002)(14444005)(68736007)(81166006)(110136005)(54906003)(256004)(81156014)(105586002)(14454004)(7736002)(478600001)(72206003)(2906002)(305945005)(7696005)(99286004)(8676002)(66066001)(26005)(53546011)(6506007)(55236004)(76176011)(186003)(33656002)(25786009)(6116002)(102836004)(3846002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB1124;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: b/fYKaWFiH7Y4wh7V1zWKl/GQaH9lnOF2ygm8xVEIQUd1KF119KTtptSF9J47U15qQZb+sqI7VU3kVMXDXQVxUuPBQx7qRwoQcCcTyETYwSlw4bAJmdtsPoYl3ZWi7mByAlMBYF2lHBY763th3hGg3ttS85l9MyxTFcb46mR29zZwJXzgYKKKpodQGhPtycRVPy2Mrubb+zNATVt+SQjzem/3VJfT+ggLV7FC4yndWhbk6RRaXouRhTaHu/aOdI7nhIs2LbiMGiNAFcYa/mldEXB1q5Td4LmqMVVJ+uajHR5SjVnQn77HSLlp5zIEBQv7tw77F/iSeWRQxoAi0mJjhnIGO4yNBoz3Dc4tJHv/RVt5fdxz+Sn9OjkZWgykXwDDQ7iJtclmk3l+ODeEVGKR1Gt2vQpIqd5edDghpFNIo0=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca1584d-3224-4383-9d69-08d6c322dd27
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2019 10:53:02.4437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1124
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190417105302.6ul4wbI4p4HesyFnmoOBa6h5CxWsZiE6X3m-jfwE4Mc@z>

On 16 April 2019 21:08, Hans de Goede wrote:

> Some tcpc device-drivers need to explicitly be told to watch for connecti=
on
> events, otherwise the tcpc will not generate any TCPM_CC_EVENTs and devic=
es
> being plugged into the Type-C port will not be noticed.
>=20
> For dual-role ports tcpm_start_drp_toggling() is used to tell the tcpc to
> watch for connection events. But for single-role ports we've so far been
> falling back to just calling tcpm_set_cc(). For some tcpc-s such as the
> fusb302 this is not enough and no TCPM_CC_EVENT will be generated.
>=20
> Commit ea3b4d5523bc ("usb: typec: fusb302: Resolve fixed power role
> contract setup") fixed SRPs not working because of this by making the
> fusb302 driver start connection detection on every tcpm_set_cc() call.
> It turns out this breaks src->snk power-role swapping because during the
> swap we first set the Cc pins to Rp, calling set_cc, and then send a PS_R=
DY
> message. But the fusb302 cannot send PD messages while its toggling engin=
e
> is active, so sending the PS_RDY message fails.
>=20
> Struct tcpc_dev now has a new start_srp_connection_detect callback and
> fusb302.c now implements this. This callback gets called when we the
> fusb302 needs to start connection detection, fixing fusb302 SRPs not
> seeing connected devices.
>=20
> This allows us to revert the changes to fusb302's set_cc implementation,
> making it once again purely setup the Cc-s and matching disconnect
> detection, fixing src->snk power-role swapping no longer working.
>=20
> Note that since the code was refactored in between, codewise this is not =
a
> straight forward revert. Functionality wise this is a straight revert and
> the original functionality is fully restored.
>=20
> Fixes: ea3b4d5523bc ("usb: typec: fusb302: Resolve fixed power role ...")
> Cc: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

For DRP & Sink only toggling scenarios, with FUSB302 TCPC:

Tested-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

> ---
> Changes in v2:
> -No changes
> ---
>  drivers/usb/typec/tcpm/fusb302.c | 55 ++++++++++++++++++++++++++------
>  1 file changed, 46 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/usb/typec/tcpm/fusb302.c
> b/drivers/usb/typec/tcpm/fusb302.c
> index ba030b03d156..4328a6cbfb69 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -606,19 +606,16 @@ static int tcpm_set_cc(struct tcpc_dev *dev, enum
> typec_cc_status cc)
>  			    FUSB_REG_SWITCHES0_CC2_PU_EN |
>  			    FUSB_REG_SWITCHES0_CC1_PD_EN |
>  			    FUSB_REG_SWITCHES0_CC2_PD_EN;
> -	u8 switches0_data =3D 0x00;
> +	u8 rd_mda, switches0_data =3D 0x00;
>  	int ret =3D 0;
> -	enum toggling_mode mode;
>=20
>  	mutex_lock(&chip->lock);
>  	switch (cc) {
>  	case TYPEC_CC_OPEN:
> -		mode =3D TOGGLING_MODE_OFF;
>  		break;
>  	case TYPEC_CC_RD:
>  		switches0_data |=3D FUSB_REG_SWITCHES0_CC1_PD_EN |
>  				  FUSB_REG_SWITCHES0_CC2_PD_EN;
> -		mode =3D TOGGLING_MODE_SNK;
>  		break;
>  	case TYPEC_CC_RP_DEF:
>  	case TYPEC_CC_RP_1_5:
> @@ -626,7 +623,6 @@ static int tcpm_set_cc(struct tcpc_dev *dev, enum
> typec_cc_status cc)
>  		switches0_data |=3D (chip->cc_polarity =3D=3D TYPEC_POLARITY_CC1) ?
>  				  FUSB_REG_SWITCHES0_CC1_PU_EN :
>  				  FUSB_REG_SWITCHES0_CC2_PU_EN;
> -		mode =3D TOGGLING_MODE_SRC;
>  		break;
>  	default:
>  		fusb302_log(chip, "unsupported cc value %s",
> @@ -637,6 +633,12 @@ static int tcpm_set_cc(struct tcpc_dev *dev, enum
> typec_cc_status cc)
>=20
>  	fusb302_log(chip, "cc :=3D %s", typec_cc_status_name[cc]);
>=20
> +	ret =3D fusb302_set_toggling(chip, TOGGLING_MODE_OFF);
> +	if (ret < 0) {
> +		fusb302_log(chip, "cannot set toggling mode, ret=3D%d", ret);
> +		goto done;
> +	}
> +
>  	ret =3D fusb302_i2c_mask_write(chip, FUSB_REG_SWITCHES0,
>  				     switches0_mask, switches0_data);
>  	if (ret < 0) {
> @@ -655,10 +657,45 @@ static int tcpm_set_cc(struct tcpc_dev *dev, enum
> typec_cc_status cc)
>  		goto done;
>  	}
>=20
> -	ret =3D fusb302_set_toggling(chip, mode);
> -	if (ret < 0)
> -		fusb302_log(chip, "cannot set toggling mode, ret=3D%d", ret);
> -
> +	/* enable/disable interrupts, BC_LVL for SNK and COMP_CHNG for SRC
> */
> +	switch (cc) {
> +	case TYPEC_CC_RP_DEF:
> +	case TYPEC_CC_RP_1_5:
> +	case TYPEC_CC_RP_3_0:
> +		rd_mda =3D rd_mda_value[cc_src_current[cc]];
> +		ret =3D fusb302_i2c_write(chip, FUSB_REG_MEASURE, rd_mda);
> +		if (ret < 0) {
> +			fusb302_log(chip,
> +				    "cannot set SRC measure value, ret=3D%d",
> +				    ret);
> +			goto done;
> +		}
> +		ret =3D fusb302_i2c_mask_write(chip, FUSB_REG_MASK,
> +					     FUSB_REG_MASK_BC_LVL |
> +					     FUSB_REG_MASK_COMP_CHNG,
> +					     FUSB_REG_MASK_COMP_CHNG);
> +		if (ret < 0) {
> +			fusb302_log(chip, "cannot set SRC interrupt, ret=3D%d",
> +				    ret);
> +			goto done;
> +		}
> +		chip->intr_comp_chng =3D true;
> +		break;
> +	case TYPEC_CC_RD:
> +		ret =3D fusb302_i2c_mask_write(chip, FUSB_REG_MASK,
> +					     FUSB_REG_MASK_BC_LVL |
> +					     FUSB_REG_MASK_COMP_CHNG,
> +					     FUSB_REG_MASK_BC_LVL);
> +		if (ret < 0) {
> +			fusb302_log(chip, "cannot set SRC interrupt, ret=3D%d",
> +				    ret);
> +			goto done;
> +		}
> +		chip->intr_bc_lvl =3D true;
> +		break;
> +	default:
> +		break;
> +	}
>  done:
>  	mutex_unlock(&chip->lock);
>=20
> --
> 2.21.0

