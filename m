Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.154.241.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706765;
	b=XasJB6O+VEWqqY+vPjFvAZ4dHec23IfN69iulB9lPZitK/EkQuyYnBrgvWvGhKDECSLv
	 z2KUm8xvCE5LxLBAxAEBVU7qJxHoqQjHzhZjRn5ZNgg2zkcNoxoIAFW2AIZdqYK9tUoZV
	 BhuSE9RXhHP+Nf2qAAtkRIDnXg9oes7AMs3wPKQ1FkIeWX5Abu7GMWd7Pycyb46B8jOIz
	 ObswV54sR6fGrE5YOcHzPcNuSj9gm2i7+ztPg2aSRtfLbxGvUfOx0+4b5lOFNWOtDx14L
	 JulvQhZPWfWPCXjXH4hDzGCWIovWf8E8nDGBWp2WF+ddA0Xr9jAnhUJAtE7UhR3ywzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706765;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:Organization:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Bm-Milter-Handled:
	 X-Bm-Transport-Timestamp;
	bh=Z3Zve0BpiV3MpBpga148hiJYe+ApMWuQ5l/3Q89GNwE=;
	b=vSHQb/JQJmdpdNTAxS8NwfvE9sIiXz5WHKc8vipkEUQbHlNOMpMTkQcHIeJiP2M59qzA
	 WmYQa61rbHP2hhG72qmX9tmvPpEm8wUy2zO9BmbpvFmYp9kL4eqpACAsxqSu2t3JasYZu
	 DHVWGj+CFYiQOQt/VgktKp/xBW1GEp+LGlt298ZF3diH3kdI8UDQap+qTX9iTeDGOy4j9
	 RIZIeOfLMyB1Inp9ADqnA8EaXQc8DgnxxTlJ8yjWu2OKe4KTXZVGx4SOaB1SaaKPej4v8
	 UjpaDzM2qjzeVWKdp4NsRDAvsJV8tS1+mdocl/oUge49fTUmb4LigtgJ0L6Xv8Otykg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=lauterbach.com;
	spf=pass smtp.mailfrom=lauterbach.com;
	arc=none smtp.remote-ip=62.154.241.218
Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F1D606A321
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 15:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3F1D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id 436C54013A3C;
	Thu, 26 Nov 2026 16:25:55 +0100 (CET)
Date: Thu, 26 Nov 2026 16:25:54 +0100
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: viro@zeniv.linux.org.uk, nkapron@google.com, me@samcday.com,
 nuno.sa@analog.com, michael.bommarito@gmail.com,
 prostitisgabriel@gmail.com, kees@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_fs: Fix synchronous read() behavior
Message-ID: <20261126162554.381af142@ingpc2.intern.lauterbach.com>
In-Reply-To: <2026112059-prodigal-cultivate-3ba7@gregkh>
References: <20260903153737.58087-1-ingo.rohloff@lauterbach.com>
	<2026112059-prodigal-cultivate-3ba7@gregkh>
Organization: Lauterbach GmbH
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-unknown-linux-gnu)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Bm-Milter-Handled: 166a2dfb-2e12-4590-8fa5-72e30323519f
X-Bm-Transport-Timestamp: 1795706755338

Hello Greg,

Link for v2: https://lore.kernel.org/linux-usb/20261120145937.39772-1-ingo.rohloff@lauterbach.com/

> > Consider a UDC where usb_ep_align_maybe() aligns the request length.  
> 
> What does this sentence mean?

The problem is: 
There are UDCs which set "quirk_ep_out_aligned_size" in
"struct usb_gadget" and some which don't.
"usb_ep_align_maybe()" modifies the request length for UDCs,
where quirk_ep_out_aligned_size == 1

These two variants of UDCs behave differently for userspace reads.
I have more details (unfortunately wall of text) in the new commit message.
I will try to summarize:

We do *TWO* userspace reads of 0x84 bytes in a row.

