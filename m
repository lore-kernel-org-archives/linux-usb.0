Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A22132F759
	for <linux-usb@vger.kernel.org>; Wed,  1 Apr 2026 14:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775055131; cv=none; b=kyj1+rTnyvBjycFVAuaExq9Ld2RJbwK+ZDWk8eHiV7hdHVZEF/ncRyeH0ebrSwXR1LNkIHCgeyOHOUexFp/Uy2bIjXuq79HgVMipqNtoeMm3Bm6Ce5ZiGei+waHecqbGcEiHVIN6jcZ3IgrMLcjbjTQhF0O6LN4sMKKhGHyzhA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775055131; c=relaxed/simple;
	bh=BDjySe3Wept64ylci3W7T5dzcnJPnCZJLigg2n3u4Sk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QBAmGDxEuVzz6ILsqxhgBhPJqlJdJaPprMTxJoIYQD05znpS5vyu///fqc+cUJS0OQJ9oVjv8sYCYTnirGRMIf7kds+7k6jNjrq5wHQI0VAtZYBHMp8qTGRzk9J78QAqDfZi9BFoCTzzokjxGDqxWggHu6hRpMGggs0BUj1HUSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aeP1fb0P; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeP1fb0P"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486fe655187so91454755e9.2
        for <linux-usb@vger.kernel.org>; Wed, 01 Apr 2026 07:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775055129; x=1775659929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xAnJuA4UgKDovd+3kYctjUIM3Ts92zwG9ROe6cpfd5U=;
        b=aeP1fb0PNuBKnmFJHMDY/uDMMrT+oujr/iUVFlqcijokI44qliufG+u1cP3FRbrhTV
         nKdG0ji+1ayx4uh7eWfFSO9qy7Q8ZPsHMNNi7MJZAcBMc07VVGla0kDkQEvjZNbFA89n
         Q+RBMDHvb7jo4OzrbuTGB49i7I6P58GmI6/BR1MLb+Q9RIgznuQHJjLpq1Garf82enIj
         AsqrliSluWqDphsoFedAWEJjuJKerkWRLcg6vA6mDJJFeAN3o/BATQsKwhcYXMZD9S2v
         X+c61FmIcZ5BaoLbA4Z5k85e88F4BbVI2wRfv8xNoeh1fUXyQTT3Xjj5zzWjZaiUpPN6
         qBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775055129; x=1775659929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xAnJuA4UgKDovd+3kYctjUIM3Ts92zwG9ROe6cpfd5U=;
        b=ejAMlXcZKEclOusA7/xr6nT1I4U1WxLpfJCyodhvSxllMy/bZn2ug+9s/KYsY442Xo
         q+Hya2Ib4XkvRL67Iq/dYwSUIZU/ttd+5dKiowpoLD3ThtTUC3ylMzRToOFPlqWNizfg
         AG5GW10dicFDfcLYjsdKjR0YlJkcBIECVKCpRdtS115BOPe7x2AtYMZbW+I2P4n6E8+Q
         V+9uVzNSJzyfQljbvysfQkybL/lCXWph0vm+bQcSJG0GKyQ8D1tXmEyX/l8lkjqVqOCx
         h9WfW8LqUGLUfkB9Qbm6gkwsG0A9JSnhQeb8Su2f4Uy/x7WCO2n3RYOzcG5Llwq7xl2y
         gjLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvYdDvAGbpGB40qUObQ7ohMAFPluZzDl2quRArG+KukyTlE1zyeS31JoFYYOGk8Q3z7jrTWlghofA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9bKSka9oZHM1c19O7a8Mos1gYpnOlftnJOi5yPDs5k7k49F3D
	NG0wMp55y6Sen+SfCA4WvyQwkfKDgM6KZiKjFUxxGPQgEB581uiBitEr
