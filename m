Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589B431F9BE
	for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 15:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781796664; cv=none; b=eK/EiTYGpUYsTHp8Nmxtq51Be4EuNYMC5Fae/eprNgrlHeR6MpC5ZecpFPuh/6BjQoU7V2CCJgVkMcQ5cKRumMo550CIhPhTdmj1sZF4gbt0ITKdVRG5eQCCBAZpA+NuGxots/PhiBVyof3CSjH1OSes/WzTF9a7v5CFDGau0i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781796664; c=relaxed/simple;
	bh=A4nU+qRBB51E8R8if1rqRCP4uUXJEV8Svg56thtRyBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3tpGtDrlEHhiXlnVpbhutGB24/8TsUZBmxLD5zpLn1yvnyCT6W5YV+V6Ml2GlYjiupv5HsINy1Cb9GghY7ho82smQCJUxYxKPrH2gt86q70hmc6eo0fx9lsKJMcNNwvnrlY7hh+nu5k08hz2zguYdJjLKBceX51LXGndm4iOCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=KEFIC3FO; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="KEFIC3FO"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8ccf01ba514so9534726d6.0
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 08:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1781796662; x=1782401462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BWTiHhzJHHvxO0H2NDFAEvSkvLqCRxPzseIfZ54SF1s=;
        b=KEFIC3FOzJ6/r47muAJOMN8bf5xbaMFUr6eFWw5qltNZ/VzqGNOnSfa3fTmRKVLrj7
         qqxLGGZ1hhdGh/iau23TwJvh+5CtLtWUXm/z0BfdedmnPenxfnecwUD9NeyyDHUl7Xus
         QAAh0xqD0rk0bP82BFDjHJdtyvhVKD7GHtwmbJ0XePP2uAjBZSPpzLhZIox7KjodHjU5
         5MnlML+2UlRMzYYv6AXFrw5xS1ki+YxzK8T+QMjBNVQaLBidVI4D7T+kJrn2YkoiqGqR
         cGocaNzAavHeUz5PGomVXyJyhgOzXhv85iLh8wuFzsOSt2KX+MjNpirStxVM6ajkDbq4
         D3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781796662; x=1782401462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BWTiHhzJHHvxO0H2NDFAEvSkvLqCRxPzseIfZ54SF1s=;
        b=s4OR3rWCrn1nmmzxl+yIEYVht7/DoZQ+7hCbAHUugfd4118SsxK7p5uFkgIcL+fEpS
         b0NOiP8Jy2HwIwQ8d6A7sAFwydI442L4ayN4y2k/vFbIsm2o9bbA/wh5NJWuZYdK2FKn
         3fJt1FSwnL9jeZB2PtG6TFIt3BdvW2Ag1k6F1qcJUoq5tX6ApKh9JKYHeR9vMKnmqQUD
         C+qxGmsLz8MM883NqzSbJ3Z+xTOiul/11WRikooBcnuR2fu087DM6qgYBwFVubT6eO6X
         7UEnAYCoqhVC/uXNt62Ko96dCkPLDMsswGnkIyo+hnz0euOd6F98/infW7xdxi2tODKT
         eyhg==
X-Forwarded-Encrypted: i=1; AFNElJ9Y0NKSi9+6LE+0bTgf+bM3fj/vbqEz/FHE95xYk5OphVZ/fpMxmiRbR85o59DWCsuRtR+Hd47U520=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrebkmCYhmWEYrB3pvC6G7zGu5WakQzspE8UbRNOKCIXkDzwK8
	VerkzW6iEKJfJ4DgGy4Omz9F7YF+HsmZf6qqHsYzItxTh2h6n0wSFhTmH9OjXPnWYw==
X-Gm-Gg: AfdE7ckUBhTLWoL+dzmQfUXDc8cQ+l3Ar209LH+3PDLJATfsZ8BksEw3Wpix3pylRds
	gIHAFS7qJ/XYtsgOp+SNgLRXe2iFCsnlpPwHu3wYrZ04DqoumRlNWQZ/4wkbikCnDq1kgaHDhmJ
	7QdalniHxL8Z/JPeoklI4RMlEtGH8WJnKWkYWtk+sCSz6M0Guka5A26vbzQ+VIbSewrJM/4ERTG
	GlgX7XRA8vWr+Uogbn6pxwor/EcYUb6Z/kTO8Jw3qX74nSFZfP9zx6TLpfOImxW3rd+RMo6MgMl
	/MrrrJ186731/2UMTFh4bclsZiKklM0OWdl/U679nU3inLmfFZtQDl6eRifx4yAfpybvnqd7s49
	jK63tncLgS10RAklUcHYKsqXDOC91yqsiom4ok0fE5Bz2sYOKGHqSttorW+yikKEXPZy7zoYq7G
	jjqzianvsl0nqz57rBhJEMa/3XgpUfCK8Sk5QiWnumOg/P/7i7gqrcCglq
