Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3489835E1B9
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 16:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328241; cv=none; b=G2fvgIu1UnZYQKqjocLgC8g7PMbwuxbIJqLr6hAyltLnUagoQZu3p03Cu0wmDGbcslrYmA6zWZPY5noGxuG0ttjar0NyYucvwrTNnH/uSREJdGQ6sGcx59Pwb5rcFhsPXKe0tBNUnhZIVm2JmaCsHsR6+zswMObEoH7+oB7M+Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328241; c=relaxed/simple;
	bh=dVjXaCbpv34VpouvyO/RjpGwp7IuWIhgtoJPQQB92E8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WNtVZ81W5fztXo6zQb/btOMY+wLceYDIVoHzxIcWtsjAFSSMSAqNZ+/UvoKYuarJHHxH6ogdzSVnmR5lagttRPk+8nk65tSsK8UD5D5G6iB/7yiUPyX5IhBnfmvcv+T8FNNTfknKYj1mUTbAbqLjbCZKILD+4hiRcWDHaECeZpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A6jpQtVy; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A6jpQtVy"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c1c50c1e29bso190250066b.3
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 09:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787328238; x=1787933038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D0OTJRC2+2m5UgK2WX3qJ3+Vk6ajv1PtJWvl3y3MXZQ=;
        b=A6jpQtVynGKWCQuHXp5+XKZ41iZ5CnjmrD7Mf5NVA8nfxkEg8zNKC/09NyKRPjqe/d
         iErhIVscDAHJGyRDvovKoNann0XDd6MUNwM1DIIXNhhpfhG/QPD4a4OQ/QCnDMEOG7Hu
         pgajWApcUjB6msCEKssezD9gBpop6eow0zb/rCnbyAR79qcidQF4i7w3FSkN+NoWJIqj
         Bs5JB8BwYoK8GIZl7TffGIzcBz7mcXiP9byxab9mPGJzHzjfYscs/aKNygqJpntguu7I
         wfy+Uus7m8SHpeC2PIhnDK9wImBZ57m8Jujxb3lKfTYKV5tSAgODTJTEimHuNfkMB3So
         V67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328238; x=1787933038;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D0OTJRC2+2m5UgK2WX3qJ3+Vk6ajv1PtJWvl3y3MXZQ=;
        b=cPz0eMmZ+VFXrGYwiqGQjz5vhnmyW66pX5JYJFTVCh8UcpPk11tPnYijwXGMCKhGF6
         uuJCQA4wEhAJa5xnsp8+uwTmMLymYss0PxCdErO26UAGJ/cWFyRjplqG7R4t08/1YNQ4
         US9NlJU6XhTu3Aha0d/DMfKV0u2lnp8iAHg66dTRScvGv+8/uT1J3CxW0mHqCYL6Xpst
         ApAysFHu/b5JTWHfzTsVU3K/86+11OPqHS2AivWhrg57V2eIjVQOq0U0dxnwsM59W/6R
         2CQDZKZuUlmnnlVWZ6cWph42cGLeSW9hhyBHGzh3rupcmFapXKIHEmnTxi9dYka3ejYF
         DtHg==
X-Forwarded-Encrypted: i=1; AHgh+RpK3NH5sYKOQQ9u2bWn03J2ILCS08X0i9kdZ1h522PNmxWaD57XS78bKBYkT0oC+95x49FQIVG3XTM=@vger.kernel.org
X-Gm-Message-State: AFuF++nSUN4En0n+e5MiCHmE1MPn/69CtE5RI+FYmW/KK+58GWWOD3QF
	OPoSsyEztTDWTZ6SXo0/9Ph/DphCtBI7PxPgFPGPNiqbhq+0PJTm+EIs
X-Gm-Gg: AR+sD10yR3nDQHJMYvuIJxRqkRCYTxbUnAta4RCwdxoKM6/ApWCzhdpNfk6IRGnrl1y
	RWJpPxiCoGwNcKIUtK7doFiO1gjQK12jIsUEFmluP4QgATVPP4Rrsf5nehui+W8muSqSYd0soC/
	HSm6TlFm4m9EmPA20QHUxo4zg8KKk9mKOXcVkBNFLaS13IQ6oBnqs8+RPgbykciEQL45V7qh3mm
	uYBoVaVQVe3hnMCp1g8LMxz2gs//6kVrE9LZqOrrPcdd3UTAbfWe4Fu51cZdtyCC3CvW+Z+yHRP
	NaI0KCGTQ22A+dCcOXzYsatFmdGOBzCgAXcbEarydWYHLQO5xFaoVKkFJQWwgdwln7fiKoSTn5R
	6asRlbKMYdxRc6bWVGEEyrHCp6cgEiVfPlwLglcXLOdxZKcOkWYJtspNwrjUX27dEuuLsVMAWSl
	95mxMR9gc99LybwBRC2ynEZTV+D4yiOoOdId+ABereAYP/Evucm+0ynYM5/xrzxyf4K58=
X-Received: by 2002:a17:907:3e03:b0:c20:1c9d:8d4b with SMTP id a640c23a62f3a-c246a30c350mr811080666b.2.1787328238214;
        Fri, 21 Aug 2026 09:03:58 -0700 (PDT)
Received: from foxbook (bfg7.neoplus.adsl.tpnet.pl. [83.28.44.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589e224dsm547071166b.2.2026.08.21.09.03.56
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 21 Aug 2026 09:03:57 -0700 (PDT)
Date: Fri, 21 Aug 2026 18:03:50 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Fix isochronous scheduling regression
Message-ID: <20260821180350.3648f011.michal.pecio@gmail.com>
In-Reply-To: <327f6412-5d07-4bee-a51c-06f1ce5823e6@rowland.harvard.edu>
References: <20260821114706.34b095b1.michal.pecio@gmail.com>
	<327f6412-5d07-4bee-a51c-06f1ce5823e6@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 21 Aug 2026 10:44:07 -0400, Alan Stern wrote:
> Maybe it's time to correct the hcd_periodic_completion_in_progress() 
> implementation.
> 
> For instance, we could add an atomic giveback_count field to the 
> usb_host_endpoint struct.  The HCD would increment the field (while 
> still holding its private lock) before doing a giveback, and 
> __usb_hcd_giveback_urb() would decrement the field after calling the 
> completion handler.
> 
> What do you think?

I would go as far as incrementing it on successful usb_submit_urb() and
completely doing away with those list_empty(td_list) checks in HCDs.

I wrote an xhci-only (less compilation and module reloading) prototype
which relies on hijacking completions of isoc URBs for counting, it
worked, results identical as with the standard solution in a few test
runs with snd-usb-audio.

Theoretical race condition: it seems we can't prevent new submissions
after completion releases its lock and class driver considers the pipe
idle, but before the counter is decremented to zero. That would be
another case of "scheduling to the past" unexpectedly.

Seems low probability, but this type of bug hasn't existed so far, we
generally have the opposite problem.

Or does it exist in non-BH HCDs?

Maybe the documented API guarantee just isn't feasible?

Entirely out of the box alternative: new URB flag. And really, if
only xhci-hcd existed, it wouldn't be hard to even implement explicit
start_frame requests or hints as MOTU wished for, which would make
the whole business of starting synchronized endpoints cleaner.

Regards,
Michal
