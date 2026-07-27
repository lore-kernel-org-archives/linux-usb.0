Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECDA36165E
	for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 05:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785130072; cv=none; b=HQVf/OBwao3VUdFftNBoYjNOufS7Io/WTVBeKbu123HVMwQUnYfw289uGRrEGausYIB5n5McKn4UgI6DQfPtHKCVmX8ht2na8CQbS3QlsRtHd/Y4sfQxMFq9XVIOg05lAu/yCCGLfDPYAIGAlsW8sHO9+Y1WtpG7R+b6heYxFmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785130072; c=relaxed/simple;
	bh=84RlqNET+I0UFHXrLWQYxgxsdvvXMS+lK8FeM5vbShI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=iLBzIvYnZJJTRTi1NraAyBMFSipSCADxQR2FCNxm+oqbDfYWw64kvcarxNnxRgQIF05PbEvmx5oCcJedlq+ZT8qFnU8LhNr3nIRMzTDO36qWQUbawBvPWSlvOyAg5e/aTXocnpo1m7dkELtD88hqECgY4LpOLbNn/5g7mtO4V74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=XhMYwNCs; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="XhMYwNCs"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260727052746epoutp024572f30601a43dcf67065f85ae30c05d~GDlZq_dE72179521795epoutp02d
	for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 05:27:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260727052746epoutp024572f30601a43dcf67065f85ae30c05d~GDlZq_dE72179521795epoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785130066;
	bh=YJRsHLsl6ZdPVEPRteFKXPizJQSCJFrhQ5gG2XZvpmk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XhMYwNCsplalcj8XbCOexX8Zaa5BjgLt25H1b10fpm0tXEVTXZPCkAP/Nr+1HJ0i2
	 WlqnOCvnCSaIuomzK5o6ZZRElrbuf17tB0NP3a6XududGcZVPDey/0rFzKXLPJlCJm
	 2OJF8l2t2ZHnLAHTlrqmdtRficzR7r+CAe0IoX84=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20260727052746epcas2p48c05917454f79962c37d583d1dee36a3~GDlZYyYn-0952509525epcas2p4T;
	Mon, 27 Jul 2026 05:27:46 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.210]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4h7nDL06Ptz3hhTF; Mon, 27 Jul
	2026 05:27:46 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20260727052745epcas2p4922cefa9051ba038b57b12cd6a6753be~GDlYSLctX0711907119epcas2p4w;
	Mon, 27 Jul 2026 05:27:45 +0000 (GMT)
Received: from ubuntu (unknown [12.81.221.204]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260727052745epsmtip1f230605650c3a5bd523177855ffa410f~GDlYQZsaQ0569005690epsmtip1o;
	Mon, 27 Jul 2026 05:27:45 +0000 (GMT)
Date: Mon, 27 Jul 2026 14:24:44 +0900
From: Daehwan Jung <dh10.jung@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: Re: usb: gadget: u_serial: fix stale req->dep warn on
 disconnect/reconnect
Message-ID: <ambrnOlx++dj2YJx@ubuntu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260727042632.1726391-1-dh10.jung@samsung.com>
X-CMS-MailID: 20260727052745epcas2p4922cefa9051ba038b57b12cd6a6753be
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----2_goLOs2Eo.NJF7jaRRb75kR90Fcpo6snoS7cibQGcDoSKK1=_2812b2_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260727042936epcas2p3840418498fba2940af27bd4f34b3dd05
References: <CGME20260727042936epcas2p3840418498fba2940af27bd4f34b3dd05@epcas2p3.samsung.com>
	<20260727042632.1726391-1-dh10.jung@samsung.com>

------2_goLOs2Eo.NJF7jaRRb75kR90Fcpo6snoS7cibQGcDoSKK1=_2812b2_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jul 27, 2026 at 01:26:32PM +0900, Daehwan Jung wrote:
> When DWC3_EP_DELAY_STOP defers ENDXFER, giveback of -ESHUTDOWN requests
> arrives after gserial_disconnect(). These stale requests then accumulate
> in read_pool via gs_rx_push(). After gadget exit frees the old endpoint,
> req->dep becomes a dangling pointer. On the next gserial_connect(),
> gs_start_rx() queues these stale requests onto a new endpoint, triggering:
> 
>   WARNING: CPU: 0 at drivers/usb/dwc3/gadget.c:1990
>   request 00000000e6e350a5 belongs to ''
> 
>   Call trace:
>    dwc3_gadget_ep_queue+0x158/0x1e8
>    usb_ep_queue+0x60/0xe8
>    gs_start_rx+0xa4/0x128
>    gs_start_io+0x128/0x254
>    gserial_connect+0xb4/0x14c
>    acm_set_alt+0xa0/0x114
>    set_config+0x22c/0x384
>    composite_setup+0x37c/0xc7c
>    configfs_composite_setup+0x5c/0x88
>    dwc3_ep0_interrupt+0x6c8/0xbcc
>    dwc3_thread_interrupt+0xa0/0x1284
>    irq_thread_fn+0x48/0xa8
>    irq_thread+0x150/0x31c
>    kthread+0x150/0x27c
>    ret_from_fork+0x10/0x20
> 
> Fix by discarding -ESHUTDOWN requests immediately in gs_read_complete()
> while ep is still valid, preventing stale reqs from entering read_pool.
> 
> Fixes: 937ef73d5075 ("USB: serial gadget: rx path data loss fixes")
> Signed-off-by: Daehwan Jung <dh10.jung@samsung.com>
> ---
> Changes in v2:
> - Correct the name of author
> - Modify commit subject (panic -> warn)
> Link to v1: https://lore.kernel.org/all/20260721013509.2327242-1-dh10.jung@samsung.com/
> ---
>  drivers/usb/gadget/function/u_serial.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
> index cdd1dfc666c4..97ee1b9cb065 100644
> --- a/drivers/usb/gadget/function/u_serial.c
> +++ b/drivers/usb/gadget/function/u_serial.c
> @@ -459,10 +459,22 @@ static void gs_read_complete(struct usb_ep *ep, struct usb_request *req)
>  {
>  	struct gs_port	*port = ep->driver_data;
>  
> -	/* Queue all received data until the tty layer is ready for it. */
>  	spin_lock(&port->port_lock);
> -	list_add_tail(&req->list, &port->read_queue);
> -	schedule_delayed_work(&port->push, 0);
> +	if (req->status == -ESHUTDOWN) {
> +		/*
> +		 * Discard shutdown completions here while ep is still valid.
> +		 * Returning them to read_pool after gserial_disconnect() has
> +		 * reset the counters causes stale reqs (with req->dep pointing
> +		 * to the old ep) to be queued onto a new ep at reconnect time,
> +		 * triggering a req->dep != dep WARN.
> +		 */
> +		gs_free_req(ep, req);
> +		port->read_started--;
> +	} else {
> +		/* Queue all received data until the tty layer is ready for it. */
> +		list_add_tail(&req->list, &port->read_queue);
> +		schedule_delayed_work(&port->push, 0);
> +	}
>  	spin_unlock(&port->port_lock);
>  }
>  
> -- 
> 2.34.1
> 
> 

I'm sorry, missing version tag in the subject.
v3 has been sent. Please ignore this v2.

Best Regards,
Daehwan Jung

------2_goLOs2Eo.NJF7jaRRb75kR90Fcpo6snoS7cibQGcDoSKK1=_2812b2_
Content-Type: text/plain; charset="utf-8"


------2_goLOs2Eo.NJF7jaRRb75kR90Fcpo6snoS7cibQGcDoSKK1=_2812b2_--
