Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795249127;
	b=fgBftO0pagLV8Q2bIRdpuHduwbydbK16cMh1TMixq8vD4TusN+vAKSyg1AGOQ5qrRXdg
	 bzSAb/oQXTpph4/Boikk/yvnAszYC4Dp5CgqTYDD7AM3u4mwDw2rh8/TMFfDLLwXzSFiI
	 dk0FcZ8k/ZKX8LlNXnTG3wc9rQoc0sCfmkG1Qj4x1X0MtXYz5YlLfBjZuP7i02zVeOZr6
	 oSZvKcB23LzX1ZI5WglazMzryTQXtxiYUReOZtJzZXmYa2L7xJOLc7nkpvfcW1q+blBNl
	 yMyYKe+jLMRYeer9jk88R4jS9LuufWhhq8+MIlSW6WDdyrO/kCqh5C+aRaltuAGTIYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795249127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l/s2mh+0qArJcTg26JMF7Y1HXG8MTRz+pIaOko7+DPQ=;
	b=UaH9aAEcO3vuuMjLcOwqV9+llQlGzfKZ1qR97WEZPQFYkaUGVts6b3F54k1v9WHZp4yj
	 kQSph5sfhPSUlNZ89Y8sBN0GdIPlWm+i5lKjlL1V1y+/bOAzIe2yF+h5H1Dq9M7827nF3
	 HBg9v+I4+wE0L411Utl7y/ikEaq6hdhwBrmpjKEw3en5VMiotYPJk7DRdVaofwS2Uwqb1
	 Lig+TU1NfxaCNqb0Q2DMvgNf2vJDhTSZAEqcgq9Q0zQNKJ6O+1BksrHPcqTUuinHTdnrP
	 y3Ip7uUeiw5UMSSEp0q6gBYKF19xcBbCdq/Ip8wSpATI8NmeGVNjqDk7gNB50w6sdIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wkennington.com;
	spf=none smtp.mailfrom=wkennington.com;
	dkim=pass header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FqcKrp2o;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C830606A320
	for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 08:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C830606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FqcKrp2o
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2eff92780daso12865125ad.1
        for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 00:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1795249125; x=1795853925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l/s2mh+0qArJcTg26JMF7Y1HXG8MTRz+pIaOko7+DPQ=;
        b=FqcKrp2oXPr4tOHL61pgnws0WILpsCSBx4JVfp1wB3NZZJoM9TtnCcObKsT4TvcGBr
         6HGYHqn0K0uu/fb/VlUOPIaD/zN4pNzNcUn2+LFtR5bMWk3zFRY5eJdtrfB/8qeVJ5us
         JN3XtGmfE0tydPRRPPQZsbWW6bel+wI33fVd3HkO0LVfrs+PfJc4qqSQwIqG+lXm8Iby
         JfRu8/ksXhVQvYQMf2FmvSCTljLrzvA7+Y6onYC+l1Nd7CIIx1TeKY26nVq24OomxbH6
         IQEYOtI/taJFk27eGrNdkOvoOkj6rswQX5EtgP94IN7g7vnKq+EuR2Z2WHM/OeuzqPpv
         w4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795249125; x=1795853925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l/s2mh+0qArJcTg26JMF7Y1HXG8MTRz+pIaOko7+DPQ=;
        b=DNwkytBL7BAs3jWArOrGFKGeGybGYQ/Q65c7gCgpEXq83Bik6atUIulJe96lrreG/l
         JW1eRmepxeN6l0OdguqLPbGnsVH+9yhzAp+t46tW2Ey705vy5o6k7MfBHuD1XCxfmqJd
         8O144tjd8pxzg7+vDzsrFTgJFquzT6Ml4d/rwkDLXT/HojlJaBQB3sJ3TrmgBX0pCYG9
         HcQkkiFvNatIq/R9UsdzBdHQ1eFYKfEv+KMoyBt0i+xTN8emw133FmdmWi9qJ4gWcIHE
         G0uzol05x6xDnk12BqhGg/aXTn4gCMYQJorVztN17AUguf1WQzFWpKNmN2PeZoZsWoRO
         kGiQ==
X-Forwarded-Encrypted: i=1; AL+hErEM5x2lFw+X1n4i4fVSo1FRbbwarripnSQyUhA77RjqcW2jpdNxO+Ztxrb8+BjcFs6jlyochyGx9HU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8n9XVaD8mpSgpP8GkXcCzuEkCGDYChH4IA69JfCbGwHEirvstD
	uqsuZSGeB9PO8MvgCyQDuy77JWaDKiTDZbNehrV3bbIlv7E3RshQimX71qZMuN4G6L1dbVQPHWP
	q2//t7AM=
