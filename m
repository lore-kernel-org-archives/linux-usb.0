Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B618B3B14B2
	for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 13:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782133913; cv=none; b=N877cXt7yBi3Af0QACrmUOGs4aJaFEEaBlZARcTgKt2yDEHzfqIiGGzoYryH65R2H8frVbK0Z6JKF3ZHi9KhFP3TbRM0lci0W9mFyWeTtvW4I4R+eQp+L2fG7PyHfzBAZZPJnNNcPkooRG56jDPw0YU/ulXSnB/+/t23Oji/QZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782133913; c=relaxed/simple;
	bh=HQz5Bgb9Ix6CxIn/K74tfrlANhIDMynRIFpNpd4eCGE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R9/iltRR7zu/SavVswJ2ioc14sON18PqPCBkSAR8oSKuo1uBx8DIioJGeSx+ZRMaPhLs7nxj3IqgXLxYnPVbHewYoC6joUxDaBgvEYbijDDSLXKGzuQdCJqX4SlE5vNhAadVchBP99Pa/Jsljj9iSTHYf8U10L5/tpMbAj6sWG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/i5uTze; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/i5uTze"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-66077e888b2so4125550d50.3
        for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 06:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782133911; x=1782738711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XkaEWxUJkCuHp/17+ud4oWXJ3qqAKnltzqopfMTtFIs=;
        b=k/i5uTzeJQR4+7Wet36cQgSo4sxL7JHnWkI80+xtkrP/9oBTFyHZ8X3t1Q2CnMTDp6
         Psigzn+fygxUIibpKJV8vugNaeMafjx2dbtYSsLvity3z1Woqbw59/7qieJHFyH4Adan
         iIRyDi8CMOCz/az4EFMKhiAYGCpfEhizDTOzb65ymOvZsLNvI1F9BvcwvMSLbbcXXmc6
         lyPBLK7m1zPmKDIwdT1nVVOesfeemXdJZa83ea/kP7geAEZB8UZ24UFkA43weVCRdqNX
         kqhXI7Jym8KGVdZHNk1qUH7mqWCLBnaTI9Bl96kF6LQYh6lfzYB59dUz5+jAHbpHTf5O
         SP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782133911; x=1782738711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XkaEWxUJkCuHp/17+ud4oWXJ3qqAKnltzqopfMTtFIs=;
        b=lG92MSUm/GQNTDRXB9XP3czEe7jKCXxjPVhUCUyQKykmCOqDY0i4WaygT4M+Y5I4ZP
         4tQRQTcNW38oh07XGpk0YWUW6o67qUDCAhHxEjbn6bIUDFHul/wk2xWk14MR7SOxHkG0
         E2XkvyF+piL0y1i0qZd7Lxp9AwRIvgIib89g+ht9MKFJ1ijRYZLq+jZKhuS/3eF+L4qX
         dQrs6X05um3BSHRkR225tq8s+zGDB8q9QaV/xLul37GmwF4zHudtvIGnCrb9FTniGQni
         Oop3woo7x4gCAjtUD2z7VoTlpYBr6zB5dC7OLDCFY9HMXsGYYYiYDGU4dnAlk/WV85AS
         Iijw==
X-Forwarded-Encrypted: i=1; AHgh+Ro1COA8xhX36lkgw4n1F/c4q9QHwalGHkI0w9qnQDwOOz6zXTt64UmvT5Rd9M/E4bfY0JTsQb8CJkU=@vger.kernel.org
X-Gm-Message-State: AOJu0YywYlZ2lsOR950dsHngYn5VeWardr0aPW7QCUSKfX2fjDgpTiqT
	+/uRV8kyhbHBQGC+/iPklX0ceI3BQ72vrBXMvAZ0N0mYRyi1NpXHtqX/
X-Gm-Gg: AfdE7ckLd60oBnzCn2ZbWbN3sajosVZTwCab9jQGYLwRrDpTAX23Wz87xb3HnyQfEUC
	xxqEwFF6u32VYvnICHZhBTRQlcciBldm7gCh0s6aFPKB6GtD+XyHtGA/CMOtW/uByvxWFGo5vXH
	IzlHL7dy8SIfVSY26qu1/6IrFYNPvPqf15KyD0dHNIAbITw0g0OfhVHSZO/s6AgHALUYKkOl3bB
	rbOtZpw4pOlDE3jPJ2iImDQRsUwQy/pSabYjJATg7pvEPAi+88xe2foBDw4Zf/91eP1vwpJo5f9
	o3O2P/j9yEWKoLZnycrHJk22Yj0MkbFRWzjXzcw7Ef8Dfng5WVRsNfZphOYyHYqA2bO3QaxwAXZ
	9vfk/9bIS1GOi1j45WXSh3ro0efwDkHsq93X5w9VyXxOnmcHMvxZZkQiUkIryItvxPUEiebjwI6
	gT+GqJ4YA=
X-Received: by 2002:a05:690e:120c:b0:660:54e4:5dd1 with SMTP id 956f58d0204a3-6630333ac1bmr11505521d50.44.1782133910591;
        Mon, 22 Jun 2026 06:11:50 -0700 (PDT)
Received: from localhost ([38.101.158.131])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66314ac3f96sm3600882d50.1.2026.06.22.06.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 06:11:50 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
Date: Mon, 22 Jun 2026 09:11:49 -0400
To: Steven Rostedt <rostedt@kernel.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Julia Lawall <julia.lawall@inria.fr>,
	Yury Norov <yury.norov@gmail.com>, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-nfs@vger.kernel.org, kvm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 0/2] tracing: Move trace_printk.h out of kernel.h
Message-ID: <ajk0lT9P0SeuD94j@yury>
References: <20260621093430.264983361@kernel.org>
 <dbb5915e-6587-4de9-87f3-76bea5024da8@kernel.org>
 <20260622090826.20efadb3@fedora>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622090826.20efadb3@fedora>

On Mon, Jun 22, 2026 at 09:08:26AM -0400, Steven Rostedt wrote:
> On Mon, 22 Jun 2026 10:05:13 +0200
> "Christophe Leroy (CS GROUP)" <chleroy@kernel.org> wrote:
> 
> > > There's been complaints about trace_printk() being defined in kernel.h as it
> > > can increase the compilation time. As it is only used by some developers for
> > > debugging purposes, it should not be in kernel.h causing lots of wasted CPU
> > > cycles for those that do not ever care about it.  
> > 
> > Do we have a measurement of the increased compilation time ?
> 
> I believe Yury does.

I re-run compilation is a more strict environment, and the difference
is negligible.
