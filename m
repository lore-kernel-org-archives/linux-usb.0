Received: from outboundhk.mxmail.xiaomi.com (unknown [207.226.244.123])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A583A7F58;
	Thu, 26 Mar 2026 07:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.226.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774509098; cv=none; b=lhdBv8gm7jw6JTzdV8v/hIC2Q8jPEzsYE2aILVz+npUVLDi5CoP3A/NOShuzewt+3NITkAvYmRqf2DOzomeDqPms/2uDynpU94MagIKIFQOa+XeHOIzfSYQo3ZJe66PAImq9+0iDRAiQ8fQ3jCs/hQeVCI8daWE+Pk6m2gB5zcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774509098; c=relaxed/simple;
	bh=4dqwcTJzkZ9yOOKoFQz4wluMs43f8gp273CFF5DTQqg=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FqTq3TPDBBAf7DniAZIWt136pismYB/BUpmfemZQDZCCLFB/HD48nAGzL/yboNHlnDFp0NRFg+62+Txk2Rh/vCo2HGs85Vo40CT8rFcWVYMktmT0eYpF6SsK5tYkRFD+adkixri1VAUQxQFPM30avj9BRqgI0oeyy9pAcuhMnhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=xiaomi.com; arc=none smtp.client-ip=207.226.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaomi.com
X-CSE-ConnectionGUID: AaJu74F9TlGj/qyQDD4zjw==
X-CSE-MsgGUID: NLFgh4PyS2KFqqUvPeYCBQ==
X-IronPort-AV: E=Sophos;i="6.23,141,1770566400"; 
   d="scan'208";a="170814951"
Date: Thu, 26 Mar 2026 15:10:16 +0800
From: Dayu Jiang <jiangdayu@xiaomi.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Brownell
	<dbrownell@users.sourceforge.net>
CC: Kuen-Han Tsai <khtsai@google.com>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: u_ether: Fix race between gether_disconnect
 and eth_stop
Message-ID: <acTb2Gbgu6gGovPo@oa-jiangdayu.localdomain>
References: <20260311-gether-disconnect-npe-v1-1-454966adf7c7@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="gbk"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260311-gether-disconnect-npe-v1-1-454966adf7c7@google.com>
X-ClientProxiedBy: BJ-MBX03.mioffice.cn (10.237.8.123) To BJ-MBX03.mioffice.cn
 (10.237.8.123)

On Wed, Mar 11, 2026 at 05:12:15PM +0800, Kuen-Han Tsai wrote:
> A race condition between gether_disconnect() and eth_stop() leads to a
> NULL pointer dereference. Specifically, if eth_stop() is triggered
> concurrently while gether_disconnect() is tearing down the endpoints,
> eth_stop() attempts to access the cleared endpoint descriptor, causing
> the following NPE:
> 
>   Unable to handle kernel NULL pointer dereference
>   Call trace:
>    __dwc3_gadget_ep_enable+0x60/0x788
>    dwc3_gadget_ep_enable+0x70/0xe4
>    usb_ep_enable+0x60/0x15c
>    eth_stop+0xb8/0x108
> 
> Because eth_stop() crashes while holding the dev->lock, the thread
> running gether_disconnect() fails to acquire the same lock and spins
> forever, resulting in a hardlockup:
> 
>   Core - Debugging Information for Hardlockup core(7)
>   Call trace:
>    queued_spin_lock_slowpath+0x94/0x488
>    _raw_spin_lock+0x64/0x6c
>    gether_disconnect+0x19c/0x1e8
>    ncm_set_alt+0x68/0x1a0
>    composite_setup+0x6a0/0xc50
> 
> The root cause is that the clearing of dev->port_usb in
> gether_disconnect() is delayed until the end of the function.
> 
> Move the clearing of dev->port_usb to the very beginning of
> gether_disconnect() while holding dev->lock. This cuts off the link
> immediately, ensuring eth_stop() will see dev->port_usb as NULL and
> safely bail out.
Hi Greg,
Hit the same issue during NCM switch stress test.
Can you take a look at this patch and check if it¡¯s ready for merge?

Thanks,
Dayu Jiang
> 
> Fixes: 2b3d942c4878 ("usb ethernet gadget: split out network core")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
> ---
>  drivers/usb/gadget/function/u_ether.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
> index 338f6e2a85a9..2c970a0eafd9 100644
> --- a/drivers/usb/gadget/function/u_ether.c
> +++ b/drivers/usb/gadget/function/u_ether.c
> @@ -1246,6 +1246,11 @@ void gether_disconnect(struct gether *link)
>  
>  	DBG(dev, "%s\n", __func__);
>  
> +	spin_lock(&dev->lock);
> +	dev->port_usb = NULL;
> +	link->is_suspend = false;
> +	spin_unlock(&dev->lock);
> +
>  	netif_stop_queue(dev->net);
>  	netif_carrier_off(dev->net);
>  
> @@ -1283,11 +1288,6 @@ void gether_disconnect(struct gether *link)
>  	dev->header_len = 0;
>  	dev->unwrap = NULL;
>  	dev->wrap = NULL;
> -
> -	spin_lock(&dev->lock);
> -	dev->port_usb = NULL;
> -	link->is_suspend = false;
> -	spin_unlock(&dev->lock);
>  }
>  EXPORT_SYMBOL_GPL(gether_disconnect);
>  
> 
> ---
> base-commit: 1be3b77de4eb89af8ae2fd6610546be778e25589
> change-id: 20260311-gether-disconnect-npe-5861d9831dff
> 
> Best regards,
> -- 
> Kuen-Han Tsai <khtsai@google.com>
> 
