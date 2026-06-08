Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653542FA0DF
	for <linux-usb@vger.kernel.org>; Mon,  8 Jun 2026 01:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780882482; cv=none; b=QsbYLfHpnKsryVXcsz8cp2L4SFSn4+nTPg4mxdBsvSxb3NMKQuBwQP8oXwfznRS6sFphD8TKjxQVOwZwTjxLNa238TipCo6zVNlw3anb8QU4o5SjL5+g327vPm/gGHrg7RbJUBAt3KBa1jWiwRsu0m/yRQA1EHo1UyD8mFagpVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780882482; c=relaxed/simple;
	bh=LEihTHK+w1sm4zbpQAiDEKBa+TdKBpxdH3hnaH0FzdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+B92lLYqo2W1WG15zh5DS1e9Ua9ZXrd5bXH/Pt6pfriOXTNOgMAV4FN8mxtJjwiqKXTwTv18C6KwqWYX+mAyOi6dr/O+4qnSK2tR47EoH7e4DLfhaVAB/YrxVbozVCtx0pBZr9b2YSl3Z0yf/WxxMdoC+pb0ZRBCqjziK6insU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=J18XNyo8; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="J18XNyo8"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-9157d3f2098so471203885a.3
        for <linux-usb@vger.kernel.org>; Sun, 07 Jun 2026 18:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1780882480; x=1781487280; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=16SgnmYV3zvjJapF3TwwoQHwkTB1+wo23yXQ8fUQYuw=;
        b=J18XNyo8KWDQhEvYDdahLaMQUNQE1CSks877W4ewSADFKWXeZ/GJ7/v8KxJf5iZdAh
         AfL8NtVAhk4UMxngd/UVu3hhZvVFrKO9juC+ivkrIqe/hM6VGJLdJby8XhSQDeEIy70X
         3NLV+o4IQQnFbzpNmLh7Q2EzpltVkkSc34l2+xG7/YZsVhTu1hfJFn1RoAzwZVoFHwxs
         hyMAOc6SuAKzmcC8IBNTyPJVZFdacuPYYriJ/ZhlDMFbEy+ZpCtiKCG14zdWt8EeXvR0
         V2H7yDbUIXD9nJTEJThfjgA+adnNvIb02hZfCHynJqpYX+On0o+IdTGeKIltByMfy7Ic
         2dog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780882480; x=1781487280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=16SgnmYV3zvjJapF3TwwoQHwkTB1+wo23yXQ8fUQYuw=;
        b=s2icg7ob8HtGdGcVqljjgmOYXctkfxK7qUAhPv0XbgmrVpoCvMdmM1jETdQZx+VhMP
         8nsXSNDInSBTVoAJQRg22JQ4adKIAaKtvyNfUVx7jOnR8llbQu0lghkZ9sT9lLegZyg+
         AUu4x+KpwrV+UnKZHOHsWb/0EX4jelcYUHofHjjoypHbA1v8hctynlbIbvfBT2aXVGo4
         g6I4L/I9KcTY58YPwEYSSndgqC+eMFc7F7e2tTpoAb6CST7UgBFFSrQnK2GG1u7W9YpJ
         gqfS6Dk3BDp4mQxY1mhiOGXv0ZbfFGQgxxcRnEPqW2aLHwdKe+GKi3jgtfgKrt7bGFv5
         uYBw==
X-Forwarded-Encrypted: i=1; AFNElJ+dSNJQk+x2Hsz9idDYQmFnxHuxyaUB9ZaqeW/qw6e1q2IRZLqq7RxUJGIXyk6eX5VS02acowxxL3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YziHEBWJ72pyOVLDeCsAPrNYBIRdnZkXLs85p3KOG0rGcvVNRIU
	HRc3HnezfaSd7FOhqQf6B7ZC1XTXDPFvtqlc58fv71M3b2jpqXkukadZYaVcJgyWyQ==
X-Gm-Gg: Acq92OFGsHuK0HDP2cI2Gf0HG8hRbLFy+XA4tCPF3sQ4LuKJI88N6W8N63bGvmwJvYl
	nItteIrg8Py7DK70XNYpPHkEwIHrQ/5FFuLB4z0hqRqLSq6CjnMBjVvRinoD+qIcj7JEPXKxq2x
	snpmZMmd0r2M1ynE/XXHC1Gaiypjc8CMdz+LATrNVbWL2MuakNizz1JbGHEJEhDM3hwPxqubV12
	uEjG9MZf5zAJUkoJ/fYnhVDKPJib1G/HJ2mQBn1mnpPRJW0jqdtO7sqcVDKJlW9LJzwh96WhAs3
	9pr9Z56PX1SY6NRM19tm4PtV7NA3FkYuphLZAzwuA0NAmotInWouI5QvCxOI0d0dUl1U8D3gsGp
	hf6YhredczH6ybVYOPOpGFo0MCspslW+esfK9ElXB2WZJSpBu5ui8eoVLD+G6NG//sK0oUZgKf3
	qLEicdpcLAgeA4UzghIWas9HWTUeA5MtzALQ/gpnSase0Zyb+njmHMvg==
X-Received: by 2002:a05:620a:6cc7:b0:914:c82c:79fe with SMTP id af79cd13be357-915a9ccca05mr2194820985a.27.1780882480117;
        Sun, 07 Jun 2026 18:34:40 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a00afbcsm1606384885a.9.2026.06.07.18.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 18:34:39 -0700 (PDT)
