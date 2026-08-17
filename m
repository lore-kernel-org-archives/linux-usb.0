Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020C043FD2D
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 13:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786974945; cv=none; b=jJc7sYdGt7QdxpUjwchE1t6qH43e0/BEyobVwoi1wS+qrNFzkGR0ScVwo/iQ73RhoD0eYtAR7mA48YQ7GbHU2FewX7GDYq0nRRpPwzVwA7dnePP72ZuA4c57C34h20sAdYNu6iebmF8syn2SFx0rxFKjrIb2cXrs9LrRiIpfqJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786974945; c=relaxed/simple;
	bh=d0NpwTyAq/GuF+lridVuDOqiMyEokvQHNppGux0nHl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dga6lrZQeT+f855H9y0+lb8pmaRfude5YHrBKnQXhwMcZlbk7I1NPPPW7/PfSCaa5lpWKZb1DKj3sIBmZlzK28JwC0mFbOHaITDa/ycBTRsU89w4rA+BWpg7w2CgXsBSxFOxFWPn9dOxM1pVkZ4thavQmzsszwDwlCD+BwOKmWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=FRUytAVp; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="FRUytAVp"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-529a1ee0e62so24190191cf.2
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 06:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786974937; x=1787579737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BSOG0aCeKzmBcbFK2L5HxIleTt+ydcZD8Iul4FDmFN0=;
        b=FRUytAVp7iFthJE4DtLRErTm8Qav6ekTVQG44HPFD9ZEYV4O7gv+BTHYebI0chPu2W
         wISNAP3Q6qMSN5707w2ClOyLEudjuAL+WjTYbdWhHWe8QhbqvVDc4CobsHKkcofJw5Ed
         egCkYVYAKKaFcS3iw/YjR5HrdRkZoasWAIHVZg2sanJ+TQHS7d8lpMdeh+vt728TdNP7
         Z0W2apIycCay0IWWBLjwNyJJaFjp9nnBZ58ui3QXsZVVShDp5wCDBK4fuAO2lUhhCeby
         9+yoLz1SUsLfQXWYD/VV3IvcqSBi3neHqUM5neJ76E/mFRF34bD+vZaYsdeTly48RlRj
         YRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786974937; x=1787579737;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BSOG0aCeKzmBcbFK2L5HxIleTt+ydcZD8Iul4FDmFN0=;
        b=Ya8mqLjdwultFR606KZDJmKPuIGEL+Lbshg2yem1mX9WTNTmyuJDCDTwkfxRTrKgv+
         fYYEdvbDXCAYULwh0WJa+iVSh+/Zv/z6vvD4U5/vrLmSjK1fkYh/myVyJBcdiemUzjFJ
         IiIVyJ97PXOCHxhWhauQAFkP9nU0srEfrAcUrU5AsZh9HvQx8jGmKOjfja+F48AoMsI8
         sim+UoxJWtl3P1mx3DgGP8zb2m6QHXHQTTaySroDbtq/YsCmqfTKJyb0/CMnRbED2KZH
         8TPqGoI1dmzEgMlLxWZO5qnK++l1rVp9MBSPEL1Xr2oyk/xYDzvC3azlqwWkv81+rb9n
         c77Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro/TV8DRKkQD88VJhCHCk5X8f70DVOBbrskH32v9E97wib7yPhif+Ksi0wzHymTjdFkTxLUPVgKIAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3KgiNNodEo+N9xzusweAJ83D0RbRWAttYAZaMUzlwbMM0trNf
	yBcPGt432NmEo67qIDMN8JGpbB9oCxOQI74sV3aXG7wsxPNaFoBirFaLM94PmZLr8g==
X-Gm-Gg: AR+sD13Yu55jx10ea37DBLKzsnJ9r/0dG5NDhymVFkwwM5I1B4zqUFesAMjqHb/9a9G
	8tYdBTGjvU9T6LLcoZx1SIYwGW/dp1f//YTNt6Dcs2BWVCORYCTfKyLjfMsNo4Uk5nLisNoCoeo
	xzXS+IMM/DpwsEhvrY9kN6mDy584mpwI58uIE+GjMIIN9HslRwX1BkAchxVo819GAnNkHQf9WPw
	lrV2v9VPAcT/gOJqZlwn+Bs7R2lwQ91ZJN38FgqyZyQ8zBlflSJHjDceXwOmvoB6BnWVTiEa0tU
	NnK3//bRxzIROXpiYLNtfNGL6XiBgu3GjFJPOAuhmAlrhG0ymH1487KpDp0pHEod2NNR/JcGCYd
	5JLK52BY14OwwBpvgJTGuHDWqRqUUt9k8KitoUeie0T4PxsMFAD6GqSuZEEqyEUgz9ON2ZJSTz2
	5dbds+CiePSN+kCGo+suvUlQ93XivXf8pSGON+k4y5HUaY7Ehhc6CwkbGsvdE8W+ZMiK/XdXqEI
	UX7F/k=
