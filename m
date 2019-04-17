Return-Path: <SRS0=xlna=ST=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEAA0C10F12
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 10:49:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 889E920821
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 10:49:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com header.i=@dialogsemiconductor.onmicrosoft.com header.b="DKF8vZE5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730926AbfDQKtk (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 17 Apr 2019 06:49:40 -0400
Received: from mail1.bemta25.messagelabs.com ([195.245.230.4]:58784 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725792AbfDQKtk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Apr 2019 06:49:40 -0400
Received: from [46.226.52.98] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-a.eu-west-1.aws.symcld.net id C9/8A-23897-DB407BC5; Wed, 17 Apr 2019 10:49:33 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1VSbUwTWRTlzUyH0dD12aJcEUhsIkZkKtVFhqw
  x+8ekP9asxEQjwejUjrRJW5rOEMDNxqoxUVDUFSUtW0FAVGpQ8KNLdKmi2RXU+B2IAQSpUXEV
  pajRKHGGAVf/nXfOufee+3IZUveATmSEYknwuHiHgZ5K2RaibPZvKpSXUVEXz22vO0Vz//1bS
  XClwVaKa3vTRHC1DTtILnLkBvEzba5pKTQf7sgxhwMnY83DbQ9oc+t7b6w52pKyks7V2F2Wgu
  INGtsFby3tPrqq+NPoC9KL7iwvRVMZCp8iof/sUaQ8dPgQAYPlUVp9DCAYvr6LLEVTGBpzcOB
  aP63geNyMwB9JV0wk3ovg8/2BcZMeC9A7MjJh2gTd0R6ZZ2S8CLrDWxSawnNhKNJFKFiLeYju
  G6QUrMNZUN5+Ail4ijyr62BVrIIRTobRrcHx9iROgIeR6vFawBjqL94iVTwDng+OaVS/AB3bu
  pHKp8PNrghSIgCeA3v6KZVOhrvVZROWFfDp+StKWQVwD4Lj1ys1k7WdzZ8nCjioL9tBqX3cMF
  xuUekkKH18mVBr32pg+OU5Ut1lI7wO3IxVTSnQuGdgYsBtEprqa5G6TDrUXBih96H5/m92838
  jqXgBNBx5QfrH/2s6dPgiVA2iGlGWxWPPt0lO3u5gTRkZrMm0iDVlZ7JZS4z8ZpY3CoVskSBK
  rMnIF4lGscS50WE1ugSpBcnHZXVf+eUv1Hcsvx3NYgjDDO3Ym/N5uh8sBdYSGy/a1nsKHYLYj
  pIYxgDaXjKUp5vuEfKF4k12h3yhkzIwcYZ47a/yjeq0opt3ivZ8VepEi5lLtQMBkvH5ngZIHe
  UqcAmJCdqnhGzFitVW6PraaPLa76LkRL0WxcTE6OLcgsdpl77Xh1ACgwx6bZ2SJ87ukr7OG5K
  jEHKUivSgEkXi/5cSvcirD33Mk/74UFXlLOOa4jIv7ffN/zPlzBN3Umjp4YzW9soY6xo2rSLe
  fCMz3NCc/Pu0tgD+Meegvuhq5qMx7l7T7vCcdyve5wR/C8723HK+W6vvTbtWEjqduy4XpS7LX
  s1b+w51+v65E+3x/zTaZ59Lr7E8uzgz3EJKa3fOq051rDdQoo03pZEekf8Czd/8bugDAAA=
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-17.tower-262.messagelabs.com!1555498172!5552292!1
X-Originating-IP: [104.47.1.57]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11895 invoked from network); 17 Apr 2019 10:49:33 -0000
Received: from mail-ve1eur01lp2057.outbound.protection.outlook.com (HELO EUR01-VE1-obe.outbound.protection.outlook.com) (104.47.1.57)
  by server-17.tower-262.messagelabs.com with AES256-SHA256 encrypted SMTP; 17 Apr 2019 10:49:33 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com; s=selector1-diasemi-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNyCEuVM8RVacG43q/aG76Y6JRQGmQIAMJAFSfHbdaM=;
 b=DKF8vZE5Zs2lTm/e6JkGFiul24eHOXCjW+skMFbaXc/k6DECv6Ro84pCUd5lazVuHyceAE1o32TQGXvAMh34Ws6f6wl5pzr03EI+869Kr40RJouaP/1FAOfLutR9xMZRhIqR8ZSCvd4+fmPhvxJMzyVFAAo3KoTphBCEHSC7fBA=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1203.EURPRD10.PROD.OUTLOOK.COM (10.169.154.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.12; Wed, 17 Apr 2019 10:49:30 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::45b2:d8a8:e1c:b971]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::45b2:d8a8:e1c:b971%5]) with mapi id 15.20.1813.011; Wed, 17 Apr 2019
 10:49:30 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Kyle Tso <kyletso@google.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v2 1/3] usb: typec: tcpm: Notify the tcpc to start
 connection-detection for SRPs