Date: Sun, 7 Jun 2026 21:34:37 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Nikhil Solanke <nikhilsolanke5@gmail.com>, linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org, mathias.nyman@linux.intel.com,
	sakari.ailus@linux.intel.com, katieeliu@tencent.com,
	johannes.bruederl@gmail.com, kees@kernel.org, dengjie03@kylinos.cn,
	limiao@kylinos.cn, wse@tuxedocomputers.com, dev@a1rm4x.com,
	vahnenko2003@gmail.com, cs@tuxedo.de, lijiayi@kylinos.cn,
	oneukum@suse.com, bence98@sch.bme.hu, eeodqql09@gmail.com
Subject: Re: USB: Request for guidance investigating configuration descriptor
 enumeration failure
Message-ID: <80bad7e6-239e-4b7c-a175-0ba170b7c883@rowland.harvard.edu>
References: <CAFgddhLGHvTmRxWtguXTpgZV_Mq5ZW=CVK_ZkqbOgUF9Y5bCsA@mail.gmail.com>
 <20260531123843.736bd69a.michal.pecio@gmail.com>
 <3b79ba92-1c51-420b-a5d2-8a358cafdbf6@rowland.harvard.edu>
 <20260601084846.433bfc51.michal.pecio@gmail.com>
 <CAFgddh+dLnR=AuAU65sxqsxAgqLYX9i0OiX3Ys_sPH+YeZuHVw@mail.gmail.com>
 <20260602193047.5fe03b8d.michal.pecio@gmail.com>
 <49acc9dd-9d2e-4a37-9b41-de5e16445461@rowland.harvard.edu>
 <20260604125323.1bcb40d7.michal.pecio@gmail.com>
 <1996a7ac-2670-4124-b855-6fdf0c9999ad@rowland.harvard.edu>
 <20260607232535.74b935a2.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607232535.74b935a2.michal.pecio@gmail.com>

On Sun, Jun 07, 2026 at 11:25:35PM +0200, Michal Pecio wrote:
> On Sat, 6 Jun 2026 22:17:20 -0400, Alan Stern wrote:
> > On Thu, Jun 04, 2026 at 12:53:23PM +0200, Michal Pecio wrote:
> > > On Wed, 3 Jun 2026 22:02:44 -0400, Alan Stern wrote:  
> > > > I used a bus analyzer to capture what happens when Windows 11 
> > > > initializes and enumerates a USB-2 flash drive.  The short answer
> > > > is that yes, the initial Get-Configuration-Descriptor request is
> > > > for 255 bytes.  
> > > 
> > > Could you also try a few BIOSes, UEFIs and such?
> > > Or anything from Apple?  
> > 
> > Here's the information.  It may not clear things up as much as you
> > would like.
> > 
> > Samsung UEFI BIOS:
> > 	Get Device Desc		8
> > 	Set Address
> > 	Get Device Desc		18
> > 	Get Config Desc		255
> > 	Set Config
> > 
> > Lenovo UEFI BIOS:
> > 	Set Address
> > 	Get Device Desc		8
> > 	Get Device Desc		8
> > 	Get Device Desc		18
> > 	Get Config Desc		8
> > 	Get Config Desc		32
> > 	Get String Desc 0	2
> > 	Get String Desc 0	4
> > 	Set Config
> > 
> > IpadOS 26.5:
> > 	Set Address
> > 	Get Device Desc		18
> > 	Get String Desc 2	2
> > 	Get String Desc 2	34
> > 	Get String Desc 1	2
> > 	Get String Desc 1	18
> > 	Get String Desc 3	2
> > 	Get String Desc 3	50
> > 	Get Config Desc		9
> > 	Get Config Desc		32
> > 	Set Config
> > 
> > OSX 10.5:
> > 	Get Device Desc		18
> > 	Set Address
> > 	Get Device Desc		18
> > 	Get String Desc 2	2
> > 	Get String Desc 2	34
> > 	Get String Desc 1	2
> > 	Get String Desc 1	18
> > 	Get String Desc 3	2
> > 	Get String Desc 3	50
> > 	Get Config Desc		8
> > 	Get Config Desc		32
> > 	Set Config
> 
> Quite a variation.
> 
> Ipad is interesting because the single Device request must be a
> high-speed optimization, or they hacked their xHC to ignore short
> packets and keep reissuing IN tokens until the URB is filled.

I would guess it's the former.  The only real reason for having a short 
request first is because for full-speed connections, the host doesn't 
know what the ep0 maxpacket length is until it sees the descriptor.  But 
then I guess manufacturers got so used to seeing this sequence of 
requests that people didn't dare change them, because doing so could 
mess up some devices.

> Linux has been doing the initial 8 or 64 byte read at LS and HS since
> forever and I found no explanation besides nobody daring to touch it.

That's the explanation.  Originally Linux always did the 8-byte read.  
But some devices didn't like it, and we saw that Windows used a 64-byte 
read.  So we copied the Windows behavior, with a fallback to the 
original behavior (which is what the spec recommends) when needed.  Even 
for LS and HS, because that's what Windows does.

> Though I wonder if it wouldn't make sense to skip this at SS, because
> Windows does (in my QEMU tests) and very likely Apple too.

I'd be fine with that.  OTOH, if it's not broken, you don't need to fix 
it.

> > I suspect that non-storage devices (such as an Xbox clone) might have 
> > more stringent requirements, because they don't need to be visible to
> > a BIOS.  In general, imitating Windows is almost certainly the best 
> > approach -- except perhaps for a few devices which are meant to be
> > used exclusively with Macs.
> 
> Are you suggesting to make the 255 byte configuration the new default,
> or are we still talking about a quirk exclusive to one device so far?

Years ago I would have said to make it the new default.  But now I think 
it would be safer to go with a specific quirk flag.

Alan Stern
