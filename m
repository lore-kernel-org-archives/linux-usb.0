Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590426;
	b=YpQzUKWaoUYJE3I2QAHomCNnhrxGzJOcEJGFVFEQuqCjnzZXBgSwQeKMsrHB/NLKsZiC
	 lcFez42GGHmMI0AUJSUXRNYjwC3Bgprq+Ffapjh/e89qYx6AN/TVMjpqN47rHk9U8UBfR
	 xD4NwI2O98opRzdEMSfu3OKW3xu/Tl2v7bZMPOpz7SGiWT+JM9rB1XGrteVuk6rCObQ3v
	 7+LBryxz2cyFLipQOgD2ER9HNNDTTSNPlm2pikYgdHHqum/M2DEUYUdVx/sPzCa26PNBh
	 FqFxg63r4Zm1+t8szq6eJogkMU7FD25y1uQxho+HzSyU0ejtVY/4WkaCc5PA9FllFDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kgtGQJbzPRUfHlejZQbNysmTaQQPZRXn9ZZAO+5WyiU=;
	b=qMA9zY80Zf0wrJLPQZDuL2+Zx83qWIJj6nfygfO59IDilE78eDuM3QOfPkglECkPFt3+
	 BuNVJ/y2IelzrRLUriJdC+TR1hsQwIYLRAxH34wKnxFg8SZAfTPU6IOMpyAeWCFx/eYnl
	 V2TpFpKfufSEFh7VC/bacebVKIlVSMsE8umLo6k6+LB5CrDbB4oIBmauya79PQLjhr6XG
	 ODwtx1iIkEoFaq8hO6iOq6yTd1UL6z9xsEI90o/mCS2No3nQQr1l8PlqoXzz1UaFAXiKb
	 0QC9NqdzA5XZouOEGcxcbjKJ8vzhGqTpZP0VwQkHGEH6sLream6NChdD4EbSsdqWkIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=Ldjnfx1t;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E654606A31B
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 13:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E654606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=Ldjnfx1t
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93e64d52949so69746185a.1
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 06:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792590425; x=1793195225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kgtGQJbzPRUfHlejZQbNysmTaQQPZRXn9ZZAO+5WyiU=;
        b=Ldjnfx1t/qfbMvCpjtlUf1T23Q41lFuGDI94teAPX/Idd8dibdqldK2px3JKb3K1ZM
         vBOtzE2m7UsJ0NSSNrGl0OpSpINMVJ+qVxcP58wE9VF0VWRdq/NFLN8Qjy/PRFB30GK9
         HoxWjPT05NUVaM2AnCVp8lZj6X5bysDdmLCg0oAzHpZsmjkCFtn+I2mSSJ9M2ymw749/
         GpfJGghRc2KwOh8tS4aixS2/biA3AT70i9WbmbXKH22kMsNd62U7VO/5e2mQ02OQEscw
         5Z8jUxZAxNC13YcBuvRNWl8b5CPNkb2XiVuE9NgJvjLcr0y+RSUcwbe2gJd9coV5ZGon
         ejBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590425; x=1793195225;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kgtGQJbzPRUfHlejZQbNysmTaQQPZRXn9ZZAO+5WyiU=;
        b=aI7yCkAz9TxMqtJsnjy+ZOmAhfi405cvXBeiaxzewoy06QV8pHogr/geSsQulwIP4R
         FndaHl7Yr4M5lo+gvfRqoCy9lbty1G01UYn8v9B//QEVQeJaIFjxTiXmTTf05ToiFqjm
         lhtIDkMPpHHrrZzTGaGtwv7oc2D1hFSY7D5Lz7t7KStHVOEtIKzvXWN9m7F83leJhRRG
         6mdnWHQecCoP7syICsERthsSm1ecwcuDobNrtgQBprPbnEXhkfRXgUQzUuHhDTjNOXlM
         8HWLCpeJchDfvliINj/HUHLnUqnOCdOsTQnk+nhjK2VTDRlLPvvkClMyTVbi8vE6rMCg
         iNKw==
X-Forwarded-Encrypted: i=1; AKwUvBzkrwM/5i8pCcDxKQ2y4b4Q9l3iMvDLTbeu/8qelCcJT1AIDe3eE3OGvxa+Am5tvsUtZUiDxa60Kqc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ31JlRM2xwdNkFnoWfZUfYY69IlnuypGmzKIOmy2DSbf2sdB3N
	xt0IJXQ0bra7y5/09/cspJA0C4CLL7xSqiENxFw2o6r7tmEP4s6AnwppvZ6W32v35w==
