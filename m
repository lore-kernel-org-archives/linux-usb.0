Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A86F19DF4F
	for <linux-usb@vger.kernel.org>; Wed,  1 Jul 2026 06:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782885704; cv=none; b=UNtlzyMSJNUp01+cWz9J2sV9MonWFl8pvt7sDkbVsg5uRNtJZS+lKA7UUbiGV1lol64W43qwLoalWPfQ7klgW2A4cQPv6Mio5fE+dZct4VtTYkGbgs6eqt/+fgyyWDj8CSFbN5GMmKTPBwL3Aqvmx/m3Dygt+j84opQVQabhQoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782885704; c=relaxed/simple;
	bh=3oeMZ6NNs7vMLHM4WilaG0v2t2tRVpTyTnDkKivbB1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/H3DNjF2cJ8jZ6w16RANSBWK4Tr+BCrr5WJULWcqJBX9HLPcQ8oXQrrUVo222EehtHaK1QIaZHMqS9s3KgJQIgnFTZtVdv02BrP3DE+bCHY7GQiXA9nZKf6TE41nIcmD8mDS4H5WUyQJaF646XCx62IIMCyxtKPuU57O1xjN9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jJLafG9B; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jJLafG9B"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ca70925c25so2637395ad.1
        for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 23:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782885702; x=1783490502; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0e78plCJzUw9mtQf3K/88IdWkJoFUVq9utFQfqU+ZPU=;
        b=jJLafG9B1CfiQIornqxu+KUsNtbIOICEg5+R9M0vh3OS5Uponag30+rtHkBH+p2sQO
         NbknKjvjqMZxvp10RqtWA3JaHeCL3ZjlBTW+X+DPyn+x24sQggaMAme0KMzkvqkLCzex
         ZfmFYuUZVwOG6pKZKn2MXtGonulb4rkQzD7Q8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782885702; x=1783490502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0e78plCJzUw9mtQf3K/88IdWkJoFUVq9utFQfqU+ZPU=;
        b=fVdanjO12f6roVy++nfMFlpfB9JAnkrI/IqxhRhnLi8KWB3/nPZjt/LCzRVFsuxX/1
         10BE69UeyVg5wi2AZTbxJ7QCUBkq3ABfHnM1E1v5Mp36QktA1yyc+vdMy81q9Jt7tqtG
         ee22UZKDZKBZVuJaXdyyhVzN/CfStfrZIz6Z+B+YcHvhJQUrQNaNUQ8/oiYdqScl6Fej
         gpoSYIYBGyMzYwgjiSh/zb5tViD48J+x9cQrcODjI7UVgzL3AhdpWRaFvUZVuuc+BfFz
         cQgjabuyac+nwL07p7l/zNGCcuKuexztDjR8J+gaxx0ImTvPAYupEOPe3rYNUK4s8oZW
         waYw==
X-Forwarded-Encrypted: i=1; AHgh+RrhFIL9trzgKihYyexbUZ7RzWXLKyduwdTqHeYtzduLQ+fuEFwVkvZQ7iGxQosPy737DVrVbiDD81g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGm4+L0qlJ5Sw0cfa2yP3LlJpegjLjfQWFi/ys+bSTfHIJbdaV
	Z4xzeyqea+nsLjuSg5B3tN91m8MznWcclDr+1gQMN8Tcwko2ZCZgVdNMHc/zcyV9sw==
X-Gm-Gg: AfdE7clc2Cvm2xJR7ik8X3a2g38cwRppQTXzwCwv3HHwJfYl/4+IrgWim4xDDGktyFY
	V3zoRfXo2272zRiuYbSONrRyQX/d1ybhIMRPA4HrWXIV19IXoJ4rIhIlIxFI6VvymKPqpv8/q9V
	SBNAsR3+voZ4gz1s/u1yfL3YH7mmEOz2UvvBCQBqWx4MdzO0ZbtQ2AWzSQwfbge+Mga9LSTOPX5
	acOr5o2fKd7XPoq4G8WhPdtsNvc1xYOr35aH63yhNwj6at6iEGVmDG3pt5rix/Zl/G3uNw5sB5V
	uM2iEaVSCGc4sDUTHo+qmors/9lJRGfluuCQXYnlqmAwoJQFzcnH7jPqbYtmD/+vxziIYmBeLR0
	cmUNJH52wFEwbBeXVilZyB/wBU/ZaU02TkBYIXPpoQHnKe3t4JnjzB98MJUEL6jRxHoUV9uEygq
	VkGXfo1d+u4+p7FmczwfqTaqqQtnXLMpkOtYUJv3KR1OCknow4CQsP
X-Received: by 2002:a17:902:ccca:b0:2c8:1c05:16bb with SMTP id d9443c01a7336-2ca7e86b86bmr3693685ad.24.1782885702562;
        Tue, 30 Jun 2026 23:01:42 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:faee:2436:3347:c0a2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a70c42sm26149575ad.11.2026.06.30.23.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 23:01:41 -0700 (PDT)
Date: Wed, 1 Jul 2026 15:01:37 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Oliver Neukum <oneukum@suse.com>, 
	Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org, 
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [RFC PATCH] usb: storage: uas: limit consecutive device resets
 in error handling
Message-ID: <akSsw_iDneYb_4gQ@google.com>
References: <20260701040335.810297-1-senozhatsky@chromium.org>
 <2026070157-stench-shabby-2519@gregkh>
 <akSqd7HkrZI78_L_@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akSqd7HkrZI78_L_@google.com>

On (26/07/01 14:57), Sergey Senozhatsky wrote:
> On (26/07/01 07:38), Greg KH wrote:
> > > +static int uas_reset_limit = 3;
> 
> This obviously wanted to be 0 by default (just a side note).
> 
> > > +module_param_named(reset_limit, uas_reset_limit, int, 0644);
> > > +MODULE_PARM_DESC(reset_limit, "Maximum number of consecutive device resets during error handling before failing");
> > 
> > This is not the 1990's, we do not add module parameters for issues that
> > should be properly solved either automatically, or on a per-device
> > basis.
> > 
> > There's no way that ChromeOs wants to attempt to track this module
> > parameter as a bootline config option, right?
> 
> Can you please elaborate on "properly solved either automatically,
> or on a per-device basis".  I don't know how to break that endless
> reset loop otherwise.  I'm open to any suggestions, the patch is RFC
> for a reason.

I can imagine uas_reset_limit being auto-calculated based on SCSI
timeout (30 seconds) and HUNG_TASK_TIMEOUT (if set).  Will that
work?  I don't know if all those timeouts can be clearly exposed
to the UAS driver (or should they be in the first place).
