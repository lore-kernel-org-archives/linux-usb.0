Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792923255;
	b=Fb4DoW2d8cZA1svk5hR17LiBMnVymmL/AT5j0w1Upbmwd6HJVAuw9KO/h2oL/ySltrsR
	 dD6FSZ5fVrMn2kaQ6UxdP9pa81jjYYHGY0Bw51iK6lImzOyecBFIgUVFCr/CXEmwSqJ6N
	 F21Qz+GUQVmIu19Y2hqD00FZg+S8VNqRyiYoJjGJDg/nLowpGj7YdjHjKB+qQd6+ozPfO
	 kJV8EY5Zc40Dn0bV/9JzFi81T6X7dfj15xWVIcSLQTSjWCYf9Bnt9PE0cmo3NHCbsY/Vl
	 AyMQCDH4+9v7V/jmIbbHb9EkjXUPibFqvxgOGY043Hcyq4/CkoCIw8jR/wKbUGNm8AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792923255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=8TYryscVF6w2YY/DasyT/S7lB9YRAx9ipg4ukd5ZVoA=;
	b=c0iG2VTCnQWWzc3zAybiiukaERoQAzjrq9JxM6bfW43J3053cRrtcyaHGUChdnwAq+TN
	 6Rq00hu/wE09N0DfAvm7vi6HYwTy4dEzDQj2AZRUrv+7udgiQGKVxZtQ9sgAzCcQo19ND
	 VYcF1vopqPlwmUnKhjkk8A4xBmYSWfOqJ2kyvgjudMy2zonSjXAl0ItHd25rkuAJQoBPh
	 oJ6dl2P+JIqUj3ZqQ6Mfi4HJs5kBiyziTVx8IjGcc0E5VUVjMvf0r/xj6BeIXuf1hpRSv
	 eiL/jzgIvId6bZuZen7kUqaK+CZAHKlz1fzaThVEC6+OuBpHuxkLyiyUwqMXnehcxqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MevbJuCA;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F13D606A31A
	for <linux-usb@vger.kernel.org>; Sun, 25 Oct 2026 10:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F13D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MevbJuCA
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso20001365e9.1
        for <linux-usb@vger.kernel.org>; Sun, 25 Oct 2026 03:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792923254; x=1793528054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8TYryscVF6w2YY/DasyT/S7lB9YRAx9ipg4ukd5ZVoA=;
        b=MevbJuCAUMrH7y4SubOajBjMm+HawbjtrwT8wyAXgwYaPm00bRUTthPPe3ksGxb4tQ
         PcbGlN0546zmaVxLxvpCHk8rr3SgLkEzlM6rPe0ZcQOOwbplgNvtZ+qjfLLB+VAUfg04
         5vaTkeSQ2kjvwcoCOWi5W5gyQmt+AqNNOpRf6Kz8BpLwiFAPqV/kNEw94XEAMmcht65w
         WaM7gKH4pcxyf5q9wxXEaNO+6JTyqVDOxlqszUzJgbE+6WzdQxKK0JRQV7Scb+uBuR7d
         qnr5WC8obLPtQ8ld7iUE9364NjS+VFCyzTkWDeORrjBkO/og6OR9j2flHemmVhkgEQiN
         qIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792923254; x=1793528054;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TYryscVF6w2YY/DasyT/S7lB9YRAx9ipg4ukd5ZVoA=;
        b=VIkmQrQHl1bi7eKSiPLUDJTcL+GdOyAuILuaxhTVtzZnIpW9BocsNhasEKTY+NsHEK
         y6wGjSfgXijw3RG3wYFYdTRxcb71BGc1EqLWHwrEfG7gy1IptOlCN55jIE3aLjFMZ/t0
         CQQ1qnRImJx76mmEnqdnGtETosDWT8x8UN1kTR1sMKd8r+5m4Bch+KPhOX/ZHRqtNpO4
         efya4BbGWwLZFEXDR8oWDWZbzpKBl1iUTF52bMTWlAQ2so8gKe41NUGp3DDIzcQ4AX5C
         HXu7bsZ2n3ZSr+HX79mRWfvlVPX8GsZpWqHIKwrSWEAi8wx4zGt3/VLQA4CWbiVfJERL
         0xdw==
