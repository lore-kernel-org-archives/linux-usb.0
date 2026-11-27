Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795817991;
	b=DvY00XlJIgJSF1nSmcL00zhJXX7kIfHY/o5Rrv/BydKfSWusNdF34tlWlNw80xYhkzmg
	 /kMT6mbdJSiSrzsXx0AyRV4Wms8ljCsA3So9Rf7shqzcIyLcjceFSbQ6esOBzANGVEVf0
	 zMKEJAvoELk28NQTGZvvdffSPx8a/NtevSmfqOvjVSl3qRZUHfg7CJecJjc+JufvBo56x
	 P5NXm9wTgI2KGKZw/DwPRJyRQsB40WZrCCuI5N4BbtfyfmzlxziPp4xx9E4HE1CXQoXUv
	 4zg1xVVoOIC2YKct4lCqrRKPZurLcHwNyHbTCT14eR4MX9C4/MUNR4gJtdAPfyWTJxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795817991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=tbApS0WijUjzsq3VfJRl8/I46amztfPHNmlj5QvfZSM=;
	b=iy7SZFeJTi2kfAJuqEqBObB5ns5gM+j6AUA8XrospZWAS+TeBm5xxlIrV2ZseYVrkLHm
	 mb4dArVZyuOeypN/h2r9d8qdceOKEc2u0kyHxVjHY8mv+sAHvQDhaMrlXCiYcAKwtr2ZP
	 Z8NcYeVel3k9snk1tj5Da1dg6F7FQndFeAdW+Dh1/V0IQ+xMYIFd/Hq01rrChyiUXx13W
	 +DDVjE2CjE5XGT7wQFncHVvJtmXXS6DISk+iwdZ1wRy4/mkIhLA9RW34GZQqOMz1ibyVb
	 68ooeW8+W4XZ1zV3IqB23pLHd1HkTiIp37R82cE2n3aHCQhdDPl3J5k/vdPPDtRaBVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=certik.com;
	spf=pass smtp.mailfrom=certik.com;
	dkim=pass header.d=certik.com header.i=@certik.com header.a=rsa-sha256 header.s=google header.b=PHpaCiYl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EE5606A31C
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 22:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11EE5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=certik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=certik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=certik.com header.i=@certik.com header.a=rsa-sha256 header.s=google header.b=PHpaCiYl
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-677bc4704cbso10027509d50.0
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 14:19:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795817990; cv=none;
        d=google.com; s=arc-20260327;
        b=E53GkertBewu0ATCp7hg96cvmrhpt/cjz/uJSXdOhuxfwDVf+29IcefYpOcNGb1G2A
         TwdbBiBsHJG3OwzEewsWJdxwCFpEMjdtWXf4U4q1mCSxWT6Mx/GK47CdcNgsp0qxqkp3
         TZu14kA0jOSsL3w+7ns/aQhPPAng+UJha2hjEE0mlIpCPy7qGcppc9uSCwt6F2o1pujn
         oBYJfe14doOgOrs+EAZJZ1w5WHtvEMU+TZmE7vbw+geEM0lyeZ0c46huINWuISsbHr8B
         /A2Oj+XB+BvJ2xPHRdkDkE9k/pboKzN+lHeUhjgby/NoPn03ihgQ6RyavWTjDRIIg4C3
         Ftkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=tbApS0WijUjzsq3VfJRl8/I46amztfPHNmlj5QvfZSM=;
        fh=cyKQMv76a2hu4WaIAl/X1oU0u3nODa8o1hgI5rnOCEI=;
        b=XFV8jXKE/AILitriNIOcWUAhPbOIjk84ki73zbRNqT6dIlWwM9hWo2xt5k5kC7BhXY
         qxzt5Omx7kK9Nl0qufnmTpDy3OHtpM28s3xaLVH6OaLOf6KOXdBxYK6EDmZKbT8yxlZo
         nErX/oNnlDiH6sP82BuJCwyHo5KQ6Qchdc/1aUNmh6JD6O4mJ0GpkFYSr7Yn3kvnn0/L
         swmUE4mSp5JJSbLYHzM8V9QyklWCpRucIMXhadmpdCVXjgXV56oyFSs8TugqLC+r7hQG
         1shvk/D0j7aTwtGMqCb/BlzD0+2iep1bJGe8hMI0UuQwm4tkavQUkfx46m21RiXRv12g
         vFwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=certik.com; s=google; t=1795817990; x=1796422790; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tbApS0WijUjzsq3VfJRl8/I46amztfPHNmlj5QvfZSM=;
        b=PHpaCiYlBnkhauOSGUS0iQ7JIvGcVzODJm4v+DxMKAQyh0M73kUGdTp5JDrYcYTyIZ
         gFwDXojFzD8xm6MVMZ5l0XfTHu5C/QZUDFacG6l/OqOoqGrhWQ1xZiPp5zyjIh4ZMfoY
         eJPH+M3KSBPnNG6PxLbeNUor9Q7djgXwxLQOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795817990; x=1796422790;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tbApS0WijUjzsq3VfJRl8/I46amztfPHNmlj5QvfZSM=;
        b=M9oIi8ZFT/MjMkTRBxDkAEJJqOBmJy2dfaKUKR4RdFGhfvz9SlwgUFu7+vHPBOFuSi
         sGN/RkZSWqHnc1P3itnhsQM1WAgXbkO6Ucstck3wx+akQwtw2504oVcGbF8zc8iL/8Zd
         UiEtCMUgVvEuDwGqEcdOaNBR84A95f6rI0JzI6a35qmvRswOQGDTM8cCe2g2k8HIKuKu
         y7jMchUW7Vu+2gpo0cWv6TcsFSQtM7BB+HSiNvaW61iQv6N1xMp0ggAnzi862U5i0fiI
         Oij/TvXn+b2LEWf9fvJyURh8RBeu4jYXcz9t5U9ldJLfj9exO9S+zcfdXeA2F/InNTMr
         aPeg==