X-Received: by 2002:a05:622a:4c06:b0:52b:6543:d8b with SMTP id d75a77b69052e-52dbd62c0b7mr10215561cf.12.1786974936397;
        Mon, 17 Aug 2026 06:55:36 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c4583aaf2sm9701736d6.15.2026.08.17.06.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 06:55:35 -0700 (PDT)
Date: Mon, 17 Aug 2026 09:55:33 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Zi Yan <ziy@nvidia.com>,
	syzbot <syzbot+805630f1453e490427fa@syzkaller.appspotmail.com>,
	apopple@nvidia.com, byungchul@sk.com, david@kernel.org,
	gourry@gourry.net, joshua.hahnjy@gmail.com,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	matthew.brost@intel.com, rakie.kim@sk.com,
	syzkaller-bugs@googlegroups.com, ying.huang@linux.alibaba.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [syzbot] [mm?] WARNING in ep_write_iter
Message-ID: <472add4b-f16a-4b87-bbc3-98c8aa385cf5@rowland.harvard.edu>
References: <6a820ebc.9ebadd4d.20b15e.001b.GAE@google.com>
 <20260816135201.98590b17b526dda8c4ec9105@linux-foundation.org>
 <DKQP5QC9XTDJ.3MI016NP0NPFY@nvidia.com>
 <02c2e5c7-0d78-4763-90ff-75fa87105fcb@rowland.harvard.edu>
 <DKQS9ADYVLN1.246LJPQ9QQYVP@nvidia.com>
 <9787b33b-b30e-4c5e-a0ee-7f14515c7166@rowland.harvard.edu>
 <DKQU9SQUIKDR.2KEZZPONJ1IJ7@nvidia.com>
 <20260816194213.0e813ed338144ebc81ed4050@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816194213.0e813ed338144ebc81ed4050@linux-foundation.org>

On Sun, Aug 16, 2026 at 07:42:13PM -0700, Andrew Morton wrote:
> On Sun, 16 Aug 2026 21:47:58 -0400 "Zi Yan" <ziy@nvidia.com> wrote:
> 
> > >
> > >> > I prefer Andrew's first suggestion.  If the user asks the kernel to copy 
> > >> > too much data, just fail -- with no warning.
> > >> 
> > >> __GFP_WARN gets rid of all other warnings, even if user asks for a
> > >> reasonable size. Why use such a big hammer?
> > >
> > > Because on many systems, WARN causes the kernel to crash.  You don't 
> > > want the entire system to crash just because the user asked for more 
> > > memory than was available.
> > 
> > User asking for more memory that what is available is pretty common and
> > should not trigger a WARN or crash, unless you have panic_on_oom set.
> 
> I assume Alan is referring to panic_on_warn.

Yes.

> Heaven knows how common panic_on_warn usage is.  Gemini tells me "There
> is no exact global headcount or precise user metric for how many people
> use panic_on_warn.  However, the setting is widely enabled across a few
> billion Android devices and many cloud/server provider host kernels
> where automated failover makes a full reboot preferable to running with
> an unknown warning state".
> 
> So I do think that WARNs are more serious than we (mm developers) tend
> to assume.

I do know that Greg KH has pretty strong feelings about this issue.

> So we just shouldn't permit userspace to trivially trigger a
> page-allocation WARN.  Especially if the caller is perfectly capable of
> handling an ENOMEM allocation failure, as appears to be the case with
> usb-gadget.
> 
> (Does usb-gadget actually get used by Android?  Surely not by cloud
> providers!)
> 
> (Can this WARN be triggered by unprivileged userspace?  I didn't look,
> this matters a lot).

I don't think it can.  Regardless, even privileged userspace shouldn't 
be able to crash the whole system by doing something that ought to 
return a harmless error.

> > You can mmap a virtual address range bigger than your physical memory
> > size plus your swap space and try to fault all pages in. That would
> > cause OOM and the system should not crash.
> 
> Right.  As long as it doesn't trigger a WARN!
> 
> 
> 
> 
> Perhaps we should revisit this.
> 
> Why are we emitting a WARN if an allocation fails, given that this will
> often panic the kernel?  Should we on the core MM side dial that back
> to a pr_warn() and a helpful backtrace?

I think that would be a very good idea.  Only the caller knows whether 
an allocation failure will leave the system in an unstable state; the 
library routine shouldn't try to make this decision on its own.

Alan Stern
