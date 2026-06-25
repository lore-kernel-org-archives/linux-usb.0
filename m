Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A41C256D
	for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2026 00:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782345869; cv=none; b=Ob2IIVW+xBSLLdvxcWZz07XTMn0nENMVipcB+RghEnoNx4Btbp8gRsmMdVOfoDofeBj81coNQQ1AlDSY8in0xyMHzB3zWslT6O/5yKjxmuTIZls6+4cVqEMpshXZt9NYgmAgBne3KBf0SRtjhNtAiBGHqRNa0n6rK/pPMyEK/h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782345869; c=relaxed/simple;
	bh=I0NXuarWnH8UYOKMagkD8xxvCNYItg/6Hvcpq84VFVk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WMRds/Gwtwkzm61FshXteAKdFz8yUlcczJI5xQ4JTeaNDjJKezZDRe7FFFJl5CPFM6rduoxI1/RAWjGQmixFZotJg1BOcAy+Q43VcJ3c14g2eyqetZjmmxR/NqHZf6EGEzC4+zk8Vfo59B3sK8uCH9uogeVPBevZq2EQQZkT5+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfLHqVCj; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfLHqVCj"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4602e2a0372so1277494f8f.3
        for <linux-usb@vger.kernel.org>; Wed, 24 Jun 2026 17:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782345867; x=1782950667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8QPXKXh/0+ryVan7xW/qbQJHj74/wdXUYEX1Gx7aERM=;
        b=RfLHqVCjirhGkcRyhTN6/T2sAghOC4JFidKeO10PeFRQHTXOZLuf2YoqisI3n28BfR
         753IHkOFDA2BW50wj2/Ej/xvsioQY0FZ/zy5aNdLma8FJUKOaAPvfMqBe925vghV1C0a
         cxUdKq+V0V6kAYdY2YvF9KJB4NsAcvhJKEUcHXIsxxfc4wj8khHFNFMvcUQvO8H7Oxi1
         3KiOkCm+xxhioyTZrjT9sUfydKjFreS/AjqxFHF8tfFttQ4Cwb3+RC3xGMIY1M4Osoxb
         2XZz2ddM0Sxto/jlxb7jc4l89glwjFLYdd1l83OcRiJXBJLNMIGVIcYHYJFH0jrEGGfW
         7Ngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782345867; x=1782950667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8QPXKXh/0+ryVan7xW/qbQJHj74/wdXUYEX1Gx7aERM=;
        b=B1Q6shM0UzlWEyH6UkP9w9zgngdLCXSPMurvkgKNsKE37J68Qq8dpY0/jjzrStgrLq
         gVw7I5OzzkOKguANBEdtfZc5ckkKgN4IiLfBeFnnYwWgZbHLdI9MTIA+DEMf0Bs54sBO
         8IL4AVo+ktiJE3Zx8hSPQQZggS9rAF9eElFulJXiFzOyQX8rPQDf1lH+lzaNnPZhXDjb
         T4GsrxHz2/3ptSRhNGwavvn1pQjCvdfx1Bv5tktCobW81YjS7uSr2JNNZcnEjhB7MjTo
         Oi2Rgm6UiOQWtnLL6WHEruE8AFYYDn1qPjXU2EUeDHDNXJvYgB9kp18AEW9ugsNNwPLx
         uWUw==
X-Forwarded-Encrypted: i=1; AHgh+RoWodpAN0Iqkcz+aXfIKil7oQNvAYwYWu7A9F0+KbH+0vjoqm7wI6Hj4XS/D/Pf0RL2dDgfUWFtkm0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdjolc95e0y+qM0d+o2zfMh6LMFhhJb8jgrSXZI0bi3QhFk9bQ
	Sy5uca7fIPYXT4gUfikTUY6zQ6u5hB2+2tJ8IsDFwSP0kEoKptr4UA7U
X-Gm-Gg: AfdE7ckHYHx9iE0lWbBnJz9KEUWsNZfddv83mjTrd8qqxtT1auH35CVmBEfTCv5690M
	6nHVzrYTuiWixx7WzgJWQG1VCtVVJN9LN2qU0uaEW7lI3g/ZDH+7kWU1f6gmeD1EEovWN/EM0qS
	obXp119SOW4T4T3LbSyRCShBZIuq74SBJ1Vx42YiZc9MHF1OLGCT639WdeCDE5Ab4btaocRC1p9
	krhytdFdoEzYy5qpgSxOS7QW/YK8MmcbvA+e/cYx7vfMKvkgRTongUTn96XY0d4XqZMaJtt3Jjl
	aI8r4EmTNtK22VZjinudM+Mb9vcLFeXWTtRxMlabyFqkNZQlf40Y84Jc4LKzdJZcYT7Wcawt1s2
	kr4zHYtKdtzLCUdXlJNv66mLtAFZkn3xDOxePBIqLSP1c79d3qvKLG3BpCc8MYmwoPOSrbRyrZU
	a4OUNdoLKqRLl9+klVMiNtRg==
X-Received: by 2002:a05:6000:490d:b0:439:c18f:5aaf with SMTP id ffacd0b85a97d-46adb0b626fmr14440997f8f.34.1782345866763;
        Wed, 24 Jun 2026 17:04:26 -0700 (PDT)
Received: from foxbook (bfg19.neoplus.adsl.tpnet.pl. [83.28.44.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c221d9a22sm11308423f8f.19.2026.06.24.17.04.24
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 24 Jun 2026 17:04:25 -0700 (PDT)
Date: Thu, 25 Jun 2026 02:04:21 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Xincheng Zhang <zhangxincheng@ultrarisc.com>
Cc: cyrozap@gmail.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 mathias.nyman@intel.com
Subject: Re: [PATCH] usb: xhci-pci: Disable 64-bit DMA for VIA VL805
Message-ID: <20260625020421.2e577a94.michal.pecio@gmail.com>
In-Reply-To: <20260624070612.337013-1-zhangxincheng@ultrarisc.com>
References: <20260623121847.53749028.michal.pecio@gmail.com>
	<20260624070612.337013-1-zhangxincheng@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 24 Jun 2026 15:06:12 +0800, Xincheng Zhang wrote:
> Hi Michal,
> 
> On 2026-06-23 12:18 +0200, Michal Pecio wrote:
> > But I don't like this abuse of the quirk. Firstly, it causes
> > unnecessary bouncing on systems with >4GB RAM and no IOMMU.
> > I found other drivers that use DMA_BIT_MASK(36) or even weirder
> > numbers, so it seems that we too could request 64 gigs exactly
> > with a bit of driver refactoring.  
> 
> Thanks for the review. I totally agree that using `DMA_BIT_MASK(36)`
> is a much better approach to avoid bounce buffers and register width
> issues.

By the way, are you sure that 64GB is the magic number and not 1TB?
I booted a common AMD64 box with iommu.forcedac=1 and instantly got
IOMMU faults, but the addresses were truncated to 40 bits, not 36.

I applied 40 bit DMA mask and my VL805 seems to work. I looked into
debugfs and many things are mapped close to 1TB, so I wonder if some
chips are better than others or maybe there are particular workloads
where VL805 truncates something to 36 bits? I tried a few, including
bulk, interrupt, isochronous and USB3 bulk streams.

How was this problem found? Do you have >64GB RAM and no IOMMU?
Or with IOMMU whose driver allocates mappings above 4GB?

Regards,
Michal
