Received: from CP4P284CU005.outbound.protection.outlook.com (mail-brazilsouthazon11021084.outbound.protection.outlook.com [40.107.202.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006F421ABB1;
	Fri, 17 Jul 2026 11:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.202.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784287765; cv=fail; b=QklRXYt9877nc0A1TtzJR2YZ263JqU5RJKz+fCQ6R9USE3UCuK1V/JmZoXbm+YY6cKa5UDQR+ZvsBXaF+4F7GgaPitrr0tEAYSUPYsNPgv/oJd95KaWB2STGV5qwpYplOA/nl7NPt16s/5LS6KV4lZhGKxbJhI2z0GtCg688Txg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784287765; c=relaxed/simple;
	bh=t/RPT4ncG49HD5a4pK/5X79D/jb9x0BkSY5mRK+FulI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MLC0ywd+y07Rcc6FuBqCT+c2fxfHXtkQiRpAQBGyIfAgAfl0GC+J5P0aQjPTl3mJ2+328Y/dib4snu25QHNe+vUAMTBjib9fGqizux5TdWmYJGShHLHqTp+fzV7zKm8iAgI4tbwlyVo09XiwyQw4r7FhfEMWEC/RkdFDYdavR9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lumal21.com.br; spf=pass smtp.mailfrom=lumal21.com.br; dkim=pass (2048-bit key) header.d=lumal21.com.br header.i=@lumal21.com.br header.b=PU8nZ0Yh; arc=fail smtp.client-ip=40.107.202.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lumal21.com.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lumal21.com.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lumal21.com.br header.i=@lumal21.com.br header.b="PU8nZ0Yh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yQiZIz/oSncYRGOyNOF7LdUwyjTYuNqStElzCbgK+jqHipDp41uyQ6jORBOsO615pN7xZ+0uuJFdNpTC9MxRupKJoWwMqyVdU9HE+oAXKozOd7LB5DfUT1dzA0SXeHcPwSgfAm9xgvQ/kAyr/i1KtiNxz0M8msQXNVvrD5laCLKIZ9TOaYLRTZku6UUyW4ylhCsD+HWdmKWTmcSCGJhDWy1Ue8EMqgZSJyQSGL6YSItm2dIoa4JnQ/lEtAY8AeCY2u//iKkthsmM/3nrtZq7O/9whHARMxrRzvMn71LPvsd1mkvwW0hRTxIzsq0xYyAC1D2mq+gDoQDJejNGpUf70w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/RPT4ncG49HD5a4pK/5X79D/jb9x0BkSY5mRK+FulI=;
 b=DDsFBLi/SMyqW6HhY6J54naUbcQQaEnOmcRF3srdMVG0kYiDva6oNw7N7NinYnQ+IDozXUmWyJBgMz3pxaJ8KPIKCf+VxIqF+9hv8iTHhu9kAcaWHA+rb0TcQB/+xK2o6SLOIT0DKPuE0N0KpMpe31y+WiHgiMJ1Tm5N76OvhrPl4k1WxqlU/1llpIQ1DGe64RZlco0/OEGOwvLHEaQ6tb/aJ+l9rZVuxBp3FuY1WLt44GEJvDut0jkMw3cVndo+lDLpwyFfkrJz9IBP+iwdz8pqkOCDppAF8KVU/sVn0p06EX1Zws4IpMG1zdmm4jgr/pQn+amLfQEu5vA769s0RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lumal21.com.br; dmarc=pass action=none
 header.from=lumal21.com.br; dkim=pass header.d=lumal21.com.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lumal21.com.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/RPT4ncG49HD5a4pK/5X79D/jb9x0BkSY5mRK+FulI=;
 b=PU8nZ0YhhPfoipq4I8v3uX5dOGTtxftitKBOtJY39POpPJoESZucqmtQAL5QjjUtqB8hyxtgD7cZs5Ywqb7Qgh4enTY+ILWieE3aRHQjmA30hF7gHsTpkQYMNnjiVJjlaPea86kwWoa46ugoS9bhhZZog2eKn2VGydv20wgEojMxWc8kCIFhV6/H837yEJXRKgTw33+QeyBFJ/RkYS+/1Ot18BRNTf7kh+OBwCmMHSkbScWDMuAXz8WXKWyBFyhVY0oDMn1RYXG+dv+ZVpoAhrQPBt22ctVpO0JWkbKjVFik9pcZzwUz7UlbB2ymdhHnllzITA/NogZbcI1wshnHUQ==
Received: from CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:2aa::9)
 by CP9P284MB4182.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:39c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 11:29:19 +0000
Received: from CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM
 ([fe80::7b77:a104:ca62:b600]) by CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM
 ([fe80::7b77:a104:ca62:b600%6]) with mapi id 15.21.0223.012; Fri, 17 Jul 2026
 11:29:19 +0000
From: Lucas Martins Alves <lucas.alves@lumal21.com.br>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "b-liu@ti.com" <b-liu@ti.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4] usb: musb: dsps: implement vbus_status and set_vbus
 platform ops
