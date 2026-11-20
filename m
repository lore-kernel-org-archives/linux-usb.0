Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177639;
	b=z7X8wsaNSkEvSuVrx67inmXCIzasU2I8wRT/uyPPZ/BCYfVp/J5KPTXWBhQm6sJ7g4Lr
	 vGfC7mTgIODXF+Q/pH+LMrlPsaXd8Qvf1tDhrFf5lBUoG+Qiq4hlBmzs9n6qHWaMBVCq3
	 +K+crcFiRS7XUwdyM03jvU7zfIuB6EGFDtf9u0bWBaVK3rhQrvb8LmMDa/+FCMH9hW2hp
	 pnr6w4KEUEU88lxhCkuxwZHYmy1o+yOUohhCrDeEBJ/jN7tWmUT6hiEq5o7iIf5dzB84a
	 zS0GmQhX7NBZxF/4BdHSotcQrmoX8kkF6egsK97MoCBRmvzo95SxJ7w06rWqnerz1ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177639;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=AcAKXow4k7nAsz4NvTf98ZQKCNLbRCZ9q0bbUe/mxCg=;
	b=ZAUz1aSbnhJR34+oM9hcgg+PSQz3IqH6UrYGWFX5q+r/SwRzv3LhgK6NlnC/wJ5lSrqS
	 fRL6xODQpnBo7ezdpbeWUxk4ls5lOAsP9RKi3oDw8S3a0UNcH7iXrDdPYeiy9yB3NAFly
	 o6+OcQ5KiCpBlUmPDNwk363N0gJlPY13gGo/D7jLZase0C/VL2gdtROBFffRlzPPkaxah
	 Y1zmjzKFNDibGRCNo7ZUZIkrK0xUh1vh1mX5UNKfqeXBkRqe0Mg6uu0zxjYj8gEHp/fME
	 IjKQxU2cYHO8B3O4HpbFDfdnfIhit9zePKyfhIDlTuXNkcOVpVymjzg+0D7jPzXXXLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="a+l/+NdJ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED17606A32A;
	Fri, 20 Nov 2026 12:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=a+l/+NdJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174611F000C4;
	Fri, 20 Nov 2026 12:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795177638;
	bh=AcAKXow4k7nAsz4NvTf98ZQKCNLbRCZ9q0bbUe/mxCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a+l/+NdJlosvbvrFz8skxFt+7lH/BYqPvJI/SIcdwvR35/YhtHI7xEaNR9/SQwDck
	 OoIenHKHOWWbZUzANxx/C2LIM3aPEhDag+j8O3HOCKVuRuQ5ofCbLJQGgQsjZzwR+r
	 ooAKISbCoLcv8rQ3xxP8xWsrEuXt8CeRSaJKKObE=
Date: Fri, 20 Nov 2026 13:27:16 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Fangwen Deng <fangwen.deng@mediatek.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	jarried.lin@mediatek.com, vince-wl.liu@mediatek.com,
	justin.yeh@mediatek.com
Subject: Re: [PATCH] usb: mtu3: cancel EP0 requests to prevent use-after-free
Message-ID: <2026112053-curtain-astound-bf4e@gregkh>
References: <20261106080140.342107-1-fangwen.deng@mediatek.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106080140.342107-1-fangwen.deng@mediatek.com>

On Fri, Nov 06, 2026 at 04:00:58PM +0800, Fangwen Deng wrote:
> mtu3_ep0_dequeue() always returns -EINVAL and leaves the request on
> mep->req_list without unlinking or completing it, so an EP0 request
> can never be cancelled.
> 
> FunctionFS assigns its temporary read buffer to ep0req and waits in
> __ffs_ep0_queue_wait(). When that wait is interrupted by a signal it
> calls usb_ep_dequeue(), does not check the return value, and its
> caller ffs_ep0_read() frees the buffer on every exit path. With
> -EINVAL returned the request stays queued and MTU3 still owns it.
> When the host then sends the OUT data stage, ep0_rx_state() writes
> the received bytes through the stale req->buf, giving the host a
> content-controlled write into freed kernel memory. That corrupts
> whichever object reuses the slab and can panic the kernel.
> 
> Implement mtu3_ep0_dequeue() following mtu3_gadget_dequeue() but
> without QMU flush/start since EP0 uses PIO: validate the request
> under mtu->lock, unlink it once and give it back with -ECONNRESET,
> so ownership of the buffer returns to FunctionFS before it is freed.
> 
> Cancelling the request that backed the data stage also leaves the
> transfer unable to finish, so retire the aborted transaction with a
> protocol stall. That returns ep0_state to SETUP and stops a later
> ep0_queue() from reading this transaction's leftover FIFO data into
> the next request's buffer. The stall is skipped when the controller
> is already powered down or no data stage is in flight.
> 
> The same stub is why functionfs_unbind() cannot cancel a pending EP0
> request, which deadlocks against the FunctionFS thread holding
> ffs->mutex.
> 
> Fixes: df2069acb005 ("usb: Add MediaTek USB3 DRD driver")
> Signed-off-by: Fangwen Deng <fangwen.deng@mediatek.com>
> ---
>  drivers/usb/mtu3/mtu3_gadget_ep0.c | 55 ++++++++++++++++++++++++++++--
>  1 file changed, 53 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/mtu3/mtu3_gadget_ep0.c b/drivers/usb/mtu3/mtu3_gadget_ep0.c
> index e4fd1bb14a55..73a1af8b6c65 100644
> --- a/drivers/usb/mtu3/mtu3_gadget_ep0.c
> +++ b/drivers/usb/mtu3/mtu3_gadget_ep0.c
> @@ -857,8 +857,59 @@ static int mtu3_ep0_queue(struct usb_ep *ep,
>  
>  static int mtu3_ep0_dequeue(struct usb_ep *ep, struct usb_request *req)
>  {
> -	/* we just won't support this */
> -	return -EINVAL;
> +	struct mtu3_ep *mep;
> +	struct mtu3_request *mreq = NULL;
> +	struct mtu3_request *r = NULL;
> +	struct mtu3 *mtu;
> +	unsigned long flags;
> +	int ret = 0;
> +
> +	if (!ep || !req)
> +		return -EINVAL;
> +
> +	mep = to_mtu3_ep(ep);
> +	mtu = mep->mtu;
> +
> +	spin_lock_irqsave(&mtu->lock, flags);
> +
> +	mreq = to_mtu3_request(req);
> +
> +	dev_dbg(mtu->dev, "%s : req=%p\n", __func__, req);

Don't add "trace" calls like this.  And __func__ is NEVER needed for a
dev_dbg() call.

thanks,

greg k-h
