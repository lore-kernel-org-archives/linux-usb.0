Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012024.outbound.protection.outlook.com [40.107.75.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2F23F823C;
	Mon, 27 Jul 2026 10:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785148112; cv=fail; b=MOBhCIQDIeHEmqCw96gWU9EPwjuB3kQwCe0OZxR99nBRauaKi/7fmG7XK0pqJRLGxNy1CohO/HSRouTEOJdNhs90gSy3t6YN3+uJZT8/C+3aU5OwGuv68KovVYXPrOgswHVaiDNcOU3zGlvtkJlRyEtVOuU4VYJbas2vROrtZiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785148112; c=relaxed/simple;
	bh=racRpqfCPCuGOC1q95Pb+Q3E0PRS2NYps2dZ3jk8VXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Zy6xakgdnfqFiIQYCZozCDevDPnu3rF6zFkAt+M7tVaKQOjVb1eJ/dkqp858oS5SYq341T4AKaBmNwanNLhuvYIkgLuwFHGPRbCdIGyQrwhCHzJOH0vX0ciAYayfGD5D4ClaWfPTMIZOoE+DjTnMUtMLCcZ6uZ/f75whdtJWdBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=e4D+HKcw; arc=fail smtp.client-ip=40.107.75.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="e4D+HKcw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NT1KjYtDv2XPvpTGbi/H3FtuIEiBXOY2ehnB02QiGn4pLJrUvT+HAFRpWykxgDcKKw1MCNNWmi6hMG7x+VGo/PeHexdCmL7HlIrQ2G5CGaKsfDxVEx0PoYc58m/Tp6eKpVuT4JVla2TaHku80+nbNfG9CojIjjnnH9G8NRuQH9i372ZJgKPgMspTVmU8X/mt70VnlxxuIuA27pVSdIK5ZPaY3AtlKl1ZnIugQbnr7K5eaz748YGUY6pHoUjP8I4EBtTE9BJtoMhZFwVrHxcwrakRygFvSPqGJTNykahtTt8w7j+pyStXOOA1bOVuVcUA+L5gQ2oNQGYiii9TnBAcrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGYzFHqlckT81iejVd25zWlWH5ssCXR74EgzuQdJdj4=;
 b=ugQz1YCeaOQJ95dKFlphlRiIHFgVTGBj5kYv6GJLiH9yQlAlwexmjYyFnUS12x0JotT4g+PnXq2iRrBEQc956ot7G/pmhG8ajtU9Oqc5aPMFlrOgtCa9pCi/ROKWoj1HAM6a1xg1FwH51qoqzhBCiuhEYHpaiiPUbF+IwNunJymHon0JUwdjKBm6/QVOD1x+cmB5E+21iDiepSymGNXDw6UU7SMzj49OigXjJqs8EFYUFt7xRD8dhKpjCxAi98J3HuJx1Sw5g9WNzVJ1qYevnnsf1eNYfVV2F04WpxjaG6jM9gHiPXyhNR2aQoo/iNcvGr1vQWYbLOQFOf5/03MqBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGYzFHqlckT81iejVd25zWlWH5ssCXR74EgzuQdJdj4=;
 b=e4D+HKcwMFToPddhlebtEYqqPPpsr+bRd0hpe587+8GbOkc5gXZ6HlfP9pxawtukezXa1YloOCkt4M5QOmH1YB7Oza0bItwjPI9GL6Sukfzy17qRGbV/7QyXshujl0PuK88uYUHyn4YpepkOIE5UEh8hGIt6sl4b6OMseZQybuU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by TY2PPF92D7F20FA.apcprd01.prod.exchangelabs.com
 (2603:1096:408::3b7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Mon, 27 Jul
 2026 10:28:19 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 10:28:19 +0000
Date: Mon, 27 Jul 2026 18:28:09 +0800
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	FangpingFP.Cheng@moxa.com, Epson.Chiang@moxa.com
Subject: Re: [PATCH v2 3/4] USB: serial: mxuport: handle SEND_NEXT transmit
 flow control
Message-ID: <amcyubnG9N8ZI0ro@moxa-ThinkCentre-M90t>
References: <20260623080138.166398-2-crescentcy.hsieh@moxa.com>
 <20260623080138.166398-5-crescentcy.hsieh@moxa.com>
 <al-VnkwqXYC7MoVG@hovoldconsulting.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al-VnkwqXYC7MoVG@hovoldconsulting.com>
X-ClientProxiedBy: TP0P295CA0040.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::13) To PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR01MB5405:EE_|TY2PPF92D7F20FA:EE_
X-MS-Office365-Filtering-Correlation-Id: cf31e2e7-96ba-4e13-bbbf-08deebc9c6b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|56012099006|4143699003|10067099003|18002099003|3023799007|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	ICjMqvJE0W9CJ0FiR7R/zQlEdp76NJKgoet8+cMZoqVy7gzkMHDh3EKULLrqpRYxyqzmZNA5tgSADMI4EDVdt+tdEI74Eh0WQb8PmcgLuNG8+0HvUd2Oi97hjELzdLKwI3pyhu/pIdsvNCNZqH5yicgHgphJThPXi9Nh0fUpuDJbjHgFudhsyxODZaVrUzy8csjvnMs0De4BI2wEYxp072hegamKi85vJEIIaGL24Mau0e1SitItzd6n5QdC2gLLme3FhLZBLjLDjtWpqyEEOezNoJE9TB5yf2+/gFKv48yvYgXZQcixWygOmSCTI3YmeH+/asQKKAy/QmpMritmCMxvOMHv486RsUxGe5vnpucVe3ifwTMstpDz2/L3NGWNQ5rW9cxysmZplyO5M4pEBRqm5f3SpXwV9m0qQqvuKXUCm+0TjBr4mYeu0m4OEC1mguKz3cBzFtJ3+3ZHph5hzhccPzYEbD/7VOjuR82Qbj0wT2lVzrnAkE/wEmeyMRQKYbDdWlIqHOWJReqUPeSV2iLPo1lFcC1F2blhqA5ftMIB4d7zGJzLHU2fkir1ZECG40scZ3rkeBB5YAt3Ve0s2SUYkI/Apo8yj1E4z0mNGpxGHCPa5PGfLC7qYJQpR6f61IoWJsSfTYCdoSm5nRXBLZ6rn4G46jgRvMQu0bMYXMtWPcuH+Xj/AiRLH0O9tersjK/SXBlPuj643bvGujZOO0s23y/+H7SX4HgRoHyvMx8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(56012099006)(4143699003)(10067099003)(18002099003)(3023799007)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+RF+iHAdezO006ZUShKqEwoNyo/fGA6JBLjKkOfnwfOP4hGhC2fnP9ddOCVc?=
 =?us-ascii?Q?Ja5ojBgEMAj/6dMyMWb3dotuFLZv42mC0HtxKcA3+t4W7hskk5crUS5eEHHM?=
 =?us-ascii?Q?F+Oc+aBpOcw6RthDQNKxbPFFJtXlwkmhPpxTiCB0/gIqGRkjdYD3e8wSVddW?=
 =?us-ascii?Q?5Q0LcMzuEzwMLezbknXtnT9qyfMwUCzkbqREsdHMAVe8giCszWhPtrX/qJp1?=
 =?us-ascii?Q?nZrsHDPeleYrzpM2i1Plb3NxkIvNR7+bpafA2su4ziuEtYGUiHheA7gf16Ml?=
 =?us-ascii?Q?ik7SePoiPuwWBHks39UJt1kKIjAaOiyXWi2kFCsVCfgKMsb38v1G9X3LXNqL?=
 =?us-ascii?Q?y2BNdlntyUv1M1v9bST8YZ0/Kbs3yl6UHdJkTVvBBnzSRp1AjmFyNuQ7/50d?=
 =?us-ascii?Q?tL2Lu7koY/fEMgmeq6PSOecYQ5M9xbEWIl9u6F1zzwzdU59s8sPqkMqivtTM?=
 =?us-ascii?Q?pDKsu+R/AlHqlehiLF+X64i6C69kXJ5+XG0QTLMMgiEarMSwcvOZ6WknGuZf?=
 =?us-ascii?Q?lD7KRhh9YYEuBwWtJp5PUcJe+KVxurC4AxWReMRRKj59lCf5h+9rg/yOiHD8?=
 =?us-ascii?Q?y7syOeB0Ra4C47rVWkIriMiLjlbk9rntyRpkbbqDt/L7OdTRIry+BuiaD2fX?=
 =?us-ascii?Q?vRxgFW86xDyQriBe3IHvTNpJYG2k5lqZFHUCtD8cearXoNZZrqftR89CcCF6?=
 =?us-ascii?Q?bbbpKJW+ZxXnX0WcqHuROBsuUokdLA1vx2K69JQSoL5DcNs6z/8B209EcENk?=
 =?us-ascii?Q?tF76f8pR7HDy1Z98gA6ujl405C1pAdK0toZXDwx9RF7PSe59D3LQohobAZaX?=
 =?us-ascii?Q?AyFShoqdutDm62SsSdzWydlkY4bnNP2V5sY1l4wmmE6xHAIo2XTedb+aJJ3r?=
 =?us-ascii?Q?ny0qisk6/0AzGo/Bj/5s5i0r7D6Hcyysxo9haludVTYL74Nn0DMKJ3XndL8K?=
 =?us-ascii?Q?ziPVrvPOKVRdel81pEkyrIHz/UnUt/X0+hAxI38ghL9d08pz2uU1+gXpdJ7X?=
 =?us-ascii?Q?gRY6g2fW58Hrb+5pW2Tbzw4w++EiTx8py7aMmn4qBALcedLXz/pHhsUlVej5?=
 =?us-ascii?Q?lmXpD2xqWRAJjnwXQGL7F0xNxWp3eAFhb941+BOe/fgtbB6BgIF+onmbDIez?=
 =?us-ascii?Q?NvUUlh2UvDwbu59R/HpPJp/uiB/zFKpOgPmE8YI3kpvQDWFKPoW17YOT8b4E?=
 =?us-ascii?Q?8FsQFRb0ZLCC/30EyyfQP2jFMekxaulGpQnZh8kuGgY+5CIaZvkMO/W+hFhY?=
 =?us-ascii?Q?tg1YeHA6vJOrcD8T25suGrGKQeRLVvq3k5FqMAc+mysazkDIR0yxGrJJ6p8I?=
 =?us-ascii?Q?exUAJkZZ+eIzA7zWh/+VNmOKvLog4qlW/vdcZli3z3ifeN5ZwWbSCb/T2ddh?=
 =?us-ascii?Q?3XtUKYFvY47tvvdNPyrX++y5BaokFB8YTVyiWTWG04I/AHIRJvPRRPymEZtX?=
 =?us-ascii?Q?KEm3xv7iBVULfB84HC+VskTy9rRzOBjc6Bbs/ukqziRXkDlPFqfREqPIFZGu?=
 =?us-ascii?Q?goFl68JOPOxx5eY01lalW3RX/7fiqD0JO07IL5L0cTHSQ5soX8EpdH2pu6UL?=
 =?us-ascii?Q?EYpzcxou8AxftY6HVF2HoDx/tGyl+FmfYjCsKOiqt4BAOkLfaUkUKF/0N3lS?=
 =?us-ascii?Q?a1ZhjWpteiLfduetteF46cFJ6un1KPIhFDXC39n8V9QaT9dC2rEgy8cDLy+M?=
 =?us-ascii?Q?PYH0JgIfXw5LfT0SzzkTtjQFF75OFGibfmAxzOzyrKZk7Vssp9KKrbFwHoBA?=
 =?us-ascii?Q?UFJ57KM1fWiZJQ1iwjnATbvS8kkIkmQ=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf31e2e7-96ba-4e13-bbbf-08deebc9c6b3
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 10:28:19.0082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xYK9TsWQ/AXjb27tN6kytTCRc+MIJ0aMxofL3jdV87gXrcOzG+xQ/RLoJbusoZpEgWSdekfmzi1zvINOzBX9ZHQewJnDiM2yO9ITWSPLWRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF92D7F20FA

On Tue, Jul 21, 2026 at 05:51:58PM +0200, Johan Hovold wrote:
> On Tue, Jun 23, 2026 at 04:01:38PM +0800, Crescent Hsieh wrote:
> > The device uses the SEND_NEXT event to pace host-to-device transmission.
> > Without waiting for this event, continuous transmission on multiple
> > ports can make the driver submit bulk-out URBs faster than the device
> > can process them, which can result in data errors during burn-in
> > testing.
> 
> Why does it matter if we're sending data for other ports? Isn't the
> problem that we're sending more data than the per-port buffer can hold?

You're right. The commit message is incorrect, as the issue can also be
reproduced on a single port. The actual problem is overflow of the
per-port buffer. I will correct this in v3.

> 
> And is this an issue with all firmware versions, including the ones used
> for the existing gen1 devices?
>  

Yes. This issue is not specific to the G2 and Platform firmware; This
could also be reproduced on existing G1 devices.

> > Stop submitting further write URBs after requesting SEND_NEXT and resume
> > transmission when the matching event is received.
> 
> How exactly does SEND_NEXT work? Is it signalled when the per-port
> buffer drops below some threshold?

SEND_NEXT is initiated by the driver on a per-port basis. The driver
sets the SEND_NEXT request bit in a bulk-out frame and then stops
submitting further data for that port. The firmware sends a SEND_NEXT
event when the corresponding per-port buffer becomes empty, The driver
then resumes transmission.

> > @@ -276,22 +280,148 @@ MODULE_DEVICE_TABLE(usb, mxuport_idtable);
> >  static int mxuport_prepare_write_buffer(struct usb_serial_port *port,
> >  					void *dest, size_t size)
> >  {
> > +	struct mxuport_port *mxport = usb_get_serial_port_data(port);
> >  	u8 *buf = dest;
> > +	unsigned long flags;
> > +	bool request_send_next;
> >  	int count;
> >  
> > -	count = kfifo_out_locked(&port->write_fifo, buf + HEADER_SIZE,
> > -				 size - HEADER_SIZE,
> > -				 &port->lock);
> > +	spin_lock_irqsave(&port->lock, flags);
> > +	count = kfifo_out(&port->write_fifo, buf + HEADER_SIZE,
> > +			  size - HEADER_SIZE);
> > +	mxport->sent_payload += count;
> > +	request_send_next = mxport->sent_payload >= port->bulk_out_size;
> 
> How big are the per-port buffers?

The size depends on the device. The G2 and Platform UART firmware have
a 4096-byte buffer per port, while the G1 per-port buffer ranges from
32 KiB to 256 KiB depending on the number of ports.

The bulk_out_size threshold is not derived from the firmware buffer
size. It is used as a simple and conservative pacing interval that
works across the device families without requiring family-specific
buffer sizes in the driver. This results in more frequent
SEND_NEXT waits and may reduce throughput.

> 
> > +	if (request_send_next)
> > +		mxport->hold_reason |= MX_WAIT_FOR_SEND_NEXT;
> > +	spin_unlock_irqrestore(&port->lock, flags);
> >  
> >  	put_unaligned_be16(port->port_number, buf);
> >  	put_unaligned_be16(count, buf + 2);
> >  
> > +	if (request_send_next)
> > +		buf[0] |= UPORT_REQUEST_SEND_NEXT;
> > +
> >  	dev_dbg(&port->dev, "%s - size %zd count %d\n", __func__,
> >  		size, count);
> >  
> >  	return count + HEADER_SIZE;
> >  }
> >  
> > +static int mxuport_write_start(struct usb_serial_port *port, gfp_t mem_flags)
> > +{
> > +	struct mxuport_port *mxport = usb_get_serial_port_data(port);
> > +	struct urb *urb;
> > +	unsigned long flags;
> > +	int i;
> > +	int count;
> > +	int result;
> > +
> > +	if (test_and_set_bit_lock(USB_SERIAL_WRITE_BUSY, &port->flags))
> > +		return 0;
> > +retry:
> > +	spin_lock_irqsave(&port->lock, flags);
> > +	if ((mxport->hold_reason & MX_WAIT_FOR_SEND_NEXT) ||
> > +	    !port->write_urbs_free || !kfifo_len(&port->write_fifo)) {
> > +		clear_bit_unlock(USB_SERIAL_WRITE_BUSY, &port->flags);
> > +		spin_unlock_irqrestore(&port->lock, flags);
> > +		return 0;
> > +	}
> > +
> > +	i = (int)find_first_bit(&port->write_urbs_free,
> > +				ARRAY_SIZE(port->write_urbs));
> > +	spin_unlock_irqrestore(&port->lock, flags);
> > +
> > +	urb = port->write_urbs[i];
> > +	count = mxuport_prepare_write_buffer(port, urb->transfer_buffer,
> > +					     port->bulk_out_size);
> > +	urb->transfer_buffer_length = count;
> > +	usb_serial_debug_data(&port->dev, __func__, count,
> > +			      urb->transfer_buffer);
> > +
> > +	spin_lock_irqsave(&port->lock, flags);
> > +	port->tx_bytes += count;
> > +	spin_unlock_irqrestore(&port->lock, flags);
> > +
> > +	clear_bit(i, &port->write_urbs_free);
> > +	result = usb_submit_urb(urb, mem_flags);
> > +	if (result) {
> > +		dev_err_console(port, "%s - error submitting urb: %d\n",
> > +				__func__, result);
> > +		set_bit(i, &port->write_urbs_free);
> > +		spin_lock_irqsave(&port->lock, flags);
> > +		port->tx_bytes -= count;
> 
> > +		if (mxport->hold_reason & MX_WAIT_FOR_SEND_NEXT) {
> > +			mxport->hold_reason &= ~MX_WAIT_FOR_SEND_NEXT;
> > +			mxport->sent_payload = 0;
> > +		}
> 
> Shouldn't you undo the effects of prepare_write_buffer() and subtract
> count from sent_payload (and clear the flag) unconditionally?
> 
> > +		spin_unlock_irqrestore(&port->lock, flags);
> > +
> > +		clear_bit_unlock(USB_SERIAL_WRITE_BUSY, &port->flags);
> > +		return result;
> > +	}
> > +
> > +	goto retry;
> > +}
> 
> This is a more or less verbatim copy of the generic write
> implementation. If we go this way you should at least mention that you
> copied it in the commit message, but perhaps we should try to find a way
> to generalise it instead.
> 
> Also, if you really need a custom implementation to throttle writes,
> then shouldn't using one URB be enough? The other one is essentially
> there to allow for higher throughput which we need to give up for
> correctness here anyway.

Agreed, the custom write path is largely based on the generic write
implementation. In v1, I attempted to implement the throttling in
prepare_write_buffer() to avoid changing the generic path, but
returning zero caused the generic implementation to submit a
zero-length URB. In v2, I therefore added a custom write path so that
submission could be stopped before preparing another URB.

I will investigate whether this can instead be generalised through a
small driver callback that allows the generic write path to check
whether another URB may be submitted. This would avoid duplicating the
generic implementation while preserving the behaviour of other
USB-to-serial drivers.

I will also describe the SEND_NEXT behaviour in more detail in the v3
commit message.

---
Sincerely,
Crescent Hsieh
