Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794087998;
	b=VwflvrFXtE3ERpjO1+eaJyg+b6L8BEdQM2uOHQKmGHrBXAIBs9KtV4OXYRBjO/kgG/OU
	 sSxAiNqCzSuLrNaUjlmA6Vk7BcfEmIWtrjvne/NWjYFLAyxZ2Zh2ZZj6eR0ygISrQU6F5
	 lx2QPfFzHHxyimc89hEyRyEtyv5WfGWcJ1W23a+TmrtYA2PIIoSURVH4S7Hde59fx+gsY
	 doNBc5qWCDYm3wJwlp7Wytke6ewbtAN3BTWlKWinxcqY/L6pFpj8lAjIjzn/sUTitR6JJ
	 U4K6ixP21IERtW/eNKlBJIop+1jZA+O4dKRffNYfGnN6N/NuczJk8yEFuAQRnv5m/CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794087998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=hJWMmVoAYE5tk8S2DiVG1dUATzph88inKANuObkMxLw=;
	b=H8slm9+HuPyrPVF2ovDtkiz7/Kg5U8hWAGM6fEorQoUAz2e88QWMBfW/jHS/z7zeSwp1
	 emHMmQzNm9uEGp49OnpiA6gl55rPfd3X+8+ZX0zu6qgL3sDPViVEcVy21DrbJ6nNYa/Cx
	 lKMsdZok9sJT7zU+SL/xnhBLqddjRMslO922d+Rksf6mdg003gHI4w28lDepD6upYHvU8
	 3lK1qNBWiqoXLuBKDvPCDp6tQ0HCows4XokAvmSOO047/YNpeEln6rGpIyBvv6jfh4CUV
	 rnd3DTiNIVfzeC/p8OcYoIW1e2Gbo+j59b9fS3fhdBGsF5ScvAmuxYV3m0v8YxJ7GGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=VoDvNh9F;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC952606A326
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 21:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC952606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=VoDvNh9F
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-943e8d35f74so1988785a.0
        for <linux-usb@vger.kernel.org>; Sat, 07 Nov 2026 13:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794087997; x=1794692797; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hJWMmVoAYE5tk8S2DiVG1dUATzph88inKANuObkMxLw=;
        b=VoDvNh9FFlmkgYwrW0NOpb4kx/LRohKUAeh2qA1sh5n1nrKbomzrEju3T9O9y8AzCn
         kWxGHrZCUqOvrvoPQ4pb1rTFb2eZ5yaTTvkKafvVWglajUUgnL1KUw7Bym3LN6o9m+jI
         lIj12lkghwlgSjzy/uL6q8B1z0a+SWvw2YUkbOspd98o4CAp69lvn5LQe48Og6PlCAHr
         sLFAm7CAisxthzpPwpFwJGKK8XjM8iCVP3ijB7PophBBO5PppfK89yEOTUoth6smUc+B
         eR6ueBAqvXAe4Rp+FuWQd6ESrPfQzAV6c6mRWAMqG9BK42Q9wWfemJlTQptqsJOcM2CQ
         CVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794087997; x=1794692797;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hJWMmVoAYE5tk8S2DiVG1dUATzph88inKANuObkMxLw=;
        b=ajLZ41H4EvRcL/Z70CemJZ/UNLTcq8xOKi4tTY0MbWOmoPaquNyax6rVrywP6VhPhE
         RZmQmJRGosbzmalaFQGIKZTishXok3XosQXmNrB4Wd+PgMXtWttbzox8v2flnWXj6//o
         IIx6BO1ZCRoUJeycNzqkp7gz26PuR6MpLdY5hb5VJhBm1hhohfL3S6FP2/h3RK9D5HqI
         5RPpGiLS5R/eyViiUjxHhL2BAPaEgH9uX7Z/cB9PS2QuECczqBIGxtpjDFML7tbgmtTP
         UtS+Vd0pkUwDw/3BoLjA+xtplqCdH5yDmcRHHmNnqDaEN++zapB0WxGzvPoKBp4R3bBX
         CDZw==
X-Gm-Message-State: APuU4Z80iWseeycpvnWBYwGxGxCnNNBSXQLh2TUqlxcGFAbVcj2+fe1a
	ftrGjBdWK5d/pIaAlLYl+Mh5OneK5fAmGKAPxuc0S3vFsERMu5EQghD9m9IGmo6wNA==
