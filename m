Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795596235;
	b=NHk3cQAuhIap6NbJEuPvIuFIBhkGrqPs5lJobTHqTmJY1RvxjgXN3i2h3arGGv5peLt7
	 OM0dIsku6wWbOIUpRhoua8fcXWSeC3JYp+mqjlHnpRPTSSaTTuz6M2oMVMkTmefWXc5gw
	 n8RLSEL3+pmoH+ndSj3g/kg+c/9D6k+5xZprBsT/febFkF2J5FPpHFXjo+T9/W7MV8oij
	 XwrMrjsX+dzoGIPWv2FXrkdaYp1zKT5Ud8CtxhqCNV89GG+N/q782gwHNvXDJesnU0xZa
	 R/0BaA2+IZskWoOaJ4UzESV/i07a8JIUvNDMbwax8OhYxyQiyo37Exr6gAmyWMsO1Fg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596235;
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
	bh=tqkFDs4UK+O0yIOkaY/guZr382A5B9opnCprxrFSB3g=;
	b=Vg88pWO7Nozr35SWB0r0PRsP05bR9dPzhMLveOGAxchoJBEZNtlo9HYqkFKavLuAJKc4
	 U1R4SBCSzdF0b06j76RHoGq5R2GPO9QDu8aG4fYPlv81Kh9/7TstOIIw8K6awBPTYrxwC
	 ZWYphSfV1JoxUUJI+qyiSDarn6FYX3JbG+nDEV1RL1Px2S8oia4mFWL/fDPmxrGLm+LuA
	 TJZTUIlm9e3S9SiA0CAIWUUjvHNhXrlR1ufq0PwGt69GqPlhQHmkYsa+7RcrOCT9TPNXY
	 VwViGfbno3Ux+TrSc7I2Y3iqco0wYquzZPY1bfCFIiZca2jADKzrT//bduPIoDABdRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=moxa.com;
	spf=pass smtp.mailfrom=moxa.com;
	dkim=pass header.d=moxa.com header.i=@moxa.com header.a=rsa-sha256 header.s=selector1 header.b="bof/+iRs";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.32
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013032.outbound.protection.outlook.com [40.107.44.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C922D606A323
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 08:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C922D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=moxa.com header.i=@moxa.com header.a=rsa-sha256 header.s=selector1 header.b=bof/+iRs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWqzCMs7JZzXRtCfpN43pQ52sAVOE8eCWN/mnhtvXewB7DXsFvDTYgkDB4s3XNrS90/uJCXLD5WVVDbWEYvDwvwjImCovk9rhGtGUoSPR02rR9TIRslgVUJ0qNlU6Bi/4qBb8nd3pOnVu374o9PElM/inAr0XUJ06J+i1eBTLdj4gcoyrsAEX/gU3wrS/l3WU0czBEE4Q6XZsscR5xkeG3LpwiuIU39g41/nfhCrmoFdB0P+5H6Zr2AMUZ2vxcElcrwBUZtf97y+EuzApHVKRqn1o256YU7HAwrfXgOkhV5gkdmOxEej+9xDrIMqwj5gDttKQNTwW5ucd+MyDZgfUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqkFDs4UK+O0yIOkaY/guZr382A5B9opnCprxrFSB3g=;
 b=Kovg5K7EFyYRkRWYHMffPlBYwqgOoPLfMiaG2007w98gBzcgNKoh4n+ES3tV7IAkqBEIYH78FRrJDA3ZADgz8a0NrLK995abDTSBrPVDRFOJ3NvI8BSexAt4KkdtAPxJQhjJrEaHnCBJqZQxfQIrHDofrcW3PibcIr9/Wrian290Tt0H9bmyR2lBxu4GswgW26zRKd0ABqD7c9ACoyFAim4QGW0qktFepytVmoLhzQwZ/fVmwphhluRaKLsYJKYahU08kcdS7Og/967qm2c/B2fg5psQR2mRhuBVoH2L/7ARfDWpU+Fckd1RW5xj0EafyHC5AC1nletvI4CiLpVjUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqkFDs4UK+O0yIOkaY/guZr382A5B9opnCprxrFSB3g=;
 b=bof/+iRs0eXsB37/Lsc0P/w5BlNvmSQBmCuy99SlkCkbXAhfA4BXcV9cu7/lQXvtCP93iMyhb982ftsZNdRF7hZOZBXFB0V4nmaz0HSBlkhWuzdt8IoOz/hLkBNKjpnJKN4NXK0bCIZc5oCiJ8bi0N9XNhSKBnE4fEe7iNGdLN0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from SEZPR01MB7265.apcprd01.prod.exchangelabs.com
 (2603:1096:101:2a6::8) by KUXPR01MB7792.apcprd01.prod.exchangelabs.com with
 HTTP via P2P; Wed, 25 Nov 2026 08:43:51 +0000
Received: from SEZPR01MB7265.apcprd01.prod.exchangelabs.com
 ([fe80::9fb0:b4b4:bb57:e95f]) by SEZPR01MB7265.apcprd01.prod.exchangelabs.com
 ([fe80::9fb0:b4b4:bb57:e95f%5]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 08:43:51 +0000
Date: Wed, 25 Nov 2026 16:42:38 +0800
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/6] USB: serial: mxuport: initialize modem status on open
Message-ID: <awaffkfDga9l-yDg@moxa-ThinkCentre-M90t>
References: <20261016100351.681390-1-crescentcy.hsieh@moxa.com>
 <20261016100351.681390-3-crescentcy.hsieh@moxa.com>
 <sashiko-outbox-174140@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-174140@kernel.org>
X-ClientProxiedBy: TPYP295CA0054.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:8::6)
 To SEZPR01MB7265.apcprd01.prod.exchangelabs.com (2603:1096:101:2a6::8)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: SEZPR01MB7265:EE_|KUXPR01MB7792:EE_
