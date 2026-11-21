Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795294502;
	b=ncw8AE/nHViL7eoVZ6hRT/UidESOEBe3sRz5NLdZsZcSdOfPl5p1u95ecJmt3+nbPkHk
	 mAtIlAcxuBE15x7qP90cYFOMwWFwHJcX5aWQK4jvdpVuk2xXpd+Cr/2SGDlfiAeWdif6e
	 1hc9i4eVDGvIiIF4qPri6LsmnEi6wj8jD8N9QAceSvn1JK5/uE6/yP2iQ7CdKHkGUbidK
	 bqW/HMfq115RHSf58cBn/SgKAxIIAFlhIUGhZ6RBLC0oVLoblEvD8pVm9eQO/qXHzvuJ1
	 hVM75J3bgNi/f4UzaWi1Kqtclu8uE5iatqVavtruBGgA1fspZInh7Gp8pPuW/Lcc+Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795294502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=KsAe0DhYdt/3g87gB1LeApXPRoWIhM10pQ46a9pN3C4=;
	b=qNFI9P694zOzYybo7VXZLPBBYVXBU0xSs+bEjgtLxgjBAKw6D4Q4zu+Q5IGQZmPA4YeT
	 GMIIxUBnnT3svyGMWp2gjbnx9aqlvSskYwmoR4LUG7d9j0afv1MvhGrYbTfFcv5We7ygR
	 tKC0KKCqHnQXP4eVnk9SiuIgCw/KE0XMUlrTaOFwPfXzKF81XFsPzmvl42K6cA6AV0lEH
	 5drQueD/swFEJmQ0/9LxfV3TsAx9Xsgky5tErnN9OTCnSfHBU2mdUJKEnx0pquy34Nxj9
	 +Nzc1PCccByc8HCOLUqpeH9QAgnDTsI86SnZtY1U5V2R1j1Cq/cPAjHzs0RDW4UgFdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=XshW6s1k;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567EB606A32C
	for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 20:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 567EB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=XshW6s1k
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-9213f004a14so20511406d6.3
        for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 12:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1795294500; x=1795899300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KsAe0DhYdt/3g87gB1LeApXPRoWIhM10pQ46a9pN3C4=;
        b=XshW6s1k7WQmR+2O2DWZ4GneGxkUS/SJGW0cSDG3Q4YBBbLNsjXA757q/8fabmUPpi
         nqQJd4MuMDODQrW65W/CqW0K3c/tyhZybm5R0QhPdCYll3lXGhMrmFwLqWOvgoE9Ssx/
         oERjx9P24ajqlRpwagkS21qqjRVFUD+jMPLHXaxxGi+s2oCEhjPbv1emGdzUKM3HovV6
         i86/SjI3vTAH8YvB+PH4Qs7VwnxIsP97xogmec5nk91r9ljnstyYsIZy4EyMz+gjBbLn
         2tJkpD6xNjxor97q+4e5hI3uaZAjaVndHg6nfOm7lZs7GO5q+PsYxY9vRfaeEpK50eNf
         xiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795294500; x=1795899300;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KsAe0DhYdt/3g87gB1LeApXPRoWIhM10pQ46a9pN3C4=;
        b=YghqVSlF02J0ttvvvdhchmFUEorRZamcgW4Y+Kl8u50cDMs7lNSmqn0qazFizXfWIp
         NTAT72genrSKbGP6hrBoowScvKpMIqxB5t8PiyT0Jr895QB6lPYYYUw7oUnOqv22KO4n
         hhUK6S+etgyrLAzX4XA6aL6nCMywIR/eLFJ9FMb6oGdx5PpGBy6UKdh0RRcD7y2+wHUT
         A2QZouyWyhtjAkiqYiEtStrTMEksDWiFQdKB9G7gPyXu1p0zcriVDIGpeXjEwzHolhFc
         BSAxMhk3lm9s9RtzfmdSfm/Dq9AxQ8CRF0aoyWvGlX204wqaHo6ERGxz3P+ZQ4l2WRup
         W9vA==
X-Forwarded-Encrypted: i=1; AL+hErFZfAp0ZEdtbyl2ftpTMtbFb5IqM8Kk5vJLFD7+6H+GDUm4rzdqsw+0CyznOws9wvjkIrvAhYzoi7c=@vger.kernel.org
X-Gm-Message-State: APuU4Z99/zKcxSwIE+52jxcRQZ0nIfsnaaAZciAUV7e1FzECdaI3RFyi
	gaeJtpNGo05MydLKG9Z5DVVTVJqLSefznO8TVy/2OMyeP7fJq6emdmJHN+x4UXpUMg==
