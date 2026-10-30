Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379161;
	b=4EdmCgHTsDgaM1LqSquW5t/FpBFphfXJQf5qNlkS9nRs64WHHMI+tXJLeO+TgR32uw+B
	 vTRzBf8rZOGzs0q/LeSQNQIA7onq7ryqPH9T0YKkttNNLbQHN8DLvs9Y+ofiqV6Xf0oRl
	 jrM4097zoNxTNQZbcuawGdBQei8rdIom05ip14Ii3OARJnYgM12JNWnzxAwEWTSX7rkgt
	 vkQF78C6Y114RN4oNxEr4hcCCLWPqBKM0BvZ64vcxoA/S8crwPBWBN47ZpMN1fSCaw902
	 4ThtXYEdYDtRHLxAX4tYHRCQBZB55AEX99nFdCcvy6QhbMwrVaaGaXZqi2mMt7lBIPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=EZG8DW65lYxNMhPsjCMAIqNHtaoCok58c1D0j+yEE9A=;
	b=4s+nX+CTlvx/2E9TihvjiBkDQA52Eldm5e9Zx3UkAQUpjy72/XJjGpDTLFTfXXzua3Zp
	 I7/Mg8RALgjp6BMYlaCT5dqxjp4VnZ0U0nYYmypMU8riZaSDlKNHAbxmt8OX+mX5AF3gW
	 Fmz0lqETS5IqqCOrhZx1jv9a/gH8vtu3JN/cGJ1L1d2x5UXCHWbjzYmdsW0seDhQM40X6
	 TgNEf3tVmIUVSNVRKvZD7f2EU9sO5o95UmzTOURCbdcRS0KD4PHbvVCoObqrdV6ZZgNQR
	 SM7+VdZag6c2YKTnnGqFgQrRudMTagkEZ29+lP0IfjJklcobC3McoghMJ/ttaM6Cpxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=zonni.pl;
	spf=fail smtp.mailfrom=zonni.pl;
	dkim=pass header.d=zonni-pl.20260707.gappssmtp.com header.i=@zonni-pl.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=he4gnpWw;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65104606A324
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 16:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65104606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zonni.pl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=zonni.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zonni-pl.20260707.gappssmtp.com header.i=@zonni-pl.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=he4gnpWw
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c247f6687dcso165817266b.2
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 09:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zonni-pl.20260707.gappssmtp.com; s=20260707; t=1793379159; x=1793983959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZG8DW65lYxNMhPsjCMAIqNHtaoCok58c1D0j+yEE9A=;
        b=he4gnpWw1/2oGJqngV1Dhe1ajGr+YVtS+w9ZQJOQywgzFg6AiRL0NdHp92dUbvHLnf
         8K2hZjqJe14PUuICT0ygtcxcVs54oI3AI3pOv8KrHozDUjiWSSEvYnT9pdFZyhKhF5SP
         3q2d5iTwyB77B/rDGS+Xq3ULDAYAAr5FhqayeLf+M2+3UIqyaaSI6W0SFmp3xCMHxnGW
         ViY9DaCSCsF4T5c5ssrQ21WampV00rwe0cSB/ck95Fs/c5S6TMa66K4C7Qe11dpxTx0k
         L8fRpaTkD38tcst4Qv2VWH77aiwQy4NhMphoT5E5KZGIyPsqi7USCUVy2BgDLh3e1FZ8
         FaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379159; x=1793983959;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZG8DW65lYxNMhPsjCMAIqNHtaoCok58c1D0j+yEE9A=;
        b=wjLiXAzoih/qfOIPZMXGVK8wiDYj4GT9El+YmjryVqdUXlqnldvy4W84DdxLcsIoiN
         KHj01m5Davlndusz4P535bbY0blN9dP1Sg0V7e2/uHEnCeY+qPeL88qLQGKjK2hk9C69
         GHpr/TXKlR1Yne/tSwIsAo+1UL6o18hffc7fze8127pOTkYo+uaRSXDY9Cb0mO2y7f72
         1Qzq+C9ocmMh7T2z7tVnIPZOeVrVe8bqTKuIdlp2+t1GAyZKCuqOBSDnfrar4my4NlkM
         pt44RooeiK4V1tefaN9PbkhK9jImfgC5yFs5keiYK7LwsI5HrO6hVxIJNgWMLWERnvhI
         rzVw==
X-Forwarded-Encrypted: i=1; AKwUvByk30UTYkHniyXuWKDbq3KjuDn0tU/KwLYm9FUPoLwrNRfEGQ48g5KKEOFByoqIsuEiwP3abfkhbHk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvJRz772DIs6Zru1mdMCwkixH4qwGs7J7yzJo4l8lk+jZJ9O/w
	eDeHqpB26dUlNBgi/LfWX8e6Ije929cAY9oqaDFjX9X40fsnkGgVIZnszKs0kjNmpWw=
X-Gm-Gg: AYBFou2yTu5iEer89T04tGWyOMykkzGJQYYYJyF7JtRJovAQW3/9+Ur8bnyuYB5fZ4v
	mufR0F1qsZZwoBMzHGuBLX6/uLpcpkCQokOkFj2GunqZKZ/e1gOwYQ95RlY8eTuizq1SP8+BE14
	e1YMvsehQYUWgu9WfncQM4zsY3E+2RgLOBm/YktEDijMWjquyehYtp21xs9aYnDunnUVMMGlBEF
	9MRaX9NG7WkhHXoxHopXOZbExK2V4wWmyctusXYK94qflR/c/cMXQ7N+Pa+orWXy/ebpRQUtTm5
	wi1DD6yY9rG/jtoR5faMwPjYrPL/LWwgX2Mp1VHrlx5IEL5v9vSr2I+Nrk4ZjZyWRaIECHc4zEY
	S88cwALYO+pIwFt8A7Jgstf71SgK5WbCVjoCGqbcpyxBYyAnx3oKWmriBvEyFmo1zjAZw4u4HM7
	MQfFpltrTLpZ1kEi4X+7MV4LMtIq19gdRyU99E043L8WI8fbBYZwpEGpbb1vd+gbJmVFU+g43b+
	w3Tg7KB6cz4bqPRdgLespYijc05NWH7R+CiE+nHfogwT1rHuqmqQv37TnUL8qNfSU9+CBMxE7o2
	/x+VIF6FksdBRKFyfPcFtT3fL9uS5Wq18QOdu6U=
