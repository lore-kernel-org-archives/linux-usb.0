Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.59.206.189
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630476;
	b=lDHwNjG5/Wl1hwYYvygr/h4okGcrUkG/dfltJRP6GLsIbJDFF+6H4f8WDsotRExSqIJo
	 0kP5b2cnwn/ud57UaCfrwuPmrXewxBJ5ZjIoARBMdVS2hGiXCYe88WhFBPZtsNcJCPLBH
	 h7YaPunit1hz99IysZHagN5CbbD0lEVo52cX3zVg4EYnEtv8vPyEU0Ln9dwQS5L0XiWAC
	 Bjkzp9jgYgBM5Jrf1xoZ8YUi7kr9O5Rp1D3hoIJwrumciTMw44x006xB0J1XPADVugSBK
	 Z+BM0qBWQHMP7PhZVXToldR9E5ykKdWQAhu4oM7SfqqY+eDbHgWyEzYRz38JOJfqOtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630476;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=T7Jfy1YX0JM1xaHCJ3ZuUaayOlpEccV6YKpeVDstUOk=;
	b=BoZIcM6XKk/DFHnZhYNddNw48To0l4snkuwLIishQ1I7GRBmf6qQiBER2C+GnrazP1wK
	 VHYPJYcbvjQfFexlWnvJkAXZoO4Ix0pqs6YRyUOG6jAs6W/jBd3kz3xVuWLYfNsgk84zl
	 zKF9z5JcnVaCxTFllFZx8unEUk6Yz+Vrf1WLEIkIfA6wrmY2JzbvAb+hoLIHvUspFuIXQ
	 RK4l3jdOIDgy9x6ZaqAObhRxC1n3sHPN4TBPaiFFlklzIpT76jwKTXz/3CCX+vsVpWwZn
	 HWtccRTLtM6tPgttlKke3Y8fr4EC2l/NbXdhCFkdcGZXD3mdWubxsZ5ttb7R0xrdnZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=SqHy6r9g;
	arc=none smtp.remote-ip=194.59.206.189
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64B7606A695;
	Wed, 25 Nov 2026 18:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C64B7606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=SqHy6r9g
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4jZSW26NGYz4QKd;
	Wed, 25 Nov 2026 19:14:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1795630462;
	bh=my78kg4S54Fk8CVZt5B3siWtk9PWEx8eNQ9n1fmSTOw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SqHy6r9gKfeGooIxTWppV5bROD5x/eJ9tz4t2pjuS/jMsMQ5uL4lW4UArPZKrM4ao
	 SucD9q7TEE9HR7awJehYsgcJ9StNsk8dN1XGLePCgiDdfAECdKrpgPkUTabspbj8eE
	 99uoaLo9QrULihXpwhI0NwZyFvxNpc4KPJ6dQ0W2ay47VAdE0h3ygMN/txsay7spbu
	 uvO5Ptm5J8hWorcxj21/qAP33q1t3+uovzBQp8fSP3piLslSPpSYH5bXrqtILetdkF
	 za3NuMHhknDYs5+CRBnRgsesvksHj6dK0rVKgdIB95Mm/zutH/vA+5ArcDa9Tw0otL
	 CgD3+N0vL099Q==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4jZSW25gPMz7xCG;
	Wed, 25 Nov 2026 19:14:22 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jZSW20fcMz8tH7;
	Wed, 25 Nov 2026 19:14:22 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 855B85F985;
	Wed, 25 Nov 2026 19:14:12 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <2d8bd052-fefa-45be-8712-bb93c73acc07@leemhuis.info>
Date: Wed, 25 Nov 2026 19:14:10 +0100
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Creative Sound Blaster X3 (041e:3264) fails USB
 audio probe on Fedora 7.3.4
To: Flavio Giacchetti <flv.giacchetti@gmail.com>, linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>, regressions@lists.linux.dev,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Linux Sound System <linux-sound@vger.kernel.org>
References: 
 <CACKiatc1Bj2et4kcXDJiYx28XXxoo6iHPc9nYt3GhTCxUmdnsA@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: 
 <CACKiatc1Bj2et4kcXDJiYx28XXxoo6iHPc9nYt3GhTCxUmdnsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179563045288.4017891.9126847949981694816@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 855B85F985
X-NC-CID: 30B9LND43JiTdovUqlYsOMsGn9G+e2I6feLTNWqyeHQzIz3YLy0=

On 11/25/26 17:46, Flavio Giacchetti wrote:
> 
> My Creative Sound Blaster X3 stopped appearing in ALSA on Fedora 45
> after the update from 7.3.3-300.fc45.x86_64 to 7.3.4-300.fc45.x86_64.
> Booting the previous Fedora kernel restores audio on this PC.

Not my area of expertise (I only help with regressions in general), but
this sounds somewhat odd to me. I CCed the sound maintainers and list,
maybe someone with more knowledge in this area will share an opinion. If
nobody comes around with an idea soon what's causing this, I suggest you
check (a) if mainline (7.4-rc4 or later) is also affected and (b) run a
bit bisection to find the change that caused the problem to appear.

Ciao, Thorsten
 > Hardware:
> 
>   USB device: Creative Sound Blaster X3, 041e:3264, bcdDevice 10.90
>   Host controller: Intel 600 Series xHCI [8086:7ae0], revision 11
>   Connection: rear motherboard USB port, enumerated at 480 Mb/s
> 
> With the stock 7.3.4 Fedora kernel, the failure reproduced on two rear
> USB ports. On one failed plug-in the kernel enumerated the device,
> bound cdc_acm to interface 1 and then logged a disconnect. After
> re-enumeration, the USB audio driver repeatedly failed to query sample
> rates and mixer controls. The X3 never appeared in /proc/asound/cards.
> 
>   cdc_acm 1-12:1.1: ttyACM0: USB ACM device
>   usb 1-12: USB disconnect, device number 7
>   ...
>   usb 1-12: parse_audio_format_rates_v2v3(): unable to retrieve number
> of sample rates (clock 33)
>   ...
>   usb 1-12: 13:3: failed to get current value for ch 0 (-110)
> 
> An experimental cdc-acm quirk skips interface 1 for 041e:3264 only.
> With that module on the same 7.3.4 Fedora kernel, the X3 registered
> with ALSA and played stereo audio at 48 kHz. The first hot-plug test
> still logged errors during re-enumeration, then recovered. On a
> subsequent normal reboot with the patched module installed and the X3
> connected, ALSA and PipeWire exposed the output and input, and the
> earlier rate-query errors and timeouts did not recur. Playback worked
> after the reboot.
> 
> This is the result of testing one unit on one host. I have not isolated
> the first bad upstream commit or established what functionality needs
> the ACM interface. The results so far are for Fedora kernels.
> 
> Would a device-scoped ACM exclusion be appropriate here, or would a
> comparison of USB traces with and without the ACM binding help narrow
> this down?
> 
> Thanks,
> Flavio