X-Gm-Gg: AZFdTZevjeFMVFRDca60Sk4Wr3u/pvaZXnSOS8rF0WeeuGkE9fv2IeGDhqdPSivR7yw
	yqUgxd4pdNo0DQ2Q5RBIvHERfR44uk1Tlxwznd2qoUnnUs7zN7z+6N51ChDO+8cCBeHDPJaide/
	qmJok2B92tjXTaqF+PgVqTqZWl/lun+EdQZwuxJXT53qPQ7ESS5dCMSp8CMDcZr4qYaW9MnI81+
	YD3HXTZf1gaKmk6Vr45TSMtZCqWZYa9/dFLEOmDKVwwcOa80FZ8x5h892B1qQn7QXiiGTEsKWw1
	nDjwJlKo3yRN97VZCS7IEhIIRy4Omx7K+ehOOJ4+peX1MuqZBFtOhMCTnTAiNSyZ50fLREtrW1Z
	2bWR4I2ngf4BJiTmVWpUB+QOvC5mFvstEwi0nuqdndIyntxWlncx/P1XsVFQplHSYP5TUjgiLzm
	I1zzvf/LSL8UoScJJU3bveP4P8F2Xm0lVr5jD2+fmijBayYUmMOT3r/nhsd0Gxschks2gSvVxDW
	rsFoaM6Cm7uTlX2LdSco6YSJiyOhryDE7GfiGTkVr9LHU8mVD8vFC5QR8HFavXVMg4//EzYJ/px
	Jki43LiK2KqDlYH11urLUP3Dy5jMUg==
X-Received: by 2002:a05:6214:4018:b0:921:3369:a766 with SMTP id 6a1803df08f44-92134a90270mr122441186d6.37.1795294500229;
        Sat, 21 Nov 2026 12:55:00 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::d398])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921347a0b6bsm60909116d6.1.2026.11.21.12.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 12:54:59 -0800 (PST)
Date: Sat, 21 Nov 2026 15:54:57 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Arbab Haider <arbabhaider649@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shichao Lai <shichaorai@gmail.com>, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
	syzbot+dc208a8cf8d37cf3e5ac@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] usb-storage: alauda: track media_initialized per port
Message-ID: <5d2e1310-88db-427e-ace0-c2a0590560b1@rowland.harvard.edu>
References: <20261121171956.1455-1-arbabhaider649@gmail.com>
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
In-Reply-To: <20261121171956.1455-1-arbabhaider649@gmail.com>

On Sat, Nov 21, 2026 at 10:19:56PM +0500, Arbab Haider wrote:
> Commit 16637fea001a ("usb-storage: alauda: Check whether the media is
> initialized") added a media_initialized flag to struct alauda_info to
> prevent divide-by-zero errors when alauda_init_media() has not succeeded.
> 
> However, Alauda devices expose two LUNs (us->max_lun = 1) backed by
> info->port[0] (xD) and info->port[1] (SmartMedia). Storing
> media_initialized in struct alauda_info shares it across both ports: once
> port 0 initializes, media_initialized becomes true, allowing port 1 to
> skip alauda_init_media() when its media-change bit is clear and divide by
> port[1].uzonesize == 0 in alauda_read_data() or alauda_write_lba():
> 
>   Oops: divide error: 0000 [#1] SMP KASAN NOPTI
>   RIP: 0010:alauda_read_data drivers/usb/storage/alauda.c:953 [inline]
>   RIP: 0010:alauda_transport+0xe5a/0x35c0 drivers/usb/storage/alauda.c:1187
> 
> Additionally, alauda_check_media() never cleared media_initialized when
> media was removed or before re-initializing on media change, leaving it
> true if a subsequent re-initialization failed.
> 
> Move media_initialized into struct alauda_media_info so each port tracks
> its own initialization state, and clear it when media is absent or before
> re-initializing on media change.
> 
> Reported-by: syzbot+dc208a8cf8d37cf3e5ac@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=dc208a8cf8d37cf3e5ac
> Fixes: 16637fea001a ("usb-storage: alauda: Check whether the media is initialized")
> Cc: stable@vger.kernel.org
> Signed-off-by: Arbab Haider <arbabhaider649@gmail.com>
> ---

Has this patch been tested?

Alan Stern
