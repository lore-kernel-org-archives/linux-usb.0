Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D16C3ECBEB;
	Fri, 17 Jul 2026 10:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784284670; cv=none; b=g5MeLNLCmE2clHZpHuFNKUoviiC3daLASIM/hXzEyNLm6jgFrZX2eCuX/f19AgkmKUewffbwariF4mJW5pSYhqbB38hLHByTC6OqRqPvRJuAmHNTSZBgfV/Z9GMTrGOLVqXrx0QGcKYb6u8l+D+d6/7/Ut5H+N1goJ+LEVn78jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784284670; c=relaxed/simple;
	bh=kQkQ0vBq/PVfjp5ODTH/287caSRNfetuh6hC2pkCfpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=br5yrN2ZrI1y0SHXL+nQOucOLXZ0Xfgtkp7F23dSgSLtkJRwbfa7hVcSeIizYwAxGlooj/WMAWzO8zDIu0jrn5WEEcdlM/kEAPjckyX3oGxCjLacpeyNNLXtVFvC44+k5qOlXcipsqluVJqn6VIaaQ6uRZvGmEryTp7cQu6IaRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xqYSIot+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xqYSIot+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8E031F000E9;
	Fri, 17 Jul 2026 10:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784284660;
	bh=iGjC5GvcgNjQ+CtEyvAmYm4D9p0r1/AFuDGJPILzaQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=xqYSIot+qcjq5Hf4HsDEDMq0n8bfSqGJ0HEsHcVBx1ZkpGcJSmu4OZv0vUQ91jEaz
	 URiALtTYjdRgeH24NeESp6R5Uhk0RWgbWvYE2L1vs9JWh+Hohzjy22PUyntI2uQvJ+
	 ++dQwrAfaTtDSWrTV1V2TsFg+DgtxKjhHFma8CgA=
Date: Fri, 17 Jul 2026 12:37:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Akshay Gujar <Akshay.Gujar@harman.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	naveen.v@harman.com, oneukum@suse.com, stern@rowland.harvard.edu
Subject: Re: [PATCH v5 2/3] Documentation: ABI: document
 DEVICE_ENUMERATION_FAILURE uevent
Message-ID: <2026071745-ambulance-reload-4e29@gregkh>
References: <20260715114028.3627807-1-Akshay.Gujar@harman.com>
 <20260715114028.3627807-3-Akshay.Gujar@harman.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715114028.3627807-3-Akshay.Gujar@harman.com>

On Wed, Jul 15, 2026 at 11:40:27AM +0000, Akshay Gujar wrote:
> Document the DEVICE_ENUMERATION_FAILURE environment variable emitted
> in KOBJ_CHANGE uevents when device enumeration fails.
> 
> Signed-off-by: Akshay Gujar <Akshay.Gujar@harman.com>
> ---
>  Documentation/ABI/testing/sysfs-uevent | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-uevent b/Documentation/ABI/testing/sysfs-uevent
> index 0b6227706b35e..e362c34aa2ef6 100644
> --- a/Documentation/ABI/testing/sysfs-uevent
> +++ b/Documentation/ABI/testing/sysfs-uevent
> @@ -49,3 +49,28 @@ Description:
>  
>  Users:
>                  udev, userspace tools generating synthetic uevents
> +
> +What:          DEVICE_ENUMERATION_FAILURE
> +Date:          July 2026
> +KernelVersion: 7.3
> +Description:
> +               Some devices may be detected but fail to enumerate
> +               due to protocol-level errors or invalid responses.
> +
> +               A KOBJ_CHANGE uevent includes the following environment
> +               variable when this occurs:
> +
> +                 DEVICE_ENUMERATION_FAILURE=<dev_name>
> +
> +               The value is the kernel device name of the device for
> +               which enumeration failed, as returned by dev_name().
> +
> +               Example (USB):
> +
> +               ACTION=change
> +               SUBSYSTEM=usb
> +               DEVTYPE=usb_interface

This will be the port device, not the usb interface, right?

> +               DEVICE_ENUMERATION_FAILURE=usb1-port1

That looks right.

> +
> +Users:
> +               udev, userspace tools monitoring device enumeration failures
> \ No newline at end of file

Didn't checkpatch complain about this?

And is there actually udev code to handle this being proposed anywhere?

thanks,

greg k-h