Thread-Topic: [PATCH v4] usb: musb: dsps: implement vbus_status and set_vbus
 platform ops
Thread-Index: AQHdFUVcqZIYQ+C0l0SydeDFTweaiLZxdl0AgAAbJL0=
Date: Fri, 17 Jul 2026 11:29:18 +0000
Message-ID:
 <CP4P284MB240219EAA6C229C52EE72735DAC62@CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM>
References: <20260716142516.510574-1-lucas.alves@lumal21.com.br>
 <20260716170551.566933-1-lucas.alves@lumal21.com.br>
 <2026071708-tamale-regroup-2a9a@gregkh>
In-Reply-To: <2026071708-tamale-regroup-2a9a@gregkh>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lumal21.com.br;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CP4P284MB2402:EE_|CP9P284MB4182:EE_
x-ms-office365-filtering-correlation-id: f3bf0a8e-1632-4652-e25d-08dee3f6a43f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|4143699003|38070700021|10067099003|56012099006|11063799006|6133799003;
x-microsoft-antispam-message-info:
 g7jeCsk6XXauCAOgRhRkqkpAMPfDoSwFgdOK42jedK0ACPkLIbsTCBlQ+/arGALot1QIMAD06awcsNf5xSY6/jxf2/pmjcwmif1tfCD8qOs1ioYRME0u5hb34QN68LMCYBbXwLTnY2xWEX0400L6djKSSFsj38THUwQgXNOupUKsx6NtQylCkSjjYzCsJ5kwgjPLLzi80nOpMFmoPPpWF7Z/EYzUvYbmJRbTHIPdxSB5TmCrZrzpQaH79sQNWTe+F1toLlTIaSjJSnzoy/gxySQQIY7UU1GbURglo5AEDexKdH92iCeVwvIHbccpnYWJu3Yr3m71bT8mhxgK7AnAk4ulXYXDFU/e7bC4NhPFIrefOMvHHOwvKD5XxiJ/At565q0FbFci+IAo+y+d3Ler8f/8Dbf3vjooWHN/3BW7I7+4UEF3wnZYJzsidjl/e8ObVVpn2Q57Dhs2yCum/FIz0K09JPVQQbC3S9bhXnnbnoS5ot7DZlfRXaC6EHuGNYuhhrkRJxU7rsXNFSg3yz/0ykW+XnZD3D3dCOOzxlf+pG5B0YQR9Ess11LEkDXO48811LU6c/FzoNqSX4Kl63FX09Y1umJXmeqdGxawGSp3LSfAkP8uw5oSuduK71impE4zbLyAUCGelMzb95MuxiupvSdH3Rfjdkh6JEgg+BRLzqF0Te0FAvLB8oIxXwimBkwb51jtqsWgMwd/MG1gtHQ+DMsVPLAbqQcaIchEgZ+6ZNQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(4143699003)(38070700021)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?tyEcCnAJu7Wwz3CnZWKbBfxTYhZ4+yzz9xkr5r7BhGfs9rdmCNJqXRtru8?=
 =?iso-8859-1?Q?LlGr5FOXmEvVRI95okrbtc9dDyEkOpuduZLUfjSmZQ+27aBoCJgU3lsQDw?=
 =?iso-8859-1?Q?iGZ+3nE/akWjqjTdmtXrL8DY4WYfj91FEg2wu/geu9ZMyjC7u+3wzpq3Lb?=
 =?iso-8859-1?Q?xjBaAieASxVC+/U2Z61IwYeV65LMLSSNdyMJ95ezo3gMO34SITjzoLs7w9?=
 =?iso-8859-1?Q?btrqaTQNtFA9bhlOeK1bIjWxDxlf5cKz7207gtTAOks8EV/JxotEdikEVE?=
 =?iso-8859-1?Q?Z7YMZ6G/5PYclzdl6IZ99UCOOjRmz2xaqbFdY97U5Wln8SW8rGh1n0QtIS?=
 =?iso-8859-1?Q?TK1dr63Nn96DQVu0sBC8qsrdpF6Wgm64L7d4xC0Hp60unQMRHbgsv5lLOT?=
 =?iso-8859-1?Q?leI9+xsJEOPqBpyA8zRnkb/4I9Tum4ebzS/xH8LfHZXHhfNvE4rYiDNa2O?=
 =?iso-8859-1?Q?QTVL7/K5cKGYjMi4xUp45Iu24zA5VYCuFzOeZ6EzCs1w8cOY2W1+3EPRQb?=
 =?iso-8859-1?Q?5XYL7cPJBGVAFzZEZotwp1PBZSjg8MdWL9yY7DifLO1lu4aBhUHvZ08Oft?=
 =?iso-8859-1?Q?JnX+87Bl7qXP+kkFj3aEGDX/9UGIUckYxDu/aNmWJpM00x4IQulFp66wVg?=
 =?iso-8859-1?Q?7CXn8P+mubRuvL8nApk2OE4cQEeqF97VWa6YUQPkbMQ9zSKhwCGDMCcAIP?=
 =?iso-8859-1?Q?59/3PIrJZ3A9FOLmcHCoDw+eGQPRv4ic9fS+Eqcm52+pwUAPVnj18A3p1/?=
 =?iso-8859-1?Q?4PvN/2lZiaxncj++lE26v/SMXwpJZZ8fiONXMgGcK80CMwuu1vIQoifXDP?=
 =?iso-8859-1?Q?z86KVqDooaRf2nYsxs1AO+/5KKPlYLQLyKwMITG0Th23QWjvsymzEvbKVa?=
 =?iso-8859-1?Q?MTq3XcCVN3TOKMPSzznZlsqXjHTO532Qb5p1aXBb/4BgWjc1lwRiDn5e+w?=
 =?iso-8859-1?Q?fnJUkYFTGjH6l7dtutbO/sowYpNZH9HISaT/1xw5AkGqLsfI6elz7ZjFgg?=
 =?iso-8859-1?Q?ihPMsK5KDrw0Y8m09fp39nwpyMv3e/ZGbR7QPGyXb1B8qgrBRi02U7YcE/?=
 =?iso-8859-1?Q?BKvm4RVeAAOiWT4F3Dft92MpNf28vMammRBolSWYsV4bvKvVsNACcYopnf?=
 =?iso-8859-1?Q?9ukkwcytgT/ZBbJPrvkwlm/6XPcmY7OyO4NkseKB9N84i3P2OCnSITgry/?=
 =?iso-8859-1?Q?E+veF723Zr6OuF/wY3ShMEs0uWLfF7a0rfF0AQzRD+cqZEXzhnkm2ZnvkF?=
 =?iso-8859-1?Q?Ioo7AHVZ3jIsMToexz/fpAJy3NimKeImLl6vyFQ6WXLYbpHWETP3SDGlxX?=
 =?iso-8859-1?Q?eZuXYIsIn7WdvWjfThwF0xhd8Cq7bbrBPeFZLfBJ87qLYJR0oT+1rUTI1F?=
 =?iso-8859-1?Q?bxng9l4+JEdHRsWfZUbhLrqz9mCQh2dB/zZNwAae0ZdEJYtu5h3+kZjoyu?=
 =?iso-8859-1?Q?0reKWWzdKAZ/bYkqPbu+ZeHjYBVI7CaCA4pTwnIbdRA9nUgC6FyDoMUDB3?=
 =?iso-8859-1?Q?Y4n08UTZsrQhYsC9fhqFzaoVIwkELemrOMOVH0B61MlpqYjSvg2wFEEbT+?=
 =?iso-8859-1?Q?gYrsZNsUlhcqU8RVQOqXA0Y5pnCU/Mj2HgM93CevBieq9DZzPA/U7K+fzv?=
 =?iso-8859-1?Q?H9EA9UHoALjSPcmQWc0vAyfsqU7DWdqanJy0WEfmbU92ic1ytBicpAfP8Y?=
 =?iso-8859-1?Q?jygVVhakc97zOfbrW93TmhWpBktrYKWPsEe1v3Lh8ID74XkMbEJpNANHL2?=
 =?iso-8859-1?Q?+0K2DDXBgAZilEtHB2dpGqSc5Pv5bSl3GBq8SOGqDXTweR49Ph0iUInee5?=
 =?iso-8859-1?Q?jup9Oyop4g=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: lumal21.com.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f3bf0a8e-1632-4652-e25d-08dee3f6a43f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 11:29:19.0015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 99055dd4-6575-473d-944c-c3b1a5a6649e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oqP3mLmSXQ4mA/mM3srcAPa3EnBRBQJum2JQzAy0ikllO3J/C0L9jwYm/u0dFYsjyo61TS6mYgplEG9mMUnJ77TYDEA0xsPHQD/nBOFQC6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP9P284MB4182

