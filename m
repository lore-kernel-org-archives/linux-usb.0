Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1534AA01C
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 14:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052055; cv=none; b=fP2NjQMODfvhsAOVg0/Zn4ZudHMjxD8KbV/tm12JM2G4cDtal6ShCD7cYKNFCKukhLXJs8UoqZ9u6Aa9kHx3ZfSKBGUx4/7zM8sHDIrEQljzEzelavkG9YsdDha/eUlSRkArFGLzSSsx8JRX4y6FYoIUblTft2C39Ws7JF1a8FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052055; c=relaxed/simple;
	bh=AW1voraFR+VCTHLGPTYMB1dx82/9seIqzpUGNvihkEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oIdANYPBzXj7hy2FW8LGOC5nUEzx3sD8pKisbRtkaSkpVVCNU/2VN8VON5WhSKSHqvXTzjIslm6aJa7NE3KZWt9Pdx2hMlU1q2Rct1Y7+8+nfpK/6Alwhm2IRAMK2e1A/pKYD3KwF7I3hojR+609c5c8FmeyawW9+J645O1QMl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=cKqq1R/G; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="cKqq1R/G"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76543e1so13077821cf.0
        for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 07:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1789052053; x=1789656853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9fpkkULHFsgtcssGIc+n8ftfpgEomFj1gRnKkIL/Qg=;
        b=cKqq1R/Gx5gJ+prr0aW8dFH0YVoAoTmlxJslM1lFOJ8mEVKvhuOh6JwriOU5LFmJeg
         joIBv2xx8cYWFOUryWxb3HcJBDZ+vtf2GY9W7CJmg+NvkuyitwCLP4rMPyfCJ7dCbnlN
         nCNOqvBAAm6CutULO0zOJGAfzycjw5roKpjfDFCAwjWOuODOtkO1LjqX3aMYV2gQ/f+n
         vuwit1wosLqK2HlSr6hiWHiUsb1BEWM7Hhx+qrFqKx8Lp7bQuaKZjMnTD6iQG+CWCGf+
         /prnpuxVOwn0tkdF46OipGWp6ODXVugdoNdkXUXhPDbZPCm4BfxMLi8uXOqMeEViaoJH
         iwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052053; x=1789656853;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9fpkkULHFsgtcssGIc+n8ftfpgEomFj1gRnKkIL/Qg=;
        b=qAttiTlSZqTaggg7StBx3f4e193A1OV2cQJHHBvAWc/MP/aYHYJ9UPf7keXja9UUdK
         Fh/UvKT3F6/SLU5GMDeG3b3b+db85mM1VqS4BmTsMF8WxrSNOKffH866yrmIekUBJ12W
         YwjrYRY8KR/gaLoQzDBKQJPhrPfoCEuyDB0QIAd5NaCwuQ4I3HRy1gA+zjVPMXpYZisZ
         E2OFThsN4ARHWtj7zpJ/2pwntfVayFPodCuJvZJ+UAropYau7PrqamYxAx4YSfedW+t4
         N/ol7fjnI9/y5yIHTIZkyv9j1RYZNp5XDPD2zMvc3iAg7QdPZgyUinuKHCXtOVNFi+Jf
         d3hw==
X-Forwarded-Encrypted: i=1; AKwUvBxB1GHGhTugi2OS1YULr1lOOEcHr56eRMZD1GEZq89VEDasbXKHOckwAQbm8CGQr2u67HvuZq1bfqw=@vger.kernel.org
X-Gm-Message-State: AFuF++nMMvauu5Ibe65fu+8GpU9p76D5CJRlzT2gxCS1X/AGYcM04Azv
	3jYZiUP26D63SR1DqdbrP5ypvJaPGccy6bd06CL0TlAA6i87kpnL3O6IfjM7QXEjlg==
