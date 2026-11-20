Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795176012;
	b=zIetTn6ZEhdqQW89iM4EGOVmk06jFfLtlbEj73ZdS5VAXzsTR+ILZXVZZzGF5exfFdju
	 6SK2r/v87ji62MLz3LNhJ7DCeySeXqoqWASE/8x3LdOvYwOc+XtT1lB1wg/OUrLeKfYrJ
	 bAZUJ73mSkWvnu7aCbeHf2Oon2SBaNYpoXAp1wJpdE7be7kDhGmAwctLkx0Qy/4mgzhxQ
	 kX6FW0k6ivOaDFHtgJyhCZoDgsA8IndFs1LyTAdojFFsuX6jJ2sruHI5o3Fic8n2n2UNx
	 xDsiCdc1WDnqwS0wy1XQObxKb/l6ZnyRLvmBXxquaerkStkAvUXVTnRITE1/qcJjYTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176012;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 Cc:Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:CMS-TYPE:X-CPGSPASS:
	 X-Hop-Count:X-CMS-RootMailID:References;
	bh=beSiUkGx2GcQ6sDeEFrAxqQYgNySD4qY7mecJDY3PFQ=;
	b=QJttPUrBivWJNou/rVnRoQO5a1jbvrnYbfJ1NbniB07oFgWedsU9E4OaMPX6CeorH4zI
	 bTCfhuVEsm41A48ty2+g0Nt2fkguHjHvSuatVY1v8idSZ3MCUOkbLeVGp4mslZdkSaeGx
	 1vdyeYBcihmfmejHKkoKj8bsr+qc8xbJHKFlB5XKqoH+zch9yIrKwSLbNdWfbzrWepur5
	 H2HS2qcCYzRtDbVP/HYp48XmOWn/WoklMKqHsQCEZF+PF6uBZoNWJE+SVFMlJ6oiICris
	 rLdl/ndOgVDCTw0aZwPgpBBoDKU2RbpgQ3E56O5DI9B4bsRaQ9Ro3sFDPAsDjlrI4DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=jB7VvWRC;
	arc=none smtp.remote-ip=203.254.224.24
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB90E60A260F
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 12:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB90E60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=jB7VvWRC
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261120120004epoutp01c456367c7130d4421999d3c755d3ed59~pvxCAs_N62276722767epoutp01B
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 12:00:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261120120004epoutp01c456367c7130d4421999d3c755d3ed59~pvxCAs_N62276722767epoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795176004;
	bh=beSiUkGx2GcQ6sDeEFrAxqQYgNySD4qY7mecJDY3PFQ=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=jB7VvWRC6cpNTrkUarDBfsL/KV02IzfScXAYinJvVWX0MY9bRk4IIaFa4VTPl/zus
	 lpc0qfVl2gUZKIMiRXOVWN1ktWvFKyAlT+z50zhYd5reAAzHTO5bBe6ir9bzHrId/W
	 tDF8/s71BWVI0SGSBXSA2eDcQ/Q4751kXmvsJZnE=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20261120120003epcas5p42a9645614d6e7e84d8b0738c3c6a5be6~pvxBkDI002298222982epcas5p4k;
	Fri, 20 Nov 2026 12:00:03 +0000 (GMT)