Hi,=0A=
I would like to apologize for the confusion regarding the previous patch su=
bmissions.=0A=
I generate and manage patches from an environment with restricted email acc=
ess. As a result, I am unable to use the traditional patch submission tools=
 and workflows, which unfortunately led to several mistakes while sending t=
his patch series.=0A=
To avoid further confusion, I have recreated and resubmitted the patches as=
:=0A=
[PATCH v5] usb: musb: dsps: implement vbus_status and set_vbus platform ops=
=0A=
This version correctly reflects the changes that I intended to submit for r=
eview. Please disregard the earlier submissions and use the v5 patch as the=
 basis for any review comments.=0A=
I apologize for the noise caused by the previous iterations and appreciate =
your patience and feedback.=0A=
Thank you for your time and review.=0A=
Best regards,=0A=
=0A=
Lucas Martins Alves=0A=
=0A=
=0A=
________________________________________=0A=
De: gregkh@linuxfoundation.org <gregkh@linuxfoundation.org>=0A=
Enviado: sexta-feira, 17 de julho de 2026 06:41=0A=
Para: Lucas Martins Alves <lucas.alves@lumal21.com.br>=0A=
Cc: b-liu@ti.com <b-liu@ti.com>; linux-usb@vger.kernel.org <linux-usb@vger.=
kernel.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>=0A=
Assunto: Re: [PATCH v4] usb: musb: dsps: implement vbus_status and set_vbus=
 platform ops=0A=
