Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635132;
	b=QMzNUv0rspF/DXEsL9wOmc/Z/ipEYgRMFYfKWZtDw32M+5uBhpIdQHF+g+wNjWytgvZP
	 JNt2RilKnsxIWNHCWQq9YY7/Ffg4it19L0hlo+vBth5LesDd7KtjqSCn0qhYL2XQWqx6n
	 ovbKoIQChiBwm6hbP92SDmVkGLbMiDT1kLfl40sgVrNfQ6jgKDKcD+C0PDAmZl7pd3E8p
	 8A84ydiW6B2/T53j9Xh2p12xNqZhUvEJC6O/5EGcVJoyFMQ0+pP8vL8KpQGgaS04wp2gf
	 7yPKBxcWPxhRVc21SkaeY18BlR5YJLFc8P2/Wz5petEfb8BKIqFkQ1mivohMNyUGhPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ovHHtD+g/v2rwITp+yEHB4bzDII1NkPaoQCCK2QFSd4=;
	b=eaIlOi1cQH6d8iUInio66oCIg8Juul9m+xw0wcCvp3AF788gWmwEI9nvg+CAec1tR1Nn
	 jKGaSATqJtzWBWmWXMQ+ETwH4gKhvIvFTIuCiWB7GiTtZPAZ2PeSM9Bdy87yA+peNUqXA
	 34zZXVN5oGmWGIlFGNpucqqQzE8ysaRJnPm0NHa4ewwpD+JfeRyKbytHZATN3pHp3nu1o
	 LqohjcblfOu4BS/3gu4N4Vp4yyDdUwyiPVhU6J4dtCQvCLWkkssCLLEPMx4VOr408HTeu
	 MKqopUB2vShM97eYUJDkNRmYnCbSXfkOSx6wGeiAbIFkI8pAbjz+VujJISOdhNYSFFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rhV7bset;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76884606A31E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 19:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76884606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rhV7bset
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso63355885e9.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 11:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795635131; x=1796239931; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ovHHtD+g/v2rwITp+yEHB4bzDII1NkPaoQCCK2QFSd4=;
        b=rhV7bset/MTcF5xzZWgPiKOXnQ7MvGMV5Jt1dX5H/b4EPGnVFn+2uszERjU021aTo4
         9nZ7PQYOs9k/LbCKXftm4CiDuXk5eoX7wfj75vINXLPl5pQKOuZEkwrgR25GYIn1fkrn
         l10V4Su08M+HDVDnx47pD/FEUMxjQvJBG+8i+cAi8s77RVGpLW/EgKUMwfMBm3zM53G2
         9mol8RNCYhoD3veHl/iL9rLycgAGQBghQV2nm2z+/2/m7QCh3b3dgQEwhC+LFE7bTsu1
         MVjLwlNws+UbjGfDU0A2VLgJn8JEEYUp1eUNnCmaxGVJ3aoZoAAG/voGxvwZFweYLJ0d
         82GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635131; x=1796239931;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ovHHtD+g/v2rwITp+yEHB4bzDII1NkPaoQCCK2QFSd4=;
        b=mShUtgkZTnlxrpvCw2bXANZgV/0atKmV/vd5Sc370Wny1LnX5R+Z2CQwR+9KYwdKyT
         7jASX8lHbdnXoKg2tpsGMbsx2z/emY3JGpBr7jmTdazvhXcbvGZZC3sARI/wamf04zGb
         nFiGtm00FCfQAUW1df64bEYF5HdeI1zPSLkso2j0neF+lUVQI/f5c1vrkcvEcOFoHXxv
         gflkzl0Y98483ZwIZ6dSvanT4RODKAukNiDugqVMZ/xGdROtapcB1xODr6WLtSRY4AM8
         haE4mxnI2prWz5gxNcnzE1IiheiNF+Ak7VPxXv1BV5OByaqKItfxRF1BYWI0UkyYGW/p
         vI6Q==
