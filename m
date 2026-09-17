Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315554E80DE
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 16:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664219; cv=none; b=NjbAAcT8JGXZ6VTEShAgjli4+/XRLoFwZmpe4PLKa4JQN3xfy+P/Mp65gfv94ymSUSAeqZ+TRMO/3w4rP9sQ3XPPvPYRY+PV25PqgOdaT+RyVxfleob+oEIYazflbfdiia9MSGDy//wdy/9KFr+Db4c6KMm2jwny1NlKhcdQf3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664219; c=relaxed/simple;
	bh=dn6zdp2y2bOJRaaaQLDIzFmFi1gvO691DvcSbAUCigE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ylg5A+PmXGvxTdqxnxI/u7Gq8+oPGexK9qLKaDhiQmQDRAc4jybkMEsBtO+F6MpCtmazclLEHzZq+an+htDY8q45o+GplzavmAhQdKyQJMPkgKfO7CvZtxPo08dGCNrYG/+942yZX9KaGcHV9aVZ0Iq5eZiUfTX8qWAFjgLbWg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dl7oiocz; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dl7oiocz"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so6695495e9.2
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 09:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789664215; x=1790269015; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QNumNnYoURFzMwz5gShxa1JkMSD2gx61i8FWqYuf9ws=;
        b=Dl7oioczVUdXEXtspFX2+mOxyKTgtK7CijzIrDpETJMXfCsvKeEwdTQqdKEWbTBWRS
         g0Cma75FJqSZHCBIED+LGvJF2805FxD8fJmljj6KU6HGHzOBxNm21ZbleanAJjvXoZ5E
         AXWerMvg8PvsxH5KKEDRB3atyr7C1KcgqdGgsHcLp+9LxStr0YcywWbVfjIvMAwdnPgl
         8XZNYVkJnTCKaI6L3SGyV7KSnEh1lYay1KhPtwu10lJgKz9CsamytYnssW/ta5o7HtyR
         3j6SNkIEgLqlQICFNA1Yns+qW66481vHOwGwNuUlToLQcTUqoypTupxEMvBS61YbGf1s
         OpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664215; x=1790269015;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QNumNnYoURFzMwz5gShxa1JkMSD2gx61i8FWqYuf9ws=;
        b=FQJtWPihzaQI5c8UbUsFR2SPVkIXSoV8UEBW5gWu6fYfBsGfzFprCUHgITDLWBC0Ae
         ktjVwiWMN1W2r3lwHIrPmbq1FYzckeEAcGYiMdodY/unOir9RM0M/1rSlCRUFaiGWyXT
         wHFNP1JchWyX3JoUZLpSmLN3e23Qe1p8X+UsZzqH50I8WjOdRpMZyHfl5U2Ltw8jU/SP
         NaUSD8pnP+5498hTok8o9YAy37EkqmN2dtMclksnarW5fU7RvdPK0pkOlxeuKgAl4XC8
         5/P4WCwrIn606kfWt8mj95xSxfvrWn67C6RRa7Wqqi2GThd9gCqYgc84nf88BZfAdfRb
         7SdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhYT/svbNo8UPyGTmOoS/3PhCEVNIKex2ViBbqVFxZPOpn72iakoJcXvCawxLNb3jbx+r8pK3RDv4=@vger.kernel.org
X-Gm-Message-State: AFuF++nX4wk72QYJRNB5RcIpy2Xel+3SD45NcdDloR1XJCCzNxLdGkyc
	aSYJOPq0RDN/czAjBA/A25HKlTVjENrzOZuc78kclsTh6kzQW5XfhSqB
X-Gm-Gg: AYBFou16jaItPeMAIBZebTTjYA425fWxYLPlr8J8rkwnuOeSA9j5hDtOx7p8lX74452
	Q8HTw4uIL+sgouoA3Upv/3wQCFPG6d8WdXNZJnxVYwj13nc8PYtE/YcA4PtqgeYSRpEMeLFdADQ
	W6B5xuwqGqRaGxlo6vGoqHOiuxwaRXzu+F2tLuxnLJ/EDAEFxMYtUqlpo+YashIwmNzg7XEGJso
	qGzAAmseXkkNTHNx8Z6KlpzGYTz+85yN3hwM8sdrx2OkhoLuCPP/wWmvQjCbe1ULqYk0jxrEL2w
	zJkHnIhnQUaLuTypE6H2dov49DEqKDCZKbT3G3jwtj6aTML94i2Dc25BIHbezmHt2ZpOngJSX2V
	AWQzxfSyhczD1Td24E17kBy51JCEMjeYkQzY1VSjccrHLYtGXMN8keBCubGyL7VgclnjqceRobS
	v9Co8uJHfyMEDKEf9BDoOguovinZeE4TJV1d8cjSEmdWb/LkEkcsB62uypsbGpRzMdrVs5a7dJI
	1urDCo+DEs=
