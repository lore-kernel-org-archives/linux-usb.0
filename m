Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D539340E8C2
	for <linux-usb@vger.kernel.org>; Wed,  1 Jul 2026 12:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782907631; cv=pass; b=hCt8sj3Ff+7Pl83bzI/QUVEY6gZ5LSdOVZwtTaKMewP38DXhIh91eU/9Z+2900tFdVLWoZgEOswKVQeNL7pZvmcm3vql3YV6jWDUoRFmrESKSKniffQemACKgMUWa6ZknBXGHIuo/UzV+9sFpO2Kdc7jIOGLetSeCzYTrCKn9a4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782907631; c=relaxed/simple;
	bh=9/m+39RgXBaNYdYcIO6pX/z82SuA7XEH4J+ByPOaFWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R153X6KxQBsX0DjciCMNH50CcHCheBCSvVDDmm3QaJ7L2hERrP55wceomhzTncyrtzZbzeH/rlCTmUluL83tws5IpeRJVYPtpRRHua/eC+fr2afuI6m7tCYmafAt8V0RcpNAPEdDWw86S7jV+xyuyDWkRHhRaH66WPYiKEh0toY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PZjvqIdR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OFU0+raV; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PZjvqIdR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OFU0+raV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782907629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9/m+39RgXBaNYdYcIO6pX/z82SuA7XEH4J+ByPOaFWM=;
	b=PZjvqIdRmxPfIIp6PtOwXbEGNSuJmUhZUFOs9kUcw1WWCIK/OS6RWuQwEEEDD729yRh/0o
	rvuB+0Pt8SN50d/im/AXvAYmW8YtGRbbLjMWH/6ufOfZKUhSiUYungFGNkbPHlV0LmtBOP
	Cb7MbIPQhjHHUZCw3PleXBOA3jaxJPE=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-M-ncTYIvMF-lHXuNlcEjrQ-1; Wed, 01 Jul 2026 08:07:07 -0400
X-MC-Unique: M-ncTYIvMF-lHXuNlcEjrQ-1
X-Mimecast-MFC-AGG-ID: M-ncTYIvMF-lHXuNlcEjrQ_1782907626
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37e17ec1940so599292a91.0
        for <linux-usb@vger.kernel.org>; Wed, 01 Jul 2026 05:07:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782907626; cv=none;
        d=google.com; s=arc-20260327;
        b=hjamPy5ZKC05zq73F02vAK7rCJXNvOH6z+9/0D3hJ5POO6puiPzfFpnAJ3GIK5pO87
         5iHXXOsaWrJt1I8f0PzOIQiALkY/lVSyshA49pF4FypZvYSI+hqmzejgBp9+P4ZYkDHk
         fcvzXADl7rE4geiCtPT6f+DI7vN31zw+I2NMIGf35ffOQbUO7SWjoT1WuarErKalPAU+
         u4quvI9jAo4DZehrWGA6fYIGGC54x6nOfCbYRou4ou7irJPEgGcKCirhOzgBBSf+oXKM
         qE/KPDwhBPfuVY8kYXe6ohYcoxJgYVO4U4P1MLFC8KggZS5H7o6WdxwbwlJAN78IxqfI
         dl6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9/m+39RgXBaNYdYcIO6pX/z82SuA7XEH4J+ByPOaFWM=;
        fh=FgNb+gbcEiZ/20GSvx1JkspwZJVp/w0qNJYQuEIqoHs=;
        b=HxMWy7oDO1WvgqJCiDO4oXFB5kYF10yweeUwIe0DGi9ZUBfIBn28O1g/SqnihhDl1K
         53nyiIl4wNBX1UHPY9r+UrwZr6qV5tMrkNDzrIqREbuiTRxgAetVDza804YOKQuaQRjm
         Mi0oc8PBHdtyXW0O7yTWhq6MO0m6yIdSmJ5g0VjxQYR8xcBXvd5QTgkNOQ2t+Tvj5xkr
         xwp1KtxP9bV6ZFFGYW3kvb/mOEl3ln9t8B4SmrvMsZE9B3xIxAzQrw6mCUvtQudBj8BR
         n5YtFSfS1TdE10SGUhSNBvOVd2kUXd5pnADZTPuoo62mIbCVXYM8XIGUPgV7RiWLnk8O
         eMrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782907626; x=1783512426; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9/m+39RgXBaNYdYcIO6pX/z82SuA7XEH4J+ByPOaFWM=;
        b=OFU0+raV7+OGyjlcHsVfQ6B+arkv0Q09N9iqEZivR4KBmSrghuRRuCFLDOhU+9VTri
         EyF9x9Z5gq7Pu7kLL2yeJnBJ7hS3Ah8druw2Zk0WmKcb1WrLSSn8hGP7jA2p3vKuqn6H
         T58cUi+K+onHaAB2u53CvkvX+6zvVXRraVS6qDxoXwyTpco6tS0uR4IdqIZz/8DkYnx0
         4sDyYwuih0riJLQDP+qtVnnL/BHJoAHjd1Ci5A3ftD4X5O6jcn4xOZb/Ye6KErTIocyg
         jn9Dz8vF0WaPkAY8hfVnnb6ngvbt3MPTLF0kjgNfm90yxn5DiCtA2olLnObyUYGnUpT4
         UzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782907626; x=1783512426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/m+39RgXBaNYdYcIO6pX/z82SuA7XEH4J+ByPOaFWM=;
        b=bqSQC/3MuPl9eOkzSQbdf2fIqVosC5hvd/KEo6z2TF25DbQgm2A5+G6zgTgNPQBksX
         nQRzOSFusl6BWEhWCDqVXEXPx+ZjbgzCuqRg1T/sxBSo/pMz8UXuB0MtIGNjk/JcOd2Z
         Jxgc1+C+vimvTSI7vQzKJCqgPFYDtOsk5J097Ty+P5+RfMPUpT9/zKPMtz09mfKJt7dJ
         ERE5f4dl8LoEtuiCJUfeRkxbDQvUU+Sldcix2y0QysCNxc5EQnPEsz6WxpDXwNVIp0JF
         skfvUTX3SNm61p+9nh1UhHfC9Le5UsGfh91RclbPKe/BUKk+MNfd75mWBF5bRkLE/PBj
         +c3g==