X-MS-PublicTrafficType: Email
client-request-id: b0390112-3017-4546-9c08-9fba98fb6051
request-id: 13d3a4d9-91da-48a9-0426-08df4ad03aa7
X-MS-Office365-Filtering-Correlation-Id: 13d3a4d9-91da-48a9-0426-08df4ad03aa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|376014|1800799024|56012099006|38350700014|10067099003|4143699003|261021121427099003|261022075727099003|261026121527099003|261102123227099003|261022105027099003|261028144727099003|261026140227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mItxxl3bXjEd0LAgEiudMNQRvRCq2KNKz2YwtpdUWqdBDNFPPraU/oMuabOwwZemhlMdNMo+NGfXmg3Q/evz/Fg9Q4jmNyXbkzg0iBELg2HEWO7fiicUr8LuVD+ueR9e1zAxbkdpQdfjHZv8gooyLTzbXlT+xyiVsZTSDvpZsUv5bwM9/WRbwpCqTQcpp0piMKqBxSVYY4dOPjkcJvnoocyrH1XQo2FRfTlW04LqcYkEvdlJrnmgdPQQkzjFWxVXxNdyGaICjyf6x4YK7F9k5lOawMaxwNyNL0ZJPbox3IRzmmds3eCscx6x2p6NXV2JeQl/HqNAi8z7P7Q5GiilyX0bMof//7mmz+5Y+Q+XedNMJGrPu/Zra3FQl5jR5ZxcUn5cVwbupTk2qrkYgBoZIWdEYE2cf3ednTQqu8kd6bssemSlvdEAPsSFWH2IfcSuAGfVfTw7X3EnjdEiao0+yA0EUWKWcLswMBzaDj7wVFTVrMaT7RurSZnqZcaxa/yZ4U3+Fk73ikg2vSJV8C+XZBANBw42zhRv6NI+Om7/NcEzYulIVwgaT68HZfAJEzJFRV1+8oVLFORhOns5O1jmRd68m5piC6DFdSqYaRRNWQrNgK4fuHdVuxc4CCvXFvV1Z5JSVeX70oJjaWVVIqNSVMtkaCd7TRslkoTQLFJg9ZwxbzYtJSylCt3g3mS+uirw5PS4drMvfoV619FNJHE7J19QDf9nR1TSCEq3rSlTTws=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(376014)(1800799024)(56012099006)(38350700014)(10067099003)(4143699003)(261021121427099003)(261022075727099003)(261026121527099003)(261102123227099003)(261022105027099003)(261028144727099003)(261026140227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RNY1CvRW7AndqbEJAzczK9+0WgOTyWRjtrCN8pjZz16fJuQedJGKRjfeFi6Q?=
 =?us-ascii?Q?FrYoZJgpQ2IgimRv7Ph3+Egb7fD2oyrJhdepSFC7vTZrcCOJ3QOZMD22i1r0?=
 =?us-ascii?Q?0aUZmxcnuwX9kX+Xp2viFH3O6JazOk4SxUY+VQoQtxkOKGUY51/7DorV/gIW?=
 =?us-ascii?Q?bPBvnALs0MqihVE/0KvBMbXcIXdgFDbgYeRdU3zflxaLfoDwChCPSbWZfbg9?=
 =?us-ascii?Q?V74/n7mVTM7GmEEJW0STOChQofJtLrWb1/3NwW7g2qo2dcaA2pL0qRf6aLOp?=
 =?us-ascii?Q?auFcqHe2Qp/JVos0dB8OM3F0J76xSOclBVnPRBqInBI7udGRMBdnApz1SMED?=
 =?us-ascii?Q?lvNKgWWLRSKj8OoaKB7PwK0AEpzk82/pzGH2JRZrhQuZh5MrnuERd4bX2HWv?=
 =?us-ascii?Q?e3wacsbxvUWyT3PCdqa37xewuhRL7ZUNLcMhNF9fSaovZOn35IZxZV5yJcRj?=
 =?us-ascii?Q?ml0wIq3PrjrlL122hqj6ZrYBPU3qibS+tHME180xMRBsas6U4hbheUKxhl2G?=
 =?us-ascii?Q?r3iVySJL4BINfQJ7+4e68k/R9r7w822kSmfnxcioKNL/YpP6qxoVuPcDHq9M?=
 =?us-ascii?Q?RdqG8FSLAKR7M+qWSB/UhwS7fsnto4opoO8LvBLmrYkMEkhxEuV91/AFuEJh?=
 =?us-ascii?Q?wV8L+C5/KFGzJe9TmeqOY5Hxd/5s4AWyNvw5COyDWvfXSZgXqt+ijeS0SAHp?=
 =?us-ascii?Q?bc4NcUPgfUBJ8Pv+lwAhFy9nNEZWqgQPC6sUNCDO8gU2C44igUFjo4JdYwzp?=
 =?us-ascii?Q?qsLXqE8us6KlQjBnJLN4yV50Y1z2iGTYss/9ynub62dXlu7QjMnsTyR4zSqn?=
 =?us-ascii?Q?iSVpmAby8eEc7s2AudX8jY7ioHwskaJgb9d10L5arwXd5TCdiI0K+ceMQkEW?=
 =?us-ascii?Q?l+Q/ruxRAl2Y/foC47Fx6XMa16AUE/XB55cIK3lBSt956lFYvlqallMJi71X?=
 =?us-ascii?Q?uqO9FjaBUG9g+hvuxx7q6ectWoc6dLr16Ycrm4uBkLgPt+yW23u8GIBxa9nP?=
 =?us-ascii?Q?LuB6Esx/r25kuUiX9SWGf3hYSmn0TTGVK1iy2RFbDC86rpmzQDSbZmeIfXrB?=
 =?us-ascii?Q?0RnTI0Ha+LxxRgQUWF+RQJvjRjonNrqqsw8RFCfW6aWumR0STrArASfLDrOy?=
 =?us-ascii?Q?zGNZPCDQsCPU5gV+BGSUAxtsZSp5ADvKsrwXWex8cUzHeYSE1RMhmmqjPVOf?=
 =?us-ascii?Q?tBuHblf0yuP+0qxYMDmF7Qzj6GUmHrl6fpClfTTEDo/iPhBeCZfEQOeHmMVl?=
 =?us-ascii?Q?Yq8xOOippHw8MnRu0aI1CqQDO5wVY5QPwzM6XLn4cHhC8GY0RK6YC54Nf2Bk?=
 =?us-ascii?Q?J0dmrltLvcknjKs4HP3QHmsMXW9IWP49Q/a0v/hkDGTG271MuS5FkGf1UpPl?=
 =?us-ascii?Q?YCp81xz0Z7CqT6kfOkXuxb5kJYbpNF6ROZJqXutzsQIYlQN5Uc5zoDQgKgM8?=
 =?us-ascii?Q?jXfOGSWSiicTSyARfrIAcyI7TYXRXlTZ5REYm/RlKorMgSXxlpjIOh83+b5f?=
 =?us-ascii?Q?U0TW2fy/UFzD43sWMYYt49PyFGnhphyRzVBEyZd6BQMSBkuOarv20Exd/zlm?=
 =?us-ascii?Q?+PPHlUxZ/HMdrFpjwsWrA90cuFPvDdauEufTEf5otiEGc+l1P3UbrPvp7Xbq?=
 =?us-ascii?Q?xXfe7OqheU8BhxdO/WhRamX8lbkOb268Ro0l4oLoccXB49S5rP8ruD7Qes3t?=
 =?us-ascii?Q?5n1Mt6+jH0R9o8PHNGCaC3BR+77Tj4+kqy3/K7ZFVUoCNscFTr6S7OPM/rts?=
 =?us-ascii?Q?PoIcKjw5C+mEddCXQhGr6kXvLDktv5w=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13d3a4d9-91da-48a9-0426-08df4ad03aa7
