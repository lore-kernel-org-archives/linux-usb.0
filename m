Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3319F3C8C48;
	Wed, 26 Aug 2026 10:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739702; cv=none; b=T6ySrL/Fn0zdzyQ1lM+bQclXVYr81DPGFxUR6nxR4KmXtupG3QhYPcedkA5Azjs6qJvo6vjm4v7f+8UdNs3x2MgRAEggcXjfMSAmBAQQ6n+niXwXLFkTE/ET4ufnDr0SStXCU5tFhgKJRExY74dmPmTjfWFXcNYWHy7Qxtvbi8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739702; c=relaxed/simple;
	bh=WAWMoxOMw1X1ig7ZylBgWgbnoOaJsdVcS000vCmH+68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JKT926Cty0ywUIidgs0hCiHjf10H1knFW+aIm+PvpMt3rDb7CTHRkVLQtRGg+dLsCb4wSOx/6Z7EE9PlumwwRHJBcrocJSoU3+L3uGQadwqLY6zN3m0evvTt3BRh1DbkjTgoIOQwDrTVOpMqGVHCGsY6eN7DsF7pgXnWUWKDGhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Jn4mz9HS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Jn4mz9HS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B8151F000E9;
	Wed, 26 Aug 2026 10:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787739700;
	bh=vw2vVLVJdn1nqDa7LCLWbZgAnC6CBWOzqVedZ5Man7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jn4mz9HSAz32CcM3ab1YpsaTxZZptszMBGhN4ZuOKe0Xxk8ja2mmbXJsBTnhNl4ne
	 hlcHJ8PhyeLxrjflSq22HsvxLZZueBJKiAMJhn4RD5OtGFQnZLT49Kxj9xK4ZWVZiM
	 vIyHHp6SDPOOMlQ0piC9w6mR2y+O89PumZU6GUkQ=
Date: Wed, 26 Aug 2026 11:27:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Cheng Lingfei <chenglingfei@foxmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Felipe Balbi <balbi@kernel.org>,
	Peter Chen <peter.chen@nxp.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] usb: gadget: goku_udc: move debug output to
 debugfs
Message-ID: <2026082632-blank-thyself-00a6@gregkh>
References: <20260826-b4-fix-usb-v3-0-b28366e817f3@foxmail.com>
 <tencent_D7673CCE71B03F2C90CD60873AB4A245D808@qq.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_D7673CCE71B03F2C90CD60873AB4A245D808@qq.com>

On Wed, Aug 26, 2026 at 05:15:06PM +0800, Cheng Lingfei wrote:
> goku_udc exposes diagnostic state through /proc/driver/udc. The single
> global proc entry collides when more than one controller is probed and
> triggers a proc registration warning.
> 
> The data is intended only for debugging and is not a userspace ABI. Move it
> under the USB debugfs root and use the PCI device name for a per-device
> directory. Create the file only after the UDC has been registered.
> 
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Link: https://lore.kernel.org/2026082616-glue-atlas-0cfd@gregkh
> Assisted-by: Codex:gpt-5.6
> Signed-off-by: Cheng Lingfei <chenglingfei@foxmail.com>
> ---
>  drivers/usb/gadget/udc/goku_udc.c | 47 +++++++++++++++++++++++++++------------
>  drivers/usb/gadget/udc/goku_udc.h |  5 ++++-
>  2 files changed, 37 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/goku_udc.c b/drivers/usb/gadget/udc/goku_udc.c
> index ac2a984c2f87..5ad8633f522b 100644
> --- a/drivers/usb/gadget/udc/goku_udc.c
> +++ b/drivers/usb/gadget/udc/goku_udc.c
> @@ -20,6 +20,7 @@
>  // #define	VERBOSE		/* extra debug messages (success too) */
>  // #define	USB_TRACE	/* packet-level success messages */
>  
> +#include <linux/debugfs.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> @@ -30,9 +31,9 @@
>  #include <linux/timer.h>
>  #include <linux/list.h>
>  #include <linux/interrupt.h>
> -#include <linux/proc_fs.h>
>  #include <linux/seq_file.h>
>  #include <linux/device.h>
> +#include <linux/usb.h>
>  #include <linux/usb/ch9.h>
>  #include <linux/usb/gadget.h>
>  #include <linux/prefetch.h>
> @@ -1050,9 +1051,7 @@ static inline const char *dmastr(void)
>  		return "(dma IN)";
>  }
>  
> -#ifdef CONFIG_USB_GADGET_DEBUG_FILES
> -
> -static const char proc_node_name [] = "driver/udc";
> +#ifdef CONFIG_USB_GADGET_DEBUG_FS

Why do you need this config option check anymore?

