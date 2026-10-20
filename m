Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514577;
	b=ZUYGRuTJhKWpnSrVd+rBhhMWM35XLmWv2cqcX7DdUsHWIKcqlBv0nOM3wZPTjZKRM+mH
	 jw4zjt0hzThQUfYawSYRC1bVEsazJ2/l1KmV6dlfGrRLBYgK0wjEuvjnStwN1/lIv4oAk
	 d1cpPXDlRk+1AmM/IlW1g8CNTjqxbI40qI0sQQyYMBtJmFfD1YUivO64XXdtRl5ZGWY2v
	 YWHhz9QGjZYp6On2/1WKDoKyx1ER8h5R6IssFYlUHbzlxk5fmQgbyPy65vm9mdKx1JQ+w
	 QO5FRIa6MkZwx+tC0wzkGXg6TKnv5PE7PZpO/XxQMUsMLOtx21bOHiFaGAM9Kntfz4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YbI3E9wpo32mpl8w38bTVPHTLpJsQclRJaeIGMppCCY=;
	b=XIQK63z4P6DFvt5QeK0XUmxunLzJjfemZMmTeuJAWZq1zwRspXwUkcKtSoM4H+DY1sQF
	 HzdzYRyPiotedIGM+/l96Tn3xNHNWlt+Q97N2VN2D/M/4tmgffTAAN9CeiyDaAHmpZlWY
	 BH3K3Hhe2N1aMMqP9nGBYC3xcBTEKEcQamFixeFg5pmtDJiPKFfvqYU5cGbaZ0TxfncE5
	 TY5eDOBv80CTSgGQzaoUvnOZidh3BmyYRILJDeWDqK2Ciws4fxsvDMKCsYqaFbqWxU7Ru
	 HLkggfGwsVhhb5y55xRxyZUqowQ7qquQ7gmD/Vs4ZvMctaW+w+1JyqaT+sQ5kzeIdBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZHlKlrM1;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202A6606A319
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 16:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 202A6606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZHlKlrM1
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so34736825e9.3
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 09:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792514574; x=1793119374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YbI3E9wpo32mpl8w38bTVPHTLpJsQclRJaeIGMppCCY=;
        b=ZHlKlrM1Qj7f9ziupsQLSfI6saYrZDMCs7hnCXMF7RrG+CpaHxCYRC97K23SIVcgg/
         Sdonjvek8squKoyvDGjl4+zAQz46TJHeFr2xnBtrkoT1eDcnHr9pW6hXzcStcniojJxL
         QY0M7C/l3UyIWq7jH5M15Wn5I8IPIuCBmsblxWfWIQo8iSCqimNwa1Th5W+GUrjTChhb
         vh1h2iL1fCyqks/gny7IUw+3qSqVBnc1wuhu7dWgbeiT9x7SJc8qT3XxbW7x+OsxQRl6
         +qAzYrVRyp7Yn7Veh2b6f+hyBZvTk51ren49WJzWPOzCV9PWJvL7x/mGMJR1WMPPLqxr
         I/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514574; x=1793119374;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YbI3E9wpo32mpl8w38bTVPHTLpJsQclRJaeIGMppCCY=;
        b=c4lASDI9blkgg+4P8qIr3BW9GCINeb8Ysc+NjmVAgX+vSQcsNPYnYiKYXRUhD2F8hB
         a0Cbas2VqLCURSluvaevPd2FWsW3Qb2BdTdmf7SGQE3l1aiRBzpyVBfrpV57xge15GBs
         mNvjdRZr6wGytOh41UebygsKi90R5QyI5fRXSuxnLkgeb8l8HHX6CVl/ljdY1amxH0xT
         fwcCFwlrb/k+q0N0nyyx4hXQQgV1Ix5+ZR1itxczJT8q5xVN5E2yub/EF99+oiRziXTQ
         iMTFRR8sjrDPpmJXS+C3NItiCeMgzoCXyZMDEqspJp0ycSJ1i9+CbHLpNGmbYEL0qiJ3
         9tyA==
X-Forwarded-Encrypted: i=1; AKwUvBw/g/5P1rUtNieSi2JrV0xrxfUm2LbR0MBe47FQGC3713FUfmVi9M0fQFDQNYPVOomOmmnEwmblGxo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0QVM7RqnTA5Y/nciQOWRzQu1kyR4pdgitVD+CmN8HCGVnzJ1k
	xHAqQdefVJpHZIgpGZjw+tyKrYs4MjBPv8Zf7SsQYSayg6RQ9nn9XZIG
