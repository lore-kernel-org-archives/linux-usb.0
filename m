Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8481DED49
	for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 09:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787478677; cv=none; b=hd23TIb4snMhAIZT01frhsGjp/N0ZJV708SWKrJN/QjofhGgfoJpDnzX6Y7PR7ZdL0j8LhOrXNdDCIHKfkQ0uXbdIijdp9cPfM0AImbOpzU2h1NJGCGfnr7ih6UvxMIaZb4jcLsEyWLLHrUgXc9iRIiPTsc0ICR9jr3EbyhVw34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787478677; c=relaxed/simple;
	bh=f2tDc1kc1ql6btFzAAkAVLGQZw4wnVLkJU+tyy6GTfY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cjl+R53JX4rUK4dBR7YXJFExyymuKE58GViVbczGekfcIEzuegGB+NuPUFdGXt3V1I/LpGVY4RXqOozr0VLgODzh6OgplfPwnt+nD5n1vUPd29Vqxv8BtofL5SthK8c2DLUxNGnuPlybAVS0oMIRctCIQIk3wlZ+ej9aKqNXQPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCd0WebY; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCd0WebY"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4980dc26022so16567175e9.1
        for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 02:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787478673; x=1788083473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wvEAMY2RkZf7PfTNiUAYI3buU2kMNo488twu/BMu5lo=;
        b=QCd0WebYqSZqXXxupF0SBWzWnMk8NRMVEiEyAmiCIK1aae6mHHOoFPx7nJC4RJutGh
         CYLPwt022YxzQsDXYlgnqaCds+piW6DeD9lII+9At8CnCzsPEouYeWFcBqosPZQMerSJ
         vmmLR2byDxIvcwbUNVmSfFSUCTKSb0UkRtzFq1GurlaDAMkFbdmmgtc4+68jfZv2OxPT
         J0IiCMQ0DEno9XeCe3XK1xoLLFxT78FLIEhjh7J3+h5c7LRDGulnnQxd1YC90TWMC2vO
         +J7KpWJtpYIt5p/by5PuNDlesJG3DSJ2GpQxHfIBgHVl1xCcZumIqtI3Is3fTetNEVux
         U3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787478673; x=1788083473;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wvEAMY2RkZf7PfTNiUAYI3buU2kMNo488twu/BMu5lo=;
        b=qDyzoQb8f/jKzSLAFtDHnZTBeQaRCcQFtwVbXNRSSqGxBHSFwl7wOJ/6aDDmWCrEw/
         e7wNauJ7BLan6yuuauajtZshZmgTouDyAP+kD/M5jyzHo0rz8BDYk81qxwfmTU4yyhpu
         FqB4DeaVSv8zsDRofoWlN/iCThzfgXIaYlS6m/2NPOriAIYetYPmFVJpLqOKJJ+9M1KB
         8gmhuXnNKe7foEVqc8FdLhxJRhEVGvlVMZFX2kdpW1obi4bqFtwJ73iG7G7CHBI7xL7u
         TPdjixMW+RWSQzdBoCBQ51dnqO27zc3aqTpCdX91na+BQY9MMrk1LcHXE5nihfKpJ6rL
         oEBQ==
X-Forwarded-Encrypted: i=1; AHgh+RqERqQJ9+DTIvr27Gu03K427mBlOVS0s+tXZlFO+VMhPUZuzw4qQNxDBUeFTx2ppX9MPZxpD4OlZ28=@vger.kernel.org
X-Gm-Message-State: AFuF++mfxw580ROWVUJv436l1+Fyfyb7LpzcSqqVC4pP+vTXO8Wn8RMQ
	kOF8RzoDzBLUzSJvT2fnfPfNiu5d+hNYUWVKvThE51bDArzW7suzwqls