=A0=0A=
On Thu, Jul 16, 2026 at 05:05:54PM +0000, Lucas Martins Alves wrote:=0A=
> From: Lucas Martins Alves <lucas.alves@lumal21.com.br>=0A=
>=0A=
> The DSPS glue layer (used on TI AM335x SoCs) was missing implementations=
=0A=
> for the vbus_status and set_vbus platform ops defined in struct=0A=
> musb_platform_ops.=0A=
>=0A=
> Add dsps_musb_vbus_status() to report VBUS presence by reading the VBUS=
=0A=
> field of MUSB_DEVCTL, and dsps_musb_set_vbus() to drive the SESSION bit=
=0A=
> on MUSB_DEVCTL, enabling or disabling the USB session.=0A=
>=0A=
> Register both callbacks in dsps_ops to allow the MUSB core to control=0A=
> VBUS on AM335x-based platforms. This enables the USB core to perform a=0A=
> VBUS power cycle as a recovery mechanism when a USB error condition is=0A=
> detected, and also allows userspace to control VBUS state via the=0A=
> standard USB sysfs interface.=0A=
>=0A=
> Signed-off-by: Lucas Martins Alves <lucas.alves@lumal21.com.br>=0A=
> ---=0A=
> v1 -> v2:=0A=
> - remove musb_root_disconnect() from set_vbus path=0A=
> - adjust context->devctl copy/update handling=0A=
>=0A=
> v2 -> v3:=0A=
> - fix patch description text=0A=
> - fix devctl usage in set_vbus path=0A=
> ---=0A=
>=A0 drivers/usb/musb/musb_dsps.c | 32 ++++++++++++++++++++++++++++++++=0A=
>=A0 1 file changed, 32 insertions(+)=0A=
=0A=
I'm confused, what about patch 2?=0A=
=0A=
THis series is all intermixed, can you start a new thread, and send just=0A=
what you want reviewed/accepted here?=A0 I'm lost...=0A=
=0A=
thanks,=0A=
=0A=
gre k-h=
