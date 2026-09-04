Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603F43EC835
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 06:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788504626; cv=none; b=P628bi/uJ2gpmiN1tc9EN89svT5LIQXfzbLVEyTQO7QQGQlxeDqHIjBjv9hWJ3nHIXQy0MDxgFXVtKhIO909Y8eTogINjTSkpAF0eWcGft/je64bf3AB9SLXz9/l5F0nK9ry1OzIRCkdh365lwiFf+C3JvLZcVup/cntCKLxJSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788504626; c=relaxed/simple;
	bh=HWME7BpOippoBegiav7p9sL3mErQ0NFRHoQGzqQaV40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WxTd1BFbMUSZPY5sQful2aQoI+Azc2We/nJT+84fHAruyfmsHSFkrwm2iT48YsawO+gV9xmB9vNcMas2bGams2rWaPaooZ0pDwR0hZWFf9b1KMnqAxe9A5GS+wCK16MOyXtfUqDwupymuuiC5F6z8kdPZpCHclIAA6Iolv788vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qu1c1VW1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qu1c1VW1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C21C1F00A3D;
	Fri,  4 Sep 2026 06:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788504624;
	bh=iBWAV6Qb0AfY0oa/m9OJIYRWP18Cg1kRKW5X7HrmnK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=qu1c1VW1harZ/HEZ7RnLV7qrTTzFlEaUNdUOoNxbwu6B9okSiQPEcqrD3DP+fQVMq
	 vgDDuqzBPqCXUAmwVYqT0feYR78D9FFGTrzrzssTJ8kPnO5RvdaLbpahYAspDKykyj
	 7WeVuLWaHvXLjpjJ/WBXlYZMCMOUqqc0PKdU6up0=
Date: Fri, 4 Sep 2026 08:48:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: rivaldihormat-debug <rivaldihormat@gmail.com>
Cc: linux-usb@vger.kernel.org,
	rivaldihormat-debug <rivaldihormat@example.com>
Subject: Re: [PATCH] usb: core: devio: add defensive bounds check for len2 in
 do_proc_bulk()
Message-ID: <2026090449-skinning-cactus-6b2c@gregkh>
References: <20260904062958.19404-1-rivaldihormat@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904062958.19404-1-rivaldihormat@gmail.com>

On Fri, Sep 04, 2026 at 06:29:58AM +0000, rivaldihormat-debug wrote:
> Although the USB host controller hardware prevents len2 from exceeding
> len1 in normal operation via babble error handling, add an explicit
> kernel-side check to improve robustness. This helps prevent unexpected
> behavior in virtualized environments where emulation bugs might break
> this guarantee.

Then that emulation environment is very very broken, please fix that.

> Clamp len2 to len1 if it exceeds the allocated buffer size and log
> a warning message.
> 
> Signed-off-by: rivaldihormat-debug <rivaldihormat@example.com>

Not a valid name to use here :(


> ---
>  drivers/usb/core/devio.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index 101cb9425480..9d8930853e8f 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -1343,6 +1343,10 @@ static int do_proc_bulk(struct usb_dev_state *ps,
>  		snoop_urb(dev, NULL, pipe, len2, i, COMPLETE, tbuf, len2);
>  
>  		if (!i && len2) {
> +                        if (len2 > len1) {
> +                                dev_warn(&dev->dev, "USB returned more data than expected\n");
> +                                len2 = len1;

This isn't even a good way to handle this error if it happened :(
