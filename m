Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E313563FB
	for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 17:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787504732; cv=none; b=Z8qp6WE8PFwX8wzE2g/U4IVMA19oaqAArWd9Fe4jJDAr3wKtTT1e/pCwI6tBoDoaRKBY6pRVBnklr59Q+PFzXF/Me56UeE5mF0iYhuXZVrWV5kkqs9qefDiqvdu8YTtsaYQx+RioeiBHe8G6rtgwXv9BdAMzEJovNsHka5lVCbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787504732; c=relaxed/simple;
	bh=tZ3kOiXAkP3ZajzR9DGtBNJIg33EF2ByFAZEw7fsQVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DT1iPqkJGVEw6Iz5sPD4ihyGeVqNas/yqzbS7C+x3B1VlvF8KcpRLk3yBilPu6JqfdkZSaiWIRH3tPa3yAHgzjBRpoOSXz2qTSTMoyOMTxh7aUU32MerFKguRFhF0+qWQWDRbNbEbNO7RmVBl2JTklDJiCaS71p1aUUfriylXfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMBzUQdt; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMBzUQdt"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ce98cb8165so25181535ad.1
        for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 10:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787504729; x=1788109529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pYrUZlO7IqIkRYhROYYB/AOAuFYaRX4X5UCYzj5mFMc=;
        b=IMBzUQdtLJ+6V/GO1zZOcwtv+iGs3xmZT8AZUqYbjDExUonMHcjuWfklNcJecR2BCg
         Jd1KnLrhRjGmE+PslLtYNI9i/yra8VGUFzc31aF2fSJjqm1Jj+Si3ZK8EGf5PNuPFfWM
         MGsw2hRPyLol20NDBQXIN8SvBl//QMbW0eoBmB+DuuS91oQk9iqgQ/o6ys3D2a+6NMUz
         1lqtYjVpW17z5oWqM+F+EIS1ofXj1n6fPH4HnZcha8MApRnVavJ9G7YroDQfL1Q3WD/G
         Xfs+Wo1E4fE3vaZsQ/ng3CLyqZeSDuiqHyTBSZ1aeJrZNvIpGZPHcz46V6jT8i71BXUH
         e1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787504729; x=1788109529;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pYrUZlO7IqIkRYhROYYB/AOAuFYaRX4X5UCYzj5mFMc=;
        b=iglgMRrV1xdcUl89ne9oDvq4W5rGzBElZZwBEyOD/jajZYHBsk71wFGfYb1dtFnvqz
         mxzXdO1Mz5ctkRBQj0wr1qTOxxPXfOs3trDqZQLA5l2B/GUzLa/dKzmfE2J3AXuYkSdm
         tbfwSyzeaCuFXwOb2PCB9jauIjpKcrXe6ILsNPx8X6hkE46ExCLcUStpcfj1pTwaZv1I
         p+LrO0sRsoAjNbTpxJk4XLSthZHLHG70KTmZwHHGNg8NKNPGS9tybuxk0JIqKf9QPW9D
         HpGDtz2pzob4LsBwpissyLv+OrP0Gm521x45yW6y2YPISzio5Oiss8DxYolteWrX9Ha1
         xF1Q==
X-Forwarded-Encrypted: i=1; AHgh+RrIa5TOTtj71WcD0Q4bppzlLFsZmcEBWrr7CPqayFIGgWhGuRDkO53Q0M8FM2l7bpHWghuB1GKtyFo=@vger.kernel.org
X-Gm-Message-State: AFuF++mb1vxiEkrXcaVNIN7L+BnSt8sOCd/oJ7u6DU2+wyl/HchSHmFX
	aUaC2iWTS3e9fd5p/RkOTa88GxDCB9sq9iQDZXA+8xC3JB878bP9DUTm