X-MS-Exchange-CrossTenant-AuthSource: SEZPR01MB7265.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 08:43:51.0064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tdNoHOASX5nRT0gvGM8peDr5cBZhu4DoPxd2YSgNJVQ2tjfTxeR/Fy4aCDOBgWPvc7d9J4qYyDd0o1qw6SqW2qEfGBlXEhjdDQTi/UPsKto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR01MB7792

On Fri, Oct 16, 2026 at 10:16:56AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] usb: serial: mxuport: TOCTOU race drops MSR events during open
> --
> 
> commit e30f4f38ee9a11d678d89a99a4f6221fd7d285d1
> Author: Crescent Hsieh <crescentcy.hsieh@moxa.com>
> 
> USB: serial: mxuport: initialize modem status on open
> 
> The cached modem status is currently cleared whenever a port is opened,
> regardless of the current modem-status inputs. This commit fetches the
> modem status register via a vendor request during port open so that
> TIOCMGET reports the correct initial input signals.
> 
> > diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
> > index fa75f844050dc..3f1989afde30e 100644
> > --- a/drivers/usb/serial/mxuport.c
> > +++ b/drivers/usb/serial/mxuport.c
> 
> [ ... ]
> 
> > @@ -1477,13 +1478,19 @@ static int mxuport_open(struct tty_struct *tty, struct usb_serial_port *port)
> >  	mxport->hold_reason &= ~MX_WAIT_FOR_SEND_NEXT;
> >  	spin_unlock_irqrestore(&port->lock, flags);
> >  
> > -	/*
> > -	 * TODO: use RQ_VENDOR_GET_MSR, once we know what it
> > -	 * returns.
> > -	 */
> > -	mxport->msr_state = 0;
> > +	err = mxuport_recv_ctrl(serial, RQ_VENDOR_GET_MSR, 0,
> > +				port->port_number, &msr_state,
> > +				sizeof(msr_state));
> 
> [Severity: Medium]
> Does this introduce a race condition where modem status events can be
> dropped?
> 
> If a physical modem status line changes immediately after this
> RQ_VENDOR_GET_MSR request completes, but before the core layer marks the
> port as initialized, it appears the completion handler drops the incoming
> hardware events.
> 
> Looking at mxuport_process_read_urb_demux_event():
> 
>     if (tty_port_initialized(&demux_port->port)) {
>         ch = data + HEADER_SIZE;
>         rcv_event = get_unaligned_be16(data + 2);
>         mxuport_process_read_urb_event(demux_port, ch, rcv_event);
>     } else {
>         dev_dbg(&demux_port->dev, "%s - event for closed port\n", __func__);
>     }
> 
> Since tty_port_initialized() is not set to true until after mxuport_open()
> returns to the core layer, any state transition in this window is silently
> dropped. Can this leave the cached msr_state permanently desynchronized
> from the actual hardware state until a subsequent event occurs?

Yes, a dropped MSR event can leave the cached modem status stale.
The driver already dropped these events during open before this patch,
so I think this should be addressed separately.

---
Thanks,
Crescent Hsieh