Received: from epcpadp1new (unknown [182.195.40.141]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4jWDRR43CWz6B9m5; Fri, 20 Nov
	2026 12:00:03 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261120115022epcas5p4bb5ebf4375f33b7c322985ee172b3aaf~pvokWv7aa0683106831epcas5p4c;
	Fri, 20 Nov 2026 11:50:22 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261120115020epsmtip119f548f3d33301237d65b92056d1475b~pvois-eZZ3019630196epsmtip1b;
	Fri, 20 Nov 2026 11:50:20 +0000 (GMT)
Message-ID: <339099861.21795176003555.JavaMail.epsvc@epcpadp1new>
Date: Fri, 20 Nov 2026 17:20:19 +0530
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [[RFT PATCH v2] 1/2] xhci: sideband: avoid use-after-free of
 stale virt device pointer
To: Mathias Nyman <mathias.nyman@linux.intel.com>, quic_wcheng@quicinc.com,
	hulianqin@vivo.com
Cc: linux-usb@vger.kernel.org, "cpgs@samsung.com" <cpgs@samsung.com>
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <20261119214841.1552318-2-mathias.nyman@linux.intel.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261120115022epcas5p4bb5ebf4375f33b7c322985ee172b3aaf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20261119214902epcas5p484ca32522cfa27d76dc17a732a166be7
References: <20261119214841.1552318-1-mathias.nyman@linux.intel.com>
	<CGME20261119214902epcas5p484ca32522cfa27d76dc17a732a166be7@epcas5p4.samsung.com>
	<20261119214841.1552318-2-mathias.nyman@linux.intel.com>


On 11/20/2026 3:18 AM, Mathias Nyman wrote:
> The sideband structure caches vdev, an xhci_virt_device pointer that
> the xhci driver may free and reallocate while the sideband is still
> registered, leaving the sideband with a dangling sb->vdev pointer.
>
> This can happen during resume, either when the xhci driver detects xHC
> power loss and resets the xHC, freeing all virt devices without
> informing class drivers, or during reset-resume when usb core
> re-enumerates the device and xhci frees and allocates a new virt device.
>
> Store the usb_device pointer (udev) instead. It stays valid across
> reset-resume and xHC reset.
> Look up the current virt device and ensure it still points to this
> sideband before using and dereferencing it in sideband API calls.
>
> Make sure xhci_sideband_unregister() works properly when called with
> an invalid vdev. Don't dereference it, or ask the xHC to stop non-existing
> endpoints, but make sure the sideband is properly freed.
> Fail other relevant sideband API calls that would access an invalid
> vdev.
>
> This solution isn't airtight. It only validates vdev when entering
> sideband API functions. It does not serialize the sideband API
> functions against the code in the xhci driver that reallocates vdev,
> so vdev may still be freed in the middle of a sideband call. It's still
> a big improvement and a first step in resolving this.
>
> The following patch starts working on the serialization.
>
> Fixes: de66754e9f80 ("xhci: sideband: add initial api to register a secondary interrupter entity")
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
>   drivers/usb/host/xhci-sideband.c  | 46 +++++++++++++++++++++----------
>   include/linux/usb/xhci-sideband.h |  4 +--
>   2 files changed, 34 insertions(+), 16 deletions(-)
Hi Mathias,

Thanks for your patch. Reviewed the changes its looks good to me.

Reviewed-by: Selvarasu Ganesan <selvarasu.g@samsung.com>

Thanks,
Selva


>
> diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
> index a5deeee4d5dc..e4dd298b80f1 100644
> --- a/drivers/usb/host/xhci-sideband.c
> +++ b/drivers/usb/host/xhci-sideband.c
> @@ -75,6 +75,22 @@ xhci_ring_to_sgtable(struct xhci_sideband *sb, struct xhci_ring *ring)
>   	return NULL;
>   }
>   
> +/* Return the current vdev of sb->udev, or NULL if it was freed or reallocated */
> +static struct xhci_virt_device *
> +sideband_to_vdev(struct xhci_sideband *sb)
> +{
> +	struct xhci_virt_device *vdev;
> +
> +	if (!sb->udev || !sb->udev->slot_id)
> +		return NULL;
> +
> +	vdev = sb->xhci->devs[sb->udev->slot_id];
> +	if (vdev && vdev->sideband == sb)
> +		return vdev;
> +
> +	return NULL;
> +}
> +
>   /* Caller must hold sb->mutex */
>   static void
>   __xhci_sideband_remove_endpoint(struct xhci_sideband *sb, struct xhci_virt_ep *ep)
> @@ -146,16 +162,18 @@ int
>   xhci_sideband_add_endpoint(struct xhci_sideband *sb,
>   			   struct usb_host_endpoint *host_ep)
>   {
> +	struct xhci_virt_device *vdev;
>   	struct xhci_virt_ep *ep;
>   	unsigned int ep_index;
>   
>   	guard(mutex)(&sb->mutex);
>   
> -	if (!sb->vdev)
> +	vdev = sideband_to_vdev(sb);
> +	if (!vdev)
>   		return -ENODEV;
>   
>   	ep_index = xhci_get_endpoint_index(&host_ep->desc);
> -	ep = &sb->vdev->eps[ep_index];
> +	ep = &vdev->eps[ep_index];
>   
>   	if (ep->ep_state & EP_HAS_STREAMS)
>   		return -EINVAL;
> @@ -202,9 +220,10 @@ xhci_sideband_remove_endpoint(struct xhci_sideband *sb,
>   	ep_index = xhci_get_endpoint_index(&host_ep->desc);
>   	ep = sb->eps[ep_index];
>   
> -	if (!ep || !ep->sideband || ep->sideband != sb)
> +	if (!sideband_to_vdev(sb) || !ep || ep->sideband != sb) {
> +		sb->eps[ep_index] = NULL;
>   		return -ENODEV;
> -
> +	}
>   	__xhci_sideband_remove_endpoint(sb, ep);
>   
>   	return 0;
> @@ -221,7 +240,7 @@ xhci_sideband_stop_endpoint(struct xhci_sideband *sb,
>   	ep_index = xhci_get_endpoint_index(&host_ep->desc);
>   	ep = sb->eps[ep_index];
>   
> -	if (!ep || !ep->sideband || ep->sideband != sb)
> +	if (!sideband_to_vdev(sb) || !ep || ep->sideband != sb)
>   		return -EINVAL;
>   
>   	return xhci_stop_endpoint_sync(sb->xhci, ep, 0, GFP_KERNEL);
> @@ -251,7 +270,7 @@ xhci_sideband_get_endpoint_buffer(struct xhci_sideband *sb,
>   	ep_index = xhci_get_endpoint_index(&host_ep->desc);
>   	ep = sb->eps[ep_index];
>   
> -	if (!ep || !ep->ring || !ep->sideband || ep->sideband != sb)
> +	if (!sideband_to_vdev(sb) || !ep || !ep->ring || ep->sideband != sb)
>   		return NULL;
>   
>   	return xhci_ring_to_sgtable(sb, ep->ring);
> @@ -329,7 +348,7 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
>   
>   	guard(mutex)(&sb->mutex);
>   
> -	if (!sb->vdev)
> +	if (!sideband_to_vdev(sb))
>   		return -ENODEV;
>   
>   	if (sb->ir)
> @@ -436,7 +455,7 @@ xhci_sideband_register(struct usb_interface *intf, enum xhci_sideband_type type,
>   	}
>   
>   	sb->xhci = xhci;
> -	sb->vdev = vdev;
> +	sb->udev = udev;
>   	sb->intf = intf;
>   	sb->type = type;
>   	sb->notify_client = notify_client;
> @@ -471,22 +490,21 @@ xhci_sideband_unregister(struct xhci_sideband *sb)
>   	xhci = sb->xhci;
>   
>   	scoped_guard(mutex, &sb->mutex) {
> -		vdev = sb->vdev;
> -		if (!vdev)
> -			return;
> +		vdev = sideband_to_vdev(sb);
>   
>   		for (i = 0; i < EP_CTX_PER_DEV; i++)
> -			if (sb->eps[i])
> +			if (vdev && sb->eps[i])
>   				__xhci_sideband_remove_endpoint(sb, sb->eps[i]);
>   
>   		__xhci_sideband_remove_interrupter(sb);
>   
> -		sb->vdev = NULL;
> +		sb->udev = NULL;
>   	}
>   
>   	spin_lock_irq(&xhci->lock);
>   	sb->xhci = NULL;
> -	vdev->sideband = NULL;
> +	if (vdev)
> +		vdev->sideband = NULL;
>   	spin_unlock_irq(&xhci->lock);
>   
>   	kfree(sb);
> diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-sideband.h
> index 005257085dcb..2d153cb57831 100644
> --- a/include/linux/usb/xhci-sideband.h
> +++ b/include/linux/usb/xhci-sideband.h
> @@ -39,7 +39,7 @@ struct xhci_sideband_event {
>   /**
>    * struct xhci_sideband - representation of a sideband accessed usb device.
>    * @xhci: The xhci host controller the usb device is connected to
> - * @vdev: the usb device accessed via sideband
> + * @udev: the usb device accessed via sideband
>    * @eps: array of endpoints controlled via sideband
>    * @ir: event handling and buffer for sideband accessed device
>    * @type: xHCI sideband type
> @@ -51,7 +51,7 @@ struct xhci_sideband_event {
>    */
>   struct xhci_sideband {
>   	struct xhci_hcd                 *xhci;
> -	struct xhci_virt_device         *vdev;
> +	struct usb_device		*udev;
>   	struct xhci_virt_ep             *eps[EP_CTX_PER_DEV];
>   	struct xhci_interrupter         *ir;
>   	enum xhci_sideband_type		type;

