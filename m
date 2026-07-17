Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F087C2FB97B;
	Fri, 17 Jul 2026 10:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784284852; cv=none; b=d6zPjjBJS2WDlFEUwVBJT1ZHy4HhIIzmkRBF9T6A5L0W2Wfnh6/Gpu3lg5B6F1XgI1ptjP1jknDpDIxHQrwMaGESnjm9WwZHPu+Yi/Y4T5wIttdHW0aiH5KESOiKGhXZkjN/cTMIq1Ocx9NLBH2fAe2Axs46X9IL1QugvDCC6wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784284852; c=relaxed/simple;
	bh=QLZ8RjI1hkhaqe4zFc5RJ+otniamIWMTEtzuD2dhieo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L8VuVtZVtEiCEfok53SqVh2z8RCII7EqWPKQhrt5eR2wJFPmy5CxDhj/LM7BwWa4chVhUUbym/Fmn2/qTFmdP/ynK2+HKXoMZx7utLOW1AuWJuiOr7SI7FwdLaibe5PtROQ8Y3/at585NjHWU3suk3u8ugaH0GqMTMU2e0lf4mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=u5DzFBQX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="u5DzFBQX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C911F000E9;
	Fri, 17 Jul 2026 10:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784284850;
	bh=ntfuroNuYbpYwJacUSwgp/78HRJ3HZJ40YQNjXEePMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=u5DzFBQX9jrUi7nR71hZJDRyije49IRTrAYqh4HdhYwiOATN22dcllbDQ67sXn2vb
	 PHgAhexVFWKmuUnTNrK1HK62i61plwnWgzMyLVyTPILW8T4kb4U+IlIl5X9Q+Upo9R
	 c9ZbTm5ORK6cgZTW7YaPq7PiAm/0vkJgl4JRirfo=
Date: Fri, 17 Jul 2026 12:40:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Akshay Gujar <Akshay.Gujar@harman.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	naveen.v@harman.com, oneukum@suse.com, stern@rowland.harvard.edu
Subject: Re: [PATCH v5 1/3] driver core: add
 device_enumeration_failure_notify() helper
Message-ID: <2026071752-proponent-ruckus-36bc@gregkh>
References: <20260715114028.3627807-1-Akshay.Gujar@harman.com>
 <20260715114028.3627807-2-Akshay.Gujar@harman.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715114028.3627807-2-Akshay.Gujar@harman.com>

On Wed, Jul 15, 2026 at 11:40:26AM +0000, Akshay Gujar wrote:
> Hotpluggable buses may detect that a device is physically present,
> but enumeration can fail early due to protocol-level errors. Such
> failures are currently only visible via kernel log messages, with no
> structured notification to userspace.
> 
> Introduce device_enumeration_failure_notify(), a helper in the driver
> core that emits a KOBJ_CHANGE uevent with
> 
>   DEVICE_ENUMERATION_FAILURE=<dev_name>
> 
> This helper is intended for use by bus drivers such as USB and PCI.
> 
> Signed-off-by: Akshay Gujar <Akshay.Gujar@harman.com>
> ---
>  drivers/base/core.c    | 44 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/device.h |  2 ++
>  2 files changed, 46 insertions(+)
> 
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 4d026682944f2..6694a0c30f61b 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -3830,6 +3830,50 @@ int device_add(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(device_add);
>  
> +/**
> + * device_enumeration_failure_notify - notify userspace of enumeration failure
> + * @dev: device that failed to enumerate a connected child
> + *
> + * Emit a KOBJ_CHANGE uevent with
> + * DEVICE_ENUMERATION_FAILURE=<dev_name>.
> + *
> + * If @dev has not yet emitted its ADD uevent, the event may be sent
> + * from the parent device instead.
> + *
> + * The caller must hold a reference to @dev.
> + *
> + * See Documentation/ABI/testing/sysfs-uevent for more details.
> + */
> +void device_enumeration_failure_notify(struct device *dev)
> +{
> +	char *envp[2] = { NULL, NULL };
> +	struct device *uevent_dev;
> +
> +	if (!dev)
> +		return;
> +
> +	/*
> +	 * If enumeration fails before @dev has emitted its ADD uevent, the
> +	 * device may still be in an early state (e.g. without a bus or class
> +	 * assigned). Emit the event from the parent device instead, while
> +	 * including DEVICE_ENUMERATION_FAILURE=<dev_name>.
> +	 *
> +	 * The caller holds a reference to @dev, so dev->parent remains valid.
> +	 */
> +	uevent_dev = dev->kobj.state_add_uevent_sent ? dev : dev->parent;

This is going to confuse people, if events show up for a parent device,
and for an actual device, in different busses/times, right?  Why
shouldn't the device itself always just be the one as it's up to the bus
to determine when to call this?

For your USB example, is the uevent sent state ever hit yet when you
want to emit this?

> +	if (!uevent_dev)
> +		return;

How can that happen?  A device will ALWAYS have a valid parent pointer.

> +
> +	envp[0] = kasprintf(GFP_KERNEL, "DEVICE_ENUMERATION_FAILURE=%s",
> +			    dev_name(dev));
> +	if (!envp[0])
> +		return;
> +
> +	kobject_uevent_env(&uevent_dev->kobj, KOBJ_CHANGE, envp);

You loose this error if something went wrong?

thanks,

greg k-h
