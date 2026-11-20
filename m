Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795176012;
	b=Ovpdh8bsDyAk3nVk67S+B5p7lFeBcoeZtWclC7VFa1N291BSf1pyabFJwgjO2f2fW2Ee
	 05zf0PW9J6k1cT+qYP9QCRy4Za6qYEq1TzzfNFUGdxvtT+TXFEROeLmcYtdZnBZwEOl2+
	 vQ50bktUzN2gwpXivoMQ0VRR2PVcyQ60DiGRR9lO23gsWO2SzIPVtWMJOkM8CbuDnyNGg
	 eBBQ5ZQpBT3xfsf+A907HUUTNLFH3N/RpRgKpeLX2kqY0ZWGWfDOn50SxLQ7hB1kfL8Ow
	 unX230yrpMWBWY6u3ghOB3cdejEJG6qiY8GTVLYqW6l5/EYJ/JWg6xN0j4bix88TBAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176012;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 Cc:Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:CMS-TYPE:X-CPGSPASS:
	 X-Hop-Count:X-CMS-RootMailID:References;
	bh=pXokVW6ojwkSbE2zUUHGwfyeCuC41rGySdWmb3y+02Q=;
	b=hDsCwXWE1yAWrAmTi901Xz1MXjghxla2kzPUsBivrEPu8E+UMClnpyhwHfgkzrjFqdkC
	 kCSsXEufBmGrgQMMwZINcWppMwV0ySf4EYjFp+KiezzsAc/OaaOgBpK5R5mjj7dwMA0ZV
	 QcweDACKO5aelal9U95vevcCD5CEMP+ec2FUPrdMlNYL7AJkNpuyg3Qx1UcpnQ2cnNQ/8
	 SMn+BeW+52rqJA/ZkH6Az1AmuYQhbo5p9sxKhUygmMpLy+rqWWNt+EXXZKSexuDeSfEM9
	 veTkzqJ5MkInwgSyWzNm7ey7VQgCp+ttr0RRM3bWzmgktEToZRPwxZj+k7C/8lHpaqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=EkzRsols;
	arc=none smtp.remote-ip=203.254.224.34
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F1960A263E
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 12:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3F1960A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=EkzRsols
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20261120120004epoutp044b13ba1fb261270b18cbf36ffcee6a75~pvxCH92XT1902619026epoutp04a
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 12:00:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20261120120004epoutp044b13ba1fb261270b18cbf36ffcee6a75~pvxCH92XT1902619026epoutp04a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795176004;
	bh=pXokVW6ojwkSbE2zUUHGwfyeCuC41rGySdWmb3y+02Q=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=EkzRsolsKbuOeI0rZ6gZqCNZOM36aM1N1G7lRi9+0pypFkbvN/VmuCMkG5Y3pooac
	 4ylzlRcvXLPqPCmm0WAD6FBCOUCJRWfTwFQwC5zR+huhD84XEOZO4wS1aYcN2/cyZf
	 j3f9p9ouwfGSHGOHm7+yCPWaW0K6wV1IPGIPPmuk=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261120120003epcas5p17cd037628eb3ad848681912a935b7234~pvxBtQ9hi2740127401epcas5p1W;
	Fri, 20 Nov 2026 12:00:03 +0000 (GMT)