X-Gm-Message-State: APuU4Z+7UTzepn+xrQfCiTyvbm5ZXFvaBqr//AugY2CNbtMd7pIlUGu5
	q1xpbTi4B0SQ0PiIsf6zgZp1BnzgfG6yTUItDqgFrgXVFoEZwQfTcGfs
X-Gm-Gg: AZFdTZcSX8KqdsUTeoPcBdcx/6T7r7aT6/ns+qeNANwJW2VRvfz3MPl/pt50DmIEnAQ
	3tlDVAAB5XY2wjPFcdbVSLi7ZD1i/5MEUsxtBK+NYnmdEXowC9e+vUFmhDI0HP1DhXu5SjQC6Zb
	h/pcHywmzQTQfo0ngr3SfqUP2M97z3OtIVH04oEL2fUqVQvZdN2QiipeM8QtlySNodFant6OW+5
	Azcw7v5EKvax/ewG7KGNJyPaurH3bqnZitUk7qVwISUM9AW2rF0v4KMLCIer2tJKk3BnORby9yy
	iOrufIaKYUSJ1pS1sq4kQr3jJGOkMwH9NWqd/RwWcE0bogi9nW1I/OLHuykacRwdwL9nNbIsFeP
	E3bdWYAdLGh9IDhZjp5wJmao9kJV7PYC4QLZQzbNKVxBZEM9NnpEKRfCv4N+3Jb2gaRx0WlktxL
	4heGmlvdf7na14LrODaTK4u3b4AWtK2D2XIp9sDt6p/wOy38ByS5DDCq+aIzbVEOqteRPF0Vna/
	SiYhDk7U/eekHwH+NCbVXJzv+KNipHBEcxJA5TQcMuNkY2d/NLSrkp8OGNFRTvt/gQFHsGG0ZD2
	dwTaoW2Z23cEJUBLEkMg1QbGR6P/XRdYfY+V31oWRA==
X-Received: by 2002:a05:600c:a085:b0:4bb:85d9:156e with SMTP id 5b1f17b1804b1-4bb8880fe46mr375307005e9.11.1795635130719;
        Wed, 25 Nov 2026 11:32:10 -0800 (PST)
Received: from foxbook (bfh118.neoplus.adsl.tpnet.pl. [83.28.45.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906e4ce6sm317579885e9.4.2026.11.25.11.32.09
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 25 Nov 2026 11:32:10 -0800 (PST)
Date: Wed, 25 Nov 2026 20:32:11 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Flavio Giacchetti <flv.giacchetti@gmail.com>
Cc: linux-usb@vger.kernel.org, Oliver Neukum <oneukum@suse.com>,
 regressions@lists.linux.dev
Subject: Re: [REGRESSION] Creative Sound Blaster X3 (041e:3264) fails USB
 audio probe on Fedora 7.3.4
Message-ID: <20261125203211.76029bf0.michal.pecio@gmail.com>
In-Reply-To: <CACKiatc1Bj2et4kcXDJiYx28XXxoo6iHPc9nYt3GhTCxUmdnsA@mail.gmail.com>
References: <CACKiatc1Bj2et4kcXDJiYx28XXxoo6iHPc9nYt3GhTCxUmdnsA@mail.gmail.com>
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

On Wed, 25 Nov 2026 10:46:58 -0600, Flavio Giacchetti wrote:
> Hi,
> 
> My Creative Sound Blaster X3 stopped appearing in ALSA on Fedora 45
> after the update from 7.3.3-300.fc45.x86_64 to 7.3.4-300.fc45.x86_64.
> Booting the previous Fedora kernel restores audio on this PC.
> 
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

Hi,

Does the 7.3.3 kernel also bind to that CDC interface, but without
triggering disconnection and other problems? If this used to work
then it might be better to fix it to work again.

If no one has better ideas, can you reproduce on upstream kernels and
try git-bisect? Or run "git log --oneline v7.3.3..v7.3.4 drivers/usb/"
and manually bisect these commits, because it's likely a USB bug.

Regards,
Michal
