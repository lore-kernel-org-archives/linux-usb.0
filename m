Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68F11FCFFC
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 05:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792041494; cv=none; b=QFSknPp/ckqNg4XB73kSQEX+vwXfmfZ3CYw9mmzhHtF23FWSq5pAAl8fMeqH38jWVlCu4hVTHPxe0gMOqGpfFmdz+lkpzqQ07XRCUb6hWZfFKePyx332EaZscoZgyXywtmrc/N2/8KRU1gRTIZ3Fob01KA0YfkPJOJOmMQpu5uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792041494; c=relaxed/simple;
	bh=ScwFpMgM6ozPoixp6NIj04ykc2gGalRSSDIu72pICCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atLwcXnbAjykzJuCd7uTTCatm72GN/dxdn/LaZU5pNNj5hNJ8hKtS+sgnO0/e5wkB1zzM1HQAxBANnFuKkJZmfgadAw252rC9qa7PZWD+mLwYNwz8EM+DCH8NZaDICONeFKuqShM7QMI/elnNX8P2968VH/Vzu9PxsDjqs+FaiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qQg8eb8v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qQg8eb8v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D42991F000C4;
	Thu, 15 Oct 2026 05:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792041493;
	bh=EeLRcs1c/BkYhO0qkDOamo4GwnUrdQW25aq7M4ACueE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=qQg8eb8vKrJWvxjDC82ZfYPZ6n2PtJYZDjTmsB3FnVsOptXAmCKNriaZ13/hG1Tz3
	 6enPUyUzLkKLOGRDFZ0ru50eSXP42dH24hoMKFc47u0PK7nwzgwirGGbbnyMLO+hm/
	 VUZPjY4V+rHORgDc7qZOZJkGJxNueb+iT5IaDSoE=
Date: Thu, 15 Oct 2026 07:18:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Reid D <skibletz@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: usb: devio: USBFS_XFER_MAX check bypassed for iso urbs due to
 incorrect ordering, potential oob heap write
Message-ID: <2026101531-secular-entire-f7a4@gregkh>
References: <CAGNJ+_3qpWtzjTLntxTzF2v0jU9mVssukGfhrJFOx_yb+2Abyg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGNJ+_3qpWtzjTLntxTzF2v0jU9mVssukGfhrJFOx_yb+2Abyg@mail.gmail.com>

On Wed, Oct 14, 2026 at 05:36:56PM -0400, Reid D wrote:
> usb: devio: USBFS_XFER_MAX check bypassed for iso urbs
> due to incorrect ordering, potential oob heap write
> 
> file: drivers/usb/core/devio.c
> function: proc_do_submiturb()
> ioctl: USBDEVFS_SUBMITURB
> 
> the bug:
> 
> the size check at line 1647 runs on buffer_length before the iso
> path has computed totlen. the iso path then overwrites buffer_length
> with totlen at line 1768, so the check never actually validates
> the real transfer size.
> 
>     line 1647 - check runs here on the wrong value:
>     if ((unsigned int)uurb->buffer_length >= USBFS_XFER_MAX)
>         return -EINVAL;
> 
>     line 1768 - real value computed after the check:
>     uurb->buffer_length = totlen;
> 
>     line 1843 - kmalloc uses the unchecked value:
>     as->urb->transfer_buffer = kmalloc(uurb->buffer_length, ...);
> 
> impact:
> 
> if totlen exceeds the kmalloc allocation size, the copy_from_user
> that follows writes past the end of the heap buffer. for an out
> transfer the user controls both the length and the data, giving a
> heap write-what-where primitive.
> 
> current constants (128 packets * 98304 max each = 12mb) keep
> totlen below USBFS_XFER_MAX (16mb) so this is not exploitable
> today. the check ordering is structurally wrong regardless and
> will become a live bug if those constants change.
> 
> fix:
> 
>     uurb->buffer_length = totlen;
>     if (uurb->buffer_length >= USBFS_XFER_MAX)
>         return -EINVAL;
> 

Great, please turn this into a real patch that can be applied so you get
full credit for resolving this.  Your favorite llm can easily do this
for you (and it can test it, which you really should also do...)

thanks,

greg k-h