X-Gm-Gg: AYBFou0UHFiBcW7eKddt+qbjHRWGYPZyAI9S6T4tB1YlHa7/iRI1lkTz0r+LsnKVKut
	jFItPaQ2d5dneUQtvFWiWTU4H29+IayoOGVQ1dCJcVNhuLpcGMYQJfS+/5Cwz5NsrdeCL05RRG1
	Wo8w+tbziyPHe/SC2XMIFcYgvGbIr4PUP6BL/IZeFEfHoAikauYGDV7DPBkX17XdMe03o+aA20T
	hzvnSxDtHpPz4UwBpA9fq3wV9V+87lQ/Na1G1SKTLTep8i4cUwKdD9y3MtbBqcbZe3jvdTFcIeY
	gCSU4pLK8Acf3xGf8eYtQ9xQi1vcxSUjCThqeV4DT4BsQ4mExlq1jRwTS6uUSwT/WmZN2BlYTVy
	FiLf+HO1CY0FzBFYdLgAu5rOB0oadN+CbPIswo0D1PnpTMq97ZEQnX6U1mw5WKiSKWfk36aAStw
	FsbUTHyIFM62CWXlHZHo202kDtrquPh7Bn37SOFTCiHlq+M+v4LvfEFqLUzYW87GCWECK4/wo90
	NTitl+sW80dmcCjHgjsQTnImA/76tUi0CxMHl0Ofe/EaaHUtVzQu0Vkc7MP4VnT8jtG1VMgO+nE
	rwzwGl+KL7LqtcuPz42OvTWkPwoZRaBoJm+RTsg65PwNkyHLPns=
X-Received: by 2002:a05:620a:8395:b0:93e:fb96:68f5 with SMTP id af79cd13be357-945f350a415mr980706285a.32.1794087996501;
        Sat, 07 Nov 2026 13:46:36 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94782d84076sm29268585a.17.2026.11.07.13.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 13:46:35 -0800 (PST)
Date: Sat, 7 Nov 2026 16:46:31 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Oleksandr Holetsek <lv200583goo@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: USB EHCI: microphone capture fails with ENOSPC depending on
 device activation order
Message-ID: <02bb0b2f-748e-4350-90f0-ff18e1891971@rowland.harvard.edu>
References: <CALkonqF8G=LsMzvv_uZQbo4oKRutdqUGFL=7k3St0xFJFJcW5A@mail.gmail.com>
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
In-Reply-To: <CALkonqF8G=LsMzvv_uZQbo4oKRutdqUGFL=7k3St0xFJFJcW5A@mail.gmail.com>

On Sat, Nov 07, 2026 at 01:28:44AM +0100, Oleksandr Holetsek wrote:
> Resending in plain text because the mailing list rejected the HTML
> version. Apologies for the duplicate.
> 
> Dear Alan and USB maintainers,
> 
> An AI assistant helped collect diagnostics and draft this email. The physical
> tests and observed mouse/microphone behavior above were verified by me.
> No proposed fix has been developed or tested.
> 
> My FIFINE K669 USB microphone fails to start capture when my wireless mouse
> receiver is already connected. Starting microphone capture first, then
> connecting the receiver to the same port, allows both devices to work.
> 
> System: Arch Linux, 7.2.14-arch1-1, x86_64
> Motherboard: Gigabyte H61M-S1
> Controller: Intel 6 Series/C200 EHCI [8086:1c26], ehci-pci, 0000:00:1d.0
> Internal hub: 8087:0024, single TT (protocol 01), device 2-1
> Devices on that hub:
>   2-1.1 0bda:8771 Bluetooth
>   2-1.2 1d57:fa60 wireless receiver
>   2-1.5 0c76:161e microphone
>   2-1.6 04b4:6014 HID keyboard device
> No external hub is connected.
> 
> Observed sequence:
> 1. With the receiver connected, request microphone capture in pavucontrol.
>    The input meter does not respond. The kernel repeatedly logs:
>    usb 2-1.5: cannot submit urb 0, error -28: not enough bandwidth
> 2. Disconnect the receiver and start microphone capture. The meter responds.
> 3. Reconnect the receiver to its original port while capture remains active.
>    Both the mouse and microphone work.
> 
> Moving the receiver to the other EHCI controller also avoids the failure.
> The original arrangement works on Windows.
> 
> I captured debugfs bandwidth allocations in the failing and working states.
> In the failing state the FS/LS allocation is 347-362 us/frame; receiver ep84
> starts in microframe 2, and microphone audio ep82 is absent.
> In the working state the allocation is 513-528 us/frame:
>   2-1.5 ep 82: 166 @ 0.2+1 mask f004
>   2-1.2 ep 84:  61 @ 0.3+1 mask e008
> The corresponding allocation excerpts are attached.
> 
> Limitations: I have not tested another kernel, reproduced on an untainted
> boot, or established reproducibility across fresh boots. This boot has taint
> value 12293 (P,S,O,E), including NVIDIA proprietary/out-of-tree modules;
> the reason for S has not been established.
> 
> Is this a known EHCI scheduling limitation?

Yes.  There are various scheduling restrictions on when periodic 
transfers are allowed to occur.  You haven't provided enough details to 
be certain what constraints apply on your system and how they might be 
violated, but it definitely can happen that scheduling transfer A first 
allows a viable solution for transfer B, whereas scheduling transfer B 
first does not leave any opportunities for scheduling transfer A.

In theory the driver could rearrange the scheduling of the first 
transfer when the second is added, but ehci-hcd does not implement such 
rebalancing.  Nor does it implement siTD Back Pointers or Frame Span 
Traversal Nodes, which restricts the possible schedules even more.

xHCI controllers are not subject to these limitations, or at least, not 
to the same extent as EHCI.

Alan Stern