Received: from epcpadp1new (unknown [182.195.40.141]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4jWDRR599jz6B9m6; Fri, 20 Nov
	2026 12:00:03 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20261120115130epcas5p1d07df643a0ac951b865e42a69ab90819~pvpjz5qUc1479514795epcas5p11;
	Fri, 20 Nov 2026 11:51:30 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261120115129epsmtip10856cd2a242d1efa2887f691e9f6bbf0~pvpjGKn9g0179201792epsmtip1D;
	Fri, 20 Nov 2026 11:51:29 +0000 (GMT)
Message-ID: <1524126153.41795176003711.JavaMail.epsvc@epcpadp1new>
Date: Fri, 20 Nov 2026 17:21:27 +0530
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
Subject: Re: [[RFT PATCH v2] 2/2] xhci: sideband: check virt device under
 xhci lock when stopping endpoints
To: Mathias Nyman <mathias.nyman@linux.intel.com>, quic_wcheng@quicinc.com,
	hulianqin@vivo.com
Cc: linux-usb@vger.kernel.org, "cpgs@samsung.com" <cpgs@samsung.com>
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <20261119214841.1552318-3-mathias.nyman@linux.intel.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261120115130epcas5p1d07df643a0ac951b865e42a69ab90819
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20261119214908epcas5p41cce5fbacd3c1f5eac70c1c1692811b6
References: <20261119214841.1552318-1-mathias.nyman@linux.intel.com>
	<CGME20261119214908epcas5p41cce5fbacd3c1f5eac70c1c1692811b6@epcas5p4.samsung.com>
	<20261119214841.1552318-3-mathias.nyman@linux.intel.com>


On 11/20/2026 3:18 AM, Mathias Nyman wrote:
> Start work to protect sideband API functions against the xhci driver
> freeing or reallocating the virt device (vdev) in the middle of an API
> call.
>
> Make the following sideband API calls hold xhci->lock while validating
> the vdev and its endpoint, and while queueing the stop endpoint command:
>
> xhci_sideband_unregister()
> xhci_sideband_stop_endpoint()
> xhci_sideband_remove_endpoint()
>
> Locking changes are still needed in several xhci 'core' driver vdev free
> paths before the above calls are fully serialized against vdev free.
> Cases involve xHC reset in resume, enumeration retry, and reset-resume.
>
> Move the stop endpoint code from xhci_stop_endpoint_sync() in xhci.c to
> a new sideband_stop_endpoint_sync() helper in xhci-sideband.c.
>
> xhci_stop_endpoint_sync() has no other users, so remove it.
>
> Also take sb->mutex in xhci_sideband_stop_endpoint(), and keep holding
> it in xhci_sideband_unregister() until the sideband is detached from the
> vdev.
>
> Fixes: de66754e9f80 ("xhci: sideband: add initial api to register a secondary interrupter entity")
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
>   drivers/usb/host/xhci-sideband.c | 121 ++++++++++++++++++++++---------
>   drivers/usb/host/xhci.c          |  55 --------------
>   drivers/usb/host/xhci.h          |   2 -
>   3 files changed, 87 insertions(+), 91 deletions(-)


Reviewed-by: Selvarasu Ganesan <selvarasu.g@samsung.com>

Thanks,
Selva
>
> diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
> index e4dd298b80f1..6f7712f95033 100644
> --- a/drivers/usb/host/xhci-sideband.c
> +++ b/drivers/usb/host/xhci-sideband.c
> @@ -91,20 +91,78 @@ sideband_to_vdev(struct xhci_sideband *sb)
>   	return NULL;
>   }
>   
> -/* Caller must hold sb->mutex */
> -static void
> -__xhci_sideband_remove_endpoint(struct xhci_sideband *sb, struct xhci_virt_ep *ep)
> +/*
> + * Synchronous xHCI stop endpoint helper. Issues a stop endpoint command and
> + * waits for the command completion before returning. This does not call
> + * xhci_handle_cmd_stop_ep(), which has additional handling for 'context error'
> + * cases, along with transfer ring cleanup.
> + *
> + * Caller must hold sb->mutex
> + */
> +static int
> +sideband_stop_endpoint_sync(struct xhci_sideband *sb, unsigned int ep_index,
> +			    bool remove)
>   {
> +	struct xhci_virt_device *vdev;
> +	struct xhci_command *cmd;
> +	struct xhci_virt_ep *ep;
> +	struct xhci_ep_ctx *ctx;
> +	unsigned long flags;
> +	int ret = -ENODEV;
> +
>   	lockdep_assert_held(&sb->mutex);
>   
> -	/*
> -	 * Issue a stop endpoint command when an endpoint is removed.
> -	 * The stop ep cmd handler will handle the ring cleanup.
> -	 */
> -	xhci_stop_endpoint_sync(sb->xhci, ep, 0, GFP_KERNEL);
> +	cmd = xhci_alloc_command(sb->xhci, true, GFP_KERNEL);
> +
> +	spin_lock_irqsave(&sb->xhci->lock, flags);
> +
> +	vdev = sideband_to_vdev(sb);
> +	ep = sb->eps[ep_index];
> +
> +	/* validate that xhci didn't reallocate vdev during reset or resume */
> +	if (!vdev || !ep || ep->sideband != sb)
> +		goto out_unlock;
> +
> +	if (remove) {
> +		ep->sideband = NULL;
> +		/* endpoint is removed, not running is not an error */
> +		ret = 0;
> +	}
> +
> +	if (!ep->ring)
> +		goto out_unlock;
> +
> +	/* Stop the endpoint if it's running */
> +	ctx = xhci_get_ep_ctx(sb->xhci, vdev->out_ctx, ep_index);
> +	if (GET_EP_CTX_STATE(ctx) == EP_STATE_RUNNING) {
> +		if (!cmd) {
> +			ret = -ENOMEM;
> +			goto out_unlock;
> +		}
> +		ret = xhci_queue_stop_endpoint(sb->xhci, cmd, vdev->slot_id,
> +					       ep_index, 0);
> +		if (ret)
> +			goto out_unlock;
> +
> +		xhci_ring_cmd_db(sb->xhci);
> +		spin_unlock_irqrestore(&sb->xhci->lock, flags);
> +		wait_for_completion(cmd->completion);
> +
> +		if (cmd->status == COMP_COMMAND_ABORTED ||
> +		    cmd->status == COMP_COMMAND_RING_STOPPED) {
> +			xhci_warn(sb->xhci, "Timeout while waiting for stop endpoint command\n");
> +			ret = -ETIME;
> +		}
> +		xhci_free_command(sb->xhci, cmd);
> +		return ret;
> +	}
>   
> -	ep->sideband = NULL;
> -	sb->eps[ep->ep_index] = NULL;
> +out_unlock:
> +	spin_unlock_irqrestore(&sb->xhci->lock, flags);
> +	if (cmd)
> +		xhci_free_command(sb->xhci, cmd);
> +
> +	return ret;
>   }
>   
>   /* Caller must hold sb->mutex */
> @@ -212,21 +270,17 @@ int
>   xhci_sideband_remove_endpoint(struct xhci_sideband *sb,
>   			      struct usb_host_endpoint *host_ep)
>   {
> -	struct xhci_virt_ep *ep;
>   	unsigned int ep_index;
> +	int ret;
>   
>   	guard(mutex)(&sb->mutex);
>   
>   	ep_index = xhci_get_endpoint_index(&host_ep->desc);
> -	ep = sb->eps[ep_index];
>   
> -	if (!sideband_to_vdev(sb) || !ep || ep->sideband != sb) {
> -		sb->eps[ep_index] = NULL;
> -		return -ENODEV;
> -	}
> -	__xhci_sideband_remove_endpoint(sb, ep);
> +	ret = sideband_stop_endpoint_sync(sb, ep_index, true);
> +	sb->eps[ep_index] = NULL;
>   
> -	return 0;
> +	return ret;
>   }
>   EXPORT_SYMBOL_GPL(xhci_sideband_remove_endpoint);
>   
> @@ -234,16 +288,13 @@ int
>   xhci_sideband_stop_endpoint(struct xhci_sideband *sb,
>   			    struct usb_host_endpoint *host_ep)
>   {
> -	struct xhci_virt_ep *ep;
>   	unsigned int ep_index;
>   
> -	ep_index = xhci_get_endpoint_index(&host_ep->desc);
> -	ep = sb->eps[ep_index];
> +	guard(mutex)(&sb->mutex);
>   
> -	if (!sideband_to_vdev(sb) || !ep || ep->sideband != sb)
> -		return -EINVAL;
> +	ep_index = xhci_get_endpoint_index(&host_ep->desc);
>   
> -	return xhci_stop_endpoint_sync(sb->xhci, ep, 0, GFP_KERNEL);
> +	return sideband_stop_endpoint_sync(sb, ep_index, false);
>   }
>   EXPORT_SYMBOL_GPL(xhci_sideband_stop_endpoint);
>   
> @@ -489,24 +540,26 @@ xhci_sideband_unregister(struct xhci_sideband *sb)
>   
>   	xhci = sb->xhci;
>   
> -	scoped_guard(mutex, &sb->mutex) {
> -		vdev = sideband_to_vdev(sb);
> -
> -		for (i = 0; i < EP_CTX_PER_DEV; i++)
> -			if (vdev && sb->eps[i])
> -				__xhci_sideband_remove_endpoint(sb, sb->eps[i]);
> +	mutex_lock(&sb->mutex);
>   
> -		__xhci_sideband_remove_interrupter(sb);
> -
> -		sb->udev = NULL;
> +	for (i = 0; i < EP_CTX_PER_DEV; i++) {
> +		if (sb->eps[i]) {
> +			sideband_stop_endpoint_sync(sb, i, true);
> +			sb->eps[i] = NULL;
> +		}
>   	}
> +	__xhci_sideband_remove_interrupter(sb);
>   
>   	spin_lock_irq(&xhci->lock);
> -	sb->xhci = NULL;
> +	vdev = sideband_to_vdev(sb);
>   	if (vdev)
>   		vdev->sideband = NULL;
> +	sb->udev = NULL;
> +	sb->xhci = NULL;
>   	spin_unlock_irq(&xhci->lock);
>   
> +	mutex_unlock(&sb->mutex);
> +
>   	kfree(sb);
>   }
>   EXPORT_SYMBOL_GPL(xhci_sideband_unregister);
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 30ac1bc4559b..bcb482795bbc 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -2883,61 +2883,6 @@ static int xhci_reserve_bandwidth(struct xhci_hcd *xhci,
>   	return -ENOMEM;
>   }
>   
> -/*
> - * Synchronous XHCI stop endpoint helper.  Issues the stop endpoint command and
> - * waits for the command completion before returning.  This does not call
> - * xhci_handle_cmd_stop_ep(), which has additional handling for 'context error'
> - * cases, along with transfer ring cleanup.
> - *
> - * xhci_stop_endpoint_sync() is intended to be utilized by clients that manage
> - * their own transfer ring, such as offload situations.
> - */
> -int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep, int suspend,
> -			    gfp_t gfp_flags)
> -{
> -	struct xhci_command *command;
> -	struct xhci_ep_ctx *ep_ctx;
> -	unsigned long flags;
> -	int ret = -ENODEV;
> -
> -	command = xhci_alloc_command(xhci, true, gfp_flags);
> -	if (!command)
> -		return -ENOMEM;
> -
> -	spin_lock_irqsave(&xhci->lock, flags);
> -
> -	/* make sure endpoint exists and is running before stopping it */
> -	if (ep->ring) {
> -		ep_ctx = xhci_get_ep_ctx(xhci, ep->vdev->out_ctx, ep->ep_index);
> -		if (GET_EP_CTX_STATE(ep_ctx) == EP_STATE_RUNNING)
> -			ret = xhci_queue_stop_endpoint(xhci, command,
> -						       ep->vdev->slot_id,
> -						       ep->ep_index, suspend);
> -	}
> -
> -	if (ret < 0) {
> -		spin_unlock_irqrestore(&xhci->lock, flags);
> -		goto out;
> -	}
> -
> -	xhci_ring_cmd_db(xhci);
> -	spin_unlock_irqrestore(&xhci->lock, flags);
> -
> -	wait_for_completion(command->completion);
> -
> -	/* No handling for COMP_CONTEXT_STATE_ERROR done at command completion*/
> -	if (command->status == COMP_COMMAND_ABORTED ||
> -	    command->status == COMP_COMMAND_RING_STOPPED) {
> -		xhci_warn(xhci, "Timeout while waiting for stop endpoint command\n");
> -		ret = -ETIME;
> -	}
> -out:
> -	xhci_free_command(xhci, command);
> -
> -	return ret;
> -}
> -EXPORT_SYMBOL_GPL(xhci_stop_endpoint_sync);
> -
>   /*
>    * xhci_usb_endpoint_maxp - get endpoint max packet size
>    * @host_ep: USB host endpoint to be checked
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index ec4bfeb4887c..6201b6b24252 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1963,8 +1963,6 @@ void xhci_cleanup_command_queue(struct xhci_hcd *xhci);
>   void inc_deq(struct xhci_hcd *xhci, struct xhci_ring *ring);
>   unsigned int count_trbs(u64 addr, u64 len);
>   unsigned int xhci_num_trbs_free(struct xhci_ring *ring);
> -int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
> -			    int suspend, gfp_t gfp_flags);
>   void xhci_process_cancelled_tds(struct xhci_hcd *xhci, struct xhci_virt_ep *ep);
>   void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
>   			      struct xhci_interrupter *ir,