X-Forwarded-Encrypted: i=1; AL+hErEPxdnz8pjHMZ53jopVu6XhkgGOaGlLJj5cStxOksvpWAM6c/TdgcUo8TMoX7Sl+yLd2e5CQG6YcEY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NppVXi5pE9ul7CFlq6ePCvM/ZwKgFd867QxTI3oV6WBUeyU9N
	DBm1BtZ/fytPY3H3wbx64zmfTlr28o6Zyo9usA75FDDo9on/IaxP8Th/1NT6m1zVxcydB8Jhn0Q
	vWpVBo+CXwBPgjhAjQc9S0DWijL3SMvgn5e5Oxesnbg==
X-Gm-Gg: AZFdTZdq9Zd+ww0c5RBnywC078qZnMlP9OVjc8fAePDHc7VO8153/6rbbr1WfEc2a8L
	/Gm3CfF92RUvf3YS7bs1Dz3yPjwtWN4sV+R9IMEB+2E7uKXJS8FsNFkWvzVLvizH3Un+kxOV70Z
	QF63vp8QOhEo+U8VV0/Px8lRJZ4+E8NHY7fRh1mP7RI54phLBPWTqPixE+SrpT0E9tw77/9tYir
	ykIXQaN3jsKCQ9gbCsPHEcX69P5MSmNIgTAzUTWVE3+ULPFyxjaetPPBGYTkjLfYWIC8tqZi03n
	up0HXDKcYyxcyAqY8E7PSr0ImwAae0i8X1T+cPSCYNWcXBnLV/1JW2bK4ZnF3RuYLs7YzUZg1qA
	/xxdsO0PYdzoTDwCc9YSKOzVVIISwK566Qhu6xXXsMUF53MuSiAHtUN/bgDcIyZnQzFNhI6NGgQ
	pId1t7VSMkUW/DbnChZ+BSSffpRMEbIIQxci4XaDFHhLUT3XWbjtuPEuusMfnvsIef5tfB7218W
	XhQWTW8+ituAipVHmJn9Ofu+ZqrBby8gOqwV7eyvGzt6HN1Xz4aBHZHeQ==
X-Received: by 2002:a53:e3cc:0:b0:67c:f8c:228c with SMTP id
 956f58d0204a3-67df44bb47amr6598196d50.140.1795817990004; Fri, 27 Nov 2026
 14:19:50 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 27 Nov 2026 16:19:49 -0600
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <awn_K39uYLTg9DWv@duo.ucw.cz>
References: <20261127-cip-cdns3-510c-v1-1-56e5faa149b9@certik.com>
 <2026112729-zips-gargle-7886@gregkh> <awn_K39uYLTg9DWv@duo.ucw.cz>
From: Dickson Wu <dickson.wu@certik.com>
Date: Fri, 27 Nov 2026 16:19:49 -0600
X-Gm-Features: Aa3M54pApVHAjr4tL-AXMrpk1mjexcurifaA53kD1Y16XS-LneTwAO_Awjaz35E
Message-ID: <CAFaZ9eqp+wcnP=phoPmyBoeZQP5mfMw9ZDODwSJqkNb6_hxSZw@mail.gmail.com>
Subject: Re: [PATCH 5.10.y-cip] usb: cdns3: gadget: fix state inconsistency on
 gadget init failure
To: Greg KH <greg@kroah.com>
Cc: cip-dev@lists.cip-project.org, Pavel Machek <pavel@nabladev.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Ulrich Hecht <uli@fpond.eu>, 
	Yongchao Wu <yongchao.wu@autochips.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 27, 2026 at 10:07:39PM +0000, Pavel Machek wrote:
> Could you share some kind of motivation / background why are you doing
> this? Do you have product using -cip? Or is it just AI advertising?
>
> There will still be 5.10-stable releases, no? This is not -cip
> specific, so I'd preffer this to go there.

Hi Pavel,

Fair question. No product on -cip, and nothing to advertise. I'm a
security researcher, and I've been going through security fixes that
reached mainline and the newer stable trees but never made it to the
older ones downstreams still build on.

I was sending the 5.10 ones to stable, but Greg said on stable@ earlier
today that 5.10.y has had its final -rc and won't take anything more.
That's why I moved them to -cip, since that's where 5.10 keeps going.

If these aren't useful for CIP, just say so and I'll stop sending them

Best,
Dickson


On Fri, 27 Nov 2026 23:07:39 +0100, Pavel Machek <pavel@nabladev.com> wrote:
> Hi!
>
> > > From: Yongchao Wu <yongchao.wu@autochips.com>
> > >
> > > commit c32f8748d70c8fc77676ad92ed76cede17bf2c48 upstream.
> >
> > There's no need to send cip-only patches to the usb public mailing lists
> > (or any other lore.kernel.org list).
>
> Could you share some kind of motivation / background why are you doing
> this? Do you have product using -cip? Or is it just AI advertising?
>
> There will still be 5.10-stable releases, no? This is not -cip
> specific, so I'd preffer this to go there.
>
> Best regards,
> 								Pavel