X-Forwarded-Encrypted: i=1; AKwUvBynpqVusHCnhrUKxSvjpDmzG/GQqvd3/QIZPxs5KCN6UWUALPsljIjNNK91dX1iTyWHFsykaZbGR00=@vger.kernel.org
X-Gm-Message-State: AFq9FYJumKYa4LOUEFHk6d7RjGrNbiE+uStyjTmslrKuR1EfQIDBn1Pb
	gAstGWM3sON70uumMtXuFVoMxQI9ri1WW7hYuDg3nyaQfIwNg2Fdk9Wp
X-Gm-Gg: AYBFou1nx1sf5sRCBmRn0jd8UCnqmLvAmWQKHXf2SJYzyims4Ee0szh1Z3HipdRkGRv
	FscnDBNyTvLTb2rCMe1ewEPg9l/XK1cjQQqf2dHQL81Zg0SpUrarptNyR3+J2ym0dzDZRfsY9jC
	9o5i1JPNk1co2VsDPKiYDiF+Avzit3BEg8l5eszIosuUnU8q2Ubf+PFWaEP3NNf4BI2CMGbfrNY
	T4j6GM4Ntjallrszflc1V437WihegGHrqC7laTeMtXpf+ILZJ6wLUrWIG6AfCzXUnCKD/B3CBNX
	rUjx1XK1mmBe17NckTqYmXQO1F+F+nxag321gHxiRnes0++Wm1rKgO+4lnD1d3MDuiv3OXoCPFS
	D1ekGyvvJkU9OBECzw96+Hy+T/ePHin5A2r6OCecqEAyu7AAB6eHdrCAml5lxesjm8hoL1cHnKO
	1MqEKgOD8OBTEYe6M77JcTg5cWU7ZyOirFXBv4zhnEEeo8tpO41UNb2mlLNbmILVopwYy4ze2+u
	FwmQbhjUM0OndmIxzJRP9e7vZLSILdh5pegW45bvGSEfcApf/0xcwNNvnrdJvwv
X-Received: by 2002:a05:600c:8b62:b0:4a2:150f:1610 with SMTP id 5b1f17b1804b1-4a35acd5f91mr56725465e9.23.1792923253746;
        Sun, 25 Oct 2026 03:14:13 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bae01sm140560695e9.7.2026.10.25.03.14.12
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 25 Oct 2026 03:14:13 -0700 (PDT)
Date: Sun, 25 Oct 2026 11:14:10 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Dennis Wissel <dennis@dsine.de>
Cc: Yiyu Zhou <yiyu@yiyuzhou.io>, linux-usb@vger.kernel.org,
 mathias.nyman@linux.intel.com, regressions@lists.linux.dev
Subject: Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron
 M5 (3434:d068) at boot since v7.3
Message-ID: <20261025111410.2c14fcef.michal.pecio@gmail.com>
In-Reply-To: <SrQQcLIwRWyg9PdEIpc0eg@dsine.de>
References: <4MjB9K-2SoiA85WbI9iEig@dsine.de>
	<20261024203558.3181711-1-yiyu@yiyuzhou.io>
	<SrQQcLIwRWyg9PdEIpc0eg@dsine.de>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