Thread-Topic: [PATCH v2 1/3] usb: typec: tcpm: Notify the tcpc to start
 connection-detection for SRPs
Thread-Index: AQHU9JAZ+1Xm554ol0eMOUc2+wtxpaZAKrnQ
Date:   Wed, 17 Apr 2019 10:49:30 +0000
Message-ID:
 <AM5PR1001MB0994B16D43DA62A663F4D62B80250@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20190416200754.2826-1-hdegoede@redhat.com>
In-Reply-To: <20190416200754.2826-1-hdegoede@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.50]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87f67a0d-dd86-4bc6-091e-08d6c3225eb4
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600140)(711020)(4605104)(2017052603328)(7193020);SRVR:AM5PR1001MB1203;
x-ms-traffictypediagnostic: AM5PR1001MB1203:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-microsoft-antispam-prvs: <AM5PR1001MB1203B7514CFE14E1B575A94AA7250@AM5PR1001MB1203.EURPRD10.PROD.OUTLOOK.COM>
x-forefront-prvs: 0010D93EFE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(376002)(39850400004)(136003)(346002)(396003)(199004)(189003)(478600001)(186003)(72206003)(102836004)(53546011)(6506007)(26005)(486006)(11346002)(2906002)(6116002)(3846002)(446003)(76176011)(55236004)(476003)(81156014)(305945005)(74316002)(68736007)(7736002)(110136005)(8936002)(81166006)(54906003)(316002)(8676002)(99286004)(55016002)(9686003)(7696005)(106356001)(53936002)(105586002)(14454004)(25786009)(6436002)(229853002)(4326008)(97736004)(71190400001)(6246003)(71200400001)(14444005)(33656002)(52536014)(5660300002)(5024004)(86362001)(256004)(66066001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB1203;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: maG+7+QbC5dGxgCzLqFNz4hhzQvrQsZIG8raay5HPFQwnm48tM1psMdt8pRitXM7GH+k09AtN57Z4NvLK/URQ5igdGskmcLFDcaVtA2NSJjFcmcmiecnv71aM5kcUZqc1Ir9C9+7ook5qZ+ITL6WFRI4TeWT/RTzxGKIDFhIEgycU4m7xaYnkAGUbR3LndRqbiC/9rxlDk9gruhyaLGAMh0gwQnKDkYsf4/fOV4YQfp6RoDzV4VGHDzbwZQgWQde3bfj9HVPOept8J9M/gzIfcDvXO0JvLHkbvfsRzrKhMpBr32m9WF3qmHhjfgMNMBKir/H6NmWaPRIdgtJ5tp6EnDaDUY3NofGhPn64oGaozrEKQhWs72ba0B93TubAKVoAqumnPexFEte86L1+pnUMKFv/OuBMB6Px9Qum3SMfoI=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f67a0d-dd86-4bc6-091e-08d6c3225eb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2019 10:49:30.3344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1203
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190417104930.bpSCLP0T9bRLTTCG6Kn-bBwSHmdN8H8oFeq3SA6z4ss@z>

On 16 April 2019 21:08, Hans de Goede wrote:

> Some tcpc device-drivers need to explicitly be told to watch for connecti=
on
> events, otherwise the tcpc will not generate any TCPM_CC_EVENTs and devic=
es
> being plugged into the Type-C port will not be noticed.
>=20
> For dual-role ports tcpm_start_drp_toggling() is used to tell the tcpc to
> watch for connection events. Sofar we lack a similar callback to the tcpc
> for single-role ports. With some tcpc-s such as the fusb302 this means
> no TCPM_CC_EVENTs will be generated when the port is configured as a
> single-role port.
>=20
> This commit renames start_drp_toggling to start_toggling and since the
> device-properties are parsed by the tcpm-core, adds a port_type parameter
> to the start_toggling callback so that the tcpc_dev driver knows the
> port-type and can act accordingly when it starts toggling.
>=20
> The new start_toggling callback now always gets called if defined, instea=
d
> of only being called for DRP ports.
>=20
> To avoid this causing undesirable functional changes all existing
> start_drp_toggling implementations are not only renamed to start_toggling=
,
> but also get a port_type check added and return -EOPNOTSUPP when port_typ=
e
> is not DRP.
>=20
> Fixes: ea3b4d5523bc("usb: typec: fusb302: Resolve fixed power role ...")
> Cc: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

For DRP & Sink only toggling scenarios, with FUSB302 TCPC:

Tested-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

> ---
> Changes in v2:
> -Rename start_drp_toggling to start_toggling and make it multi-purpose,
>  rather then adding a new start_srp_connection_detect callback
> ---
>  drivers/usb/typec/tcpm/fusb302.c | 10 +++++++---
>  drivers/usb/typec/tcpm/tcpci.c   | 10 +++++++---
>  drivers/usb/typec/tcpm/tcpm.c    | 32 ++++++++++++++------------------
>  drivers/usb/typec/tcpm/wcove.c   | 10 +++++++---
>  include/linux/usb/tcpm.h         | 13 +++++++------
>  5 files changed, 42 insertions(+), 33 deletions(-)
>=20
> diff --git a/drivers/usb/typec/tcpm/fusb302.c
> b/drivers/usb/typec/tcpm/fusb302.c
> index 6ea6199caafa..6d83891cc895 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -876,13 +876,17 @@ static int tcpm_set_roles(struct tcpc_dev *dev, boo=
l
> attached,
>  	return ret;
>  }
>=20
> -static int tcpm_start_drp_toggling(struct tcpc_dev *dev,
> -				   enum typec_cc_status cc)
> +static int tcpm_start_toggling(struct tcpc_dev *dev,
> +			       enum typec_port_type port_type,
> +			       enum typec_cc_status cc)
>  {
>  	struct fusb302_chip *chip =3D container_of(dev, struct fusb302_chip,
>  						 tcpc_dev);
>  	int ret =3D 0;
>=20
> +	if (port_type !=3D TYPEC_PORT_DRP)
> +		return -EOPNOTSUPP;
> +
>  	mutex_lock(&chip->lock);
>  	ret =3D fusb302_set_src_current(chip, cc_src_current[cc]);
>  	if (ret < 0) {
> @@ -1094,7 +1098,7 @@ static void init_tcpc_dev(struct tcpc_dev
> *fusb302_tcpc_dev)
>  	fusb302_tcpc_dev->set_vbus =3D tcpm_set_vbus;
>  	fusb302_tcpc_dev->set_pd_rx =3D tcpm_set_pd_rx;
>  	fusb302_tcpc_dev->set_roles =3D tcpm_set_roles;
> -	fusb302_tcpc_dev->start_drp_toggling =3D tcpm_start_drp_toggling;
> +	fusb302_tcpc_dev->start_toggling =3D tcpm_start_toggling;
>  	fusb302_tcpc_dev->pd_transmit =3D tcpm_pd_transmit;
>  }
>=20
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpc=
i.c
> index ac6b418b15f1..c1f7073a56de 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -100,13 +100,17 @@ static int tcpci_set_cc(struct tcpc_dev *tcpc, enum
> typec_cc_status cc)
>  	return 0;
>  }
>=20
> -static int tcpci_start_drp_toggling(struct tcpc_dev *tcpc,
> -				    enum typec_cc_status cc)
> +static int tcpci_start_toggling(struct tcpc_dev *tcpc,
> +				enum typec_port_type port_type,
> +				enum typec_cc_status cc)
>  {
>  	int ret;
>  	struct tcpci *tcpci =3D tcpc_to_tcpci(tcpc);
>  	unsigned int reg =3D TCPC_ROLE_CTRL_DRP;
>=20
> +	if (port_type !=3D TYPEC_PORT_DRP)
> +		return -EOPNOTSUPP;
> +
>  	/* Handle vendor drp toggling */
>  	if (tcpci->data->start_drp_toggling) {
>  		ret =3D tcpci->data->start_drp_toggling(tcpci, tcpci->data, cc);
> @@ -511,7 +515,7 @@ struct tcpci *tcpci_register_port(struct device *dev,=
 struct
> tcpci_data *data)
>  	tcpci->tcpc.get_cc =3D tcpci_get_cc;
>  	tcpci->tcpc.set_polarity =3D tcpci_set_polarity;
>  	tcpci->tcpc.set_vconn =3D tcpci_set_vconn;
> -	tcpci->tcpc.start_drp_toggling =3D tcpci_start_drp_toggling;
> +	tcpci->tcpc.start_toggling =3D tcpci_start_toggling;
>=20
>  	tcpci->tcpc.set_pd_rx =3D tcpci_set_pd_rx;
>  	tcpci->tcpc.set_roles =3D tcpci_set_roles;
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.=
c
> index a2233d72ae7c..fba32d84e578 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -31,7 +31,7 @@
>=20
>  #define FOREACH_STATE(S)			\
>  	S(INVALID_STATE),			\
> -	S(DRP_TOGGLING),			\
> +	S(TOGGLING),			\
>  	S(SRC_UNATTACHED),			\
>  	S(SRC_ATTACH_WAIT),			\
>  	S(SRC_ATTACHED),			\
> @@ -472,7 +472,7 @@ static void tcpm_log(struct tcpm_port *port, const ch=
ar
> *fmt, ...)
>  	/* Do not log while disconnected and unattached */
>  	if (tcpm_port_is_disconnected(port) &&
>  	    (port->state =3D=3D SRC_UNATTACHED || port->state =3D=3D
> SNK_UNATTACHED ||
> -	     port->state =3D=3D DRP_TOGGLING))
> +	     port->state =3D=3D TOGGLING))
>  		return;
>=20
>  	va_start(args, fmt);
> @@ -2540,20 +2540,16 @@ static int tcpm_set_charge(struct tcpm_port *port=
,
> bool charge)
>  	return 0;
>  }
>=20
> -static bool tcpm_start_drp_toggling(struct tcpm_port *port,
> -				    enum typec_cc_status cc)
> +static bool tcpm_start_toggling(struct tcpm_port *port, enum typec_cc_st=
atus
> cc)
>  {
>  	int ret;
>=20
> -	if (port->tcpc->start_drp_toggling &&
> -	    port->port_type =3D=3D TYPEC_PORT_DRP) {
> -		tcpm_log_force(port, "Start DRP toggling");
> -		ret =3D port->tcpc->start_drp_toggling(port->tcpc, cc);
> -		if (!ret)
> -			return true;
> -	}
> +	if (!port->tcpc->start_toggling)
> +		return false;
>=20
> -	return false;
> +	tcpm_log_force(port, "Start toggling");
> +	ret =3D port->tcpc->start_toggling(port->tcpc, port->port_type, cc);
> +	return ret =3D=3D 0;
>  }
>=20
>  static void tcpm_set_cc(struct tcpm_port *port, enum typec_cc_status cc)
> @@ -2847,15 +2843,15 @@ static void run_state_machine(struct tcpm_port
> *port)
>=20
>  	port->enter_state =3D port->state;
>  	switch (port->state) {
> -	case DRP_TOGGLING:
> +	case TOGGLING:
>  		break;
>  	/* SRC states */
>  	case SRC_UNATTACHED:
>  		if (!port->non_pd_role_swap)
>  			tcpm_swap_complete(port, -ENOTCONN);
>  		tcpm_src_detach(port);
> -		if (tcpm_start_drp_toggling(port, tcpm_rp_cc(port))) {
> -			tcpm_set_state(port, DRP_TOGGLING, 0);
> +		if (tcpm_start_toggling(port, tcpm_rp_cc(port))) {
> +			tcpm_set_state(port, TOGGLING, 0);
>  			break;
>  		}
>  		tcpm_set_cc(port, tcpm_rp_cc(port));
> @@ -3053,8 +3049,8 @@ static void run_state_machine(struct tcpm_port *por=
t)
>  			tcpm_swap_complete(port, -ENOTCONN);
>  		tcpm_pps_complete(port, -ENOTCONN);
>  		tcpm_snk_detach(port);
> -		if (tcpm_start_drp_toggling(port, TYPEC_CC_RD)) {
> -			tcpm_set_state(port, DRP_TOGGLING, 0);
> +		if (tcpm_start_toggling(port, TYPEC_CC_RD)) {
> +			tcpm_set_state(port, TOGGLING, 0);
>  			break;
>  		}
>  		tcpm_set_cc(port, TYPEC_CC_RD);
> @@ -3621,7 +3617,7 @@ static void _tcpm_cc_change(struct tcpm_port *port,
> enum typec_cc_status cc1,
>  						       : "connected");
>=20
>  	switch (port->state) {
> -	case DRP_TOGGLING:
> +	case TOGGLING:
>  		if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) ||
>  		    tcpm_port_is_source(port))
>  			tcpm_set_state(port, SRC_ATTACH_WAIT, 0);
> diff --git a/drivers/usb/typec/tcpm/wcove.c b/drivers/usb/typec/tcpm/wcov=
e.c
> index 6770afd40765..f1f8f45e2f3d 100644
> --- a/drivers/usb/typec/tcpm/wcove.c
> +++ b/drivers/usb/typec/tcpm/wcove.c
> @@ -416,12 +416,16 @@ static int wcove_pd_transmit(struct tcpc_dev *tcpc,
>  	return regmap_write(wcove->regmap, USBC_TXCMD, cmd |
> USBC_TXCMD_START);
>  }
>=20
> -static int wcove_start_drp_toggling(struct tcpc_dev *tcpc,
> -				    enum typec_cc_status cc)
> +static int wcove_start_toggling(struct tcpc_dev *tcpc,
> +				enum typec_port_type port_type,
> +				enum typec_cc_status cc)
>  {
>  	struct wcove_typec *wcove =3D tcpc_to_wcove(tcpc);
>  	unsigned int usbc_ctrl;
>=20
> +	if (port_type !=3D TYPEC_PORT_DRP)
> +		return -EOPNOTSUPP;
> +
>  	usbc_ctrl =3D USBC_CONTROL1_MODE_DRP |
> USBC_CONTROL1_DRPTOGGLE_RANDOM;
>=20
>  	switch (cc) {
> @@ -642,7 +646,7 @@ static int wcove_typec_probe(struct platform_device
> *pdev)
>  	wcove->tcpc.set_polarity =3D wcove_set_polarity;
>  	wcove->tcpc.set_vconn =3D wcove_set_vconn;
>  	wcove->tcpc.set_current_limit =3D wcove_set_current_limit;
> -	wcove->tcpc.start_drp_toggling =3D wcove_start_drp_toggling;
> +	wcove->tcpc.start_toggling =3D wcove_start_toggling;
>=20
>  	wcove->tcpc.set_pd_rx =3D wcove_set_pd_rx;
>  	wcove->tcpc.set_roles =3D wcove_set_roles;
> diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
> index 0c532ca3f079..36a15dcadc53 100644
> --- a/include/linux/usb/tcpm.h
> +++ b/include/linux/usb/tcpm.h
> @@ -121,10 +121,10 @@ struct tcpc_config {
>   *		with partner.
>   * @set_pd_rx:	Called to enable or disable reception of PD messages
>   * @set_roles:	Called to set power and data roles
> - * @start_drp_toggling:
> - *		Optional; if supported by hardware, called to start DRP
> - *		toggling. DRP toggling is stopped automatically if
> - *		a connection is established.
> + * @start_toggling:
> + *		Optional; if supported by hardware, called to start dual-role
> + *		toggling or single-role connection detection. Toggling stops
> + *		automatically if a connection is established.
>   * @try_role:	Optional; called to set a preferred role
>   * @pd_transmit:Called to transmit PD message
>   * @mux:	Pointer to multiplexer data
> @@ -147,8 +147,9 @@ struct tcpc_dev {
>  	int (*set_pd_rx)(struct tcpc_dev *dev, bool on);
>  	int (*set_roles)(struct tcpc_dev *dev, bool attached,
>  			 enum typec_role role, enum typec_data_role data);
> -	int (*start_drp_toggling)(struct tcpc_dev *dev,
> -				  enum typec_cc_status cc);
> +	int (*start_toggling)(struct tcpc_dev *dev,
> +			      enum typec_port_type port_type,
> +			      enum typec_cc_status cc);
>  	int (*try_role)(struct tcpc_dev *dev, int role);
>  	int (*pd_transmit)(struct tcpc_dev *dev, enum tcpm_transmit_type
> type,
>  			   const struct pd_message *msg);
> --
> 2.21.0

