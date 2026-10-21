Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792566724;
	b=USDFXlP1PgmyEQfKdWAmjaXWV6kPowgwqBLdbw4L9MikbvctsvimCuAbfPOJENSv4hHx
	 irzw67AScb6Ps4eXjoRe9+1S1TDM14bz2Lfs9NBi7RseQMUqmx4wr2Bwh4bHmSktO+Fi/
	 VxTvf57T+u2uPO+Dbg5O3osf5QpJW590yViwJZs7E4mX6EbnC9LO7eJ3HlYllFCvdm6yA
	 waLiEt08hAAHocyglFN6M1987o6S5r1+BE5Cq2Cllxf1zJnPzPI3CoidX3IclfwDIxAPZ
	 0mXBF5hQNC9rtnRz4gffgee0kTooOpq/kG3Q488zfp2AtKKGYpd6M/eGce/pIU+6uMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792566724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=pkYp+7Cerae/4hvPBPVJ47A8aQzxR1pyx/G6X3uTZ2Y=;
	b=jSx0ZJsEXPEFMbOUdRxa2EAVN+/rZbTNB4giXKiCzbxN+utswvQrsDDW8r+XE6N9HZK6
	 5Xt2rjGCb5s316/dmSbS0xdEMsDNS81czurlgJZa7SKsSa3CHMryoR3EJmXWJJFTh0vE2
	 LJfqh6RGsdk1WIF3Emr0oonJomv52zebrvpDj1Oam0wf0FIEkhBU40s+nJ2B67jwUCZ0O
	 f7oYMS17B9mGWwA5uYe4PA1ChPOgRZN2/6ZXYzlCbQsI9hzpizigevEBx9SO7ehyCP4A3
	 FQFVNzEGXtB52wjnt/MxrZosUXDc8u2yR+OOeGdYnidOU0vpOrJvdxaM85Su2HrbzJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k9TOnKRo;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAF0606A31B
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 07:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBAF0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k9TOnKRo
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso222819f8f.2
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 00:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792566722; x=1793171522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pkYp+7Cerae/4hvPBPVJ47A8aQzxR1pyx/G6X3uTZ2Y=;
        b=k9TOnKRotyfftAmySX+0K1yDgnJoy6a4j8JOtnNAIIEDzdcheZm+L4r0XCDEfLspQb
         VdWXHhAnzSONR63hbfoIYP4MafkzgyKp9UfPqymp040SF4q4my6b2XQoMbckMjn05g31
         rlDbR5NTFv6aqqGwtuBXDkdWGGh9XPdHd2J1rlCEzwoHduM0p654CQ+FdMiDngWau1ij
         4WlSI1i/Rd+2rtTE7dmvIEal4v4DgQTUWMAbBXP5+JVQHCCxLcGr+A4hydd+v1uhCoGz
         GNm8M0N/jM7lNz7mvmfo7F8umep5aVVpmt0GNBVnzk1bBeKNZycBL/QTffO7wt4UApsh
         IaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792566722; x=1793171522;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pkYp+7Cerae/4hvPBPVJ47A8aQzxR1pyx/G6X3uTZ2Y=;
        b=FmNQxoHzN4NGxicx6KjuWY9kpp7XC7OcAu5VZjHxEnQPMBxxDP4iiIqvklGP7+WIN5
         lQ2FtiZL5FQWTLpv2jmh4QYD+M8aGOqjs39lYe6Et75ptxmjXbrNfKwnnb7BhrLG3r6T
         WqqJVEz5gFXxvdWu/XAe7kI5Uol0CEj2jKs6yEm7Y2zCtOn3yvhDCooTOgpJBh0Ft9TO
         UDmLd3ejwGEy/8NRlHTznMAGOXZSDmRBhpzJY2WsOs8xM7/mGZjeMdSGNaHSwgbFQEDG
         3aqakGlqaw8Q0zDAyQmjnsBXyfqOzAy/qI6iqHQSQU0pIfb9KTJWTCfqFDucMWhzf2S9
         US0Q==
X-Gm-Message-State: AFq9FYKJWkR5wU1bWk5phlfOKa83oFd1toOQ/AqqCWGLP4UAQxUxmmRf
	tj3vKcRtIBE4guUKHCWwigXegcnb/JTB8D+eeGrH0sX0yXhaZPyG1bIDyOmQO7eN
