Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B4935E1AA
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 17:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789580881; cv=none; b=mnn4NNvQZrreLE2ZWCfel5O3GaBpZnVVkDz0UwCvg/UR6uMADQ15q8TLrRXN8rbQWuiyed/J41inomVL5eUl3kQi77lw8c2gg687yZe8Aoe0wOVWVV6BuWvwG83Ul2qrIcRs82ZoSSYPn/7uv35/SSiv/HXXVuHzSx6DpXgh4Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789580881; c=relaxed/simple;
	bh=423QCoFRko5QoenBYgH5SA389zSQJ1eZi3cHQBiuFc0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c8IRwdE+DRmx0tEe2b7q716S7fb1eBhdEHRdb6ya8n0QVlAaaR8tKummwkudhC0T0ISE1xCctsfrBLhKjTWz2Z0LKrI4c6h4fQ5rdhfYCdzZSwSzK1o8ezHaqEzf87Uf1vKfYMqFExV/TQ48XEnuCuRDl4kAowzapOEJioKlHQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJ65aMqm; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJ65aMqm"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so12635e9.3
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 10:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789580861; x=1790185661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=clnnyObsMqwlypspEmmRDCHaoGhK1U61AypucZ20MzM=;
        b=DJ65aMqmRbxRcLEB12SRLW0f0nBr5xfh6Dh6UuF983Zyo9KacSCvK7k7uskz2S71bC
         j3a/uKELI4s0pM7mWFqZrdGWWxtLBNJfe8mcVlqpzogwhWQuIJQGtk/napwChJk0Sjyb
         7duxmomdu4ifR59uVqW4AqX7U9lYQT+gnxW9vymym3rh3DYFqw77KLg3FQw+J++jg2IT
         F/qicKVdgnNAdcaHJhap/fp1F6qpra1gw085hEnsmc0fpYmbtXwjUJYS1NzpcBNysES8
         kvjZVDhZYUKl2Qq/DNWMj9vhqTfydMHbKBqHcm676zQ1kc67P28qR8mrmXzK0ktvO5LO
         mH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789580861; x=1790185661;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=clnnyObsMqwlypspEmmRDCHaoGhK1U61AypucZ20MzM=;
        b=T3RaNCIqb9UPc0pu7SrKOUDd3QksRXIJIOqlyhZhMLTdTpPSfvSnFu9hfBoPdNPvU1
         eh9SrV1c5K+BHGek99sdomVc7zgnDZE6gJINxU3Yf7W5pilxFosSXVm5ieZnXVKWmFXE
         Zo5L3JsrF4bNhbdCGItmp1LU8XHXUnMahn6GJukke4CuRweRwaxX1wHYzXei/Eem9pZ4
         NdPbEvphnGebsL7Pe7JWPA4cNCXxKxx7YVVwP8cwfxMc7Oiu+ln6GdqDv0FMmGskpTIy
         u98duDp1TBQyyJuXDOAiWykQ/q8e32z35DlHkfVhAdgm4N2QEBLUA4CWB1Bt5U4YgsbJ
         YhZA==
X-Forwarded-Encrypted: i=1; AKwUvBwZ667DfEs7rslRiYLOasvA97IxodNPrUUKYZ5xyzqUQ6kQmxaQAo3P/y2v8+JnfGtCEbQD/8Cm3UU=@vger.kernel.org
X-Gm-Message-State: AFuF++niuqvHtKPeQKGDi0dH0dWw6FRM4smKBydsZD+9F6lzNik/Va1q
	a7tTsN9h07JRUZ8Jk1b5pp3cHkvGFVt4XxbN1jMRTW3jHGjBZVQValV8
