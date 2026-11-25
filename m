Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795596247;
	b=jrKSv1S/jMLt8l03giUW5jPtUyP4d7TybOxzybrdjK8aQ+oJFQDrTsbG45hK70PPSntJ
	 5xquCmNL3itY8U3pbh0zIPa24Fh6z0Sm23h2U+0vXPo6fX2fjwYB0cFAGCGEsBASDn5OT
	 L71qiCpBjNsLhjRC83I1fMKhOz0ogWfnibiZCuu7pC3pjaHbg3Wj6lOLYlwrfOK36WbRS
	 veu5gre+1GMGvUGZIXGHnhdbmLi5qMmfdBbFaO8xvKEXtViPv2sMV0HF7UbamCWTtWtYv
	 UAA0SuXV4rhGMEruNTPdlZxlv6qm0ugFdw0/y1LQ5zv/Og/9pKI+TOmSYTgQ2+ubCbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596247;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-TrafficTypeDiagnostic:
	 X-MS-PublicTrafficType:client-request-id:request-id:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=6AUI5AE+XZ/zx5sU0PvnDKe1B6rl19cjUkLQDcn8bQw=;
	b=E/TUhQS1N+O5h2vRvSVp1zZBgA5c9mAKpDQOsC30PKh3695TZ70eazCn0libLK1JCiNC
	 u3mYZMIa+wP4kVYTtSRWJZvP+jEyPTrcGSmSV4Bv0UlTfN+mMcai5hk+MGq04s+iqf83j
	 K0brmtkudKcK8EOY6ckcz0KDh65c/fCg+ua6to9LU6wg+jF8zaZ4zvWU7UL5nuJRHmqXw
	 v5ONMEM3L7PwWYei3gANC+5dzyxjfYamvAHzHGxGgjBwKZ4RXNL/RIGi3mgE0NhWPdTmx
	 wl2bUncYZ2bZU9+RNdP43URDp0Zv+oT5dAJ5FDUEyoByn3cyI7MWO6j3V8e/uSp9RWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=moxa.com;
	spf=pass smtp.mailfrom=moxa.com;
	dkim=pass header.d=moxa.com header.i=@moxa.com header.a=rsa-sha256 header.s=selector1 header.b=LZdE7uh5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.65
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012065.outbound.protection.outlook.com [52.101.126.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B6F606A31E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 08:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01B6F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=moxa.com header.i=@moxa.com header.a=rsa-sha256 header.s=selector1 header.b=LZdE7uh5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6SqsvYqpjvfxA57yb8i0gNPm55cLUMVU1O2d+IDzYbdAjYotWU+WQNHUUmb4fyFKdpkR8B6emCTg2w4sI73BJEcAhwJb6ZnCivU1VJq1JUwT05V+ZyaeM70k1tTsQWAvDXDFT7LVP1aQxp9eHXHvM9S8RynGPymCar8BwWUuf1dSBI/2hXsz40NJfROjz0wz3WlIh54C1QrO9QCHHtUmYufute8uHjcJcrErcJSgchzhvVZFMOWxmGflVGZQOu8rWt1HFbrUIDGh74XqkNr+WZTOk5b+OdEh9MVO4tmx+heu5XuMztwJ1cdh2wpLs98WtZRVg243aLGt4+6ck/S8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6AUI5AE+XZ/zx5sU0PvnDKe1B6rl19cjUkLQDcn8bQw=;
 b=tr3L/BbClp6xYG696srvdp1CGiU2p38BmXTgbIwUMxW0/27RCqX0WWM9JBhwAVo3OyJ2lysbAM6RVDeIFmRTxXelOvMIzwGVRyznYq1aegrXT5scG+7kfQAtZFIE4NrxlAJTjqZUIg9zulfhPV8dCl8oMl4LmxUN4CumRrex1Ftt37p2BaN8dU9uXM31QuVYc+uPGAjs0dq+unxQtU319qvvW153wl+nOPGP+SsfipnMaB3VgbZtj737E7kWuDqIg3K80ghxk8jA+HOIQQi+Y/hn6/IR1croHJUjvfqXDhi9vXJbiTAeWscceY7dfrqS5fWXo+50QkfTlKslwPti6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AUI5AE+XZ/zx5sU0PvnDKe1B6rl19cjUkLQDcn8bQw=;
 b=LZdE7uh5TOZSd+TTcwEbfFZj1KeXx4U0A4K1SCtBUxfH3afz4Ev9Ms/bsBnCntvg2e3HmSV6NPMh4M0QtCYtgq67NjRWRqSS1zhNHuN2G2NwMJso9Dn/Z7635+bj7kcPfYeWI7Vft5wdx95LE8oakVh1Gd12vDIDPG8lFrF6Q6Y=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from SEZPR01MB7265.apcprd01.prod.exchangelabs.com
 (2603:1096:101:2a6::8) by TY1PPF30E681ADF.apcprd01.prod.exchangelabs.com with
 HTTP via P2P; Wed, 25 Nov 2026 08:44:03 +0000
Received: from SEZPR01MB7265.apcprd01.prod.exchangelabs.com
 ([fe80::9fb0:b4b4:bb57:e95f]) by SEZPR01MB7265.apcprd01.prod.exchangelabs.com
 ([fe80::9fb0:b4b4:bb57:e95f%5]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 08:44:03 +0000
Date: Wed, 25 Nov 2026 16:42:51 +0800
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH 5/6] USB: serial: mxuport: handle TCFLSH buffer purge
Message-ID: <awafi1yxlHg9Va9r@moxa-ThinkCentre-M90t>
References: <20261016100351.681390-1-crescentcy.hsieh@moxa.com>
 <20261016100351.681390-6-crescentcy.hsieh@moxa.com>
 <sashiko-outbox-174156@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-174156@kernel.org>
X-ClientProxiedBy: TPYP295CA0046.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::17) To SEZPR01MB7265.apcprd01.prod.exchangelabs.com
 (2603:1096:101:2a6::8)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: SEZPR01MB7265:EE_|TY1PPF30E681ADF:EE_