X-Gm-Gg: ATEYQzyYjezDsd29+w8RX3YPlQ93D0FHm0E91PvM9jbrA8oOWXwaOxXHmyDc1eVgoWz
	Yd4YoPlkoQx3vxIh404eCI2pBcIfV5GxOSMPfKWJX3+BFX7U1i3DmVJGHNP/mZDiF7LB4Om67HW
	vdwePTrbg2gNEN/yp3owaADC0eMVx2jR/oQd5AdGFqxkSYX30Ios5O/TX4NBxBpDTKWguOOL/E+
	nr0t2v4FxeLzIysbTrwvTAP3uPc5/BZDg+tvIVjxPpfTVPZkxxIsO/91Khbuwmk30J372lW8CxI
	jYQ8MiCbihfBlMPtKhWbpe6wQp0QBb41FQfaEr6FbYhdaOjbLfu6ua05/iPFqU96uPvg7Z7fl8g
	0zSIEGFfKzrVQ4eXbLsfqj6T9/GaxfUmZM8N7NPXy8vUMpPdTEIh+YvwsMRHbeJLtb9UnoSFkAz
	Jkzcshk23kJ15EfIg+oqvgdN838aSnx9+I
X-Received: by 2002:a05:600c:c168:b0:485:3cf3:1010 with SMTP id 5b1f17b1804b1-4888355e4admr68427405e9.2.1775055128629;
        Wed, 01 Apr 2026 07:52:08 -0700 (PDT)
Received: from foxbook (bfi53.neoplus.adsl.tpnet.pl. [83.28.46.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a62616dsm5272185e9.3.2026.04.01.07.52.07
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 01 Apr 2026 07:52:08 -0700 (PDT)
Date: Wed, 1 Apr 2026 16:52:05 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Make usb_host_endpoint.hcpriv survive
 endpoint_disable()
Message-ID: <20260401165205.56dcfcda.michal.pecio@gmail.com>
In-Reply-To: <e14fb308-a003-4a76-b908-106b5271eccc@linux.intel.com>
References: <20260331010654.269ac270.michal.pecio@gmail.com>
	<e14fb308-a003-4a76-b908-106b5271eccc@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 1 Apr 2026 17:34:37 +0300, Mathias Nyman wrote:
> On 3/31/26 02:06, Michal Pecio wrote:
> > xHCI hardware maintains its endpoint state between add_endpoint()
> > and drop_endpoint() calls followed by successful check_bandwidth().
> > So does the driver.
> > 
> > Core may call endpoint_disable() during xHCI endpoint life, so don't
> > clear host_ep->hcpriv then, because this breaks endpoint_reset().
> > 
> > If a driver calls usb_set_interface(), submits URBs which make host
> > sequence state non-zero and calls usb_clear_halt(), the device clears
> > its sequence state but xhci_endpoint_reset() bails out. The next URB
> > malfunctions: USB2 loses one packet, USB3 gets Transaction Error or
> > may not complete at all on some (buggy?) HCs from ASMedia and AMD.
> > This is triggered by uvcvideo on bulk video devices.  
> 
> Were you able to trigger a usb_clear_halt() called with ep->hcpriv == NULL,
> causing a toggle/seq mismatch?
> 
> The ep->hcpriv should be set back correctly in usb_set_interface():
> 
> usb_set_interface()
>    usb_hcd_alloc_bandwidth()
>      hcd->driver->add_endpoint()
>        xhci_add_endpoint()
>          ep->hcpriv = udev;

right, and later:

     usb_disable_interface(dev, iface, true)
       usb_disable_endpoint(dev, ..., true)
         usb_hcd_disable_endpoint(dev, ep)
           hcd->driver->endpoint_disable(hcd, ep)
     usb_enable_interface(dev, iface, true)
       usb_enable_endpoint(dev, ..., true)
         usb_hcd_reset_endpoint(dev, ep)
           hcd->driver->endpoint_reset(hcd, ep)

So it seems set_interface() is broken and doesn't actually reset host
sequence state (while the device is supposed to reset its own).

This alone is rarely a problem because the endpoint is usually "fresh".

But uvcvideo calls usb_clear_halt() *after* stopping a bulk stream,
because that's what Windows does. Then sequence state is random and
gets cleared only on the device, because hcpriv is still NULL.

The next URB gets Transaction Error, the host endpoint is reset and
another URB succeeds (because we restart the endpoint unconditionally).

Regards,
Michal
