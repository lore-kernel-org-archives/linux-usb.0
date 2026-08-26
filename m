Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719453C4B93;
	Wed, 26 Aug 2026 10:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739699; cv=none; b=cdd75+khOOQpww8bZeaSD5pvkWUwwAiahUsLVtM1f77pNAt2SCa88nxpTjkRoGFBs/oXDMW2RrtekRx/OolNm3PTcQtjzR3mVJex5CyRalaklvIOexFIHMjKzaL8RwHa8fpJGRmPtbbJWxfUt2OvPMoipHxfxbQ5eG+lEK2iDQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739699; c=relaxed/simple;
	bh=UfLnOD1t258kC8ndfSeZNYYTQSsscRhRCqp2rn6xV7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KKjqQ2NFG6EQCQbMWpBeLjz5YH9Pz90Qh+j9hyuF34LFwcQCvOKVXUhwqszbZ5sfOwi6viOAr5F/PNL3fDrHYaDkR8/+VxzkW8KlhZxxqHjGbVRJhK95CEnY69XCmtWFSIpDZ39Ybm0XwX5DH4Lmnlpw2w83snn/dKvK1FyEzOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iEU1A/fA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iEU1A/fA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85E6B1F000E9;
	Wed, 26 Aug 2026 10:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787739698;
	bh=w2lz5S7DqP1DF0hVK0GP9SrUAC2QSIXs036qsCvjjVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iEU1A/fAG4HJEoa2B0KiKhS2awaqLfjq8jo/xWVC8e7XXnsm32eEQ02IqsCPO2BOT
	 gCGCojF33jpgErKnsH1c6FYXuuQQxjy+fny0/A3gAWZnH61CCvS4ghlzMegAcs2pM7
	 Bd4FdGx/iaQFy1ErShdvnVhUWDEXG98e0hcbJORM=
Date: Wed, 26 Aug 2026 11:27:28 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Cheng Lingfei <chenglingfei@foxmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Felipe Balbi <balbi@kernel.org>,
	Peter Chen <peter.chen@nxp.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+06ec7624018233e17113@syzkaller.appspotmail.com
Subject: Re: [PATCH v3 2/2] usb: gadget: goku_udc: fix kobject warning on
 probe failure
Message-ID: <2026082647-tripping-skater-fe31@gregkh>
References: <20260826-b4-fix-usb-v3-0-b28366e817f3@foxmail.com>
 <tencent_79E338821F4FC825B0149D5951476C189E07@qq.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_79E338821F4FC825B0149D5951476C189E07@qq.com>

On Wed, Aug 26, 2026 at 05:15:07PM +0800, Cheng Lingfei wrote:
> goku_probe() calls goku_remove() when hardware initialization fails, but
> the gadget device is initialized only near the end of probe. As a result,
> goku_remove() calls usb_del_gadget_udc(), which drops a reference to an
> uninitialized gadget device and triggers a kobject warning.
> 
> Initialize the gadget device immediately after allocating the controller,
> but add it only after all hardware resources have been acquired. Track the
> gadget registration state so goku_remove() can safely clean up both partial
> probe state and a fully initialized device.
> 
> Use the split gadget removal API and drop the final gadget reference only
> after all hardware resources have been released. Obtain the controller from
> the embedded gadget device in the release callback because driver data is
> set on the PCI device rather than the gadget device.
> 
> Fixes: 3301c215a2bb ("USB: UDC: Expand device model API interface")
> Reported-by: syzbot+06ec7624018233e17113@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=06ec7624018233e17113
> Tested-by: syzbot+06ec7624018233e17113@syzkaller.appspotmail.com
> Assisted-by: Codex:gpt-5.6
> Signed-off-by: Cheng Lingfei <chenglingfei@foxmail.com>
> ---
>  drivers/usb/gadget/udc/goku_udc.c | 28 ++++++++++++++--------------
>  drivers/usb/gadget/udc/goku_udc.h |  3 ++-
>  2 files changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/goku_udc.c b/drivers/usb/gadget/udc/goku_udc.c
> index 5ad8633f522b..615cc6b8f354 100644
> --- a/drivers/usb/gadget/udc/goku_udc.c
> +++ b/drivers/usb/gadget/udc/goku_udc.c
> @@ -20,6 +20,7 @@
>  // #define	VERBOSE		/* extra debug messages (success too) */
>  // #define	USB_TRACE	/* packet-level success messages */
>  
> +#include <linux/container_of.h>
>  #include <linux/debugfs.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> @@ -1726,7 +1727,7 @@ static irqreturn_t goku_irq(int irq, void *_dev)
>  
>  static void gadget_release(struct device *_dev)
>  {
> -	struct goku_udc	*dev = dev_get_drvdata(_dev);
> +	struct goku_udc *dev = container_of(_dev, struct goku_udc, gadget.dev);

That looks wrong.  If it is correct, please create a proper macro for it
so that you verify that this all is working properly.