X-MS-PublicTrafficType: Email
client-request-id: a01d4a8b-d4b8-40b2-87e8-b1649e58ac43
request-id: dac46269-6d15-414a-50dd-08df4ad041ee
X-MS-Office365-Filtering-Correlation-Id: dac46269-6d15-414a-50dd-08df4ad041ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|22082099003|18002099003|261009223027099003|3023799007|56012099006|4143699003|261028144727099003|261022105027099003|261021121427099003|261102123227099003|261022075727099003|261021123027099003|261026121527099003|261026140227099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	rwJdH4bVf+5SYc5hsjaJMIoxHTDGDPxpw95s21oix78AZwQzSTK7x38vyHrwhTbtZ48GVCPnw5Yhvx9QRzcZtapk2EEsm+egfQ0RL15n0UxN3aWihInLGqNrzyTtbPyYRfTyx3dkHPKM5BpeCebtxRmbn0ZUb4givgzJdlIH0TVfIXwLNl981OSqewtqHzL6gFvGGTW/hFa39xljW3oBXgEb8D8xcmXEzmNSnk3LRS7ibTD/vvFard+dpT6Z/BcBHIjgC/uMWWwt4lkfTUkdvr0S2rnLq8qxmlIJphXpCdqLdPkxhoh11eXC6n4ufwzSKvpXPB/UsxWKNbZXr8pM+96QgDs1fazvwgZ7G0uHZh81vEwVuX2vtOh0LZHSsB1oPPEHrS7yeee+GmfTKDFR0+nQJZidOy86U/qVj5lbWXzQMp8O0O4m8a6RMTeAeW2Uya+FLYgjvhHN9XzlSCplIZCemuVEKllmJuFfO4r2mUNQyR2HZR4VQXMsfpsFbLw5B+eOpIEVfyfDnFG3SyI3ZT8L65fxLymTtiLQaWKfrbvbyW0decRot2auqOkvclLLRm4uErzHthgHeGtlRtw62cxreHuv7j3c6+9M5HkCzuCZ0wt4WtMiTESFDxc5filpWqRmNFPPKmgdMijvSTzHB1FIf68pYX3JjzIpiTO+QU3Qv07zMmpHlDKkFm2A9JasgE3+k7SIsGmTLNgtjWadxNQVLZG4zvW2mSfIL9AsCyo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(22082099003)(18002099003)(261009223027099003)(3023799007)(56012099006)(4143699003)(261028144727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261022075727099003)(261021123027099003)(261026121527099003)(261026140227099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p6BlAIvQWOgpxBKRl2l0fD51JNTDqkpdCWfzCwlNw2HrcRCrtWcOsCWRU4ru?=
 =?us-ascii?Q?PgVOj0N4LC+j0Vqlfpt13ovuec12H/DG5FyPuk5Pv9Eqxg0fVZ0ZS55LTPrc?=
 =?us-ascii?Q?oX8QIMVutAbHaZp62ioBXbgo4ogtB25HmSRXb91RYm/K8j354qRfg991bn3/?=
 =?us-ascii?Q?JVnizhisFsOcmn2PmfOyAHLQb8+ArAo9Rb+lLhPoHbFgaY0NqlVUqea87h0m?=
 =?us-ascii?Q?LSMovohrGFIyZ0OnfGCW2h6iZ+Con5tonAD90+KHDu9NmAfpuIV45+0cctfV?=
 =?us-ascii?Q?Em/Qf7b6Rn0vJTSE/wjGr+c+9IjXezq/+QYx4DYSKyIfRWAkZkJ303KNUl1K?=
 =?us-ascii?Q?mQ2CKO5E1bHfF6PyfsNvuus5QBl6Gu0MRlNTLNWxiX2/xuLOMdOohIwVx6RR?=
 =?us-ascii?Q?4tQllIVAUU52qmW3zru+pqlQmzUAS0YpeW9QUOKqsSeb2MVBr3tw2gf4fagO?=
 =?us-ascii?Q?rL3RNRvoygi94ASdJQGcpa7Ttcg/2hv3AoWruNqeOeOmdH5gWLkXRrUEakWt?=
 =?us-ascii?Q?iLOAzj8I5z8GyonEq7QT3z6QR6G3RZfZ2mAye6RI0Bw3+neM8/QoOZj64A7Y?=
 =?us-ascii?Q?ipclO3WiIZxjDGVyQb4gD/kW/aatOqcFA5X/s4Vxf0+OTNd5wNV+Lc2H6pEr?=
 =?us-ascii?Q?iv9g62gsnnooZwJFb0PXbegMaxzMcnUWYkmi9SYfXrCYEuae7DxVpGNSrKji?=
 =?us-ascii?Q?IH0oVYy1kHuLnz6AyGEmj9kY2ilIYR7L2N/fn0s7aB4lNTLvehw2OOEwvFmV?=
 =?us-ascii?Q?Wyq0vCfNcVlkUYaaWYHZ4sogYixAEqQYKCAcloqt8SwVoZiCKphQqcD3CF99?=
 =?us-ascii?Q?if+cItXppJwvHIBH4+1LX4S+Y33WpaY7Qa46XADqrfZ6EtdAJBEgtcBGuPc7?=
 =?us-ascii?Q?n4U0VW4xOe03iM7IdnlhpPFafFRD4F8QH7lWnjeefSKnAXzQwEid831kXCEY?=
 =?us-ascii?Q?AfHm4bZZMRRPz5wQJqxGDtE3i2l5sqnvTuMD6w1WFCIRnj+GvSUIZuW3uKEc?=
 =?us-ascii?Q?Cz4b+8lQ5P5dOuvdLE7spu5tMumJRXCer/2XoK24lK6cgM/m/TkKiye46/jZ?=
 =?us-ascii?Q?83au8MQk7ApJX4HkIjScXW6y1sF6Mh6U1obEByVPyHS8cHvILxEuwv/LsI+e?=
 =?us-ascii?Q?hLPpArZ7fhgPwS9zEW58GHEbu1qh2aqdYgxe8Vgc/oxlk8HsE1NJwV1nPZi8?=
 =?us-ascii?Q?i98/7fCAH0hIkIdgvOIfyt1t1sUEUqPXQ1BNBpRHZB4kDsKjdgOZv09tV8Kh?=
 =?us-ascii?Q?avMTgKq4AmgbOYcwfC6j8Ro58ZGp6Ah4MOn73vKuq6+gazEbOFjo0yy3LR+9?=
 =?us-ascii?Q?S0+gz0Z6Ppdud/wNSDxg3tsfASKFiLD9huzRz97ukZLa8XvbkrSDWxqKioEG?=
 =?us-ascii?Q?l81tpYcawEwatNRjA1pkKJVRyzatLh471VbhMnU9ab1tKs3vs0TGpXiNWnw2?=
 =?us-ascii?Q?c1hoV5JRJ2eOPuNfpIOo5AlRF4xyEEcNM1frrBoREB/uzclAqLJi63NEWc5B?=
 =?us-ascii?Q?XTih8188LokKInNc9W/MrOyNY8expuqPDN6EChCAD3e795pMPLUEYMaC2aWn?=
 =?us-ascii?Q?Lyme6ikrJiPN9HygW5XiSPtwzthjTQl3YnVO4iSHHOfKHCWobLolmj3hv7Dj?=
 =?us-ascii?Q?tFgwroYKjpNF5SQ58F5hXNYHqIFA/Uqwato4/x5FEgpDisoF3OLFv3RfajPE?=
 =?us-ascii?Q?7xU94hWJZeE5zm8jjCyt9+j1xoT33hkFHyX8ACPTgpFX17AEJF12MQSfRPMJ?=
 =?us-ascii?Q?qqDev1qBCpdDZaAwRI2ncU4xDHNEwAY=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dac46269-6d15-414a-50dd-08df4ad041ee
X-MS-Exchange-CrossTenant-AuthSource: SEZPR01MB7265.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 08:44:03.0742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 82EjkESXgyqeT7UIotRcxRlHKnbeD8sQ6IrTZiNlcw0fOzuKyf0395D3xQaPET0unsstLZ0/NsJdzWb/ZAz4P5IL1e2GROXpqBqklv88kKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF30E681ADF

On Fri, Oct 16, 2026 at 10:23:23AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] tty: mxuport: TCFLSH interception causes AB-BA deadlock and job control bypass
> - [Medium] usb: serial: mxuport: sent_payload accounting desynchronized by in-flight bulk URBs during purge
> --
> 
> commit 50a2e5dd5f4f9804e6a3238f55deca09791f0018
> Author: Crescent Hsieh <crescentcy.hsieh@moxa.com>
> 
> USB: serial: mxuport: handle TCFLSH buffer purge
> 
> Generic tty flush handling does not purge the receive and transmit
> buffers in mxuport firmware or clear the USB serial write FIFO. This
> commit handles input, output, and combined flush requests by issuing
> the corresponding firmware purge request.
> 
> > diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
> > index 326a5ce18c6a0..9d304fb3aa02f 100644
> > --- a/drivers/usb/serial/mxuport.c
> > +++ b/drivers/usb/serial/mxuport.c
> [ ... ]
> > @@ -952,6 +958,70 @@ static int mxuport_set_rs485_config(struct usb_serial_port *port,
> >  	return 0;
> >  }
> >  
> > +static void mxuport_tx_flush_start(struct usb_serial_port *port)
> > +{
> > +	struct mxuport_port *mxport = usb_get_serial_port_data(port);
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&port->lock, flags);
> > +	mxport->hold_reason |= MX_WAIT_FOR_PURGE;
> > +	kfifo_reset_out(&port->write_fifo);
> > +	spin_unlock_irqrestore(&port->lock, flags);
> > +}
> > +
> > +static void mxuport_tx_flush_done(struct usb_serial_port *port, bool purged)
> > +{
> > +	struct mxuport_port *mxport = usb_get_serial_port_data(port);
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&port->lock, flags);
> > +	if (purged) {
> > +		mxport->sent_payload = 0;
> > +		mxport->hold_reason &= ~MX_WAIT_FOR_SEND_NEXT;
> > +	}
> 
> [Severity: Medium]
> Since kfifo_reset_out() empties the software FIFO but does not unlink or
> kill already-submitted URBs, is it possible for a late-arriving bulk URB to
> be received by the device after the device has processed the RQ_VENDOR_PURGE
> control message?