X-Gm-Gg: AR+sD10Obz0N1y2y/BCNrniBofcRObnlnq22SxLNOGDZAYfXG0Stt+JS9bmQLI2ECn2
	xzFfrZlDGGR/VYrufnpCf951MjQDZN/XZG3tE9edgYj+F+5bgrngQgCg9UMouUbzJZRrkzBeH0b
	fFv1eZgXHgvcay441pFaX15fn3xU9JmDm7aVltZ9Dcv2U0WXQxB26tQsiXOlHAT0EhGu5OiAU0J
	zsctuHbQpJZY1lnbFRpOVCsSEwWYN3ypyPX4cT7MMGxMl5HoVYiug0sujMIsPs9NMQHbKQlHOXI
	oD4Q+5lI3n7qxNkTn/BstV4aXzVWO7GpwymSFPydiHLBqD/LN222Wf0BhtqRoa6ieaRhvsFAdVQ
	ZcXl6bE8Cj35PY4tNuK1rvxunLzNv7JDyF5q+5b5goKKr7WhOeZAkgnj5yZzBwQWeZK4V8Vhf2h
	8ShC3Sj6g0/6U2TWtWqHKXvsKTNaCgVgA6D0IiUOkjlm8QjbzL+K81s2wKboe+Yg8mKKWHoTvtG
	CKXKzSLVHV/5YRF7au4DJroGA==
X-Received: by 2002:a05:600c:a01:b0:499:bdf1:7578 with SMTP id 5b1f17b1804b1-499c19bfd2dmr85924005e9.3.1787478672407;
        Sun, 23 Aug 2026 02:51:12 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9c0acaesm4597451f8f.29.2026.08.23.02.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 02:51:12 -0700 (PDT)
Date: Sun, 23 Aug 2026 10:51:10 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 <linux-usb@vger.kernel.org>, <netdev@vger.kernel.org>
Subject: Re: [PATCH] r8152: simplify loops in generic_ocp_{read,write}()
Message-ID: <20260823105110.231a88bc@pumpkin>
In-Reply-To: <4a7604ab-c6ef-4552-b63b-3e7146ff42d0@auroraos.dev>
References: <20260822202155.18632-1-s.shtylyov@auroraos.dev>
	<bf541361-3d57-4e53-8c67-78b474b420a2@auroraos.dev>
	<20260823091131.0254d6ab@pumpkin>
	<4a7604ab-c6ef-4552-b63b-3e7146ff42d0@auroraos.dev>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 23 Aug 2026 11:20:30 +0300
Sergey Shtylyov <s.shtylyov@auroraos.dev> wrote:

> On 8/23/26 11:11 AM, David Laight wrote:
> [...]
> 
> >>> In generic_ocp_{read,write}(), the *while* loops look very strange:
> >>> the last iteration is executed differently to the prior ones, doing
> >>> some useless assignments before *break*. Move the code for the last
> >>> iteration out of the loop bodies, dropping the pointless statements
> >>> as well...
> >>>
> >>> Found by Linux Verification Center (linuxtesting.org) with the Svace
> >>> static analysis tool.
> >>>
> >>> Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>  
> >>
> >>    Actually, scratch this patch -- it's not entirely correct... :-/
> >>
> >> [...]
> >>  
> >>> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c>>> index f61686433031..de9738bdce85 100644
> >>> --- a/drivers/net/usb/r8152.c
> >>> +++ b/drivers/net/usb/r8152.c
> >>> @@ -1431,27 +1431,19 @@ static int generic_ocp_read(struct r8152 *tp, u16 index, u16 size,
> >>>     if ((u32)index + (u32)size > 0xffff)
> >>>             return -EPERM;
> >>>
> >>> -   while (size) {
> >>> -           if (size > limit) {
> >>> -                   ret = get_registers(tp, index, type, limit, data);
> >>> -                   if (ret < 0)
> >>> -                           break;
> >>> -
> >>> -                   index += limit;
> >>> -                   data += limit;
> >>> -                   size -= limit;
> >>> -           } else {
> >>> -                   ret = get_registers(tp, index, type, size, data);
> >>> -                   if (ret < 0)
> >>> -                           break;
> >>> +   while (size > limit) {
> >>> +           ret = get_registers(tp, index, type, limit, data);
> >>> +           if (ret < 0)
> >>> +                   goto error1;
> >>>
> >>> -                   index += size;
> >>> -                   data += size;
> >>> -                   size = 0;
> >>> -                   break;
> >>> -           }
> >>> +           index += limit;
> >>> +           data += limit;
> >>> +           size -= limit;
> >>>     }
> >>>  
> >>
> >>    I forgot to check size for 0 here...  
> > 
> > I don't think it can be zero - assuming it isn't zero on entry.  
> 
>    Even if so, anyways it can -- if size % limit == 0 on entry...

Not with the 'size > limit' check at the top of the loop.

David

> 
> > David  
> [...]
> 
> MBR, Sergey
> 
> 

