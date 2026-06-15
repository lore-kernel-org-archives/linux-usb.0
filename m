Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9701F4CB3;
	Mon, 15 Jun 2026 02:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781491005; cv=none; b=Sflfg/u0X72HS4S5cJ1IvPS6rWzfQtHoV3cdmldSVwJWRH08MMf8L5O33R2iyDPcj4Xjl8q6T9DBupjr3Bj0QUOvXLeAiiIq2B4tf+QuYB7yOEIlnWjE1utHfN8MEQRC8pGVbOz0RooAgZdBCgV4X5X61qTmWApr3QnojIL1lQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781491005; c=relaxed/simple;
	bh=+tjiLRvfmU5KbP7Ghn2QvhiTMJqWnaPONoy2gPe6E4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XmBlk8BiPhaOoS1/BX8XzcG+95LwOCXhEVhmNEJgFyb7ymikXWEWoDuzJGJtqA7I4SazYYMNtJ4ZC26ZrvcKySuzatKTAkJAtGYRi4Hc0e/Tkg9SNIHF9vFCH/o32QUiBD4QlZC+JrnoomThHfbLat3LxlAw0SuaWCYOTklNbYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Z4RjeSnG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Z4RjeSnG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A26D11F000E9;
	Mon, 15 Jun 2026 02:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781491000;
	bh=OHLsAVV0R3+Z5WhcDOp6BnNDk5J5sZ3n5ZBOg/+pUsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z4RjeSnG7LVhfLXKnidv9KdUkBmkjkLr0qxjpR0s/Uy3LCd3CzCQcb0fpr1Nzscal
	 HLrx8gdZbEXq5n6J4S2+XrLuMXZw2wdi+X6x9LdUETcu5mA+QA0y5caiuLmcbyu8oK
	 5sVuBNttr/rjUEYY96mjRk4gVLFj/GTFq3e5XDvU=
Date: Mon, 15 Jun 2026 04:35:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Neill Kapron <nkapron@google.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH 3/3] usb: gadget: f_fs: Introduce rw_proxy file
 descriptors
Message-ID: <2026061503-ripening-jokingly-eb4e@gregkh>
References: <20260614181006.3648010-1-nkapron@google.com>
 <20260614181006.3648010-4-nkapron@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614181006.3648010-4-nkapron@google.com>