X-Received: by 2002:ad4:5a53:0:b0:8de:1d51:ee17 with SMTP id 6a1803df08f44-8de1d51f004mr2625716d6.15.1781796661978;
        Thu, 18 Jun 2026 08:31:01 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8dcf3cf5552sm28359086d6.39.2026.06.18.08.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 08:31:01 -0700 (PDT)
Date: Thu, 18 Jun 2026 11:30:58 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Nikhil Solanke <nikhilsolanke5@gmail.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org, mathias.nyman@linux.intel.com,
	sakari.ailus@linux.intel.com, katieeliu@tencent.com,
	johannes.bruederl@gmail.com, kees@kernel.org, dengjie03@kylinos.cn,
	limiao@kylinos.cn, wse@tuxedocomputers.com, dev@a1rm4x.com,
	vahnenko2003@gmail.com, cs@tuxedo.de, lijiayi@kylinos.cn,
	oneukum@suse.com, bence98@sch.bme.hu, eeodqql09@gmail.com
Subject: Re: USB: Request for guidance investigating configuration descriptor
 enumeration failure
Message-ID: <a53340b2-4002-4c5f-8a70-c6cec78159f8@rowland.harvard.edu>
References: <3b79ba92-1c51-420b-a5d2-8a358cafdbf6@rowland.harvard.edu>
 <20260601084846.433bfc51.michal.pecio@gmail.com>
 <CAFgddh+dLnR=AuAU65sxqsxAgqLYX9i0OiX3Ys_sPH+YeZuHVw@mail.gmail.com>
 <20260602193047.5fe03b8d.michal.pecio@gmail.com>
 <49acc9dd-9d2e-4a37-9b41-de5e16445461@rowland.harvard.edu>
 <20260604125323.1bcb40d7.michal.pecio@gmail.com>
 <1996a7ac-2670-4124-b855-6fdf0c9999ad@rowland.harvard.edu>
 <CAFgddh+FU-8xQ850GTkxt08R8ZdAn=kfVZz7bG8-aJ47kSy1ww@mail.gmail.com>
 <45f91c9a-e4d5-44e3-a0d1-9727806aa00d@rowland.harvard.edu>
 <CAFgddhLAdyoBFtQ_G0Ys4dJyaxCFAbf0G3-xSkh5ttxth-6aog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFgddhLAdyoBFtQ_G0Ys4dJyaxCFAbf0G3-xSkh5ttxth-6aog@mail.gmail.com>

On Thu, Jun 18, 2026 at 07:54:34PM +0530, Nikhil Solanke wrote:
> Sorry for the late reply, was occupied with my uni exams over the last 2 weeks.
> 
> Thanks for the suggestions. I have created the patch accordingly. I also ran it
> through checkpatch.pl script and got rid of most warnings.
> 
> I am patching it against the usb subsystem tree maintained by Greg. Should i
> use the mainline tree instead?

As far as I know, either one is okay.

> > Finally, since this fixes an actual bug, you should include a "Fixes:"
> > tag and a "Cc: <stable@vger.kernel.org>" tag so that the patch will
> > automatically be applied to the -stable kernel releases after it is
> > accepted.
> 
> This does fix an actual bug, but the bug in question is long-standing linux
> behavior. Since there is no regression and this has been the behavior for
> entirety, is there still a need for the "Fixes:" tag? If so, should I use the
> "1da177e4c3f4" commit which dates back to kernel v2.6. I have provided a
> "Closes:" tag pointing to my initial email as well.

According to Documentation/process/stable-kernel-rules.rst, a patch 
doesn't need to fix a regression to be considered for the -stable 
kernels.  It's sufficient to "fix a real bug that bothers people".

Alan Stern
