Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AAC25B0B9
	for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2026 14:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783692086; cv=none; b=QOBq7rsezbVeVW7/xiEceAHNFxEB2EBKOG/+H2aNkAS1+MGvbzW9OtpZTZrcj5xifSnF4EUnVRaosnMa+F0kZQFqwUos+ZQAq7TJ84U4QY8FPQ85GrthRHeZjd8s7WQ7f7U/bpL2z0ostWI5/fFXwkZgal/txGrcFF3mJRN39rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783692086; c=relaxed/simple;
	bh=KQ4bKsrc/xK1yeeXuK06Qp80BYbK3OO9EfBduyj7sE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZPWM0cHAoWvOuom1LKs9dm1IFJKVZbu5tliw05Xe68XOWvwzK7X0yXJJ8ff6NeTvay/NN44mLuy/BSkKeC0x3fcmV9FBujCQTCbi6aHUC7AQjQCUsBefJh0SG7O3paV4fEDm95kYdOOU67Ptqu/IGWsCbel9fLx59Exm0+Yd3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=spLPQFX8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="spLPQFX8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A9401F000E9;
	Fri, 10 Jul 2026 14:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783692084;
	bh=fqw2ZT7Xbye+cU8YqbJ0k/lcNr9ZCyosy+wOdTWbsgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=spLPQFX84f7AdDXLGwn6A7t2J54Lre5a7sTzDLNAUa/1/9ntt7qSQ/5t8ush/rSAB
	 TktXWUZD5YuNhr17v3/nQdLfiDVGqk3NvWbZedFd8iI+TPC7r+5qiZtgE1lykALttH
	 W0y+0GBjNSwC5fbO3qXqqxix7/KzWaMIBVVkpZ50=
Date: Fri, 10 Jul 2026 16:01:20 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zhenghang Xiao <kipreyyy@gmail.com>
Cc: Paul Cercueil <paul@crapouillou.net>, security@kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH usb-gadget] usb: gadget: f_fs: clear stale priv->req/ep
 on DMA-BUF transfer completion
Message-ID: <2026071030-skedaddle-camisole-6295@gregkh>
References: <20260523152739.66340-1-kipreyyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523152739.66340-1-kipreyyy@gmail.com>

On Sat, May 23, 2026 at 11:27:39PM +0800, Zhenghang Xiao wrote:
> ffs_epfile_dmabuf_io_complete() frees the usb_request via
> usb_ep_free_request() but never clears priv->req or priv->ep. When the
> host later triggers endpoint disable (via SET_INTERFACE, disconnect, or
> gadget unbind), the completion fires and frees req, leaving priv->req as
> a dangling pointer. A subsequent close() or FUNCTIONFS_DMABUF_DETACH
> ioctl then passes the stale pointer to usb_ep_dequeue(), resulting in a
> use-after-free on the freed kmalloc-128 object.
> 
> Walk back from req->context to the ffs_dma_fence and its priv, then
> clear priv->req and priv->ep before freeing the request. The cleanup
> paths in ffs_epfile_release() and ffs_dmabuf_detach() already check for
> NULL under eps_lock before calling usb_ep_dequeue().
> 
> Fixes: 7b07a2a7ca02 ("usb: gadget: functionfs: Add DMABUF import interface")
> Signed-off-by: Zhenghang Xiao <kipreyyy@gmail.com>
> ---
>  drivers/usb/gadget/function/f_fs.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 002c3441bea3..88d3e89c21b7 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -1413,8 +1413,13 @@ static void ffs_dmabuf_signal_done(struct ffs_dma_fence *dma_fence, int ret)
>  static void ffs_epfile_dmabuf_io_complete(struct usb_ep *ep,
>  					  struct usb_request *req)
>  {
> +	struct ffs_dma_fence *fence = req->context;
> +	struct ffs_dmabuf_priv *priv = fence->priv;
> +
>  	pr_vdebug("FFS: DMABUF transfer complete, status=%d\n", req->status);
> -	ffs_dmabuf_signal_done(req->context, req->status);
> +	ffs_dmabuf_signal_done(fence, req->status);
> +	priv->req = NULL;
> +	priv->ep = NULL;
>  	usb_ep_free_request(ep, req);
>  }
>  
> -- 
> 2.50.1 (Apple Git-155)
> 
> 

Does not apply to the latest usb-linus tree, are you sure this is still
an issue on the latest release?

thanks,

greg k-h
