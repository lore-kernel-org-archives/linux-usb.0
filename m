Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39AC425867;
	Mon, 20 Jul 2026 13:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784555658; cv=none; b=abNQplcFvAnz80UzOYE8fjdW4vfKqRx8uvW+T0n4WvyFoBhdcSLDt5kQ95W8SLIYmjHAfsgErcvJcmOitc2pFGXsyDTtTOWhsnlUeQldWtGXFO/kw0n4NAOXsSS0bzzSQYCy3XM6QKnzOOI5jpbRwCl+J6ybFZMKs3ET5XxwbUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784555658; c=relaxed/simple;
	bh=o4aRS6hcdVOSOvbDXKE561gpLKqDCbNq/GEYNtDrQ2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JWZZEff7ZYS5jAUpBlamsoPejiPTyMiZ7F4Bzw32+2hUnk5i3Ee0bBQ4604hT7BYB27FTj5Jms1vQquNP8xXUm/EcnLbG5N9FH0ZBQSJNsDj1eZBSGGXtSx08gPUVfl4kMlap/PxEidgBru7SyQTur9EnJd9VhISTc1vXqKvIOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d3LrUrS3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d3LrUrS3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95F7A1F00A3A;
	Mon, 20 Jul 2026 13:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784555657;
	bh=SxLH32ZGv+MQ7Ig6YmFENNgL+30ebCSBgbzMQJALgq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d3LrUrS3aj/gipDmgsILbOFfc2oT3DBGN3F6FzeV0xw/fN3P45qhF/2RRxRLhc7vu
	 8kb9reufF2PvkoKiz8biumm7d3/0uAw1m4lyBMgvbDfId5RHMc5h4mczlphoTAEZre
	 QD11vJ8XBwy7bXXm6eMxjjpl49p8UUPsdVAkA33urcSPGH4BlPapYZq3u1VK4CS7SR
	 BX6kE1VkjFH01uyII5dotWr/+6oFlUjLDYXQucwe/ei7inxcoefgUYaBgS+1JoXv9+
	 6eSKVsxPNrIe3Nxzo13/eAuDmBF5JMhsT01jAHxMx+UMBH5F0Lpx0jjfKzZbiilPy5
	 d8SB64fAkuJEw==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wloRj-00000008o73-1bkB;
	Mon, 20 Jul 2026 15:54:15 +0200
Date: Mon, 20 Jul 2026 15:54:15 +0200
From: Johan Hovold <johan@kernel.org>
To: yangsizhe <18392868223@163.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, yangsizhe@meigsmart.com
Subject: Re: [PATCH v4] usb: serial : option: add multiple MeiG VID/PID
Message-ID: <al4oh_aNqeKbxer0@hovoldconsulting.com>
References: <20260624033524.7913-1-18392868223@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624033524.7913-1-18392868223@163.com>

On Wed, Jun 24, 2026 at 11:35:24AM +0800, yangsizhe wrote:
> Add the PID and VID to facilitate the binding of our company's module
>
> Real name:MeiG Smart Technology Co., Ltd

Please mention which devices you are adding here (and in Subject if you
can generalise it, e.g. SLM8xxx) and include output of usb-devices which
gives an overview of the configuration. Please also mention what each
interface is for.

Here's a recent example of what this may look like:

	https://lore.kernel.org/all/20260517153237.55995-3-janvolck@gmail.com/

You may want to break the patch up in one patch per device family.

Also, what chipset are these devices based on?

> Signed-off-by: yangsizhe <18392868223@163.com>

Is this how you would write you name in a legal document (i.e. all lower
case and no space between first and last name)?

> ---
> Changes from v3
> 1.Resolve the issue of compilation failure
> 
> Changes from v2
> 1.Adjust reserved interface mask,avoid conflicts with RNDIS driver
> 
> Changes from v1
> 1.Add Real name into commit changelog descriptor for device identification
> ---
>  drivers/usb/serial/option.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index a34e79cfd5b6..1bf37df4493d 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -2459,6 +2459,25 @@ static const struct usb_device_id option_ids[] = {
>  	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d64, 0xff, 0xff, 0x40) },	/* MeiG SRM813Q (AT) */
>  	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d64, 0xff, 0xff, 0x60) },	/* MeiG SRM813Q (NMEA) */
>  

No need for a newline separator here since you're adding further MeiG
devices. You can just remove the existing one which snuck in by
mistake.

> +	{ USB_DEVICE(0x2dee, 0x4d23),						/* MeiG SLM868x*/
> +	.driver_info = RSVD(4) | RSVD(5) | RSVD(6) },
> +	{ USB_DEVICE(0x2dee, 0x4d62),						/* MeiG SLM820x*/
> +	.driver_info = RSVD(4) },
> +	{ USB_DEVICE(0x2dee, 0x4d30),						/* MeiG SRM813Q*/
> +	.driver_info = RSVD(0) | RSVD(1) },
> +	{ USB_DEVICE(0x2dee, 0x4d50),						/* MeiG SRM811x*/
> +	.driver_info = RSVD(0) | RSVD(1) | RSVD(6) },
> +	{ USB_DEVICE(0x2dee, 0x4d51),						/* MeiG SRM821x*/
> +	.driver_info = RSVD(0) | RSVD(1) | RSVD(6) },
> +	{ USB_DEVICE(0x2dee, 0x4d52),						/* MeiG SRM810x*/
> +	.driver_info = RSVD(0) | RSVD(1) | RSVD(6) },
> +	{ USB_DEVICE(0x2dee, 0x4d57),						/* MeiG SLM770A*/
> +	.driver_info = RSVD(0) | RSVD(1) },
> +	{ USB_DEVICE(0x2dee, 0x4d58),						/* MeiG SLM828A*/
> +	.driver_info = RSVD(0) | RSVD(1) },

Please keep the entries sorted by PID and add the missing space at the
end of each comment (i.e. before "*/").

> +	{ USB_DEVICE(0x05c6, 0xf601),						/* MeiG SLM750x*/
> +	.driver_info = RSVD(5) },

That's not the usual VID. Please highlight this in the commit message
and explain what's going on.

> +
>  	{ USB_DEVICE_INTERFACE_CLASS(0x2df3, 0x9d03, 0xff) },			/* LongSung M5710 */
>  	{ USB_DEVICE_INTERFACE_CLASS(0x305a, 0x1404, 0xff) },			/* GosunCn GM500 RNDIS */
>  	{ USB_DEVICE_INTERFACE_CLASS(0x305a, 0x1405, 0xff) },			/* GosunCn GM500 MBIM */

Johan
