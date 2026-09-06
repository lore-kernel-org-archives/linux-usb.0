Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA725262FC1
	for <linux-usb@vger.kernel.org>; Sun,  6 Sep 2026 10:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788690478; cv=none; b=rut6XRgeJm4B9veHO7fXAvOr9TeRP8ikugN7x8Wp1vaZEZM24ozVczWBYfb2lTHMHqcVLopap9VuCvC2QukpYiKHQsFPGYU12YVGsjUFMpm4YUrtIc50L7suMR0LntIdqnQ48tn4CQ4yjxdRqClZKSAGzOEEiJGiR/4CVyV18lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788690478; c=relaxed/simple;
	bh=UCHO0H7rTTCwRQcolz6xVcpIfDIxE83aFzIdSYE1QZg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l9W7W+VlsdD6YQMzQmN3FBY+zCcAarbdWSuFOA7O6fVufOkuhKPvdy906RkOz9ag64oL0+akEA5h2yB2ofvVtba5yJlT1mgvg0QJ54f/QX3qu2VIsADKvkHci9PW6jex8ZfuD7BZ6sH+TEd8+mk+cytZaRj5DJniozR3Li68VdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pdko1F/D; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pdko1F/D"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so21635165e9.2
        for <linux-usb@vger.kernel.org>; Sun, 06 Sep 2026 03:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788690475; x=1789295275; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uXSjGNTYq9LVAly//Rv9vgBCfh1ZX5gWNKe2cgVzOHk=;
        b=Pdko1F/DCQTNT7FJIawPOyncai2T3guLKLjSd4unFwptBK0IAUvVIijAqDcecojlwo
         BADfnoqZ1kv2KJIta84MHDZz8aY3LgIDO1FkCiujE3EsVUxPp2Av3uUZvbpaK+1jBRKs
         PhlOidI1I+DAao7mr/vUQwZAZ8N1RXY//nF3BNaVorVktS3W7upcwL+EyqYBn1yI4HvQ
         Pw+iPirGZNJ12VndFV0yzPaz8Gle3CxOVGM54dDu+oA5e0GZ5h9gAfUW069R5s6vb7r6
         rXBXdEh/epTcORGulkby9XTJvWumfplTMAOWavV3uxd5M46nG712M2kfBx8pUBWu5uq1
         4ilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788690475; x=1789295275;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uXSjGNTYq9LVAly//Rv9vgBCfh1ZX5gWNKe2cgVzOHk=;
        b=BduF6vovzw8QUUzGdmv8FMijDJHM+K3x9zKcdUCGC84aszHhtUmW6qvv3xlSil/jsc
         /ZwRv0rtltITxbw9q940ZwwOcnw9cwLb+XRI4UtYD4VvByDjdKaO1BjM5l8ThEGSoKU4
         JDu7AjJHDTNpEpgOOwczpijOCSAoxah+FAN+a4FONpn9yDyx/zmZYrnk8ezNw34bvrT7
         NwZ2+soWmUneE7TTACV/NLfjo+LeKDdmqRRRZ8UXioxxKnYuxtMekv2LIFQEnmmjhYgU
         ZbflimPVd7QdoLvgpxg3VvVxaDxbIpa/UO2Fo67Wir4BLscuQPQZntLMfHZ0mhfDWKif
         ulYg==
X-Forwarded-Encrypted: i=1; AKwUvBzLzglolpbfpM+2xiJXPCvpkBzBf5AsWvSPGMzXvPR+k1Sjn7uy3ww6E1MmN9AZJmvSIchTt5E8AB4=@vger.kernel.org
X-Gm-Message-State: AFuF++lVmoQmQ+pFxokLt7/oj1YsZ3TozrQj/JTZmRjCav4T+l15+F/Y
	33e3b/kfIMIt7rnteZqosJdkoySjGqGGOeIkU3dpYzaT4vDbYs7AKvlw
X-Gm-Gg: AYBFou0gURDSeBimcf+BfND7e0HGjT7XQY35a75nN+TskTmFO0f6iSDhhKo4tSIVraV
	HRvkBlSQVxQOVFUnRdqACKS+qMkcyYA3iefz5ejZ328dTW6nM6x2Q9IpQxfOdTN+O7YEYXLj/6E
	SW4F1rCoWYfKyZR4J7GU81vYGB+/sdRwREFaTV8/vxQCoYT/ZPufmX4A4LWPPXn8JuVRO19S//d
	XXkJlYwzIWEI5W/f/NafymmniUKRu6escDXrmNoMG1XI6SEWYs22ZXF9U/wkrZrgVTgXqWkhvD6
	Tax014zA390VcAsE0QvAEwQhUgAYCGhXmYE08PnBmXt/eJpZKicjYwiEMQiZJj2S3MiKUyr+k3h
	0I3dofariCQrZkjnEqk9dlEyLOEgg4ZTH1FtVD6cJqecqEKvCPd2T4tanWSueQGtXYTz7DIkFhF
	KmwHAq1CV3qCtHxz9JnB5+K/O8lQK4M++mmLOA8EgSlPrzj7XoodCz8/rnyC4jLgTYuCAutg==
X-Received: by 2002:a05:600c:1986:b0:49c:fa21:e744 with SMTP id 5b1f17b1804b1-49cfa21e906mr133178685e9.26.1788690474695;
        Sun, 06 Sep 2026 03:27:54 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7740d44sm500305275e9.15.2026.09.06.03.27.53
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 06 Sep 2026 03:27:54 -0700 (PDT)
Date: Sun, 6 Sep 2026 12:27:50 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: wakasio <scarabeeta@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: xhci_hcd / ASMedia ASM4242: Bulk-OUT -EPROTO with Logitec
 0789:0308 during DVD+RW recording
Message-ID: <20260906122750.1c71f176.michal.pecio@gmail.com>
In-Reply-To: <20260906021345.10436-1-scarabeeta@gmail.com>
References: <20260905234752.1f0c9c83.michal.pecio@gmail.com>
	<20260906021345.10436-1-scarabeeta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  6 Sep 2026 11:13:45 +0900, wakasio wrote:
> One more thing, separate from this test. On this kernel, about a
> minute after boot, the ASM4242 controller itself hit this:
> 
>   xhci_hcd 0000:77:00.0: Clearing Run/Stop bit failed -110
>   xhci_hcd 0000:77:00.0: PM: suspend_common(): xhci_pci_suspend returns -110
>   xhci_hcd 0000:77:00.0: can't suspend (hcd_pci_runtime_suspend returned -110)
> 
> This happened once, during runtime PM autosuspend, before I started
> the burn test. After that the whole controller stopped responding
> until I rebooted. I do not know if it is related to the DVD+RW issue
> or a separate ASM4242 problem. I am mentioning it in case it is
> useful. I have not tried to reproduce it on purpose yet.

That seems to be a thing with those chips.
https://bugzilla.kernel.org/show_bug.cgi?id=220936

Do you remember (or can look up in logs) if any devices were connected
when it happened and what they were?

Regard,
Michal
