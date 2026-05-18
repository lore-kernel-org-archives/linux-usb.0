Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10E3399015
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 21:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779141269; cv=none; b=QnyCcD/Zmlw3Ik2gmh8MXHjVJkFxwaNU0kZxnJRWPo+SYb9uQ84K0pPiCWwPtYNbGvItdXMFghXO4fNVNIrOs9+u3HADDWM/huoN8e18gak7MWhZsUW16szh0bav9iYqoqoBo0PZDzha1sV6Q53jhSOY/wM5u7+ExzhLnjJOwd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779141269; c=relaxed/simple;
	bh=QL3k29rAvR2xNsgHCe6ZsHOzX8Bl8P0IRFycyNMvTTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qdz2Qt6ZiD6bm8vXNiUBGp5Je49CJ3QYLEElGVK8jJEEbbPe3u1U3+ngIb+golLJuDwWypcFVeIyF20FfuRHBWXUz+/AkvAWYy7lT1VtJ7awSXuroChLhLQblgZlSlYPQVI36gZHvs1PUceJ1Je4OXbc5WIVtMsKCed3Uex4iJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=CHtdgU17; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="CHtdgU17"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-50d87610513so36921721cf.3
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 14:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1779141267; x=1779746067; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xqk9vBawcFaV4OMn7N1td+kO+tZlE2hfUob5M/7FxBk=;
        b=CHtdgU17OSJVdEk+5FVXyDW0LhoNaX5YKX/ZguPMS/UUNkEng3RVa0eJ60dVnK1wTD
         beB3ibDfWmHScFfqCk+ydLuzd/6gLXt5tiB3Q+WBm9kI223LvPjQqr9/P86M6gJNyo/N
         uUH4ElewSf5N72ZW8mTvIcuidRlB4rWu+4+lZ6UI4M0NsK9ahXKLrR/JD79O62wXDYLu
         I5DnaAbF0Yc9eDPp+WxwbDCpnJXkVkoEOZQ0zsAHBI0JrJVfxFM/NnYBDY35hZDfpt2j
         cJBQbOBBE8+N/BwmWXFcd8rVmswawlbAl3XqwJ+BStuxt5MALvFS2te5pc/0ZQwGTQ7K
         NxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779141267; x=1779746067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xqk9vBawcFaV4OMn7N1td+kO+tZlE2hfUob5M/7FxBk=;
        b=Hbxqtt1CSbtNf3S46GOD9eUHHdLE3o0lVWH8yN90PK/jUuPvjqcvkbuwRB4TLTwfsG
         bXEhrDIEYG+sSy0dJ6Aq9tqe/3Pd28HVrpXajK2xaBsHSZDijI1VyHt67tIcfzWg1dcS
         WWfkUEZAF3uo9vPi+kCNvy+z7y/i//XGDQqPbS99KvPtd9H9n6EAm0CoYFjJ3udRhZ54
         heIOstGVQOoeRMjGPj1UlQYXBbnkoO39hQPtZCCuJbgn4/zzN8QY+pFEhrzHE6+xAYXu
         POAMBo0cvCOXR3laNA0vNSwmXGdunBrJT8jcKu6xjQYpw69SHso5ZPrLKZEwZHJk5B4L
         ZltQ==
X-Forwarded-Encrypted: i=1; AFNElJ/KbjxAD55s/+MrWmAow8+ppx/j1lBj+ABclTMbh0zU1Ns4z5a/iGw7RdzJauBTWbm62Sya6ky0CY8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxT9+ZZQwMBAQi1BgQmY0BKUCC7RyCjX6AqWcWU2JxsvJvGrhG
	MYCy+HL9rFcdANRoIN25AYTNTIFZfDHeZwqLyCzhSDMhwD/2V7o6CZ+Z9QKC3/eXypVu+uVktYj
	YdFE=