Yes, an outstanding bulk-out URB can still reach the device after the
purge. I plan to block new TX submissions and use usb_kill_urb() to
cancel outstanding bulk-out URBs before issuing the TX purge.

> 
> If the host controller schedules the bulk and control transfers such that an
> in-flight bulk URB arrives post-purge, resetting sent_payload to 0 here
> could permanently desynchronize the driver's flow control accounting. Could
> this lead to miscalculating the UPORT_REQUEST_SEND_NEXT threshold, resulting
> in over-transmission and an overflow of the device's internal RX buffer?
> 
> > +	mxport->hold_reason &= ~MX_WAIT_FOR_PURGE;
> > +	spin_unlock_irqrestore(&port->lock, flags);
> > +
> > +	usb_serial_generic_write_start(port, GFP_KERNEL);
> > +}
> > +
> > +static int mxuport_flush_buffer(struct tty_struct *tty,
> > +				unsigned long arg)
> > +{
> > +	struct usb_serial_port *port = tty->driver_data;
> > +	int err, ret;
> > +	u16 mask;
> > +
> > +	switch (arg) {
> > +	case TCIFLUSH:
> > +		mask = MX_PURGE_RX;
> > +		break;
> > +	case TCOFLUSH:
> > +		mask = MX_PURGE_TX;
> > +		break;
> > +	case TCIOFLUSH:
> > +		mask = MX_PURGE_RX | MX_PURGE_TX;
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (mask & MX_PURGE_TX)
> > +		mxuport_tx_flush_start(port);
> > +
> > +	err = mxuport_send_ctrl_urb(port->serial, RQ_VENDOR_PURGE, mask,
> > +				    port->port_number);
> > +	ret = tty_perform_flush(tty, arg);
> 
> [Severity: High]
> Does calling tty_perform_flush() from within this driver's ioctl handler
> create an AB-BA deadlock between tport->mutex and ldisc_sem?
> 
> When ioctl(TCFLSH) is called, tty_ioctl() delegates to serial_ioctl() which
> acquires tport->mutex, and then calls mxuport_ioctl() and eventually this
> function. tty_perform_flush() acquires ldisc_sem (read).
> 
> Concurrently, another thread could call a TCSETS ioctl, which acquires
> ldisc_sem (read) in tty_mode_ioctl() and then tries to acquire tport->mutex
> via serial_set_termios(). If a writer (like tty_set_ldisc) is waiting for
> ldisc_sem, the read lock will block, completing the deadlock.
> 
> Additionally, because the hardware buffer is purged here before
> tty_perform_flush() calls tty_check_change(), does this bypass POSIX job
> control, allowing background processes to evade SIGTTOU restrictions?

I'll focus on TX flushing in v2 and move the purge to the USB-serial
.flush_buffer() callback. For TCFLSH, the TTY layer will check job
control before invoking the callback. The driver's ioctl handler will
no longer call tty_perform_flush() while holding the port mutex.

---
Thanks,
Crescent Hsieh
