Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9099B2B9BA
	for <linux-usb@vger.kernel.org>; Sun,  9 Aug 2026 04:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786248794; cv=none; b=PRO1IuFSqaQ+hJ6tBwZEca+TotiOYqgHmY8t6uJQ75/groAaAH6NCokzu97gYqYicVmCEMXmS7GEf8gcFXI93W+KbPUkSPs9ahN75UGRZcw/tOJhjHY9ZqgmVI3yvLYPYMnO3qiEf/PpGr5FE4gZKEa0U7QuMw5/KIDAi1hoVY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786248794; c=relaxed/simple;
	bh=Vp26WNHsAUIcNh05+zplYOqB8aiowwtcXdnguD7GNBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lHezHez+H8MH/7Cq8l6RR7NDVaH4n7gxQHkKEGWb4QFnopHp4wvpRYsOgdW+E8yvpPrMhpBGHnnKYC97SFlU6uAhgw+d0OgZ9a3zVTgGjIqb67HLXNLIT4evh8AX9dnFJgnvCbg3+IW62pjt7XZLiIohrdu3NE/QoXcFAgzh8Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com; spf=pass smtp.mailfrom=morsemicro.com; dkim=pass (2048-bit key) header.d=morsemicro-com.20251104.gappssmtp.com header.i=@morsemicro-com.20251104.gappssmtp.com header.b=xsLlqzHf; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=morsemicro-com.20251104.gappssmtp.com header.i=@morsemicro-com.20251104.gappssmtp.com header.b="xsLlqzHf"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2caed617615so9462275ad.3
        for <linux-usb@vger.kernel.org>; Sat, 08 Aug 2026 21:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20251104.gappssmtp.com; s=20251104; t=1786248792; x=1786853592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h4w3AQd1jCeLPSgxkCztnrGaN74HPq29qoe5WzG+trg=;
        b=xsLlqzHf7Y1QfKYFAzQgyM1mM/sMvUQsz5idK0BEbpgMrdCg+5jweqW10XVeWFv9hv
         M0p6akVgFzuV5HRD/Zorcj8pSob+jwd/hdxt/mzz209/fcy2JneahXW7lrcaKc2td7Uc
         dTkV0EGzshF4oGmxka6Jknncs/2aeCwDkHun8+6sOcV66euaXpzEC6XHKg+GW8pSrcxX
         mRBERe+tc+Upt6BkUm8lfNDBP7EkUazs4rrDDNQKv/rSPWoqXs3s+NlKVjM9+qVPuvH7
         JCzz9qvqh4dGSH7KZGX2cQ21T5+xyGf9p33xRWY82n0QSCKQPx0LCFftNw3R2AgAl4LL
         N28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786248792; x=1786853592;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h4w3AQd1jCeLPSgxkCztnrGaN74HPq29qoe5WzG+trg=;
        b=OgI0E6H+nv5mIA4HOAcOL0i7DfLyONFQOUsO3QGRrnZEzYZKU48FHXEm1VsLqYxOF7
         wjfR4/EWpfLr2Q4FFx3ejoB1z56EJEgGXt0AGwECfqL7LBQgOXTQtQWV9UQn0gwat7WC
         u4paTv/J4sXsZxZ84/9KaqS32RYRjbI24v8m9mDdhsKmHFQqwufvMFgsunlLC2oNl2hE
         3PsqwT8kYxJZx5q9cjHxLt5TkQkZ1TDSRMFP65G6rlDSrmZsWzsIUXMabS/vklAB+5/+
         V+dKaGme+zCixqx0FFFWdSB+JzUDndFEKv9jkbkDAvgvVlnq4X4V4RbZzbSnmILjm0KY
         ljDQ==
X-Forwarded-Encrypted: i=1; AHgh+RpEVRixFyce8SngdKiPPTIxrY2K1vLtQ6sPeMh0nxSIl7BBOVP2lBUcOCTCMYFRZHZbggkfCwzkHDE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyODXHyRankYYeC4RiOpsLxgYdCc2KFuNOitOkSQ2a1LgTIw3sb
	So2c2iBweXnXdLwiRQ6QffrLoQWFneiUD2de14xh0bTvR/OGgXORGToibXrVLnXTqtM=
X-Gm-Gg: AR+sD11d+kP/k0bt1EXxT5OX35UVwK/LM17P9vnX+xoHzbEcm044o4yFUZqzoMUFT1d
	lzLDHKz7+nQM6wZLWaU02z4GmEbJmWNZ0cV1x/i6lByhPXiIUUOj5p/7qTAsVOoU4x3iqBoaHu2
	g6Oye+3dEsgkYKicVFQ8yzpVKTWIPIKBZ6578DYYvRz1dcHW1GWA13pSv98wMrAVPZnHMVxsWMH
	QL83txdfRrciqWOHbSuzjX8ckEDcBJ2JaNYJtfqN7CIszZmdWA312fh/CCGWzXvUHV6J8+bcbAc
	ueFCGAyTJQx6xeBfg7/vV2ta0d9UlMuPHnRTx9SgZP/TCT8rPjbkBaYDyCxTFgTsV7PX+ajEUX8
	/D/wpLbw0zJOD05b+nw4fJ7VmcU5zjk/HRU8JS/rQ4c1EQ8mOOURy3N+t7P0p0gLdZwLAwCAU0H
	u4ptFh/IWuiABnEnFg1G8A1iwyTWm7ihdw0YzcclHq83qjpqJ23tPcdYS+miLEjutHM562hFWEA
	EKAneGkMiEbTo2vGl8cM2X/TNaH2w==
X-Received: by 2002:a05:6a21:6112:b0:3b4:e4f6:4f15 with SMTP id adf61e73a8af0-3cb85e9922cmr38651509637.5.1786248791872;
        Sat, 08 Aug 2026 21:13:11 -0700 (PDT)
Received: from localhost ([60.227.217.136])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86e90asm25391596eec.3.2026.08.08.21.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 21:13:11 -0700 (PDT)
Date: Sun, 9 Aug 2026 14:13:07 +1000
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, mathias.nyman@intel.com, 
	gregkh@linuxfoundation.org, oneukum@suse.com, linux-usb@vger.kernel.org, 
	arien.judge@morsemicro.com
Subject: Re: [RFC PATCH] usb: xhci: use BIT_ULL for CRCR bits
Message-ID: <knbvpftjb64kwsq4dz7fj5sf4hb6li6wmlbkmutqcrkx4wsssm@xen5ehykjbxm>
References: <20260730054521.296139-1-lachlan.hodges@morsemicro.com>
 <20260730100434.3354b600.michal.pecio@gmail.com>
 <a47f7c2d-d122-4cb3-bc03-1165b3578e6d@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a47f7c2d-d122-4cb3-bc03-1165b3578e6d@linux.intel.com>

> > Makes sense, including observed symptoms.
> > 
> > A system with IOMMU would fault on top of that, but the accesses
> > are reads, so hopefully no corruption in absence of IOMMU.
> > 
> > > Happy to test alternate fix proposals! Thanks.
> > 
> > I think the sort of code you quoted should work without surprises,
> > so widening these macros to ULL is right.
> > 
> > And there is a few more. They currently don't break anything, but
> > neither does CMD_RING_ABORT or CMD_RING_RUNNING for that matter.
> > 
> > ERST_EHB
> > EP_CTX_CYCLE_MASK
> > 
> > Let's see what Mathias thinks about it.
> > 
> 
> Fully agree,
> 
> We should probably try to get it into 7.2
> 
> Thanks Lachlan for debugging and elegantly describing the issue.

No problem - thanks for squeezing this in late in the cycle :).

lachlan
