Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD4014A8B
	for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2026 05:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780292653; cv=none; b=YjycoLlUCdXzYJAwFBQWFnp9pEAwFjZNyr0WKqnaWsCjMUXPshh2SXwd+7EuyEbMVLHidGdC2WMxAj5NhHO0sCtkGnbydfbHrk5G/auAjgpvTpNz0vJXugx3HSsEskOxn/XcqGPqEnICAavk+YmJ29oM1Iz9PEUQD7CTCkMEodY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780292653; c=relaxed/simple;
	bh=hk750NYhlKOMzWub3pPu33E2MYch0PsKBYOjxJOv2EE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=axbxfP9JMmfnBh757rEly304Pb9vFgOXaz77MGCbB12C0v1h3FFqRH21z3cX0rZwUuvJZnG5TxJahHjcNXQKtkLh1DjgktoHgtFfDJub7Yg9MphWeyxXX6wzVLj5S3aYQOHbAWEwvivyq4dHkYzooFvpqoD+QZ1pIpdl0DHre1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Fxq+9+nv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Fxq+9+nv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7F9F1F00893;
	Mon,  1 Jun 2026 05:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1780292652;
	bh=cAmfmcs46OCwYzGe2CZ9FiQT0k9DETufJE2d6YqGz3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fxq+9+nvnYgcb+tq88YpvFmns23JxEKnOwKi//RXdk9iI13VVtARv0nfCZ89RWSna
	 2EbLoWfk9bwj1/kWVBUxRVuuDi3iY1F2havzja2nZtm8pr7dvoPoiOZBdLEkhO16ss
	 Vb5mGG4EjTRbxByYwVc+Kd8Emym4AWm7Vqlv4kcM=
Date: Mon, 1 Jun 2026 07:43:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ginger <ginger.jzllee@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [bug report] Potential order bug in 'drivers/usb/misc/ldusb.c',
 mainly in 'ld_usb_disconnect()'
Message-ID: <2026060157-pettiness-corporal-05eb@gregkh>
References: <CAGp+u1a_9JNnadwUmCTPAWrs=nxL2KJbxr=tzo7BiJBYzFcpsQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGp+u1a_9JNnadwUmCTPAWrs=nxL2KJbxr=tzo7BiJBYzFcpsQ@mail.gmail.com>

On Mon, Jun 01, 2026 at 12:10:37PM +0800, Ginger wrote:
> Dear Linux kernel maintainers,
> 
> My research-based static analyzer found a potential order bug within
> the 'drivers/usb/misc' subsystem, more specifically, in
> 'drivers/usb/misc/ldusb.c'.
> 
> This potential issue is similar to a previously reported one
> (https://lore.kernel.org/linux-usb/2026042444-freeing-consumer-468b@gregkh/).
> It is present as of git commit eb3f4b7426cfd2b79d65b7d37155480b32259a11.
> 
> Potential concurrent triggering executions:
> T0:
> ld_usb_disconnect
>     --> usb_set_intfdata(interface, NULL); [t0]
>     --> usb_deregister_dev(interface, &ld_usb_class);
>          --> usb_minors[intf->minor] = NULL; [t2]
> T1:
> usb_open
>    --> new_fops = fops_get(usb_minors[iminor(inode)]); [t1]
>    --> err = file->f_op->open(inode, file);
>        --> ...
>        --> ld_usb_open
>              --> dev = usb_get_intfdata(interface); [t3]
> 
> In T0, the interface is nullified before its get deregistered. Thus,
> it is possible for T1 to still get the usb dev and access it via the
> interface, which, however, has already been nullified.
> The concurrent buggy order is t0 -> t1 -> t2 -> t3.
> 
> Thank you for your time and consideration.

If you think this needs to be fixed, please just send a patch for it and
we can evaluate it that way.

thanks,

greg k-h
