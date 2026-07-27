Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012013.outbound.protection.outlook.com [40.107.75.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585173BFE4C;
	Mon, 27 Jul 2026 10:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785148099; cv=fail; b=hqRKhO8cM7f3dvsK/pduTgRGP86cqkZ2qj0bg4Kp31d5A8DVhrJSCqjCb6qY9H1Xwv6+jU26yj89OT3+uM++y7ggFgI2uNbn1k2ZxuxVi5VehKNy3C1xTFxyCj7N5WNeR6ecBPTVqTBk8rmHP6jNVljb3pB6h0FMpzzMD6hvuLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785148099; c=relaxed/simple;
	bh=ZgxcTwELdHvT3sGbpkhvzW4YoGpx8E9fHA3BGyohqLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=npw/EcsMcuAHFV8FzS5kmlUDfQHIUtguXPpyzRHRJ61E6oSga3DpiIzD4gOVFckKK3ayA0oLfk1EtjUBImFc24oITnFyif7VtApFGtC4xUhfLO1t62vTGvU1g9ZYQBcG6rhnXuAgX5BkKKgHHqNdeXW2cc9ri09qIJsh+TA8m2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=WjONtAGu; arc=fail smtp.client-ip=40.107.75.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="WjONtAGu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFtH8fWscntwCWdPQW9npwjqeGEiIVLnx1WLEh4cJVK/oDqN9Dqp2EZEHoLIC8Y3tX8zKnMWo+XrmFwzj2oWDdV7wemzRpfjsECzxoHQXlCAEUt+e0z75795uqEev0E09C09ID3v3Ljj4bSsI24mGfhPuKIm9uJ6RIweokfMe/ATk2n3uQIBzkYKI30xsaqMnHhkGAA5wwBQo+6P+p14M1KNsWnvyFKoqeBET26r0RXYwaJebOQzl91ZH06oLGVTr+u10b44QAU4hPNxFLwVQqqABvHvmALl1PJuvue89M/jo7giKfYuB7O99B+PQexjHaH6OXjGREn3Bn05Hq1HlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WrVc2lPhqzHT/ISbF+b+BGAT+g3XpQtb0LQ+Yv5cDP4=;
 b=sBJm5MdkrH9sx3CfYb660vnyEMQqiwE0cGy+oYUwkNzbOALT8xFV5DJk9RSvqRTB+8NEqg9lC6Chs03yB3ND5sOHzjng/PI2NacEg662ZKSYqTy1B01nnEA9deGJzPkd8tN4mWe4GZvjfpAImd831XKBHOABvD2c0Wecmiodxd0Qh5i6zdmLOJoXtmAadvVDqNLT89iILoT10LqotxW32PwsoyO0CebAEObFdzN1QXmrc3cBpZaCDtCOtSB07uL8e3BZAdBrzjnGkY0s+Lxdj8xAyRHkdhztBTPultZMPfPtINGwL1XDNxOycnaGifF9mO75IAUeAxThLE/44OCBUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WrVc2lPhqzHT/ISbF+b+BGAT+g3XpQtb0LQ+Yv5cDP4=;
 b=WjONtAGuBY6hH0jfAxZvZi+b1NAnV+PM9vCb8vFDYYXOZaVlqWxopgCswlyjRbQMmtWwh3mbrZf4OhQn8yG7Rclj2waI3rGprupV3tVt3T8a/k71/3w0y1HwjMO09oH1cO3xyTVd6rvRmAW7ytt4Y2ttf9DeyI7+RufZ4Km49bI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by TY2PPF92D7F20FA.apcprd01.prod.exchangelabs.com
 (2603:1096:408::3b7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Mon, 27 Jul
 2026 10:28:08 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 10:28:07 +0000
Date: Mon, 27 Jul 2026 18:27:58 +0800
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	FangpingFP.Cheng@moxa.com, Epson.Chiang@moxa.com
Subject: Re: [PATCH v2 2/4] USB: serial: mxuport: add MUX50U-based device
 support
Message-ID: <amcyri8fi8YPrEW4@moxa-ThinkCentre-M90t>
References: <20260623080138.166398-2-crescentcy.hsieh@moxa.com>
 <20260623080138.166398-4-crescentcy.hsieh@moxa.com>
 <al-JOStaDglCBoL1@hovoldconsulting.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al-JOStaDglCBoL1@hovoldconsulting.com>
X-ClientProxiedBy: TP0P295CA0004.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::14) To PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR01MB5405:EE_|TY2PPF92D7F20FA:EE_
X-MS-Office365-Filtering-Correlation-Id: 52828630-2567-4eb6-e035-08deebc9bf9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|56012099006|4143699003|10067099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	XitZT/D4jQzs6Q/j5B0cSyWAWIh2CT8ud83ihWJMHhhGAWQhY27nzUwGlX9nHMWu4wkeu0CA5jT9i8Nl3+ZQSybgwiW1oZuOpeK/AASbK9CNMKCJfOZ8/hFGImoTk5BLFSgBp9R7D1vPonHvbNovbJ3oVzRAPD5Yt2sWoUP0G3CFCbxSSRYypQOv70U4DdmUAJhh4nCa+VqQ//rDgjh/gURvo68XxAuMLvgOdft6Y8Ln2k7KhBtauObL48vKNWZUJpvXozLvUk6PiV1cFl4o/scN4jjDPpUwz9REnQuXr4Anu+Z7gs4N2yQU0VrpWeR21hny4zXAocX8TOhxd2yUKDVyVrTi6LI/W+63TlhsBTKxQAqkrifpSerc84Wzjm1ZFheYLwajvW5+RumaRIWC71FFsB2UN6SmpPH27cX59mmmTnnX2JWrI7n+v6lZ4zfoAIkfPwfuor0nMkGi0awNPoNedMiXc6yEKrIyxAG9zqb9ZJOAKGyEK2Eiw2NI43HIrfi432u39myvH5ubwW++JLQFh2AdpwyI3c6kFilXI9skgtjc72eaOEYCwqM9j0HtDN/RpfcqyUl6iIAiNT3yObCSRbmXV8KjG2lgIZ5q/9EiKhDr9yB8nAI2dnfUIs5iI/ej92CdUs8VIsVq9T8KVdswcKXmvv66fo9rrrQJFPI24DCtqMah7gRoUqmB0L55fZ7DzIO5BjFh2swiuzcY5K1IBYN++OPo/IHTJ8vEAu4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y9kU8A20nTsqfYKgK2CndkV0o0aLDzZAQoeMyTLxWgyqGo8mthNVrEdNoTAm?=
 =?us-ascii?Q?Oykpsu/1zJmKo3bS/vIR+xBuadchqjz/ii6Xg2jJNEJAcPfakJ8gORnqzMzJ?=
 =?us-ascii?Q?QqfFYj3qRNnyR0N/L8Py4pY2RhFygH7Q/GP2akpmxJpWm7cyo2FGfkLjxpD9?=
 =?us-ascii?Q?1qU9BTawJ8Tln5c7F4Ip0BXNBuOrnQ5ZPmR2O0nLc3N8INFqHhLQhU0hAS8r?=
 =?us-ascii?Q?3WoNtTbIXzKG5QZH9oGKlX5EEXZStIo0QMtt62AOi0c6LpPp6kgcnG8Y3plk?=
 =?us-ascii?Q?rZdXyr67aRFMS5KCrzXLCBYqDZ9tg0xiKYCCqzE77W/m2FdprMUypTcp7YrS?=
 =?us-ascii?Q?/esvAAj8zWfzjdk0x9HhrynQzO47s/kLR+Ymfu94R2upkXhUiNc2HHBjFBmj?=
 =?us-ascii?Q?0PwpSCeemqzNpa+2dGfOMlnQs/R5ph0f40rNhbWhNfQkc3BGhyvsnhPC0bNu?=
 =?us-ascii?Q?hceRQcdO2KqySIOMyOF+HlRAr+EA7qcmF/5sUfrJooYZqqiZgLZqv/9CLs70?=
 =?us-ascii?Q?TqBIKFN9ZecwBbCytJ4wsbaMFrYosbSRRHt3xEuGDt3y6dmiojy/XgidcLrR?=
 =?us-ascii?Q?6BHD7eL3J8MlLn1wukT2015IGnB932exSd2y/XYTNqdXfUnSYBmLnHCPcuv7?=
 =?us-ascii?Q?et5EDw/+C0CJa2M6dur3bJS0Ss+s89gKAj6BftcNySTmKr3hr2GFQy0RvueY?=
 =?us-ascii?Q?aOIo1sETcQi+Db36fLm+oU1bzIgjUSDifxUW22t4rk489kHCnyLX23XTneeV?=
 =?us-ascii?Q?1qfle2NEDeZXEWC9ffHTV5PKtfzq76Dpt0+AK84KwXfvR5m786hGhKRFVDH1?=
 =?us-ascii?Q?z4nx49N/FBhVxKI0XJojFs2UawIasQtvt80ebY4+pF+GDOppBKvCuk+ikkfb?=
 =?us-ascii?Q?zymwo8vMW4ebieMR9dsQWXtamVrb3Dnvt8iqblXzwYCzy/k+bwKtFj568Hnl?=
 =?us-ascii?Q?56L4eIGWoeMcD0h+PeZU9lLixS0ZcW51ykM2Y9TmWDthpOM2cDuv1xLYVP81?=
 =?us-ascii?Q?rs7GpcMqNC1wsw63JxXF88+4XShMSarSZoqxRbUD0Gn+tfeHPqHHiJ5yt+2x?=
 =?us-ascii?Q?CaMKHlT/OORHnWWW8iOTZpp9mO70on/wH4vdi2lU6UqvSGyZ5srPQUA/VLlf?=
 =?us-ascii?Q?4x3j2IbJTjS7MtZDFReeD3xOIsxuiMYqNx5cLJ2A4pRNotOa3Ggw1RDLd24e?=
 =?us-ascii?Q?+MngjcVY/4FuYF6QpblenunBx+JbuGxC8WPxolcDKF5ZNlkZUMRe7/ecjW4a?=
 =?us-ascii?Q?TqEVdztJnE5Jd+ZR2AecIaYb7Kvif6YHSOOPZtbY4/W1EgLrtzm+PZC6q/XK?=
 =?us-ascii?Q?wbZ65+VWtFQIZMPxso4lHGSlvwVdRXPKLDm8qSpj5HKz9fs6yL7kPhDlDMM8?=
 =?us-ascii?Q?AkP4RX2KN1WDEd1kgk3J4HY8FiliWOyU8aqhEVYBNfjwdy7+TJx+h7hS39X9?=
 =?us-ascii?Q?btIEP1mNR9VdpdR1kpT4zBhoepZ7mX/Xbdr7bD+fEiBsV6YB8PkrV9pT1Jf3?=
 =?us-ascii?Q?MTNNY/+RoQp4NKYfzi0m+wU6ijn9Zemt+cT3u+Rl4oMgMvgZ4bW9Srv/zxL5?=
 =?us-ascii?Q?D6hCwy852Yl7SXNfQU3Fv+0jZodPmocyUnBZdHQ+Lau7cWhQyjuBT5+NYBd6?=
 =?us-ascii?Q?/jcd8QWNyv6OEr/tMDLE/VlzvN7kXzv5e6SmnNkjFL2DBNHn22pQcSboUFNw?=
 =?us-ascii?Q?yw1xifbDuYS6K3zhbThI9dc+gSfMKRje0K/gjboORaA7+vBru6++32O2+kf0?=
 =?us-ascii?Q?qOAblAX9QjrO19Lup7YnN16iP1Mh6Nw=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52828630-2567-4eb6-e035-08deebc9bf9e
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 10:28:07.6657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C3WQG7IIcW/GofWX7WbD4gbL5s7DYUYdcc9FTRYHzrQ/NOO9A0jMHLF6XUOYk7jSdlBB/frBmBC1HutdV0VFsGiDsyJ1OnKTlrxEnhEW6Qs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF92D7F20FA

On Tue, Jul 21, 2026 at 04:59:05PM +0200, Johan Hovold wrote:
> On Tue, Jun 23, 2026 at 04:01:37PM +0800, Crescent Hsieh wrote:
> > @@ -7,8 +7,11 @@
> >   *
> >   *	Supports the following Moxa USB to serial converters:
> >   *	 2 ports : UPort 1250, UPort 1250I
> > + *		   UPort 1250 G2, UPort 1250I G2
> >   *	 4 ports : UPort 1410, UPort 1450, UPort 1450I
> > + *		   UPort 1410 G2, UPort 1450 G2, UPort 1450I G2
> >   *	 8 ports : UPort 1610-8, UPort 1650-8
> > + *		   UPort 1610-8 G2, UPort 1650-8 G2
> >   *	16 ports : UPort 1610-16, UPort 1650-16
> 
> Should you add the MUx50U ones here as well for completeness? At least
> some of them seem to be missing.
> 
> But perhaps it's just me not getting how these PIDs map to products.
>
> >  */
> > 
> > @@ -37,6 +40,24 @@
> >  #define MX_UPORT1613_PID	0x1613
> >  #define MX_UPORT1653_PID	0x1653
> >  
> > +#define MX_UPORT1252_PID	0x1252
> > +#define MX_UPORT1253_PID	0x1253
> > +#define MX_UPORT1411_PID	0x1411
> > +#define MX_UPORT1452_PID	0x1452
> > +#define MX_UPORT1453_PID	0x1453
> > +#define MX_UPORT1619_PID	0x1619
> > +#define MX_UPORT1659_PID	0x1659
> > +#define MX_UPORT165A_PID	0x165a
> > +#define MX_UPORT165B_PID	0x165b
> 
> I realise this is how the existing PID defines are named, but would it
> not be possible to name the defines after the products they are used
> for?

Okay. I will complete the supported-device list and rename the PID
definitions after their corresponding product names in v3.

> >  /* Table of devices that work with this driver */
> >  static const struct usb_device_id mxuport_idtable[] = {
> >  	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1250_PID),
> > -	  .driver_info = MX_PORTS(2) },
> > +	  .driver_info = MX_DEVICE_INFO(2, MX_FW_UPORT_G1) },
> >  	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1251_PID),
> > -	  .driver_info = MX_PORTS(2) },
> > +	  .driver_info = MX_DEVICE_INFO(2, MX_FW_UPORT_G1) },
> >  	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1410_PID),
> > -	  .driver_info = MX_PORTS(4) },
> > +	  .driver_info = MX_DEVICE_INFO(4, MX_FW_UPORT_G1) },
> >  	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1450_PID),
> > -	  .driver_info = MX_PORTS(4) },
> > +	  .driver_info = MX_DEVICE_INFO(4, MX_FW_UPORT_G1) },
> >  	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1451_PID),
> > -	  .driver_info = MX_PORTS(4) },
> > +	  .driver_info = MX_DEVICE_INFO(4, MX_FW_UPORT_G1) },
> >  	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1618_PID),
> > -	  .driver_info = MX_PORTS(8) },
> > +	  .driver_info = MX_DEVICE_INFO(8, MX_FW_UPORT_G1) },
> >  	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1658_PID),
> > -	  .driver_info = MX_PORTS(8) },
> > +	  .driver_info = MX_DEVICE_INFO(8, MX_FW_UPORT_G1) },
> >  	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1613_PID),
> > -	  .driver_info = MX_PORTS(16) },
> > +	  .driver_info = MX_DEVICE_INFO(16, MX_FW_UPORT_G1) },
> >  	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1653_PID),
> > -	  .driver_info = MX_PORTS(16) },
> 
> My initial reaction was that it would be better to just leave the gen1
> entries alone (with family implicitly set to MX_FW_UPORT_G1), but I
> guess this is fine too.
> 
> > +	  .driver_info = MX_DEVICE_INFO(16, MX_FW_UPORT_G1) },
> > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1252_PID),
> > +	  .driver_info = MX_DEVICE_INFO(2, MX_FW_UPORT_G2) },
> > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1253_PID),
> > +	  .driver_info = MX_DEVICE_INFO(2, MX_FW_UPORT_G2) },
> > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1411_PID),
> > +	  .driver_info = MX_DEVICE_INFO(4, MX_FW_UPORT_G2) },
> > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1452_PID),
> > +	  .driver_info = MX_DEVICE_INFO(4, MX_FW_UPORT_G2) },
> > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1453_PID),
> > +	  .driver_info = MX_DEVICE_INFO(4, MX_FW_UPORT_G2) },
> > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1619_PID),
> > +	  .driver_info = MX_DEVICE_INFO(8, MX_FW_UPORT_G2) },
> > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1659_PID),
> > +	  .driver_info = MX_DEVICE_INFO(8, MX_FW_UPORT_G2) },
> > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT165A_PID),
> > +	  .driver_info = MX_DEVICE_INFO(8, MX_FW_UPORT_G2) },
> > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT165B_PID),
> > +	  .driver_info = MX_DEVICE_INFO(8, MX_FW_UPORT_G2) },
> > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MU250U_PID),
> > +	  .driver_info = MX_DEVICE_INFO(2, MX_FW_PLATFORM_UART) },
> > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MU450U_PID),
> > +	  .driver_info = MX_DEVICE_INFO(4, MX_FW_PLATFORM_UART) },
> > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MU850U_PID),
> > +	  .driver_info = MX_DEVICE_INFO(8, MX_FW_PLATFORM_UART) },
> > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MU850U_6PORT_PID),
> > +	  .driver_info = MX_DEVICE_INFO(6, MX_FW_PLATFORM_UART) },
> > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MUX50U_3PORT_PID),
> > +	  .driver_info = MX_DEVICE_INFO(3, MX_FW_PLATFORM_UART) },
> > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MU850U_5PORT_PID),
> > +	  .driver_info = MX_DEVICE_INFO(5, MX_FW_PLATFORM_UART) },
> > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MU850U_7PORT_PID),
> > +	  .driver_info = MX_DEVICE_INFO(7, MX_FW_PLATFORM_UART) },
> >  	{}			/* Terminating entry */
> >  };
> 
> Perhaps the family defines can be shortened to make this a bit more
> readable, for example:
> 
> 	MX_FW_UP_G1
> 	MX_FW_UP_G2
> 	MX_FW_PF
> 
> or even
> 
> 	MX_UP_G1
> 	MX_UP_G2
> 	MX_PF
> 
> I didn't try and see what the result looks like. Perhaps the more
> verbose names are preferred.

I used the verbose names to keep the firmware-family naming explicit,
but I agree that readability is important as well.

Listing each device-table entry on a single line would make the table
easier to read, but doing so directly would result in overly long lines.
Another option would be to introduce a small helper macro:

#define MX_DEVICE(pid, ports, fw)			\
	{ USB_DEVICE(MX_USBSERIAL_VID, pid),		\
	  .driver_info = MX_DEVICE_INFO(ports, fw) }

The ID table could then be written as:

MX_DEVICE(MX_UPORT1250_PID,  2, MX_FW_UPORT_G1),
MX_DEVICE(MX_UPORT1250I_PID, 2, MX_FW_UPORT_G1),
...
MX_DEVICE(MX_UPORT1250_G2_PID,   2, MX_FW_UPORT_G2),
MX_DEVICE(MX_UPORT12150I_G2_PID, 2, MX_FW_UPORT_G2),
...
MX_DEVICE(MX_MU850U,           8, MX_FW_PLATFORM_UART),
MX_DEVICE(MX_MUX50U_6PORT_PID, 6, MX_FW_PLATFORM_UART),

This would allow the firmware-family names to remain explicit while
keeping each device entry on a single line.

---
Sincerely,
Crescent Hsieh