X-Gm-Gg: AZFdTZcNPZ+jYAqQz8IKrqKZzj9chqC0nSdWgnk/zD2ItBbCANOV9p+KJnw5zpbFFvt
	zGuEGTMQFjyGIhTU6VvYoRUmi7XIxp1bKNN9aSD8RbDhkFbz2EB5no0X6V8hGHHS6jzwi1CRDn1
	fKibTxxBugjPok2yJXLcr6bXG6bohQCHD+EiyC+FJw92C+4YOrk+2WQlQyhlNdOr+3hVTAeu/4o
	ytzxEgVTlG5UDg60ix8dQET0ofxx2c2tL2QRJ+uND+6yPW0206eR00aQTDBNugN7lRjU7UCtVNQ
	spbq7pKrgJzHCg2zgK9VbQKjDve4R2h+3Ufelf1rfZAyqLakEs0o3xBHt5RlAJwdcQOkx3Q05Wz
	IlY6fpEMG7LaJ23BJ/iSn/0qjM7XUOtjKB/3SgW+EKNUy4nJCpAlbY5juUe/uWpHUKBPcPCk5v7
	FR8OfmiLgYP2dQAE0Kktl0O10WUVibdmYP6RG91RBsCL6Q1sXbz+cnjp4ezj436dN7ZScAfeEgS
	7UiCzuRvu5aiX7Zf646FgqKItoG5cvUpK8+CvBNXqHh7h45VNwNLHMsxrtGr6Io3+XRlDpzpHl4
	H9XxWaAZpkyzxB2GsM8mq6L5rNkeSt9epD6SII8WaXO4kbWpiy1e91r6tZcVHLvoukx9Ji2iain
	66xBXhgkLkRQ2ig==
X-Received: by 2002:a17:90b:17cd:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3b41c9d3111mr4310485a91.34.1795249125252;
        Sat, 21 Nov 2026 00:18:45 -0800 (PST)
Received: from wak.c.googlers.com.com (246.21.127.34.bc.googleusercontent.com. [34.127.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41aab4729sm7548983a91.0.2026.11.21.00.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 00:18:44 -0800 (PST)
From: "William A. Kennington III" <william@wkennington.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Oliver Neukum <oneukum@suse.com>,
	Havard Skinnemoen <hskinnemoen@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: Re: [PATCH] USB: cdc-acm: refuse writes after disconnect
Date: Sat, 21 Nov 2026 08:18:43 +0000
Message-ID: <20261121081843.4065887-1-william@wkennington.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <awAtdlEpSLc1ges1@hovoldconsulting.com>
References: <20261118145636.3534234-1-william@wkennington.com> <awAtdlEpSLc1ges1@hovoldconsulting.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Nov 20, 2026 at 12:22:30PM +0100, Johan Hovold wrote:
> Thanks for reporting this. I assume this is not something you actually
> hit yourself but rather something flagged by an LLM?

We actually hit this twice in a kdump I got from a machine doing some
usb reset testing. An LLM was used to squash the bug.

Trimmed dmesg and backtrace from the first vmcore (the
second crash three days later hit the same PC/LR at 51s uptime):

  [   57.197371] usb 1-1.4.1: USB disconnect, device number 9
  [   58.287013] usb 1-1.1.1: new high-speed USB device number 15 using npcm7xx-ehci
  [   58.599405] usb 1-1.1.1: Product: Zephyr CDC ACM sample
  [   58.676523] cdc_acm 1-1.1.1:1.0: ttyACM1: USB ACM device
  [   58.797838] cdc_acm 1-1.2.1:1.0: ttyACM2: USB ACM device
  [   59.026611] cdc_acm 1-1.4.1:1.0: ttyACM3: USB ACM device
  [   59.324421] IPv6: ADDRCONF(NETDEV_CHANGE): mctpserial0: link becomes ready
  [   59.378147] Unable to handle kernel paging request at virtual address ffffffc009fd5000
  ...
  [   59.437892] Internal error: Oops: 0000000096000047 [#1] SMP
  [   59.446523] CPU: 1 PID: 217 Comm: kworker/1:2 Kdump: loaded Not tainted 5.15.167-yocto-s-dirty-4ae9335 #1
  [   59.456085] Hardware name: XXX
  [   59.462436] Workqueue: events mctp_serial_tx_work
  [   59.474127] pc : __memcpy+0x7c/0x240
  [   59.477711] lr : acm_tty_write+0xec/0x1fc

   #10 [ffffff8001f03cd0] el1h_64_sync at ffffffc008011250
        PC: ffffffc0083e94bc  [memmove+124]
        LR: ffffffc00859ed50  [acm_tty_write+236]
   #11 [ffffff8001f03cf0] memmove at ffffffc0083e94b8
   #12 [ffffff8001f03d60] mctp_serial_tx_work at ffffffc008559924
   #13 [ffffff8001f03d90] process_one_work at ffffffc008059118

In both vmcores, tty ("ttyACM0") had count == 1, ldisc "mctp" attached,
acm->disconnected == true, and acm->wb[0].buf == 0xffffffc009fd5000
already unmapped by usb_free_coherent() in acm_disconnect().

> This isn't the right fix though as the line disciplines should not be
> calling back into the driver after a hangup (and this isn't cdc-acm
> specific).
>
> I've prepared a fix that restores the ldisc to N_TTY when a tty is
> reopened after a hangup instead.

Clearly your patch does it more cleanly :). Thanks for providing a clean
patch that looks like it does solve this issue

Thanks,
William