X-Received: by 2002:a05:600c:358a:b0:49c:fc6e:a3dc with SMTP id 5b1f17b1804b1-49eb733cea8mr116064525e9.27.1789664215299;
        Thu, 17 Sep 2026 09:56:55 -0700 (PDT)
Received: from foxbook (bez152.neoplus.adsl.tpnet.pl. [83.28.37.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd225898sm95977295e9.9.2026.09.17.09.56.54
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 17 Sep 2026 09:56:55 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:56:50 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: djraszit <djraszit@gmail.com>
Cc: Oliver Neukum <oneukum@suse.com>, Oliver Neukum <oliver@neukum.org>,
 Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] uas: JMS578 returns reproducibly incorrect data after
 host reboot
Message-ID: <20260917185650.7fdea3cb.michal.pecio@gmail.com>
In-Reply-To: <CAFKhL9dmR1KDaBQGta=X5xDCGirzJ8t7u0rH4HUgBoFqN152DA@mail.gmail.com>
References: <CAFKhL9eUM91rtywaz_7Mz+4mJH2b2csmOmc3+86ii3a0Ka3Q6g@mail.gmail.com>
	<c335085d-a824-4632-ad3a-c06715258c81@suse.com>
	<CAFKhL9f6aLZgerw_7bohbQWvzMxSfd-m-LFcuNP1_p1vWkN4=Q@mail.gmail.com>
	<1320caa3-85b5-47dc-aa2d-56d3b003c6ef@neukum.org>
	<CAFKhL9eTD7DxtxMSMuUVP9cDG7Nq4jvrkTCjYfwr9puZfuC4Gg@mail.gmail.com>
	<20260915233818.5881ad97.michal.pecio@gmail.com>
	<CAFKhL9fL++S1xh+aUCuYbk6EkLQnfUn95y7TBoWaGnPAVP1gYA@mail.gmail.com>
	<20260916204713.22c4f575.michal.pecio@gmail.com>
	<6041fdad-78b9-4310-a86b-f9931563de19@suse.com>
	<CAFKhL9dmR1KDaBQGta=X5xDCGirzJ8t7u0rH4HUgBoFqN152DA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Sep 2026 18:02:02 +0200, djraszit wrote:
> shutdown Pi with the enclosure connected
> -> disconnect USB after shutdown
> -> boot the Pi without the enclosure
> -> wait for Linux to boot completely
> -> reconnect USB  
> 
> I repeated this three times. All three tests were GOOD

> USB_MSD_PWR_OFF_TIME=0
> 
> I do not currently reproduce the state where the enclosure enumerates
> successfully but returns incorrect data. Instead, after consecutive
> reboots I reproducibly get the "Cannot enable" failure described
> above.
> 
> After changing it back to:
> 
> USB_MSD_PWR_OFF_TIME=1000
> 
> I repeated the test twice, starting from a known GOOD state each time.
> A reboot reproducibly resulted in the enclosure enumerating normally,
> but:
> 
> Alternate GPT is invalid, using primary GPT.
> 
> and the previously tested block returned the BAD hash.

So it's a boot issue. I think it would make sense to determine whether
the problem is caused by bootloader actions or the kernel.

Is it possible to configure the bootloader to wait a few seconds before
booting the kernel and connect or disconnect the device during this
time, or to never boot the kernel at all so that the device can be
disconnected and tested on another machine?

If it's the bootloader, and things seem to be going in this direction,
then you will need to sort this out with the vendor, obviously.

> Regarding the Raspberry Pi 5 test: yes, the enclosure was connected to
> USB 3.0/SuperSpeed. The Pi 5 uses the RP1 southbridge rather than the
> VL805 used by the Pi 4. On my Pi 5 Linux exposes two xHCI controllers,
> xhci-hcd.0 and xhci-hcd.1, each with a SuperSpeed bus at 5000M.

Thanks, that's all I wanted to know. It's some other xHCI controller.

(I looked it up, it seems RP1 uses Synopsys IP).

Regards,
Michal
