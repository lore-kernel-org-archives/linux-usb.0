Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912167;
	b=gxOjVoU0vW0mIxutWs+ct+BzDhvi0Khjj2eOaKCn+qDxjkmACT17UavRHvpCBlb0c0iT
	 fOtyobTynoUcpPUrhWETx6xV/2Pohtk4zD2rwVn3zT15Ow90X/UMWjxc7O/YctN2hbbZn
	 LDQ/3wGCY5Qa+/ZXGg/YpyTWDl74R1eNAL2cODTQSLKnWeDEcvXFu5zmA8jQkL1NofiaZ
	 oANshjq20CL4a6216giVpILvDM4pOZPUzjp4OLim7EBKl7BWgNnfZxoyhLcSbMOvHXrDG
	 u9mggqwmSEmUX2vqxpqRlgQcKLbiW7hsGnxbUw7CuJ1YoNS992dIdEeKz6Hz0Dlywtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HgAqnihyWjT0W1/XYLws/8ecxSlSEuqqsnuR+rSxLUM=;
	b=k+HMay/AdSW/AvqBPAbJ44NIDGuVWoWz8cW7+vYHo+CLgmVyq0FX466oR3Y31FJmPgpk
	 gJG3m+hkyIk1W+w4F9lePaeVufn04jOqOgxkbQU4Qyr2zwIRGB0ueIsVmxpL6rM8RjVUl
	 BL/hZ5yn4i3Tv8lV04bgxAJODQiNm2OfP3SCca5LBq5hBERy/LiGBbaSE3EoYgGKhNx0v
	 zSuP91H9h2jsjDa8KUFXqMUbDJTc2UCGr4LB7ha4ZuT/dM5Mcdx2Fe81UgAg20IIO1lnU
	 0DEow7QBNj2NHU6nuFyIS2MR3JuJjBarr0++wiyMjKmMOU7bWZdWZqAebMZO+GR7oCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b="JTOno/V/";
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D77606A329
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 20:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90D77606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=JTOno/V/
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5365f9a04c5so32652041cf.1
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 12:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793912165; x=1794516965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HgAqnihyWjT0W1/XYLws/8ecxSlSEuqqsnuR+rSxLUM=;
        b=JTOno/V/J4fyCfD/dlUURr4B1Ge4nZhUE5euQEnOZXxCFtc9XIFg5jdfX9mNxJ1UCM
         7RyGZtYDpZdyipozmwk+zrC8ffAEzT9wJMKq7gQ/NZg4h+zsOpsCAJgRd4MdMKnngVJk
         1VEDzbu2K3BsMaqdJbYgjo0ZLk9OJmVfSywAoXgnDaDW7bcujk6sgzhRoNUdObLeZySg
         kiPahA3k73nTvvchjg1yZPwfp7jsna8pZQPOh0DOLt+B5m8DknHz2vQdrgafFs+kIcIN
         sFfXnjD+YnVxoH6WY+jhbTGbTSWvMP9w1D4uCufkaSdo7opJbvJl8WLzVLlZ2U/WdqsN
         DUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912165; x=1794516965;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HgAqnihyWjT0W1/XYLws/8ecxSlSEuqqsnuR+rSxLUM=;
        b=BEKDnKsw4KmEocwlQQ+vT6uoAQKopKO7Uq6Mqpn/S64nCDofe2fsB81aHgdOp8jlm1
         X+pvtr6a3eTuBZMrbJGhLgxGLdUOwdzz44hVcKtJOSQCnRSrGpgfzVLbTwbZx0gDHyCH
         SIXnH6fVN0fDcsyQYqcwHd+zriXqBdrLZZ2Rk8v/16h39PC0ub5fCWMJn7u5LOgkj98S
         vJDNq01g/V+H9W/ROi+ibdziyUmRA2UdrgqxrRfiyTpG1GQDvySQXPlFaSeYTphIMtob
         IdIlDIoiFHGvhpUsNTnR/S5EJQhcfuiNcwAoLqV3JLTIzw2J2o5IXCGMAdQ3nlFhAFE6
         0E+w==
X-Forwarded-Encrypted: i=1; AKwUvBzat9ep11ECKqkzfpOHsLh6v7ECIGaKUBbeFY4OZpeu25xzkLLKOCOd/iNDANtu9lhCWGsBhgFo7mQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DN6jG7jFAyBtYFYt5/ijBD2VQQv4tfjuC6sp+mBhEwqc9K+Gg
	Z6/aBBsbvz5BenTFibGL2jQf9Ei+yhAWYjvrcl+sQ1/Ts6pxKfH4JQq8g9TOnReQcte9P2J2Vm8
	u75N/HiC6