X-Received: by 2002:a17:907:d40c:b0:c1f:983f:d8a with SMTP id a640c23a62f3a-c4ca7a4087fmr238307766b.24.1793379158505;
        Fri, 30 Oct 2026 09:52:38 -0700 (PDT)
Received: from [10.0.1.50] ([89.228.212.118])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdc3csm88828566b.17.2026.10.30.09.52.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 09:52:38 -0700 (PDT)
Message-ID: <361defcf-9268-40d2-a0ac-eebd51d5da10@zonni.pl>
Date: Fri, 30 Oct 2026 17:52:37 +0100
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
Subject: Re: [PATCH v5] usb: pci-quirks: always assert xHCI OS ownership
To: Rishabh Jain <rishabh.jain1198@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mario Limonciello <superm1@kernel.org>, Michal Pecio
 <michal.pecio@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260902052631.75c6068b.michal.pecio@gmail.com>
 <178832755831.50581.1058201741431375556@gmail.com>
Content-Language: en-US
From: Maciej Zonski <me@zonni.pl>
In-Reply-To: <178832755831.50581.1058201741431375556@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I tested v5 of this patch on an ASUS ROG STRIX X870-I GAMING WIFI
(AMD 800 series chipset). It fixes the failed xHCI state restore on S3
resume and no USB device is reset any more.

Tested-by: Maciej Zonski <me@zonni.pl>

Hardware
--------
  Board:   ASUS ROG STRIX X870-I GAMING WIFI, BIOS 1805 (09/18/2026)
  CPU:     AMD Ryzen 9 9950X3D
  Sleep:   S3 ("deep"); /sys/power/mem_sleep is "s2idle [deep]"

  6f:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD]
          800 Series Chipset USB 3.x XHCI Controller [1022:43fc] (rev 01)
          driver: xhci-pci-prom21
          path:   00:02.1 -> 03:00.0 -> 04:0c.0 -> 6f:00.0
                  (behind the chipset PCIe switch)

  Devices on that controller: Intel AX210 Bluetooth (8087:0032), a
  Logitech Logi Bolt receiver (046d:c548), a YubiKey, and several
  HID devices.

  The CPU xHCI controllers (72:00.3, 72:00.4, 73:00.0) and the ASMedia
  ASM4242 controller (6b:00.0) resume fine with and without the patch.
  Only 6f:00.0 is affected.

Kernel
------
  7.2.8 (NixOS, CachyOS flavour, so v7.2.8 plus the CachyOS patch set).
  v5 applied cleanly (drivers/usb/host/pci-quirks.c only).

Before the patch
----------------
Every S3 resume I looked at showed this (shortened):

  xhci-pci-prom21 0000:6f:00.0: xHC error in resume, USBSTS 0x401, Reinit
  usb usb8: root hub lost power or was reset
  usb usb9: root hub lost power or was reset
  usb 8-7: WARN: invalid context state for evaluate context command.
  usb 8-8: reset full-speed USB device number 6 using xhci-pci-prom21
  usb 8-4: reset high-speed USB device number 2 using xhci-pci-prom21
  usb 8-11: reset high-speed USB device number 7 using xhci-pci-prom21
  usb 8-7: reset full-speed USB device number 5 using xhci-pci-prom21
  usb 8-6: reset full-speed USB device number 4 using xhci-pci-prom21
  usb 8-5: USB disconnect, device number 10
  Bluetooth: hci0: Found device firmware: intel/ibt-0041-0041.sfi

USBSTS 0x401 is HCH | SRE (halted, save/restore error). btusb then
re-probed the AX210, so bluetoothd lost and re-created the adapter, and
the USB devices on that controller were reset or re-enumerated.

The disconnect was also visible: on every resume the desktop showed a
"YubiKey connected" notification, because the key was re-enumerated as
a new device (device number 10 -> 11 in the log).

With v5 applied
---------------
I analyzed three S3 suspend/resume cycles on the patched kernel:

  - two short ones in a row on one boot (about 13 s asleep each),
  - one long one on a later boot: 07:29:58 -> 16:19:29, about 8 h 49 min
    asleep.

In all three, the kernel log between "PM: suspend entry (deep)" and
"PM: suspend exit" contains none of the lines above: no "xHC error in
resume", no "root hub lost power or was reset", no "reset ... USB
device", no USB disconnect, and no hci0 firmware/probe lines. The
Bluetooth adapter stayed bound to btusb, and the YubiKey and the AX210
were still enumerated after the long sleep.

The "YubiKey connected" notification that appeared after every resume
before the patch has not appeared since the patch was applied.

The patch also fixed a problem I had given up on: my Logitech Bolt
receiver (046d:c548, port 8-6 on this controller) was reset and
re-enumerated on every resume, which made it unreliable, so I had
stopped using Logitech devices to wake the machine. With v5 applied the
Bolt Receiver works consistently across many suspend/resume cycles (this
is what I observed in daily use; the three cycles above are the ones I
checked in the kernel log).

Thanks for the fix.

Maciej Zonski