On Sun, 25 Oct 2026 01:10:27 +0200, Dennis Wissel wrote:
> On Sat, 24 Oct 2026 13:34:07 -0700, Yiyu Zhou wrote:
> > The fix is queued in Mathias's for-usb-linus branch as 1f36cc9fa949
> > ("xhci: give back all TDs when skipping endpoint reset after
> > disconnect") and applies cleanly to v7.3:  
> [...]
> > Could you test it?  If it fixes your case, please reply here so that
> > Mathias can add your Tested-by.  If it does not, reverting
> > 042aad8d0db6 and 7e0ef4332ed9 on v7.3 would show whether these
> > commits are involved.  
> 
> Thanks, I tested both on top of 7.3.0-4-cachyos, booting with the
> mouse plugged in each time.
> 
> 1) With 1f36cc9fa949: much better, but not completely fixed.
> 
> No reset loop anymore. After one disconnect and re-enumeration all four
> interfaces bind, and both the mouse and the NuPhy keyboard work.
> Before, the boot took about 3 minutes and both were dead.
> 
> But hub_wq still stalls for about 11 s after the first reset of the
> mouse. Other devices on the same controller (1-9.2, 1-14) are only
> enumerated after that. Just before the disconnect is handled, xhci
> prints three "not part of TD" messages for ep 0:
> 
> [    3.509460] usb 1-1: new full-speed USB device number 2 using xhci_hcd
> [    3.510626] hid-generic 0003:3434:D068.0001: input,hidraw0: USB HID v1.11 Mouse [Keychron Keychron M5 ] on usb-0000:00:14.0-1/input0
> [    3.510772] hid-generic 0003:3434:D068.0002: input,hidraw1: USB HID v1.11 Keyboard [Keychron Keychron M5 ] on usb-0000:00:14.0-1/input1
> [    4.973074] usb 1-1: reset full-speed USB device number 2 using xhci_hcd
> (nothing on the bus for 11 s)
> [   15.970122] xhci_hcd 0000:00:14.0: Event dma 0x0000000104205260 for ep 0 status 1 not part of TD at 00000001042052d0 - 00000001042052f0
> [   15.970767] xhci_hcd 0000:00:14.0: Event dma 0x0000000104205280 for ep 0 status 13 not part of TD at 00000001042052d0 - 00000001042052f0
> [   15.971131] xhci_hcd 0000:00:14.0: Event dma 0x0000000104205290 for ep 0 status 1 not part of TD at 00000001042052d0 - 00000001042052f0

That's not good, your HC seems to be executing stale URBs, probably
from before the device was reset. I suspect we reuse the default pipe
without recovering it from the broken state left by EP_DROP_PENDING. 
(Such bug may have existed since forever, but only in USB3 and cases
which seldom or never happen. 7.3 generalized it to more cases.)

But is USB core really resetting a device for which the hub has
reported disconnection? Something isn't as I would expect.

This could result in DMAR faults, but it didn't. Was IOMMU enabled?

> [   16.157121] usb 1-9.2: new high-speed USB device number 7 using xhci_hcd
> [   16.354120] usb 1-14: new full-speed USB device number 8 using xhci_hcd
> [   16.481086] usb 1-1: USB disconnect, device number 2
> [   16.894150] usb 1-1: new full-speed USB device number 11 using xhci_hcd
> [   17.026214] hid-generic 0003:3434:D068.000B: input,hidraw1: USB HID v1.11 Mouse [Keychron Keychron M5 ] on usb-0000:00:14.0-1/input0
> [   17.099110] hid-generic 0003:3434:D068.000C: input,hidraw9: USB HID v1.11 Keyboard [Keychron Keychron M5 ] on usb-0000:00:14.0-1/input1
> [   17.101019] hid-generic 0003:3434:D068.000D: hiddev100,hidraw10: USB HID v1.11 Device [Keychron Keychron M5 ] on usb-0000:00:14.0-1/input2
> [   17.103029] hid-generic 0003:3434:D068.000E: hiddev101,hidraw11: USB HID v1.11 Device [Keychron Keychron M5 ] on usb-0000:00:14.0-1/input3
> 
> 2) With 042aad8d0db6 and 7e0ef4332ed9 reverted (and without
> 1f36cc9fa949): exactly like 7.2.11. Interfaces 2 and 3 fail right away
> with -71, the device is reset once, no stall, no reset loop, and the
> mouse and keyboard work:
> 
> [    3.498259] usb 1-1: new full-speed USB device number 2 using xhci_hcd
> [    3.525104] usbhid 1-1:1.2: can't add hid device: -71
> [    3.525732] usbhid 1-1:1.3: can't add hid device: -71
> [    4.981085] usb 1-1: reset full-speed USB device number 2 using xhci_hcd
> [    5.167055] usb 1-9.2: new high-speed USB device number 7 using xhci_hcd
> [    5.352064] usb 1-14: new full-speed USB device number 8 using xhci_hcd

Not sure if I want to ask you to repro the failure on 7.3+1f36cc9fa949
unless you are sure that IOMMU is in good order or don't mind this
system potentially getting random junk DMA'd to a random place in RAM.

But can you post what happens on 7.2 with xhci_hcd and usbcore dynamic
debug enabled?

And BTW, the previous commit in the series (e3d757dc9257) also creates
problems which are fixed by the later ones, but those would be more of
a nuisance than corruption risk.

Regards,
Michal