X-Gm-Gg: AYBFou0eBMActraIo7By1gzXVpKr8doR5IzuM5zl0+qFoe4fTYtBNKg4mf+8Rbs2t4M
	5UjOB/AeGnQZxehqCTNLMk6uab8umTDpOjAlMgEQnd4+EXqFUU/RVL3Ao4sVS8UN4Y5CFAU+E0Z
	urzSAWYFOInwDVpNMpPX+QjAy5FlJXyc3o0Ug62riT1mBYVXGBAvW+i2iuPUlE/IyYvu69s0Xo7
	OAwO8emRY5bbXR0OkXX1VwdO7PzGR+iAsGyair0nIEqYYT8esluuxT3MaV+2ZPMXI+6HqJ7pHdl
	CgkcfE+FJbGN0kzOUzFRs2ShGnw8bhefX1IbFgRrWAM8BlU/uDbY16GnhmyMoFO/Dn4ptqSJpMI
	L1hbsZ6021tXRp2D+LvplDIuicr/qy5m03LDL+VwDerQqCnSg5CIOeykdO+gnKJx5TLwMGoxJcX
	tBxIET8jt8d03yc6+h9DVedo18VX407Nfy8C+QcaDhNWz0tGVwOx7l0p5ZhjW/9t6Yiu8q7aPmh
	CNEhVqud+8wkc1FPNQg2CCKaRmG+CqL8TZQ+3ZsIjOz33SaztCFJp47mRzSkvEXNo0=
X-Received: by 2002:a05:600c:6995:b0:4a1:e08e:46b5 with SMTP id 5b1f17b1804b1-4a1fdd245c7mr18888085e9.16.1792566721874;
        Wed, 21 Oct 2026 00:12:01 -0700 (PDT)
Received: from foxbook (bfd231.neoplus.adsl.tpnet.pl. [83.28.41.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254f093asm3872395f8f.4.2026.10.21.00.12.01
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 21 Oct 2026 00:12:01 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:11:55 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Nahuel Clotet <nahuelclotet@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 mathias.nyman@linux.intel.com
Subject: Re: [REGRESSION] v7.2: btusb SCO (HFP mic) broken on AMD Raven xHCI
 + Intel 9260, works on v7.1
Message-ID: <20261021091155.733a122c.michal.pecio@gmail.com>
In-Reply-To: <CAJD1503U2GDcbWma3Y4EGjBztADi-EO2ZGk6Ux0cDpWvYCwLoQ@mail.gmail.com>
References: <CAJD1503U2GDcbWma3Y4EGjBztADi-EO2ZGk6Ux0cDpWvYCwLoQ@mail.gmail.com>
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

On Wed, 21 Oct 2026 02:17:04 -0300, Nahuel Clotet wrote:
> Hi,
> 
> Bluetooth HFP microphone audio stopped working in v7.2. v7.1 is fine.
>
> Hardware:
> 
>    - Lenovo ThinkPad T495, AMD Ryzen 5 3500U
>    - xHCI: AMD Raven USB 3.1 [1022:15e1] (06:00.4), BT on usb4 port 1
>      (full speed)
>    - BT: Intel Wireless-AC 9260 [8087:0025], fw intel/ibt-18-16-1.sfi
>      (201-12.24), linux-firmware 20260916
>    - Headset: Anker soundcore P30i, HFP with mSBC (also tested CVSD)
>    - Userspace: BlueZ 5.87, PipeWire 1.6.9, WirePlumber 0.5.18
>      (identical across all kernels)
> 
> Test: switch the card to headset-head-unit and record 6 s from the
> bluez_input source (pw-record, 16 kHz mono), then check the samples
> and the kernel log.
> 
> 
> *Results*:
> 
>    - 6.18.55 (CachyOS LTS): OK, real audio (rms ~1500), no SCO errors
>    - 7.1.11-arch1: OK, real audio (rms ~200), no SCO errors
>    - 7.2.11-arch1 (vanilla): BROKEN, all-zero samples, nothing in the
>    kernel log
>    - 7.2.9 (CachyOS): BROKEN, dmesg floods with "Bluetooth: hci0: corrupted
>    SCO packet" and "SCO packet for unknown connection handle 257", PipeWire
>    reports "Failure in Bluetooth audio transport"

Hi,

For the record, did you try downgrading to 6.x or 7.1 *after* finding
that 7.2 doesn't work?

Not sure where the difference between 7.2.9 and 7.2.11 comes from,
there are no xhci-hcd changes and only one btusb quirk. But there
are changes to net/bluetooth, so maybe there.

> btusb's isoc path (btusb_recv_isoc, btusb_isoc_complete,
> btusb_submit_isoc_urb, __fill_isoc_descriptor, __set_isoc_interface) is
> unchanged between v7.1 and v7.2, and btusb submits SCO URBs with
> URB_ISO_ASAP. The isoc-related xHCI changes in v7.1..v7.2 are:
> 
> d20405dcdf usb: xhci: Remove skip_isoc_td() 298ff13271 usb: xhci: Remove
> isochronous URB_SHORT_NOT_OK handling e765ab012f usb: xhci: Improve Soft
> Retries after short transfers
> 
> I have not bisected yet, so these are suspects, not a confirmed culprit.
> I'm happy to test patches or reverts on this machine.

You could start with testing this commit, which includes all those you
listed above and other USB changes that went into 7.2-rc1. If it fails,
bisection will be trivial. If it works, the bug may not be in USB.

1c2b66a7d725 ("usb: ucsi: huawei_gaokun: support mode switching")

Regards,
Michal
