Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610B637F8C6
	for <linux-usb@vger.kernel.org>; Tue, 16 Jun 2026 21:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781644833; cv=none; b=kmaCrc5QUl2rUgn69jOnpINBKgnHm9tuhV/1zvaiIDW+KmbisYLLKbu3t2yFdObnBYPhORLVLL+7GGwx/5ndnFHNYDyDtOHMJLcw0WVgGrwibnGhtdftLdURYGJY9TNgKS0G+wkMT7OcmUzBwGJWHulf9Sr8RmMUWJ6qXtXyO7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781644833; c=relaxed/simple;
	bh=wapozlZ15SwnLYwG2dp/kT2sgJSViUjoDMIJaS/HsFg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ub6owIyGEv7T5KskHt+rAUd2ba4Acatwx0Js6ao9J732CNqcJGCgatlSIkQwx1kx+6v6f9QxIHfcRhvzFQg6R09/k2pBMknAo39e8Zf1MNlAylZZDBaxuUe+YqscsSeOGY7mUGMMvzMlIneIJzSel6nGz+09/7SnNBH1lYX68lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4bJ1LLO; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4bJ1LLO"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso47890585e9.3
        for <linux-usb@vger.kernel.org>; Tue, 16 Jun 2026 14:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781644831; x=1782249631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0MLk7EFjFyUhInKOQGFIRVTa7n3SV8FUkqmtHf663Y=;
        b=Z4bJ1LLOg2DjGnjAk/RayOPBHu4g1RjpWXzfrGAazInSKlOnCjr48JYFXm5SKXzT7I
         8IKgPSwHPbRL0x++MBUkJZSoegFOTLJZ0OJhjqHgIhuz1UguSwG5k4bu9uvyrsC01Kk2
         nW6pYJuysQH/Uvrs3YHzVryMN/c7Q/ThnJHsZ0xAFMRD6YbfM+mesB2EN1TQkU9013PP
         6ZzUO7j9BCkO7246yF+q7BkEq2CHXvyMZENMxUe7RlUY2yUyLyOBv3NJED+LBsiG/2QG
         vNCp1kJMMC5h9Sa4zMKBTzE9agURXZDYctbkMcQv1NCLiZp68kEIgVN9b14bjpH+Pbx/
         Bv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781644831; x=1782249631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g0MLk7EFjFyUhInKOQGFIRVTa7n3SV8FUkqmtHf663Y=;
        b=GMjw8Sqr4G1wTg09J1fvEsn5x9UkZwe8yyXVBBgHYr0YmeLL26IBhb0r3UGffJkL8A
         +sthDK9ZB81b1TanrExkDSfCXjYI9oVVqeWAAjE3n1GPSQpaGZmBgHzYW3aa+JyAGpPL
         gHvYF952p4hgkzh/aPHZj6MaTGnRYAZBDzHYHHwpZ94TXl9vsg0hHTzaTnHh6LkCQdDE
         BdEOFx1f55ECnho7Co2XORUmf7CifnTe8NMINYOfUDgrvLuNgDAZjMRexuIYU7UXqoGd
         /zCkaAfUXldpsMV/jqOJF/Qo7+b9tm/PifYGXKuLWm8kvydeOpdJK3hHeYmNvhqqDpZx
         7NDg==
X-Forwarded-Encrypted: i=1; AFNElJ/H2y5eM1JNu1gqJVSrKpLkf0CdD7CYIAHoGpw9yLEp4Pek9BDDifRbYXuos/77X7zm0jVl6gAGYwI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8SYUutTpdbuLYcfX7mPQdcXB/dZc8RYYGA9RtRj5UVoGtju0o
	wz8XhIVSNxMxtg7SV1irZbo7ZXhgUST6JgvvSGwTHnRGFKJHk53zxqdS
