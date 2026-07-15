Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1883F9268
	for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 09:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784106820; cv=none; b=e/p/Xp1lgeDdDTtP2okUH0+uI5pdu9EzFbrHKdWbdXvuahlZTHzY14yG4mPBWEWggQ38Ln4Ga3y3fdyf6+2IFRjIAGgKuzhjqX6Fa/MgQde+py06eCa/cH5ph26zGz8YI1+FrlyJvEIVJPbh0mxoay7aaYittUSha8tf2zFpcIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784106820; c=relaxed/simple;
	bh=iT96h0QPtPzANSaxfkiFwITyPJ8zpe+7dPX3twrBcEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z1i1Y3KQEEfG2Ubz9MfIaJ1C8gToXsbnHPWLVslFYkwRocllryRC60ILCYmWak1pw7wtEBsY+VB1mBdyAyiEjzLaTI/clHtKfExlgoNQ36+Yd8Lr80LDY+KKM7qC0HmKiYdLCeNbet7U5SKBjAnCdMD0jtzGUGZ6OlcquTP/4YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FPAkWl/a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FPAkWl/a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EE071F000E9;
	Wed, 15 Jul 2026 09:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784106818;
	bh=Xch6WA6UrxxmAyxCO+cQ4q7PNY8YlGLsB0RxxpUykQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FPAkWl/avghjEZLihOodu/6sGzQ+/CRHQeUtxURo+oQ6w2e+yfg+adONnrwm9zYFm
	 7E8HglPpsE3SX5tKJgdSheUp4G0GCxYF1G2asBEvzaPNpTNvNMddui2QR5NEVZu225
	 5jSl50uqrmrEeQmBJIgCcPwxOaezvqO/P2lqDKq8mqTn7XotRcmIDiY7GuSnfFZ5Uy
	 h5wCsaNpBnXcJ70Lf7DPGmPipa9kTTuZ6mCRXw3LUzzk4cof8bxlr5MVHBt9/RxkLv
	 LrhkJ1+MH7FVV3cUPM6VfEukGF7YMWo6XR3NeUEU35zqDfSlR9YwGa1/hls6SY3nFI
	 zXHHGUh27JOJA==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wjvgO-00000005uG0-05Zw;
	Wed, 15 Jul 2026 11:13:36 +0200
Date: Wed, 15 Jul 2026 11:13:36 +0200
From: Johan Hovold <johan@kernel.org>
To: Oliver Neukum <oneukum@suse.com>
Cc: gregkh@linuxfoundation.org, jkrshnmenon@gmail.com,
	linux-usb@vger.kernel.org, Lukas Dresel <lukas@artiphishell.com>
Subject: Re: [PATCHv2] usb: serial: sierra: deal with insufficiently long
 notifications
Message-ID: <aldPQHu1lPvxrTug@hovoldconsulting.com>
References: <20260715090821.1364583-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715090821.1364583-1-oneukum@suse.com>

On Wed, Jul 15, 2026 at 11:04:32AM +0200, Oliver Neukum wrote:
> A malicious device can send too short messages which
> would cause the driver to read beyond the part of the buffer
> holding valid data.
> Ignore too short packets.
> 
> Fixes: 033a3fb980b04 ("USB: Sierra Wireless driver update")
> Reported-by: Jay Vadayath <jkrshnmenon@gmail.com>
> Reported-by: Lukas Dresel <lukas@artiphishell.com>

You should add a Link to the report(s) as well. I only saw the one from
Jay.

> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
> 
> v2:
> - fixed description and added reporters and fixes tag
> 
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

Please move and rename this one as I suggested in my reply to v1.

>  		usb_mark_last_busy(serial->dev);
>  		err = usb_submit_urb(urb, GFP_ATOMIC);
>  		if (err && err != -EPERM)

Johan