X-Gm-Message-State: AOJu0YwAK5VCyy263KvwsjsK5pZVqcQqRnmOpTxlfXWuveEHVrEBtmlq
	Ft+fc68FdXrCcpuVtCL7uNFG+x9ArsZ5CkSNpn4YsRLks6n00y4QpqW5UYRhMveXarVytGLcSw4
	dkevRiQX2PayaSEjcBV14+q54N6sbSvyx3zYFVGd8wodx1zAh/nxvGgIAy3/qDlUL/zX2dpePVQ
	iMMWHpEDZ8iOZBh44HM+guN0bdXGBkyVdyKQTnuUNvyxxh
X-Gm-Gg: AfdE7clLrLELenjB74obAjynRFUU7ZyTqqqjRhr/ZUambqswWY72w3j6PaAPWxy/BPq
	CPl1avVbLTThp7rTb+3wbnO1mgsVI/YfA56fXhIUGckx22m980WZKJBOzUYn+YnKvaDUwrsFro9
	daKjhWYgCw4X3zpOcFnKSnBlj16/j2I45Ca8M3dHGHN8FCnzbaaoeJqw0UrbUivFDKX/hyfXpXV
	0VJtqcz40QEi1AEaQyHaiMRmGQ9TBpBuGCzAbKd/m2dv/S86tyEfA==
X-Received: by 2002:a17:90b:4acb:b0:37f:d6f3:450d with SMTP id 98e67ed59e1d1-380aa1313ecmr1402118a91.14.1782907626383;
        Wed, 01 Jul 2026 05:07:06 -0700 (PDT)
X-Received: by 2002:a17:90b:4acb:b0:37f:d6f3:450d with SMTP id
 98e67ed59e1d1-380aa1313ecmr1402085a91.14.1782907625931; Wed, 01 Jul 2026
 05:07:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701101826.894848-1-sgrunert@redhat.com> <20260701101826.894848-3-sgrunert@redhat.com>
 <2026070107-estrogen-semantic-31a4@gregkh>
In-Reply-To: <2026070107-estrogen-semantic-31a4@gregkh>
From: Sascha Grunert <sgrunert@redhat.com>
Date: Wed, 1 Jul 2026 14:06:54 +0200
X-Gm-Features: AVVi8CeRQTqgN5cj_Z4mp2mNGeXSYNgKCI3KC-weO90OjIlH9BN804MEvO8IifE
Message-ID: <CAPre7xAbrZssWtLkVbLnEzcea5FxSZk12ZY-PpRJ4xC+w5n3Dw@mail.gmail.com>
Subject: Re: [PATCH 2/2] usbip: block SET_INTERFACE for isoc alt settings
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, valentina.manea.m@gmail.com, shuah@kernel.org, 
	i@zenithal.me, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 01, 2026, Greg Kroah-Hartman wrote:
> What commit id does this fix?

The limitation goes back to the original import:

Fixes: 4d7b5c7f8ad4 ("Staging: USB/IP: add host driver")

tweak_set_interface_cmd() has always forwarded SET_INTERFACE
unconditionally, which is fine until an alt setting with isochronous
endpoints is activated.

> Why is this not an error? And if a user sees this, what can they do
> about it?
>
> > + return 0;
>
> Why isn't this an error?

Returning 0 here means "handled" in tweak_special_requests() semantics
(!err = 1 = tweaked), so the URB is completed with success and never
submitted to the HCD. If we returned an error instead,
tweak_special_requests() would return 0 (not tweaked) and the URB
goes through to the hardware, the isoc alt setting activates, the
transfers fail, and the device disconnects, which is the problem
this patch is trying to prevent.

You're right that the user can't act on the log message though. I'll
change dev_info to dev_dbg in v2.

Thanks,
Sascha

