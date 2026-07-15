Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99A63C141A
	for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 07:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784100147; cv=none; b=AHYtcroTG1z6A9/ot1ULLdZ+Ix7cK3lAs04UZBuz1ov+J1GQ4AdvKl2UtnnlZbKoN8FBbmlAKyeEp5yC7gQaj59Kupth2e4ilGqDDP1kzYkPJoFwRGTNjhCxRShNeIVxyWdyfgHdtExseVMnAG/rE+28FIk2z5bMpi7FoTa9Vug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784100147; c=relaxed/simple;
	bh=NU+tpEA8y67yYIcJHDVGGSb0LqQF2n+vZpEY19y0Zcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZ4GcPwsQnvW7rpeRTdlW21JEY37oSciPOavYVaDBSgzGgYfOb7dQDeCWlK5Qpm+GjGldXb1TGAdywoNkAMTL4n9XVV4AqERBpTYHlG+5D17CAGG+q4XzKaoEv839rLGeJVltJzILx40HuGrrh15EBEe7D9+wtmJP2WZFk60AAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ft9F8Fgq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ft9F8Fgq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4362D1F000E9;
	Wed, 15 Jul 2026 07:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784100139;
	bh=cTeZZmaeR41ODLVMMj5mV4Jbn4kNf9OiVhYEjsdWxjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ft9F8FgqT6hOq+riTIkogOzcXk7FF0udCjSnRwqJSqA2vpD+wvosUzaKWtCX3qHpw
	 draU6xmWNOwvNht5dsT6S5vhmLGgdLiOv8AiRbwRq8mVlflckjhM8v2YCPg7zRnuXS
	 P+WYkENRArFWRe9E05hMqoQgMuWfCoCD7i5TqlnB1P8oFSKWd4d+862IBQ72EyY4/L
	 VQOhklFNJts6R4npUuoxXYfg85Zm8DxnKFkdVnU/F53jHgb9iT9ndHoUOPYmC2wjYH
	 NOdGRek4jVNCRkp+sKVLjdYmgdXFpCifmOiFkRkp+OqA5yqP2uOq/Zrb3jPIR1cydT
	 R17tDU/5W/gFQ==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wjtwf-00000005pmv-12C9;
	Wed, 15 Jul 2026 09:22:17 +0200
Date: Wed, 15 Jul 2026 09:22:17 +0200
From: Johan Hovold <johan@kernel.org>
To: Oliver Neukum <oneukum@suse.com>
Cc: gregkh@linuxfoundation.org, jkrshnmenon@gmail.com,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: serial: sierra: deal with insufficiently long
 notifications
Message-ID: <alc1KYBzqiOWUx4u@hovoldconsulting.com>
References: <20260714183305.1331363-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714183305.1331363-1-oneukum@suse.com>

On Tue, Jul 14, 2026 at 08:33:05PM +0200, Oliver Neukum wrote:
> A malicious device can send too short messages which
> would cause the driver to overflow the buffer and hit

"overflow" makes it sounds like memory corruption but this is just a
potential 1-byte read beyond the buffer (or of stale data inside the
buffer).

> stale data in their interpretation.
> Ignore too short packets.

Even if this was found by an LLM it was still reported to use by a
person so please add a Reported-by and Link tag along with a Fixes tag.

> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/usb/serial/sierra.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/sierra.c b/drivers/usb/serial/sierra.c
> index 6e443aacae07..f50833055360 100644
> --- a/drivers/usb/serial/sierra.c
> +++ b/drivers/usb/serial/sierra.c
> @@ -575,10 +575,19 @@ static void sierra_instat_callback(struct urb *urb)
>  				__func__);
>  			return;
>  		}
> +
> +		if (urb->actual_length < sizeof(struct usb_ctrlrequest))
> +			goto skip_too_short;
> +
>  		if ((req_pkt->bRequestType == 0xA1) &&
>  				(req_pkt->bRequest == 0x20)) {
>  			int old_dcd_state;
> -			unsigned char signals = *((unsigned char *)
> +			unsigned char signals;
> +
> +			if (urb->actual_length < sizeof(struct usb_ctrlrequest) + 1)
> +				goto skip_too_short;
> +
> +			signals = *((unsigned char *)
>  					urb->transfer_buffer +
>  					sizeof(struct usb_ctrlrequest));
>  
> @@ -603,6 +612,7 @@ static void sierra_instat_callback(struct urb *urb)
>  
>  	/* Resubmit urb so we continue receiving IRQ data */
>  	if (status != -ESHUTDOWN && status != -ENOENT) {
> +skip_too_short:

And please move the label before the conditional and rename it after
what it does (e.g. "out_resubmit" or just "resubmit").

>  		usb_mark_last_busy(serial->dev);
>  		err = usb_submit_urb(urb, GFP_ATOMIC);
>  		if (err && err != -EPERM)

Johan
