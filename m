Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB2A426D03
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 14:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786543420; cv=none; b=CEyB9RSDGU6hGAbyyQsppJBFuXLHx/4Bw4RO3wzRwmkV3gB8MtFYJeYSR7+AwS349r9bw8GKjaOwIPFd7YBZYRDOT4Ho4LKlwsS3MpTYBlEEo4YsN8eR0c/FaHgqnzDn+KZijT3i38AD4mvaNx2u+NQVkzv2UBnk0BED9jIHYDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786543420; c=relaxed/simple;
	bh=tkFBWX6TWsY2yqbIdcFhwLJgBnXo3tnHmb+/clVqnq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WkMT/bfWCXMwZpSriiCxZk9LIdBgPMYwGWlLVKdwdvBbUTQOIqfmz2UroM2aw149JGaaxdL3jQZeXCjQfyVqMk6XEsycYcWK/+ieBVov26+ViQtQuL1sg6XxaR+fjWYFaUZ+bB6GjP7q+SX49D4A7DD5t3tlEgpWkj6UeuGyuEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=gVNIh5l/; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="gVNIh5l/"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-52d5bfa4bafso10395651cf.3
        for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 07:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786543417; x=1787148217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1g2SHfgKmket+Ww0ZqSMLYugnJBxmjuhN4c9IVa+FUE=;
        b=gVNIh5l/hSxZ8Nx+RCDLC61gPro/3sY2V2oyToa+XOHgodHmFCTTtZci4LN/6Y75XD
         zCNZipWSYKkLFbN9u6WByCtkshzA3W1MkNcgbTjmH7b9KbOSJHxbBWFKOyTHx9jQAasp
         aEZEFfFqQmSqAmqU4wPo1n2rzSRIo73/qEI+GDymWg4uqMr9sD8EERoKSPaEdRNyrtiY
         IT5vCJ924s3u9vWlV/J5IdJqigGEK/ayVzFqUL+06SA/VkwwTQJ3hhSL2HAi1nemhXtr
         hhdELm6Anx7+0mOi1kkG3eg3kKbYW6l5sFjUoSqhJYpYiK3dxSzQXVDtkKJRS6HMs4F8
         kFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786543417; x=1787148217;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1g2SHfgKmket+Ww0ZqSMLYugnJBxmjuhN4c9IVa+FUE=;
        b=GWlB3UTUPhQaEDOhxoEQVb4oHS+PprznTDJjnO6WrVUckPjG0zSuSPmqWAInVNNnkg
         NQkMlMFQnnX62LcvASsfjdE4p+1mrSF4Dw3IRgM0Utqjz2RG761jD6x4AAYFDIERnt1H
         NNvOGdw7Fw/AqqnTPWIegB3S82f8JwsNnjoM5J31sqVLtIIXtdKXMSU0MBIEu72kQ3A1
         D+dI3ySUENB/9H2SlsViOBjdtx1zaW6hsUuASnGfdZtsxa8u9Iz9W9VRcQRaIE69RBAs
         b320PQXZ+qY6mu19nsF0dFv8L2Rbmdutzl/G0FvJnXceperyfcnLPwVWoj55ERVy3zfz
         EM+w==
X-Forwarded-Encrypted: i=1; AHgh+RquNCFpTytYuazqNpwZLodHOH2v8xRck7Aet5WHUDg2Z/V7MjVNDmacsow4kLlBnWOASyn/RBwpJ1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDgvoGX6wTNmU4i4o5eTXCwHtjuXcbApYjCEfgnuZOP8YmRzHT
	F0iSBC05sbcOKmXxTaFIvHYgtuYm9oYu5FfXeG8YzOTDfQ0odgDf39WUfBqJBPQeVQ==