X-Gm-Gg: AR+sD12kxfpamrVP4SkMQ8iuF8Aacn5sKVQyLgA20HXy3aX2sG3rcUf+kbnTEIcEZiT
	pPHETxmFwNW7CCPSKOG+Dt8xGKE/WhBloFTGAwO6mB/XZeUHa+QaPEFq8A82e4vlnsNDs0GW6WX
	jYIHCSzPv9SIB+uJDK3SCK1CpUsOLgk8YR0zSR7YSrOdD+LtYlje7TEQs9tUGvAyGhsRqsk9TZa
	3G2QhtQlxd9ql/qx6LHfDZAy9SM48D43vqPhHNkCvvqEXZ4eQhvT/qpanEa5HHl8PZZDFC/95Mz
	gmjiVp5KavgeJ5anHx1ENXqS9WcgxNYw8rCHfmD7hFUlwNTGg6X9eI9yXt0iSMv9zT9J+hQj7OK
	I8VTkY+VYdrzzWrYneNu3EjiMsWpIeifVmQuDFwM3vn0OnDXbxp/dBUw7PF5I3KxIGvS9eF+gYV
	iKdfFz+PCKaCCr/XHuunZH2lNGUBb1DKbzD9UbhQ7o+asbKxTzLYOAm/gF7NFJq6y7KezveRGN6
	lMxU0GN+SGU/dWYZxKEQ+M1nsiA
X-Received: by 2002:a17:903:b45:b0:2ce:a6a4:451b with SMTP id d9443c01a7336-2d61a183641mr202719365ad.11.1787504729357;
        Sun, 23 Aug 2026 10:05:29 -0700 (PDT)
Received: from localhost ([2409:40c4:35d:a0d7:1d3:cd30:d9bc:b5a9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d36f9sm26172029eec.16.2026.08.23.10.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 10:05:28 -0700 (PDT)
Date: Sun, 23 Aug 2026 22:35:24 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
	Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mario Limonciello <mario.limonciello@amd.com>, Forest <forestix@gaga.casa>, 
	Slavik Dev <developer.slavik@gmail.com>, Mathieu Fluhr <mathieu.fluhr@gmail.com>
Subject: Re: [REGRESSION] 6.12.36+: usb: hub: post-resume delayed work
 triggers > uncorrected MCE / data fabric sync flood on Threadripper 7970X >
 (bisected to aec11e5f9c45)
Message-ID: <aoser8dLytrwqBC2@eggarch>
References: <CAPyJwA_D9qw0T72f8zwM1yKjP+To=maVANbcdsWM7yRmbBxYvw@mail.gmail.com>
 <CAPyJwA9R=p8_uxyYODb00g_nUq26SRsWHBGgAAJnR0YMTRRo4A@mail.gmail.com>
 <CAPyJwA9P48LDcOr7u_iT1WPFBCHxh9w6cxFvyi5GS3syM6crbQ@mail.gmail.com>
 <07435e6b-ee30-4c85-8c8b-0ce3a4ead1d9@leemhuis.info>
 <aosGtkE_diwVJJtB@eggarch>
 <20260823174059.46fec036.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260823174059.46fec036.michal.pecio@gmail.com>

On Sun, Aug 23, 2026 at 05:40:59PM +0200, Michal Pecio wrote:
> But I'm not sure what you mean by "1Hz stress loop" and why is slowing
> down the suspend/resume cycles or moving suspend from close() call into
> a work supposed to create problems?
> 
> I would naively think that doing things *too fast* is more likely to
> trigger races and break the HW. The whole issue smells like a HW bug,
USB2 roothubs still do 30 ms cycles and are harmless, only stretched SS
ones kill the box. So if speed were the issue the faster ones would be
dying first and pre regression kernels ran fine.

About 1Hz, adb scans the bus once a second,
every open resumes the root hub and host controller out of D3 and close
puts it back this existed before regression too but with 30 ms of
close() and slept for rest of the second and now it keeps it
in D0 well after close(), the suspend itself happening later from the
delayed work, so this d3 - d0 - d3 trip of ~230ms repeats on
each scan. That's the loop I meant.

> Can it not become a problem for external hubs, under other workloads?
Possibly yes, but nobody reported that so I'd rather scope where the
harm is proven.

> Also, what if we connect a downstream SS hub to the root hub? Will this
> not cause the root hub to stay awake for 200ms again? Problem is back?
The root hub itself skips the hold since the check is on its own parent,
but it will be kept awake anyway while the downstream hub or devices are
in use which is normal activity based PM.
If heavy polling behind a real hub ever causes trouble that's probably a
xhci/platform level fix anyways since real hubs can't really just drop
the hold.

Regards,
Lovekesh