X-Gm-Gg: AYBFou3AhP0ExRiH+YWURetRnX0p4mABKoWNpQfn6LTfzsJVfJ1BYOswhxWmx2lm07T
	Y7UQD5Y64pJiP66MjWArJa81BOFdy3Owv9Jqw6whqsOTsXbfXELZJp7tuzjooH9mm6UW2pSiQ47
	P3ACRp0w2LuPpo6BdETuPOU5D0/Y3w16CCgKeiz/89hhAbh4SC0g1KR/+K5dZzvaA+4CQipWQp/
	giMdxiSLvsseuvR4o5VuIOm173UbxUkSxjb6p06nh2P1fCCW9FHuPn7gyAxCUAJcKDjHlL3vwAH
	spWeqVibwQh7hTmDHqSrJMIedyH0Pa0L8FI83EYBDNLJN/NwpNYOlq5TeCYzJ+YnRtgNzrXSWcD
	85sZETEDcDwsgfUZoBTc3Zxq45+NKJXNL0PsB8RQ0IdcZqnaRlA9iDJGa4W0pE0C8mLZiyg4E0+
	luBguyei3wSgXwGmaZuYJyjLF59ec0lxZnt8FiWsKtIhdeqSr3MJAREFEWDfGqvwyI99YukvZr
X-Received: by 2002:ac8:5f47:0:b0:530:b2e3:f774 with SMTP id d75a77b69052e-530b3638587mr59852731cf.29.1789052052689;
        Thu, 10 Sep 2026 07:54:12 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ac575c32sm39327271cf.5.2026.09.10.07.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:54:12 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:54:09 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Adriano Cordova <adrianox@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sarah Sharp <sarah.a.sharp@linux.intel.com>
Subject: Re: [PATCH] xhci: ring: use get_unaligned_le32() for setup packet
Message-ID: <2c57827f-261f-4b10-b5f5-71bf49ceeeca@rowland.harvard.edu>
References: <20260910123629.345114-1-adrianox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910123629.345114-1-adrianox@gmail.com>

On Thu, Sep 10, 2026 at 09:36:29AM -0300, Adriano Cordova wrote:
> The setup packet maps directly onto the two little-endian data words,
> so read it with get_unaligned_le32() instead of manipulating
> bRequestType/bRequest/wValue/wIndex/wLength by hand. No functional
> change.
> 
> Signed-off-by: Adriano Cordova <adrianox@gmail.com>
> ---

Nobody asked my opinion, but I'll give it anyway.

The original code was fine as it was, regardless of the FIXME comment.  
Using get_unaligned_32() relies on details of the layout of the setup 
packet and is harder for a reader to follow.  I would not do it unless 
it provided a measurable improvement in speed -- which it doesn't.

Alan Stern

>  drivers/usb/host/xhci-ring.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index ec278a9f9540..e428d3794717 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -58,6 +58,7 @@
>  #include <linux/string_choices.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/bitfield.h>
> +#include <linux/unaligned.h>
>  
>  #include "xhci.h"
>  #include "xhci-trace.h"
> @@ -3837,7 +3838,6 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
>  	start_cycle = ep_ring->cycle_state;
>  
>  	/* Queue setup TRB - see section 6.4.1.2.1 */
> -	/* FIXME better way to translate setup_packet into two u32 fields? */
>  	setup = (struct usb_ctrlrequest *) urb->setup_packet;
>  	field = 0;
>  	field |= TRB_IDT | TRB_TYPE(TRB_SETUP);
> @@ -3855,8 +3855,8 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
>  	}
>  
>  	queue_trb(xhci, ep_ring, true,
> -		  setup->bRequestType | setup->bRequest << 8 | le16_to_cpu(setup->wValue) << 16,
> -		  le16_to_cpu(setup->wIndex) | le16_to_cpu(setup->wLength) << 16,
> +		  get_unaligned_le32(setup),
> +		  get_unaligned_le32((u8 *)setup + sizeof(u32)),
>  		  TRB_LEN(8) | TRB_INTR_TARGET(0),
>  		  /* Immediate data in pointer */
>  		  field);
> -- 
> 2.51.0
> 
> 