X-Gm-Gg: AYBFou0L8j/oSu5+n36ssrxEvnzllnmIHlmfoat91RsQY45qSuVOaMeJQPF3KmO4gdq
	eX/pmPLq5nLtd3tpkJ0ASKCZbEpyziUlX3eli+8DoX9+WABQZHPKdKQYW2kZYAtMR2epxkv76K2
	hrkYK/Pxyagjc5dN8378TpfJIEogzT/JXh40ccNt3ym9NpcvnFO+zvoZcfqJ/Y+NUyIF0GwjFiS
	lAEx7n1lzTkdg/tlDbnxFb8ss6Z9pM0l1Gjzq1E1GnJo0o6LmDoyyqMj6SL7HIbdN4Co+hmxTGn
	/zK/xAiPMFyXgnpqOHdI7F1OWjsQE5ZJxDfvM5u9H59quG3zSIeWr2rdgVCwN7mT1tWLmCaihWV
	UNxpb+aNGyKT8nRNT9tme7Fu7Bnv0hlIaFTUL8qkt9V5kV24d4+MvEVnPQDIkmAQHrzh0WXi0nt
	7WqawDhXuFj1JbqiNzYB65gI9rBzpM+9b8iX7Esy4HPRDazduhixoRbBGl5q0l0OW43/nc/d4Vm
	TdZhsoqug==
X-Received: by 2002:a05:600c:8b51:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4a1da58073fmr212926695e9.31.1792514574361;
        Tue, 20 Oct 2026 09:42:54 -0700 (PDT)
Received: from foxbook (bfd231.neoplus.adsl.tpnet.pl. [83.28.41.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce3302b5sm244278035e9.4.2026.10.20.09.42.52
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 20 Oct 2026 09:42:53 -0700 (PDT)
Date: Tue, 20 Oct 2026 18:42:44 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Steve Bayless
 <steve_bayless@keysight.com>, Guido Kiener <guido@kiener-muenchen.de>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 0/4] usb: usbtmc: fix undersized high-speed bulk packets
 on xHCI
Message-ID: <20261020184244.69b78d5e.michal.pecio@gmail.com>
In-Reply-To: <20261020-fix-usbtmc-short-packets-v1-0-903f4d029193@tipi-net.de>
References: <20261020-fix-usbtmc-short-packets-v1-0-903f4d029193@tipi-net.de>
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

On Tue, 20 Oct 2026 16:33:37 +0200, Nicolai Buchwitz wrote:
> The Siglent SDM4065A-SC, Rigol DP800 and Rigol DS1000Z (and probably
> others) advertise 64-byte bulk endpoints at high speed. USB 2.0 only
> allows 512, which xHCI correctly implements. Unfortunately this breaks
> usbtmc on these devices. Reads stop after the first packet, and longer
> writes also fail or hang the OUT endpoint until a USB reset:
> 
>   usb 1-1.3: config 1 interface 0 altsetting 0 bulk endpoint 0x81 has invalid maxpacket 64
>   usbtmc 1-1.3:1.0: Device sent too small first packet: 8 < 12
>   usbtmc 1-1.3:1.0: Unable to send data, error -110

Fascinating.

But SDM4065A is apparently pretty modern (2025) gear marketed for
"automatic production lines", so it's odd that it has such issues.
Has anyone looked if the same out-of-spec descriptor shows up on
Windows or (don't laught at my optimism) consulted vendor support?

Maybe Windows xHCI driver tries to enable out-of-spec maxpacket?
We could do that too, though IIRC not all controllers are happy,
so a SW workaround may be unavoidable.

And xHCI doesn't support URB_SHORT_NOT_OK, for the record.

> We ran into this in our factory once we switched some test PCs from
> dwc2 based hardware to xHCI based ones. dwc2 uses the advertised 64
> bytes, so the devices worked fine before.
> 
> This series adds a quirk table to usbtmc and moves one packet per URB
> for the devices in it. The DP800 also wants a ZLP after a write that
> ends on a packet boundary. Only read() and write() change, the ioctls
> behave as before. More devices can go into the table as they turn up.
> 
> The Rigols still have one issue I can't work around. They split
> replies over 500 bytes into several transfers, and a follow-on
> transfer that ends exactly on a packet boundary never arrives. Raw
> libusb shows the same, so I guess it's another firmware bug. Should
> be fine for most use cases though.

What exactly is the sequence of URBs you see vs would want to see?

> 
> Tested on a Raspberry Pi CM4S (BCM2711 xHCI) and a CM5 (RP1 xHCI).
> 
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
> ---
> Nicolai Buchwitz (4):
>       usb: usbtmc: handle undersized high-speed bulk IN packets
>       usb: usbtmc: handle undersized high-speed bulk OUT packets
>       usb: usbtmc: add Rigol DP800 and DS1000Z to the packet I/O quirk table
>       usb: usbtmc: send a ZLP after a full last packet in packet I/O mode
> 
>  drivers/usb/class/usbtmc.c | 87 ++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 76 insertions(+), 11 deletions(-)
> ---
> base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
> change-id: 20261020-fix-usbtmc-short-packets-1c4e233ae407
> 
> Best regards,
> --  
> Nicolai Buchwitz <nb@tipi-net.de>
> 
