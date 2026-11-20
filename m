Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185572;
	b=ANcgCelmao5b/gahbhUvADA0P36Z2YSm3Sep5tFxUuUscY5NU9My13T5OSKoAm7yBN8G
	 mcN8Ei8bw7NjJOoTdpF04Bm9DxE0x6bvAPymOtxKGn2LaLss0ZoEul5Ixy3YEMpV5ILeH
	 Qj1kaxo+1Slsm2ofFW/OaFnD5dHEoJNtvjn35vjttGftzy/OPDo8uSHTVPMx8+EFK3QQU
	 prVmL9Wt0hpVYJgtV/gqbjMpEY35clzKLNQR/6ESXZwNfcZMf7FwMhgsTO6ij9x7Gzzqj
	 HCrkwpdgJ9UQsqST7ZiX2YlwLRcFaB4jQ/9eB2oyTdoFYulzphI863sRWXmbPtvzD6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185572;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=XpZQjmKZxreog+ab3lD9lfvx3xegG1hms1E5VdEVsKs=;
	b=5IyrIDXM0iFOUQH3OLCLZdoEBVGy/yrS+7EtRWB4lPXw435LNRk/YZKCzBYLjb6CmoGq
	 xcklk40hEF4UgFYQR+W8SfZqwJQZLloZxF3y+Kct+Dx5YMb6dy3737iPp9MurrcE200Bh
	 Fb5JRYCrC2tnPe2/wKNL9YMiM661c5hzUJnVwziEgEryFsjQaZeQZ9oiqVVVBxrLhTSl5
	 fMshQWDq2NjqogYLXk5yqW3UIJuhsZMRNdYBU3O/PNENYSYlQ7dwUWUVjqA0eKEXA0I6a
	 f0jfVaPQIUFYTYWC6ElWaWG80AY3ivZyv5xWeJcrU+MHP0dBmAxsm3ry+CZUk7rpjAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=y1xUy+3Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BD8606A320;
	Fri, 20 Nov 2026 14:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=y1xUy+3Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332BD1F000C4;
	Fri, 20 Nov 2026 14:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795185571;
	bh=XpZQjmKZxreog+ab3lD9lfvx3xegG1hms1E5VdEVsKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=y1xUy+3QLq86FEgq75E5RICGCJxvdjLTmZuOsW6jOkqm9qsI8C95xg3cRqafvAvSj
	 qW8Abo4VAZbV5Cl4EaiC5MkIDegdWk4+W1J0e5CJfBaOykkVklMHIf+ylIjNf1wWXv
	 6W2PuOOLqlN3LFBsEgKCUOxKiHWq6S4b0MhVIUj4=
Date: Fri, 20 Nov 2026 15:39:29 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Liu Junyuan <2058432396@qq.com>
Cc: nkapron@google.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+2a7ce560c30c4ca3bc22@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: gadget: udc: handle NULL request in tracepoint
Message-ID: <2026112010-unwritten-fretted-e3f7@gregkh>
References: <tencent_08E401ED34EC47C550C71A0462C8161D5D05@qq.com>
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
In-Reply-To: <tencent_08E401ED34EC47C550C71A0462C8161D5D05@qq.com>

On Wed, Nov 11, 2026 at 02:28:01PM +0800, Liu Junyuan wrote:
> usb_ep_alloc_request() passes a NULL request to
> trace_usb_ep_alloc_request() when ep->ops->alloc_request() fails.
> The udc_log_req tracepoint assumes req is non-NULL and dereferences
> req->length, causing a NULL pointer dereference.
> 
> Make the tracepoint handle req == NULL so allocation failures can still
> be recorded safely.
> 
> Reported-by: syzbot+2a7ce560c30c4ca3bc22@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=2a7ce560c30c4ca3bc22
> Fixes: 5e42d710a108 ("usb: gadget: add tracepoints to the gadget API")
> Signed-off-by: Liu Junyuan <2058432396@qq.com>
> ---
>  drivers/usb/gadget/udc/trace.h | 30 +++++++++++++++++++++---------
>  1 file changed, 21 insertions(+), 9 deletions(-)
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
