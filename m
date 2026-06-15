Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0163E405F7;
	Mon, 15 Jun 2026 02:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781490687; cv=none; b=VNarHdKcb9UHMmiw0I+KCSyB+sjWE/uJHf88c7yr+1ZBE6Gb8+NFcNZMvRLIm0+kJiJGvfrxuA81huy6YO25YBmaUnRfqSh5Bgy0Z3VIGHVaTnpDbAMZoREeYWAv8SB9TTHUPLp5KanCBTCvoEM0hm5ms9EAI1sFBqsXAyVDYXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781490687; c=relaxed/simple;
	bh=3JVxYVotMtVZqNJmKlpbZOp2o8JCRWwfZ3gt/Rwo2m0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QEOcu7u0ml9OPH3Y1SLZffcfyawdTwsPlf8LECfNfE0vxr8pxFDiAwMchbcDCjAf+eU8uedmvGOo1vgcXgBymwLZpOjA+XZ6JOXV1T0I+PMDwkVoXBW6jkHzyNgFAlo4Q3q976BgODW6c3yS9XuFdk1HGdsZrTx7ugtS3KRT/tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=c4AsWxVo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="c4AsWxVo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F1491F000E9;
	Mon, 15 Jun 2026 02:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781490685;
	bh=q3rNy/qzKWFFjxxKHLJ8BF5GUf+dbl3dIN9WXeo3Ufs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c4AsWxVoSRuf4eB7cCfd4iLxw4aBONiRgNeNWMuqtfEZTurqcMGUV31nVhZae/hCZ
	 a7HUoJvuqk8FiJWGh0WcwR1GB17GOEhrokzTbiH35gilxwd0fSR0wcu+si1vL5t1wE
	 FL/JZ6F9D/IdJhp+J5rgm3LBHeMB+XUQsKdWRgYE=
Date: Mon, 15 Jun 2026 04:30:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Neill Kapron <nkapron@google.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH 0/3] usb: gadget: f_fs: Add R/W proxy EPs and ZLP support
Message-ID: <2026061557-another-enduring-493d@gregkh>
References: <20260614181006.3648010-1-nkapron@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260614181006.3648010-1-nkapron@google.com>

On Sun, Jun 14, 2026 at 06:09:59PM +0000, Neill Kapron wrote:
> We are working to deprecate a widely used, out of tree gadget driver by
> moving the functionality to userspace via functionfs. To do so, we have to
> maintain strict compatibility with the legacy driver, as there are many
> third party applications which can’t be modified and are reliant on this
> interface. Specifically, the following requirements must be met:
> 
> - The function must expose a single file descriptor to userspace for both
>   reads and writes,
> - It must block on writes when it can not handle more data, 
> - It must handle arbitrary write transaction sizes,
> - It must automatically append a zero length packet (ZLP) when the write
>   transaction ends on a boundary of a multiple of the max packet size.
> 
> Initially, we pursued a compatibility layer in userspace which implemented
> a socket pair to combine the OUT and IN endpoint files. This approach
> proved problematic for several reasons.
> 
> To preserve the write transaction boundary for ZLP calculation, we
> attempted to use SOCK_SEQPACKET. This created problems as larger
> transactions required contiguous buffers to be allocated, and, even if we
> ignore the constraint to the arbitrary write size and limited it to 1MB,
> the socket would occasionally return -ENOBUFS to the end user if a write
> operation was attempted when other sockets on the system were consuming
> more than 7MB of the 8MB wmem_max limit.
> 
> After significant investigation including switching to SOCK_STREAM and
> attempting a heuristic timeout approach, we decided the best path forward
> was to pursue a native proxy endpoint approach in the functionfs driver
> itself.
> 
> This patchset introduces the `FUNCTIONFS_RW_PROXY_EPS` flag to functionfs
> which, when set, creates an additional proxy file for reading or writing
> to a pair of endpoints. In an attempt to limit the change to the UAPI
> surface, we added several constraints to this proxy file. We chose not to
> handle ioctls on this proxy file, as the current ioctls do not have a
> directionality associated with them, and would require essentially
> creating duplicate ioctls with a direction argument. To use this flag, an
> even number of in/out endpoints must be created, and a proxy ep is created
> for each pair of endpoints in the descriptors.
> 
> With this new r/w proxy ep, we are able to transparently hand it to the
> end application. However, to match the legacy driver’s ZLP functionality,
> a new ioctl is added, `FUNCTIONFS_ENDPOINT_ENABLE_ZLP`. This allows the
> userspace functionfs daemon to write the necessary descriptors, configure
> the auto ZLP functionality on the IN EP, then handoff the proxy ep to the
> application. When enabled, functionfs sets the req->zero flag. The UDC
> driver then automatically adds the ZLP if the transaction length % max
> packet size is 0.
> 
> An addition, a patch is included which fixes an issue if certain ioctls
> (like the new `FUNCTIONFS_ENDPOINT_ENABLE_ZLP` or
> `FUNCTIONFS_DMABUF_ATTACH`) are called prior to the host being connected.
> 
> This patchset has been tested on a kernel based on 7.1-rc7, as well as a
> backported version tested on 6.1. Existing functionfs implementations
> continue to work without modification, and the new functionality passes
> tests designed for our legacy kernel driver implementation.

Very cool, thanks for these changes.  I'll look at them after -rc1 is
out!

greg k-h