X-Gm-Gg: AYBFou0jc+X2WSrOAfinWntmn6FnpOsMCKvxlp1BMSL3qXUMmJuUhaFi58LvW+NPG3N
	RLPq71B/bRzUyj5CZRTJDjthHDGcXz9soii3cfZWRZIEl1UP50PQ4E59992pLMc9AZ5QoqiBoXm
	mvCsLnkign2gu9oing2+FBvodx3JhHm9941GY/CXMKgZ4Xz0e1IDyYpZLk7G52BtmwXHO0yVnY1
	mznjboMEv8oyNrKcFly4mmKQfgf/KxqpXxObfeYBdsaoXh+l1QDjVyaR6MttdeEVgrzh/Bi8LGx
	2JprtRkjQIh277da7FA1DWWodn9u5SipvkJPtO4d2ngj/oXACBTC6ti8kmp6b23UMtCAAWZDXid
	o+oxa3zWEPR/9enya9fAil7ssMA3vIN0aypXLxsywFLni072R7mYTLtxhwnOH3O5lNnQkgE0/jW
	ayyfxOU9ivY4Aeyhk+RYT7aa+Fl5i33VqZIZzcPvDz59osU1tFYLnt8LFNpBaDlro0UKqtrrIP2
	5tKhYXZ4vI=
X-Received: by 2002:a05:600c:190b:b0:49d:870:7a69 with SMTP id 5b1f17b1804b1-49eb73309d8mr72372485e9.12.1789580860990;
        Wed, 16 Sep 2026 10:47:40 -0700 (PDT)
Received: from foxbook (bfh234.neoplus.adsl.tpnet.pl. [83.28.45.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd1d0d0bsm8512885e9.1.2026.09.16.10.47.40
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 16 Sep 2026 10:47:40 -0700 (PDT)
Date: Wed, 16 Sep 2026 19:47:36 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: EricLin <ericlin050914@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 mathias.nyman@intel.com, mathias.nyman@linux.intel.com
Subject: Re: [BUG] Usb fingerprint sensor constantly resetting on MSI
 Prestige 16 Flip AI+ C3MTG
Message-ID: <20260916194736.7ba779c2.michal.pecio@gmail.com>
In-Reply-To: <20260916131730.5522-1-ericlin050914@gmail.com>
References: <20260911222137.6639b397.michal.pecio@gmail.com>
	<20260916131730.5522-1-ericlin050914@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Sep 2026 21:17:30 +0800, EricLin wrote:
> I'm using fprint to operate this fingerprint sensor
> 
>     |__ Port 006: Dev 002, If 0, Class=Vendor Specific Class, Driver=[none], 12M
>         ID 27c6:6090 Shenzhen Goodix Technology Co.,Ltd.

This all sounds like some userspace driver is used.

And to me, this below looks like completely normal and successful USB2
device resume, followed by a reset initiated for unknown reason. 

[  240.364611] xhci_hcd 0000:00:14.0: clear USB_PORT_FEAT_SUSPEND
[  240.364612] xhci_hcd 0000:00:14.0: PORTSC 0663
# PLS is suspend, write resume
[  240.364616] xhci_hcd 0000:00:14.0: Set port 3-6 link state, portsc: 0x663, write 0x107e1
# PLS is resume, write U0
[  240.405029] xhci_hcd 0000:00:14.0: Set port 3-6 link state, portsc: 0x7e3, write 0x10601
[  240.405066] usb 3-6: usb auto-resume
# reached U0 state
[  240.405138] xhci_hcd 0000:00:14.0: Port change event, 3-6, id 6, portsc: 0x400603
[  240.405148] xhci_hcd 0000:00:14.0: handle_port_status: starting usb3 port polling.
[  240.446041] xhci_hcd 0000:00:14.0: Get port status 3-6 read: 0x603, return 0x40103
[  240.446119] xhci_hcd 0000:00:14.0: clear port6 suspend/resume change, portsc: 0x603
# this would be "finish reset-resume" if one was intended
# or "retry with reset-resume" if resume failed
# see drivers/usb/core/hub.c::finish_port_resume()
[  240.456987] usb 3-6: finish resume
[  240.457379] xhci_hcd 0000:00:14.0: set port reset, actual port 3-6 status  = 0x791

So maybe it's just the userspace software doing it for whatever reason
on every use. Guess you could run "strace -eioctl" on this program to
see if there is USBDEVFS_RESET each time the dmesg message shows up.

Or add dump_stack() in usb_reset_device(), recompile and see what pops
up. Probably ioctl syscall at the bottom of the call stack...

Regards,
Michal