X-Gm-Gg: Acq92OEUxxYoNI16k7h3LJe4B0ko8IFcbt3AptTeJ4NDbQfm1NiNLbxDrN2f6i9R5KE
	gLAs+pjrjhN9GNnDOEOS5XECa6IphaLv1xqEc+9ebTchfWEeZshmq2RpdANEXR7vrfFg/A3wzXN
	ITEqh/uJTL0DkQO7Xsc1I4HZGWELcg0S8hwCyWn6LlSBPKVRM4c5h2eNnfwBqLPbZEbJRBAUQ+F
	UuXplhAPEhoQUmn/o4Qp84+GrJbmj2Dfi32j5WDoQCiefQT78P9+JT+fmS3DHJV5Mbv6zQ0Oh0i
	8OlEs2IboQy++lmoUD2rJbM3n0TYBsnkqmVtH2dpEzmyrqQTSDH3KLUjpul+TotOzCpdTQXzpLJ
	tQ4F39xjjG3QFavsOHppYD+Z1mpO2fivIIeQObWle64a0gxCqpJ+xxXVQMkTeOfJNU9TuBgKTpG
	gINydfsrzNOW2FarDWKLykIeoX01Owu2rw+uVs56STIu8=
X-Received: by 2002:ac8:578f:0:b0:50f:9c32:509d with SMTP id d75a77b69052e-5165a286f00mr234843941cf.60.1779141266677;
        Mon, 18 May 2026 14:54:26 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5164581f1eesm141238591cf.25.2026.05.18.14.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 14:54:26 -0700 (PDT)
Date: Mon, 18 May 2026 17:54:23 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: pip-izony <eeodqql09@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Kees Cook <kees@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	David Mosberger <davidm@egauge.net>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] usb: host: max3421: Reject hub port requests for
 non-existent ports
Message-ID: <a5b4720d-e91b-4a81-b2b6-e04835e1826b@rowland.harvard.edu>
References: <20260517000145.1868817-2-eeodqql09@gmail.com>
 <20260517190308.1876316-1-eeodqql09@gmail.com>
 <20260517190308.1876316-2-eeodqql09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517190308.1876316-2-eeodqql09@gmail.com>

On Sun, May 17, 2026 at 03:03:08PM -0400, pip-izony wrote:
> From: Seungjin Bae <eeodqql09@gmail.com>
> 
> The `max3421_hub_control()` function handles USB hub class requests
> to the virtual root hub. The `GetPortStatus` case correctly rejects
> requests with `index != 1`, since the virtual root hub has only a
> single port. However, the `ClearPortFeature` and `SetPortFeature`
> cases lack the same check.
> 
> Fix this by extending the `index != 1` rejection to both cases,
> matching the existing behavior of `GetPortStatus`.
> 
> Fixes: 2d53139f3162 ("Add support for using a MAX3421E chip as a host driver.")
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

Heh, this made me go back and look at dummy-hcd.c.  It's missing the 
same check in the same places!

Would you like to submit a patch to fix that driver as well?  If not, 
I'll take care of it.

Alan Stern

>  v3: New patch in v3, suggested by Alan Stern.
> 
>  drivers/usb/host/max3421-hcd.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
> index 3d6b351dcb1a..73e76d0e6973 100644
> --- a/drivers/usb/host/max3421-hcd.c
> +++ b/drivers/usb/host/max3421-hcd.c
> @@ -1685,6 +1685,8 @@ max3421_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value, u16 index,
>  	case ClearHubFeature:
>  		break;
>  	case ClearPortFeature:
> +		if (index != 1)
> +			goto error;
>  		switch (value) {
>  		case USB_PORT_FEAT_SUSPEND:
>  			break;
> @@ -1728,6 +1730,8 @@ max3421_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value, u16 index,
>  		break;
>  
>  	case SetPortFeature:
> +		if (index != 1)
> +			goto error;
>  		switch (value) {
>  		case USB_PORT_FEAT_LINK_STATE:
>  		case USB_PORT_FEAT_U1_TIMEOUT:
> -- 
> 2.43.0
> 
