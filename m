Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9779346E6A
	for <linux-usb@vger.kernel.org>; Fri, 30 Jan 2026 05:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769751266; cv=none; b=SBcmEwdbumBqyUGIkmK9nunHeJUNT+kqjP29lGfo6+aUizR9NEpUtUj9qV8D8P15F2FPtx+9ZVdGzGn6g5u31rqZOgNvxKduqhAIODwFc0J8bDU0WAuDJzg8p/+TM4NtFdd+PIZmLNYkFhRYn7GhKejcSAo6GOFrUyC8tZvEsQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769751266; c=relaxed/simple;
	bh=ak2lzdvQFEQkyzjpXcQjcrwCW3IK4NTWWTzNHThfc7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WGtauTbDwvEzjuagkwlXLPHCr75MMpupSf/gzkDk5qtfYy1EpReZtmkYv+UHRoy/XmzAHamrWGDBsa3gygLBFvPt8D7YJuQekoy6jK0x312Aji2mIqLpdJwneWhdEOYrrKeYrPukAIycz7S83LpvJ3b6dbr/o5x+RAzph9F1c90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ngi1lpRV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ngi1lpRV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 183A4C4CEF7;
	Fri, 30 Jan 2026 05:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769751266;
	bh=ak2lzdvQFEQkyzjpXcQjcrwCW3IK4NTWWTzNHThfc7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ngi1lpRVkvzTBrEkUhCmh1AsBRWcyUHFiFbeaCNOPGtuF9fxjEHEpWRsS62hp4Amq
	 A3ZMD6GO0OJEyn2zOFKK5mWKkvG6plz6S/s5rC/q4lpeAjKcLLr2LD3kENH1DRapbZ
	 mf0J9+Wzb5EPN74+YvKFvJ57232hB64onDh5dWkg=
Date: Fri, 30 Jan 2026 06:34:23 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: raoxu <raoxu@uniontech.com>
Cc: mathias.nyman@linux.intel.com, kenny@panix.com,
	linux-usb@vger.kernel.org, michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com, zhanjun@uniontech.com
Subject: Re: [PATCH v11 2/2] usb: xhci: enable secondary interrupters and
 route transfers per slot
Message-ID: <2026013013-corridor-giblet-07e5@gregkh>
References: <5de1da4b-d8aa-4180-a269-79fd544c2e8c@linux.intel.com>
 <0140630012648248+20260130034847.2656706-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0140630012648248+20260130034847.2656706-1-raoxu@uniontech.com>

On Fri, Jan 30, 2026 at 11:48:47AM +0800, raoxu wrote:
> Hi Michal, Mathias,
> 
> Thanks for the detailed feedback.
> 
> > Xu Rao, can I ask you you run the same test as before with only primary
> > interrupter with interrupt moderation the change below?
> >
> > diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> > index 585b2f3117b0..9a2a4d17ed68 100644
> > --- a/drivers/usb/host/xhci-pci.c
> > +++ b/drivers/usb/host/xhci-pci.c
> > @@ -573,7 +573,7 @@ static int xhci_pci_setup(struct usb_hcd *hcd)
> >   xhci = hcd_to_xhci(hcd);
> >
> >   /* imod_interval is the interrupt moderation value in nanoseconds. */
> > - xhci->imod_interval = 40000;
> > + xhci->imod_interval = 10000;
> >
> >   retval = xhci_gen_setup(hcd, xhci_pci_quirks);
> >   if (retval)
> 
> Test device:
> ID 090c:2320 Silicon Motion, Inc. - Taiwan (formerly Feiya Technology Corp.) FF952
> 
> The results of testing a single USB drive are as follows: there is no
> significant difference in speed. Perhaps I can test more devices to
> see the differences.
> 
> 6.19.0-rc6 result:
> dd if=/dev/zero of=./test bs=10M count=1024 status=progress oflag=direct
> 10611589120 bytes (11 GB, 9.9 GiB) copied, 30 s, 353 MB/s
> 1024+0 records in
> 1024+0 records out
> 10737418240 bytes (11 GB, 10 GiB) copied, 30.3882 s, 353 MB/s
> 
> 6.19.0-rc6 + v12 patch result:
> dd if=/dev/zero of=./test bs=10M count=1024 status=progress oflag=direct
> 10475274240 bytes (10 GB, 9.8 GiB) copied, 30 s, 349 MB/s
> 1024+0 records in
> 1024+0 records out
> 10737418240 bytes (11 GB, 10 GiB) copied, 30.7994 s, 349 MB/s
> 
> 6.19.0-rc6 + v12 patch + imod_interval =10000 result:
> dd if=/dev/zero of=./test bs=10M count=1024 status=progress oflag=direct
> 10643046400 bytes (11 GB, 9.9 GiB) copied, 30 s, 355 MB/s
> 1024+0 records in
> 1024+0 records out
> 10737418240 bytes (11 GB, 10 GiB) copied, 30.2851 s, 355 MB/s

dd is a horrible benchmark tool and does not mean that the data really
is flushed to the devicei (oflag=direct _should_ bypass the page cache,
but I don't remember if that's always the case.)

fio would be more interesting, spreading transactions across multiple
devices at the same time, what about running the benchmark you showed
earlier in the thread?

thanks,

greg k-h