X-Gm-Gg: AR+sD10QZOpdx5X8qGSRV0E0zgGp/g8YVqjgyjjwahnrTsAMlilg+Ubue8DHQJAV4Jg
	lCdMLOsoawsGuSYQkiv2pq/lNp/Q5q53bpJzuX4kVv6L3/VlcVT7IcjCjAybnsPP5Vvq2ISNnCd
	7YTkRDccW80R3pYakC1j1KkTEQnNjCNslw5nGagY8n0GQOTeZ3a8nXosLpDHMimOa7zMRxEhTJP
	WxSppxIfT/c+m5HcCeeA1ii5rPmikHh0v+EXBPuAQRi73xgK1uXvYxSXtkmmWz4lezD16XDP+ax
	cxU0n/Km7Jfy5zTaw8PshpTj05NRWddxVr8EAPhg7njVZX4oUcNs7mpVRACRzze0q3xbuT9UcNu
	w+vODJbfJzKdN8PnEfXHbVoBkLDrTSKj+ReZzums0BQMO8ugm2qVOSPMD1KWINfhOCP+HiPiRuY
	83jTDGNMaWOYxDA81aNxUJtyVcKXEWSVF6fdPIPjtB3f/lbD+2RfgA56uPwej+h54oFWpY3hlGS
	A6orgw=
X-Received: by 2002:ac8:5a8f:0:b0:51c:ace:de6a with SMTP id d75a77b69052e-52d6471a97dmr39189301cf.18.1786543416751;
        Wed, 12 Aug 2026 07:03:36 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d61c3adecsm18281101cf.11.2026.08.12.07.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 07:03:36 -0700 (PDT)
Date: Wed, 12 Aug 2026 10:03:33 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Seungjin Bae <eeodqql09@gmail.com>, Kees Cook <kees@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Sebastian Urban <surban@surban.net>, Felipe Balbi <balbi@ti.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] usb: gadget: dummy_hcd: set no_sg_constraint only
 on the SuperSpeed bus
Message-ID: <38202595-cacd-4527-88d6-1ed1980420d3@rowland.harvard.edu>
References: <20260807075438.5566-1-igor.skalkin@oss.qualcomm.com>
 <20260812081910.6821-1-igor.skalkin@oss.qualcomm.com>
 <20260812081910.6821-3-igor.skalkin@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812081910.6821-3-igor.skalkin@oss.qualcomm.com>

On Wed, Aug 12, 2026 at 10:19:10AM +0200, Igor Skalkin wrote:
> dummy_hcd registers two separate root hubs/buses: a HighSpeed one
> emulating an EHCI-class controller, and a SuperSpeed one emulating an
> xHCI-class controller.  usb_submit_urb() rejects SG URBs whose
> non-final segments are not a multiple of the endpoint maxpacket size,
> unless the bus has no_sg_constraint set.
> 
> For SuperSpeed bulk endpoints maxpacket is 1024 bytes; usbtest
> generates SG lists with varying segment sizes (e.g. 512 bytes) that
> are valid transfers but not maxpacket-aligned, causing usb_submit_urb
> to return -EINVAL before the URB reaches the host controller.
> 
> xHCI-class controllers have no such DMA alignment requirement, so set
> no_sg_constraint on the SS bus to match.  Leave the HS bus unchanged:
> EHCI-class controllers do have this requirement in hardware, and
> dummy_hcd's HS roothub is meant to emulate that behaviour, so the
> constraint should stay enforced there.
> 
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Assisted-by: OpenCode:claude-sonnet-5
> Signed-off-by: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/gadget/udc/dummy_hcd.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
> index 29f671c7b319..0ae600159478 100644
> --- a/drivers/usb/gadget/udc/dummy_hcd.c
> +++ b/drivers/usb/gadget/udc/dummy_hcd.c
> @@ -2578,6 +2578,15 @@ static int dummy_setup(struct usb_hcd *hcd)
>  		dum->ss_hcd->dum = dum;
>  		hcd->speed = HCD_USB3;
>  		hcd->self.root_hub->speed = USB_SPEED_SUPER;
> +
> +		/*
> +		 * xHCI-class SuperSpeed controllers have no maxpacket
> +		 * alignment requirement for non-final SG segments.  Only
> +		 * relax the constraint on the SS bus; the HS bus keeps
> +		 * emulating the alignment requirement of EHCI-class
> +		 * controllers.
> +		 */
> +		hcd->self.no_sg_constraint = 1;
>  	}
>  	return 0;
>  }
> -- 
> 2.49.0
> 