On Sun, Jun 14, 2026 at 06:10:02PM +0000, Neill Kapron wrote:
> Currently, FunctionFS exposes each USB endpoint as a separate,
> unidirectional file descriptor (e.g., `ep1` for IN, `ep2` for OUT).
> While this mirrors the underlying hardware structure, it forces
> userspace daemons implementing bidirectional protocols to manage
> multiple file descriptors. When dealing with legacy protocols which
> require exposing a single, bi-directional fd to userspace, this becomes
> problematic.
> 
> This patch introduces the `FUNCTIONFS_RW_PROXY_EPS` UAPI flag. When
> passed in the descriptor header during initialization, FunctionFS
> provisions a "rw_proxy" bidirectional file descriptor (e.g., `ep1_rw`)
> alongside every pair of IN/OUT endpoints.
> 
> Implementation details:
> - RW proxy files act as a pure VFS alias, proxying operations
>   directly to the base ffs_epfile instances. A `read()` proxies to
>   the OUT endpoint's file, and a `write()` proxies to the IN file.
> - Because operations are proxied natively, they reuse the underlying
>   base endpoint's lock (`epfile->mutex`) and tracking state. This
>   serializes concurrent read or write operations, preventing buffer
>   corruption and race conditions even if userspace mixes transfers across
>   both the rw_proxy and base files. This approach allows full-duplex
>   synchronous operations to occur concurrently without serializing on a
>   single lock.
> - Control operations (like IOCTLs) and intentional stalls (via
>   reverse-direction I/O) must still be issued on the base endpoints, as the
>   rw_proxy returns `-ENOTTY` for IOCTLs and cannot trigger stalls.
> 
> Assisted-by: Antigravity:gemini-3.1-pro
> Signed-off-by: Neill Kapron <nkapron@google.com>
> ---
>  Documentation/usb/functionfs.rst    |  56 ++++++++++++++
>  drivers/usb/gadget/function/f_fs.c  | 109 +++++++++++++++++++++++-----
>  drivers/usb/gadget/function/u_fs.h  |   8 +-
>  include/uapi/linux/usb/functionfs.h |   1 +
>  4 files changed, 156 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/usb/functionfs.rst b/Documentation/usb/functionfs.rst
> index 582e53549d5b..b189cf5626ba 100644
> --- a/Documentation/usb/functionfs.rst
> +++ b/Documentation/usb/functionfs.rst
> @@ -96,6 +96,58 @@ One such IOCTL is:
>      * ``-ENODEV``: The FunctionFS instance is not active.
>      * ``-EINVAL``: The endpoint is not an IN endpoint.
>      * ``-EFAULT``: Invalid user space pointer for the argument.
> +
> +RW Proxy Endpoints
> +==================
> +
> +If the ``FUNCTIONFS_RW_PROXY_EPS`` flag is passed in the descriptor header
> +(requires ``FUNCTIONFS_DESCRIPTORS_MAGIC_V2``), FunctionFS will provision a
> +bidirectional rw_proxy file descriptor (e.g., "ep1_rw") alongside each pair
> +of IN and OUT endpoints. The rw_proxy file aliases the underlying hardware
> +endpoints, allowing userspace to use a single file descriptor for both reading
> +(OUT) and writing (IN).
> +
> +This flag requires the total number of hardware endpoints to be an even number.
> +FunctionFS will automatically walk the provided endpoints and group them into
> +adjacent pairs (e.g., ep1 and ep2 form the first pair, ep3 and ep4 form the
> +second pair). Each pair must consist of exactly one IN endpoint and one OUT
> +endpoint.
> +
> +For each valid pair, a rw_proxy file is created and named after the first
> +endpoint in the pair with a "_rw" suffix. For example, if ep1 and ep2 are
> +paired, a rw_proxy file named "ep1_rw" is created. If ep3 and ep4 are paired,
> +"ep3_rw" is created.
> +
> +If the ``FUNCTIONFS_VIRTUAL_ADDR`` flag is also enabled, the endpoints will be
> +named using their physical endpoint address in hexadecimal instead of their
> +index. RW proxy files will inherit this naming convention. For example, if the
> +first endpoint of a pair maps to address 0x02, the rw_proxy file will be
> +named "ep02_rw".
> +
> +When this flag is enabled, userspace has the choice of performing data transfers
> +via the single rw_proxy file descriptor or the two base file descriptors. The
> +rw_proxy file descriptor acts as a pure VFS alias that proxies all operations
> +directly to the underlying base file descriptors.
> +
> +Because it is a pure proxy, there are no data races or buffer corruptions if
> +userspace uses both the rw_proxy endpoint and the base endpoints concurrently.
> +The native mutexes of the base endpoints perfectly serialize all concurrent
> +transfers. However, userspace should generally pick one method and stick to it
> +to avoid interleaving its own data stream.
> +
> +- **IOCTLs (Clear Halt, etc.):** RW proxy endpoints do not support IOCTLs and
> +  will return ``-ENOTTY``. To clear a host-initiated halt, userspace must issue
> +  the ``FUNCTIONFS_CLEAR_HALT`` ioctl directly on the corresponding base
> +  endpoint file descriptor.
> +- **Intentional Stalls:** The traditional mechanism for intentionally halting an
> +  endpoint by issuing a reverse-direction data operation (e.g., attempting to
> +  read from an IN endpoint) continues to work, but it must be issued on the
> +  base endpoint. RW proxy endpoints cannot be used to trigger a stall because
> +  they are fully bidirectional.
> +
> +Note that DMABUF data transfers (``FUNCTIONFS_DMABUF_TRANSFER``) are unsupported
> +via the rw_proxy endpoint because it does not support IOCTLs. If DMABUF
> +transfers are required, users must use the standard base endpoints.
>  DMABUF interface
>  ================
>  
> @@ -103,6 +155,10 @@ FunctionFS additionally supports a DMABUF based interface, where the
>  userspace can attach DMABUF objects (externally created) to an endpoint,
>  and subsequently use them for data transfers.
>  
> +Note: The DMABUF interface is unsupported on rw_proxy endpoints. See
> +the RW Proxy Endpoints section for details on using DMABUF alongside
> +the ``FUNCTIONFS_RW_PROXY_EPS`` flag.
> +
>  A userspace application can then use this interface to share DMABUF
>  objects between several interfaces, allowing it to transfer data in a
>  zero-copy fashion, for instance between IIO and the USB stack.
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 4c1bafb3eef5..0ccfdcfb1810 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -159,7 +159,9 @@ struct ffs_epfile {
>  	struct mutex			mutex;
>  
>  	struct ffs_data			*ffs;
> -	struct ffs_ep			*ep;	/* P: ffs->eps_lock */
> +	struct ffs_ep			*ep;		/* P: ffs->eps_lock */
> +	struct ffs_epfile		*epfile_in;	/* P: ffs->eps_lock */
> +	struct ffs_epfile		*epfile_out;	/* P: ffs->eps_lock */
>  
>  	/*
>  	 * Buffer for holding data from partial reads which may happen since
> @@ -219,17 +221,20 @@ struct ffs_epfile {
>  	struct ffs_buffer		*read_buffer;
>  #define READ_BUFFER_DROP ((struct ffs_buffer *)ERR_PTR(-ESHUTDOWN))
>  
> -	char				name[5];
> +	char				name[10];

Why change the size?  Shouldn't that be a separate patch?

>  
>  	unsigned char			in;	/* P: ffs->eps_lock */
>  	unsigned char			isoc;	/* P: ffs->eps_lock */
>  
>  	u8				zlp_enabled; /* P: ffs->eps_lock */
> +	bool				is_rw_proxy;
>  
>  	/* Protects dmabufs */
>  	struct mutex			dmabufs_mutex;
>  	struct list_head		dmabufs; /* P: dmabufs_mutex */
>  	atomic_t			seqno;
> +
> +	int				opened_count; /* P: ffs->eps_lock */

Attempting to track "is this file open or not" almost always fails
horribly.  Think about file descriptors that can be dup() and passed
around, the kernel has no idea what is going on with them, nor does it
have to.

Yes, we do track if the file is opened or not already, but I'd argue
that too is broken and should probably be removed and just use the
normal file descriptor logic instead.


> @@ -1378,8 +1393,18 @@ ffs_epfile_release(struct inode *inode, struct file *file)
>  
>  	mutex_unlock(&epfile->dmabufs_mutex);
>  
> -	__ffs_epfile_read_buffer_free(epfile);
> -	ffs_data_closed(epfile->ffs);
> +	spin_lock_irq(&ffs->eps_lock);
> +	if (epfile->is_rw_proxy) {
> +		epfile->epfile_in->opened_count--;
> +		if (--epfile->epfile_out->opened_count == 0)
> +			__ffs_epfile_read_buffer_free(epfile->epfile_out);
> +	} else {
> +		if (--epfile->opened_count == 0)
> +			__ffs_epfile_read_buffer_free(epfile);

If you drop the opened_count, shouldn't these buffers just get freed
when the structure themselves get freed?  You are treating the count as
a "reference counted structure" in a hand-rolled way that might not
really be right here as it's kind of hard to prove.

Either use a real reference count for the whole structure (i.e. kref)
because you need to, or just tie the lifetime of the buffer to the
larger structure itself.  Otherwise these fake references are going to
be a pain to track that all is correct with them...

thanks,

greg k-h