Host sends 0x108 bytes (in for example one USB HighSpeed Packet).
quirk_ep_out_aligned_size == 1:
  1st userspace read receives 0x84 bytes.
  rest of 0x108 bytes from host get buffered in the kernel.
  2nd userspace read receives 0x84 bytes from buffered data.

quirk_ep_out_aligned_size == 0:
Depends on the UDC driver implementation, but for a DWC3 UDC:
  1st userspace read receives 0x84 bytes.
  rest of 0x108 bytes from host get thrown away.
  2nd userspace read blocks until more data arrives from the host.

I believe buffering the data is always correct.
So the patch changes behavior for UDCs,
which have quirk_ep_out_aligned_size == 0.
I don't think that's an issue, because the current behavior loses data.

so long
  Ingo





On Fri, 20 Nov 2026 11:20:43 +0100
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Thu, Sep 03, 2026 at 05:37:37PM +0200, Ingo Rohloff wrote:
> > To provide consistent read() behavior, USB requests submitted to the UDC
> > for OUT endpoints must always have a length that is a multiple of the OUT
> > endpoint's max_packet_size.
> > 
> > Consider a UDC where usb_ep_align_maybe() aligns the request length.  
> 
> What does this sentence mean?
> 
> > If a request completes with more data than was requested by the read()
> > call, the excess data is buffered and is returned by the next read() call
> > via __ffs_epfile_read_buffered().
> > 
> > The buffered excess data has at most "max_packet_size-1" bytes.  This
> > happens if read() requests "n*max_packet_size+1" bytes and the USB host
> > sends "(n+1)*max_packet_size" bytes.
> > 
> > However, if usb_ep_align_maybe() does not align the request length to a
> > multiple of max_packet_size, the behavior is different.  For example, with a
> > max_packet_size of 512 bytes (USB HighSpeed), a read() request for 512+128
> > bytes may be completed by an OUT transfer containing 512+256 bytes.  The
> > kernel returns 512+128 bytes to userspace, while the remaining 128 bytes are
> > discarded by the UDC instead of being buffered.  The next read() call then
> > blocks until the USB host submits another OUT transfer.
> > 
> > The former behavior is the expected one.  Enforce it by using
> > usb_ep_align() instead of usb_ep_align_maybe().
> > 
> > Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
> > ---
> >  drivers/usb/gadget/function/f_fs.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> > index 43962e05eacf..d31a6330d6a0 100644
> > --- a/drivers/usb/gadget/function/f_fs.c
> > +++ b/drivers/usb/gadget/function/f_fs.c
> > @@ -1078,11 +1078,12 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
> >  		}
> >  		data_len = iov_iter_count(&io_data->data);
> >  		/*
> > -		 * Controller may require buffer size to be aligned to
> > -		 * maxpacketsize of an out endpoint.
> > +		 * To expose a stream like interface for read(), make sure
> > +		 * the enqueued read request is a multiple of the maxpacketsize
> > +		 * of an out endpoint.
> >  		 */
> >  		if (io_data->read)
> > -			data_len = usb_ep_align_maybe(gadget, ep->ep, data_len);
> > +			data_len = usb_ep_align(ep->ep, data_len);  
> 
> What commit id does this fix?
> 
> thanks,
> 
> greg k-h



-- 

-------------------------------------------------------------------------
Dipl.-Inform.
Ingo ROHLOFF
Senior Staff Engineer
phone +49 8102 9876-142 - ingo.rohloff@lauterbach.com

Lauterbach Engineering GmbH & Co. KG
Altlaufstrasse 40, 85635 Hoehenkirchen-Siegertsbrunn, GERMANY
www.lauterbach.com

Registered Office: Hoehenkirchen-Siegertsbrunn, Germany,
Local Court: Munich, HRA 87406, VAT ID: DE246770537, 
Managing Directors: Stephan Lauterbach, Dr. Thomas Ullmann

-------------------------------------------------------------------------
