Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.210.214.84
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793241980;
	b=QhV3moKckARjGIsetGoX4dXtOSb3nm+iNOoIapEln9bMUFVlSXCyFgQ07hvyGpjAZlZk
	 x+CfppNlCsZQ+z5EUEuk88VVnM5P54OESQJ26MmVwcIdLuxPY3njv/EnpGqNM0Uyv/I/r
	 aFNTGiEYqJQI39FXq7SriVNsNVexD0yiTPkpHd5tSLzcGjeVAoYyGwYWFZin//Jcyhb2E
	 koS9jZFKq9Rh26O6UrElv4zSEdB4k55U/ar6MkKmw6IHX8f5HOQrCV+d/iaJyvChj9ZmZ
	 sdKF9bik/0ktmVR+g9JasFocpgDqeMULfdAabTltIOmpgu7QZ6afMVOU0WSLYtsVE8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793241980;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=PABQUNtwzA7tp2WIdIkVm8tzuMcr4y+wWPxd8RLkMGk=;
	b=Qszo8bulfvZ/8epRGKfYQM98Y2bNn98n+9I01pjvzdsZlg2HS9mosqTlM/eEdwNZ+kfB
	 ouUiZnoGYQ3QYEAzWT+pwEaZAymOIFibeBj+evnXa3DVx1rql91qmQq8mQKKg+rafhqk5
	 uG/U64D2LAcFNXs+Gwp+59HRMnnQi9hcNFOu01EkgnTTK1yhnZnXSYHe8UhI+VEJL3oUO
	 6WmwhbHj87yaR/OHCf60pOOu7ngb9ulgbZnrF7Vpj7OCJ8i1bd+tnsuSNIQH0/rhOeTYk
	 p0dFf8FOOumLDTqmQLNVKvnq0vdIzTKfyGsIcOGV8+q9Z/i4Uc0nXMrnJ1hp8ysCdBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codewreck.org;
	spf=pass smtp.mailfrom=codewreck.org;
	dkim=pass header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=SayRpoU0;
	arc=none smtp.remote-ip=62.210.214.84
Received: from submarine.notk.org (submarine.notk.org [62.210.214.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC05B606A31F;
	Thu, 29 Oct 2026 02:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC05B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codewreck.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=SayRpoU0
Received: from gaia.codewreck.org (localhost [127.0.0.1])
	by submarine.notk.org (Postfix) with ESMTPS id 99A0B14C2D6;
	Thu, 29 Oct 2026 03:46:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1793241976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PABQUNtwzA7tp2WIdIkVm8tzuMcr4y+wWPxd8RLkMGk=;
	b=SayRpoU0s+/TQ1WuZe4o/5liJzEtyY0Ch/PDlpO9NxyVwx7wBoIwb6jSmg1hmjWXSkV4hJ
	4JzHeZSHMtuRZqHGVoRJgpaOCo1K3WAM0AmqQUK5SJD0dreuMVeEV1EcMg28060HokvO0l
	luhnibaYFzKSkxsF/AzWQUu0ZZWpKg9nZUKjRI3xLgdA9D8jdi8mogTt4H8mkQvntdY1Kh
	aUE8rRpDDwCdwQ2Qo1PSqUY02t9w5+uvBQ7ESivCc/jxPpMnwGZGU1eBL7n15UNt4oLFXd
	n0hkQJl8mCxEVLo1nZ9UCziAU7jpmF3pXWy0cSg/jdZCHpkulq9Vqj0CX+dGzw==
Received: from localhost (gaia.codewreck.org [local])
	by gaia.codewreck.org (OpenSMTPD) with ESMTPA id 438811e2;
	Thu, 29 Oct 2026 02:46:11 +0000 (UTC)
Date: Thu, 29 Oct 2026 11:45:56 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Cc: ericvh@kernel.org, lucho@ionkov.net, mika.westerberg@linux.intel.com,
	andreas.noever@gmail.com, YehezkelShB@gmail.com, corbet@lwn.net,
	linux-usb@vger.kernel.org, v9fs@lists.linux.dev,
	linux-doc@vger.kernel.org, linux_oss@crudebyte.com
Subject: Re: [PATCH 0/3] net/9p: Add 9P transport over USB4STREAM
Message-ID: <auKzZIyFW2CTci1b@codewreck.org>
References: <20260924162333.147033-1-alan.borzeszkowski@linux.intel.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260924162333.147033-1-alan.borzeszkowski@linux.intel.com>

Alan Borzeszkowski wrote on Thu, Sep 24, 2026 at 06:23:30PM +0200:
> This series adds trans=thunderbolt, a 9P transport over the
> Thunderbolt/USB4 DMA tunnels exposed by the tbstream character devices
> (USB4STREAM). It's designed for simple host-to-host file sharing over
> single Thunderbolt/USB4 cable.
> 
> Today the only practical way to use 9P over a USB4 link is trans=fd
> which, due to its design, cannot fully utilize USB4STREAM capabilities.
> Thunderbolt transport offers a simpler mount (no fd redirection required),
> busy-poll support and substantial throughput increase compared to FD
> transport.
> 
> User may mount 9P export with following command:
> 
> mount -t 9p -o trans=thunderbolt,aname=<exported_remote> /dev/tbstreamX /mnt
> 
> Thunderbolt transport achieves a median 1.21x more throughput compared
> to FD transport under same conditions, and the advantage grows with
> concurrency: 1.03-1.09x at 1-2 threads, 1.14-1.27x at 4, and 1.34-2.28x
> at 8-16.
> 
> As an example, 4K random reads, 4 worker threads. FD transport achieves
> ~53k IOPS, Thunderbolt transport ~66k (+24.7%). 4K random writes follow:
> FD ~28k IOPS, Thunderbolt ~33k (+19.4%).

Thanks for the patches

We've kept adding new transports for 9p lately but maintenance is
becoming a burden so let me push back a bit: is the increased
performance really worth it over trans=fd ?

If this could be used to bringup a system with a root filesystem like it
was done for trans=usbg I'd see the point, but otherwise the simpler
usage could be addressed with a simple mount.9p helper, and at this
point I'd consider usb4stream to be used for perhaps one-shot copy and
not care too much about 4k random IOs (so less affected by latency
if msize is large enough, and for a one-shot backup it doesn't matter
too much if it takes 6 instead of 5 minutes)

If you can convince me this is worth it and can take care of the
transport for the forseable future I'm not dead set to refuse this, but
I can't say I'm convinced right now, especially as I can't even test
this (I don't own two computers with working usb-c...)

Thanks,
-- 
Dominique Martinet | Asmadeus
