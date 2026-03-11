Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347933A383F;
	Wed, 11 Mar 2026 14:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773238666; cv=none; b=l98Zj5Q2Zicz9tZNtHvWSrhrXAQuvy/1XTiPpzICqjEPVMYF+UwKCzG8Uv0ypL8sqfJd2s1z3JnaQCc8UksyxwnkXX8GyOvrw/gemlfodKuLQJYO3b0lznR5nZX1GyQpeue5IznlFvmcP8F8WhmsOjF1cvxXwNg8d25uZaEZ9yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773238666; c=relaxed/simple;
	bh=AMuuGCKvPqzJhnSuUlzHy+ZI7cHetm3b4PRD7AqEk0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uIgpn/oPon8eJxBtvYNpEgWqIbzEgBlJJvlNaYdxUMOMuapD+sKlxv38M1FzbAa20PiFnTmJIMsgN+jB0m6Amz4/J15da+sqWQTCl1p99Q+8iZK9H6NaB2JXKkCuE56vtJYKpwKqGhbx1WnG12yzA2jbZYTJHzUXg9rdEew+FQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=toQJ1zkY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="toQJ1zkY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD4EC4CEF7;
	Wed, 11 Mar 2026 14:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773238665;
	bh=AMuuGCKvPqzJhnSuUlzHy+ZI7cHetm3b4PRD7AqEk0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=toQJ1zkYXp0JrETUn+IprG4JhF6t+mjfnHW/q34ThW12czB9g+R41/3ivpoetSefX
	 qziAnpzR3a0/3g/leXshqSM8xdUQ7dO6gc5OEzO8NO12bQmsJ/nYVrkY3Sh05MOmPH
	 m6Dk9FSKPYRSRgLo2f9s5zptlfZ2QKJMnwMICynE=
Date: Wed, 11 Mar 2026 15:17:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: xiaoxiao_li <lxxstone@gmail.com>
Cc: hminas@synopsys.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc2: exit clock_gating when stopping udc caused
 deadlock
Message-ID: <2026031116-canine-blimp-94ae@gregkh>
References: <20260310080000.3164692-1-lxxstone@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310080000.3164692-1-lxxstone@gmail.com>

On Tue, Mar 10, 2026 at 04:00:00PM +0800, xiaoxiao_li wrote:
> dwc2_gadget_exit_clock_gating invoke call_gadget to hold hsotg->lock,
> causing dwc2_hsotg_ep_disable_lock unable to acquire the lock,
> lead to a deadlock.
> 
> To ensure that enabling clock gating before stopping UDC does not
> cause the deadlock, we lock exit_clock_gating using
> spin_lock_irqsave and spin_unlock_irqrestore.
> 
> Signed-off-by: xiaoxiao_li <lxxstone@gmail.com>

Please use your real name for your From: and Signed-off-by: line.


> ---
>  drivers/usb/dwc2/gadget.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index d216e26c7..c8b02c27d 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -4607,7 +4607,9 @@ static int dwc2_hsotg_udc_stop(struct usb_gadget *gadget)
>  	/* Exit clock gating when driver is stopped. */
>  	if (hsotg->params.power_down == DWC2_POWER_DOWN_PARAM_NONE &&
>  	    hsotg->bus_suspended && !hsotg->params.no_clock_gating) {
> +		spin_lock_irqsave(&hsotg->lock, flags);
>  		dwc2_gadget_exit_clock_gating(hsotg, 0);
> +		spin_unlock_irqrestore(&hsotg->lock, flags);

If the call to dwc2_gadget_exit_clock_gating() wants the lock, how will
calling it outside of it fix the problem?  I'm confused by your
changelog text, what am I missing here?  And what changed to cause this
to not work properly?

thanks,

greg k-h