X-Gm-Gg: Acq92OFc1nkIlp/i8fh/9aE5AnZHZJk/8/slPYW++io0mDhZAq17YIKn854MU79iela
	7blU1tqbqJiWSHqv47tJ9mE/5ktakvNuecUCetKmgiAhPka9Lb5tvyQsVwJF657/4/w1ZrtuPYY
	gD3GarTfYgs3XrAU3gQlY/tT3T8uci4K2b12ZtXKlnEgoHSG89v12e8BvWe1sIc6jyJnEMnvWlM
	mwQ87/wcfmbYoqy84jEVec39xE/GUhmYlpN6NucZCeqR3qOkywnL45UWVLQv6eCyHBFHkvvxovY
	+va3mhAQVA+hArbt0+mPZIQc/EdJKk96uWLX2cA55Qk5+oo5chC7F2pVErSHLvAKXAv/2NHCKdD
	GO/QcU5jNvDyhKYw/b9g8aKeDWEki7UHT7g/H/Ku7ZoMXI/R7xL/DyJo5AT0rAjndunABHENtnq
	t3evRb87zC3YDdyjqW4D1BXxHOdR0EpdcI
X-Received: by 2002:a05:600c:e548:20b0:490:e5c1:b8c0 with SMTP id 5b1f17b1804b1-492333a1565mr13531725e9.5.1781644830555;
        Tue, 16 Jun 2026 14:20:30 -0700 (PDT)
Received: from foxbook (bfg19.neoplus.adsl.tpnet.pl. [83.28.44.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619fb12edbsm10569658f8f.17.2026.06.16.14.20.29
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jun 2026 14:20:30 -0700 (PDT)
Date: Tue, 16 Jun 2026 23:20:27 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Amin Vakil <info@aminvakil.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
 linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>, Tao Xue <xuetao09@huawei.com>,
 regressions@lists.linux.dev
Subject: Re: [REGRESSION] usb: core: interrupt-IN wBytesPerInterval fixup
 (727d045d064b) breaks RTL8153 in Lenovo dock
Message-ID: <20260616232027.10ba0415.michal.pecio@gmail.com>
In-Reply-To: <8f862eb6-adfb-43a9-b4f5-8f9232333b51@aminvakil.com>
References: <cbdeb118-58c7-48a7-94a0-15e5cdb5879c@aminvakil.com>
	<35d2b455-382e-470e-acf4-1ab60770da90@leemhuis.info>
	<5036fee2-4d00-4ca0-aeed-400da64d7872@aminvakil.com>
	<573bbb08-0ba7-4f00-8996-819cc1d9cc48@aminvakil.com>
	<20260616183646.4798516b.michal.pecio@gmail.com>
	<8f862eb6-adfb-43a9-b4f5-8f9232333b51@aminvakil.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 16 Jun 2026 20:22:19 +0330, Amin Vakil wrote:
> On 6/16/26 8:06 PM, Michal Pecio wrote:
> > RTL8153 was one of the chips specifically targeted by this fix, but
> > it affects the CDC configuration which you don't seem to be using.
> > 
> > I have tried linux-hardened-7.0.12.hardened1-1-x86_64 from Arch repo
> > as well as my own build of 7.1-rc6, and my RTL8153 (0bda:8153) in a
> > different kind of USB-C dock still works with a few xHCI controllers.
> > 
> > So it's some weird problem narrowly specific to your system. Now that
> > you have built your own kernel, please also revert the suspect patch
> > to verify if that's really it.  
> 
> Honestly I've tried patching it myself :)
> 
> by changing
> 
> (le16_to_cpu(desc->wBytesPerInterval) < usb_endpoint_maxp(&ep->desc) &&
> 
> to
> 
> (le16_to_cpu(desc->wBytesPerInterval) == 0 &&
> 
> in line 187 of drivers/usb/core/config.c to see if that fixes the issue 
> and it did not, but I didn't specifically reverted the commit to see if 
> that fixes the issue.

This should be enough to prevent overriding wBytesPerInterval on
RTL8153 (and get rid of the new log message).

If the message goes away but the device still doesn't work, the problem
must be somewhere else.

I would start with userspace - if you haven't already, downgrade to
some kernel package which worked in the past. See if it still works.
Or check if 9ddb9c0deca48d2c2a22ebf4d2f35c925a520328 applies to your
dock and try reverting it if it does.

Otherwise, no idea, besides git-bisect I guess.

Regards,
Michal
