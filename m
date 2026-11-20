Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795183562;
	b=V5yavkXBfYtZJbuYGzVjwMy3XGLKWlQDFD/h1yQY40VFGfTKK3p0I+RiPakBte9tyuLZ
	 5k/x0F7fvf99eLdXIEFlIKRhRdN5YYmeAWYOwuM3Z1ybNp8XPLak/AbQFCp7pYnxEL6Ja
	 SvYV1u3JMCu5mEPJn+Vp0gTYXyU73VhN4rPa9fONmh4S2lTMW2Q6yiqWzwSndXATsJxzY
	 Hb8ehspsFrVDkWrMX6XIA08zpeY1NzQQrV2+IiyAr2P3VfvNB/7EtVXq7RObveZnZy7uO
	 aLjcB9yDxfNvXkQESw36SyOSXEisjuthVLJNNsPXebbC8512YDsLMk6WqnA0IUwzhrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795183562;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=51Cs/lJptEaPc0qI8lZEFylkfjoLgr9Fc+9yPXpu0ec=;
	b=SfwtvlLu/dwaEr+Ue883KS6Jr2KeLrZ+7QkOd4yiyTO0uhcFd7VQkZ8fENGH9lYfCxBU
	 Xh7mxZnRl6TkTVnfje1agXmCXJoJAWwxZ7CzLDdXqcGjZWVIwN1xZc5OBqbMX/s6uSn5u
	 JeBG+uktp2HGBw7d/ZzFp15Ltiqs6aU5x8BtXnXcZziiLXhyQD3F4j21gLzQbMd9gLJfv
	 cI/zbZVsB3dPPZI+GRtyaQtPt6L40Q0BviW6S6+P9MwNdC6EHf9AaCmwPeWBb+MOfa1Xv
	 Bak5LVJMpD4ipPsYQ/H73HYUWdv8tqpJ0ArZJrheWHzYvLOXwD64IbqEcNg6KOYsqtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Dl+v355X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F1F606A334;
	Fri, 20 Nov 2026 14:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Dl+v355X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DA6F1F000D0;
	Fri, 20 Nov 2026 14:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795183562;
	bh=51Cs/lJptEaPc0qI8lZEFylkfjoLgr9Fc+9yPXpu0ec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Dl+v355XbRjnS/YhTWdm8UjSBQ6vQUM6mejqB1qHRpQbuLuxAsFr+cwyAzPxgOk3P
	 KD2t5DpuZC3b6RQWv2NVlTVqV8moSVfPggRFmfgx0BzDqg4HHBICtrflNRbkNybaUx
	 ImjE7L/xPqAnFKmucgg60ZR3OseBvQBZpzepIRVQ=
Date: Fri, 20 Nov 2026 15:05:59 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jhon Wilker Rodrigues Aquino <jhonwilker0112@gmail.com>
Cc: Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>
Subject: Re: [PATCH] usb: musb: host: clear stale TT buffers after aborted
 transfers
Message-ID: <2026112019-tripping-catnip-a738@gregkh>
References: <20261103190333.87207-1-jhonwilker0112@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103190333.87207-1-jhonwilker0112@gmail.com>

On Tue, Nov 03, 2026 at 04:03:33PM -0300, Jhon Wilker Rodrigues Aquino wrote:
> From: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>
> 
> On AM335x with MUSB and a Microchip USB2514 hub, disconnecting a
> full-speed CDC ACM device during bulk traffic can leave its TT unable
> to enumerate full-speed devices. High-speed devices still work, and
> Reset_TT restores operation.
> 
> Queue Clear-TT-Buffer for failed or unlinked control and bulk URBs
> behind an external TT. Park the affected endpoint queue until the
> asynchronous clear completes, so new URBs cannot use a buffer being
> cleared. Keep the parked queue alive until the callback finishes,
> including during endpoint disable.
> 
> Signed-off-by: Jhon Wilker Rodrigues Aquino <jhonwilker0112@gmail.com>
> ---
>  drivers/usb/musb/musb_host.c | 166 +++++++++++++++++++++++++++++++----
>  drivers/usb/musb/musb_host.h |   2 +
>  2 files changed, 152 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
> index 31b0612489911..6e8cf462676ec 100644
> --- a/drivers/usb/musb/musb_host.c
> +++ b/drivers/usb/musb/musb_host.c
> @@ -22,6 +22,11 @@
>  #include "musb_host.h"
>  #include "musb_trace.h"
>  
> +static bool tt_clear = true;
> +module_param(tt_clear, bool, 0644);
> +MODULE_PARM_DESC(tt_clear,
> +		 "Clear hub TT buffers after failed or unlinked control/bulk transfers (default Y; set N only for A/B comparison or if a hub mishandles CLEAR_TT_BUFFER; affects new requests only)");
> +

No, this isn't the 1990's, we should not add new module parameters as
they will not work well over time.

Do this automatically please, a user should never have to know how to
pick this.

thanks,

greg k-h