X-Gm-Gg: AYBFou1f7mZn13EvYMta+BjnU8LHD3ZF4TtoSVjDAXj52gwn21KBEAZK2hFWQb/sox7
	YKhNYoJgTo1+K37lQMwKjHDwp9H+cVy96TYToqTcAsk6hRzWB+uYb+wpYT/vUYu2yl8JH6syvLC
	zRlwWTZibDsVbdIqYhiPc66J1+0EUc5Dey5+Ux56veQ79aaW4XHrPJ+y+/ROuIw8A7LeTt2OM9L
	xZWK+46T4bS2mmsX5gi9jWu/rE4kFOIu4sefJa/CSaRsPQ4QR4UZ5T+QaGWtlsk/AFOhOJW/DJt
	zzY2dTcqO5ZrTb7R5JTe1sy1Mle6dUaBaBJ2YeUaxFPJC4oCf7uXgh4MXA+JDteBG4/K3EJ+pJR
	bEWBrIxxMJv2Qoovl9jO2gERWLfuO42x9EPZb/sUc2ReHk7m+UW9zKxOOTdOgcSfgaH39gJeFHJ
	mXBz+m9X263c086NyOWSJ271T0jEC/k3hUZ01mo/jH6CYUVl7PFJeUHNmCkfcL6P3ZZkYMnzfJr
	Wr0pUqosZ5KiOUy8E3L5kLrnWXfrFbLdBVc3rss7je1s2D0LmhaJB5NJkItavVK5GxvCeaEGuEM
	IwMKw8xO2lG+2RI4VjUcbfWMAkTg
X-Received: by 2002:a05:622a:428f:b0:537:d4b4:3617 with SMTP id d75a77b69052e-54e102eff8fmr9205801cf.6.1793912165435;
        Thu, 05 Nov 2026 12:56:05 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e230dabcdsm2890661cf.1.2026.11.05.12.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:56:04 -0800 (PST)
Date: Thu, 5 Nov 2026 15:56:01 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Cho, Yu-Chen" <acho@novell.com>, Josef Bacik <josef@toxicpanda.com>,
	Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org
Subject: Re: [usb-storage] [PATCH 0/7] usb: storage: some llm-found patches
Message-ID: <b6f819ba-2c7a-41a6-9b82-28d09f851126@rowland.harvard.edu>
References: <20261027-llm-usb-storage-v1-0-d1655e94ed10@linuxfoundation.org>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027-llm-usb-storage-v1-0-d1655e94ed10@linuxfoundation.org>

On Tue, Oct 27, 2026 at 03:40:43PM +0100, Greg Kroah-Hartman wrote:
> Here are some small llm-found patches for the odd usb-storage drivers
> that were sent to me.
> 
> None of them have been tested, but they seem semi-sane so I thought I'd
> submit them for others to see and Sashiko to give a second pass at.
> 
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

They all look reasonable to me.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

> ---
> Josef Bacik (7):
>       usb: storage: ene_ub6250: fail MS init on card errors
>       usb: storage: ene_ub6250: report boot block errors
>       usb: storage: ene_ub6250: fix write to unmapped MS block
>       usb: storage: ene_ub6250: bound the disabled block walk
>       usb: storage: sddr09: bound the unused PBA search
>       usb: storage: shuttle_usbat: fix READ CD divide by zero
>       usb: storage: shuttle_usbat: bound the READ chunk size
> 
>  drivers/usb/storage/ene_ub6250.c    | 18 +++++++++---------
>  drivers/usb/storage/sddr09.c        |  2 +-
>  drivers/usb/storage/shuttle_usbat.c |  9 +++++++--
>  3 files changed, 17 insertions(+), 12 deletions(-)
> ---
> base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
> change-id: 20261027-llm-usb-storage-6d3bfec890ee
> 
> Best regards,
> --  
> Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> -- 
> You received this message because you are subscribed to the Google Groups "USB Mass Storage on Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to usb-storage+unsubscribe@lists.one-eyed-alien.net.
> To view this discussion visit https://groups.google.com/a/lists.one-eyed-alien.net/d/msgid/usb-storage/20261027-llm-usb-storage-v1-0-d1655e94ed10%40linuxfoundation.org.