X-Gm-Gg: AYBFou2dsC5pskv/7dWWXi46pRanIKB6BBzgEAvQdI5BrK/gAO0Kc0ifYdL7OCYtdQy
	6kmCpVu+maGRJPtvMD6Ix59bKLMfi8daaup2IKsVYsVdiYqQ1qPKFg1kCA6nwPn6nlCXUcZOtlc
	5VNTQ0jg1kdAkX08o1g+lfiEUUWRJdknwp3AycREG2AaSEel2zJ/KZ5H9pnXfNYM0bwRdemiEfM
	GdHcHhLwVgqY3BLLG3R9OVrc9kZCb3rGTKUf/ctCht2AZKmNJDPeIW9uLHB00pRktIHBf8LisCR
	1+UtbEOcfs1QR9YN6QAjMSUhLd/zzv2OT+77jBj+iTUayNYkPjs4EyJE7KcNgcRcm0sVTZk+e4k
	Ftaw9WJDSejiUDDRdXcQ6M9RT3wf1MRHir7P1KCX7afllJ5RMaMwsT+IrigRKAX4dz3wIRcBWiZ
	neJcfX/wuxKRoS3hvoNR2tVtJtmD5No7uSROylNpRUqkAlp4OSUHXj4stV2ZBTUlqAqAIDsx6DJ
	47CZNoMsmfBM/DVFjy5C4Rl9CmexL9ppd7fnoi6yXbHskWwk+tHZA4WVMUAs5Oz+8lFwE8o6w==
X-Received: by 2002:a05:620a:4496:b0:93e:c12c:f121 with SMTP id af79cd13be357-93f57fe2729mr420063685a.77.1792590425021;
        Wed, 21 Oct 2026 06:47:05 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56e2a60fsm257587685a.41.2026.10.21.06.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:47:04 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:47:02 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Cole Leavitt <cole@unwrap.rs>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: hcd-pci: Do not disable an already disabled device
 on remove
Message-ID: <c9cb1c9d-1dab-4a18-af70-636770dbaa64@rowland.harvard.edu>
References: <20261018164134.134106-1-cole@unwrap.rs>
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
In-Reply-To: <20261018164134.134106-1-cole@unwrap.rs>

On Sun, Oct 18, 2026 at 12:41:02PM -0400, Cole Leavitt wrote:
> suspend_common() calls pci_disable_device() and resume_common()
> re-enables the device. If the host controller is hot-removed during
> system resume before its ->resume() callback ran (for example pciehp
> handling a Thunderbolt/USB4 dock or host router that did not come back),
> usb_hcd_pci_remove() drops the enable count a second time:
> 
>   xhci_hcd 0000:b2:00.0: disabling already-disabled device
>   WARNING: drivers/pci/pci.c:2198 at pci_disable_device+0xac/0xc0, CPU#9: irq/128-pciehp/225
>   Call Trace:
>    xhci_pci_remove+0x89/0xd0
>    pci_device_remove+0x4a/0xb0
>    device_release_driver_internal+0x19e/0x200
>    pci_stop_bus_device+0x63/0x70
>    pci_stop_and_remove_bus_device+0x16/0x30
>    pciehp_unconfigure_device+0x96/0x170
>    pciehp_disable_slot+0x66/0x100
>    pciehp_handle_presence_or_link_change+0x62/0x190
>    pciehp_ist+0x14f/0x1d0
> 
> (usb_hcd_pci_remove() tail-calls pci_disable_device(), hence it is not
> in the trace.)
> 
> Only disable the device if it is still enabled.
> 
> Fixes: a0d4922da2e4 ("USB: fix up suspend and resume for PCI host controllers")
> Signed-off-by: Cole Leavitt <cole@unwrap.rs>
> ---
> 
> Notes:
>     Tested on a Lenovo ThinkPad P16 Gen 3 (Core Ultra 9 275HX, JHL9580
>     Barlow Ridge host, I226 Ethernet), in daily use since 2026-09-17.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/core/hcd-pci.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
> index cd223475917e..ae5175fefd91 100644
> --- a/drivers/usb/core/hcd-pci.c
> +++ b/drivers/usb/core/hcd-pci.c
> @@ -348,7 +348,13 @@ void usb_hcd_pci_remove(struct pci_dev *dev)
>  	usb_put_hcd(hcd);
>  	if ((hcd_driver_flags & HCD_MASK) < HCD_USB3)
>  		pci_free_irq_vectors(dev);
> -	pci_disable_device(dev);
> +	/*
> +	 * suspend_common() disables the device. If the controller is
> +	 * hot-removed during system resume before resume_common() had a
> +	 * chance to re-enable it, there is nothing left to disable.
> +	 */
> +	if (pci_is_enabled(dev))
> +		pci_disable_device(dev);
>  }
>  EXPORT_SYMBOL_GPL(usb_hcd_pci_remove);
>  
> 
> base-commit: 32c52ec87d6245ee2d12ed5dd509e40062939b50
> -- 
> 2.54.0
> 
