Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4509A412294
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 06:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788504551; cv=none; b=RN3snPCOYUNtK3Cm2IFV1fake4iIt7dwbe1eEW03lDkNLsd/5bfiSMDu/zCngVKb14ZfPGLdcMhgQszsMMyosmIjdoC5ex11oFZ1J5MGACf4g/gs7xETbGdXtwQem9FNwQ/cz9EMxJxp+0D0Ry6HoATeVF0bBf2zcB098StBVI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788504551; c=relaxed/simple;
	bh=3metq0fFkU5qokO778Tq4dwFRhvn4iBLPMuY31cbVQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GtW+M9i/c9EHuBJzOGzconlN3lY13xc5rd5DPUo2tlJKEy56R/mfnyZTPDxI3Rh1yS6uO+oCeSTWCHD5wQy4W8EC5i0T/KQleOLPmNNw4QGBGuKEH4eRzdB3X8rLU5odJa8bAIOjSCMc+YWSM7fezE72HlmOE0ykll6CGjzN2l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iCQh4V14; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iCQh4V14"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 913AD1F00A3D;
	Fri,  4 Sep 2026 06:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788504548;
	bh=4IcUaIEP8qqFUIf4E6GOnxGYAFHbeHrf7gVu+c7rxz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iCQh4V14DSJKHhexdqBpadhamztLbaYjaRph8jZ8h9SR7fHPWFgNVAIzCzP8ZLb0D
	 Ya8gS7puYH8RJC4oD6J+4QkBTMw1QIR76qzBCClXKaMdSNQmwUlFMKlnVj5Y69PcPg
	 XPcddfkbWwvLTRZR35BBUMlLeRI5IuncLB8tpLiw=
Date: Fri, 4 Sep 2026 08:47:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: rivaldihormat-debug <rivaldihormat@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] i40e: fix integer overflow in i40e_dbg_command_write()
Message-ID: <2026090442-shampoo-afterglow-d8ef@gregkh>
References: <20260904063918.21213-1-rivaldihormat@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904063918.21213-1-rivaldihormat@gmail.com>

On Fri, Sep 04, 2026 at 06:39:17AM +0000, rivaldihormat-debug wrote:
> Signed-off-by: rivaldihormat-debug <rivaldihormat@gmail.com>
> ---
>  .../net/ethernet/intel/i40e/i40e_debugfs.c    | 1855 +++++++++++++++++
>  1 file changed, 1855 insertions(+)
>  create mode 100644 linux-6.6/drivers/net/ethernet/intel/i40e/i40e_debugfs.c
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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
