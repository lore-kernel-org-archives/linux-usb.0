Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795678285;
	b=zM+3b/CcqkbMYYl45Xz/EeTGGSElS3rpod9iTwGkKRN8GzE8r7rcIVED97ym7Sh1IdEd
	 Wud1pVjm02tb3rZSaltA7R52Y708NT9CH7uiSKGlcfw9Hz7s0SfbEfX0GucnGVADR71cF
	 Dh0s2FahexenazhBWTQo6AgIVE8Ne4gSTcK+wEC0hgR0qiFcpQNqe87fBvggUEYHrqbUy
	 /sMH/W0u113yrrmlH2lVZfV/Lca0UADFFQRbyeJvxz9MdKi7sUf2N4QdQAwrwr6Pqjq2W
	 quXFK3si0YlyizsCiciM5hHbRFUmeikZfktvTxZ7KjsUJ+8jff7jG8XTuil/0tR/MzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=0MO5Sggy9dIKYUZzgsC6cSV3LFpYteqN8TEvQ5hWShQ=;
	b=MIsqcCcFLgYLnsY6HpD6CEFHPxGCCk4wQT+Qyv1vy7CwJ7n0Tz9Q8T7MDFzcN+FyuTfq
	 jkLx8ChrhcxzZEMh3c7ctKHNYyTLPgWr6iT/LKa7nRY5bCE2VBo6ifdjYrddlRd6H0Ab2
	 5P2cNMEt2v3giRZnerreD+unkwz0Ima0KHk77iWs7GMdSiw90QNhu+tLEVw7dfVSHi+yE
	 G/DX3r9yCQ0A5rRmFziMASSicINmP1mIlJElHJcslpiIrVpvFIWtmWuSh+zv2d4Ew+7Qg
	 loI0VLZJRDVbhYyVS10e8w15aGehTttiNr+9s7Bz2ysWl9iLMR3vjv6htpBczQNs1oA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zSCItGFg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B58606A336
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 07:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57B58606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zSCItGFg
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-71ad2c6491fso3962745eaf.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 23:31:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795678284; cv=none;
        d=google.com; s=arc-20260327;
        b=BaaNMNWvrsF7COTuGEdQyWQckTyLCFE9M6Th+W6UjjyAQEFM6lcLv1leStE/8njvRq
         Ugt7cmgmNkOBQnRWJXEmwowlKVGVyEFvxHRjyF2JW2VQm343trYuX1fwFrfrEfos+fn2
         lMIlFXplhP/7dlqV7pHtN88AMUd3At7Lk4lfnXrSvEKJL3WoBz7haWMTG0yIdHtbN3Vc
         lqCl+se7kNVg0ZVxahJ4nU7YKHIGTum+Ijj7ugE18XraSWaa7wCPo5DVSS44xPJ0neyr
         qj5AJSaaFzYIcAErVgjaCxjjLAIdOLQRQDtEEVSjxpI1XDJb1ieR4DaQnt+J1P9bfUbL
         sjPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=0MO5Sggy9dIKYUZzgsC6cSV3LFpYteqN8TEvQ5hWShQ=;
        fh=uW0XYUSLYx4DU/FDhFl9q/odVc0v6vpfh+gHDAJi5Rs=;
        b=Vtuj3dpq13Xx/QkzHvEzEnfGH4gjkj233Z/B5BAH/kgHmcHexQe7B/k64DbK+KEY2B
         R+iB8XLZ0znOY3S/NnVpswCeZprIFS0A7amKM3+rdHjP32nRyqvKkjxPGVD454fYjPfQ
         lkx63AJbcx4Hmiww/rxKevkUX60FMEIq23Oh1mg+x13cPUty1syu8snPwlQjLeU0airR
         YFVRlwH/6iKHkjtYr0P14QaAV7HOOndugo9CvjrMZVDVKI3KOgy2wZFkR9p/BZJOtKkN
         lFzND+kYgDek0L9g1x6ZI4s9B2/8rPhzPQ7SeL1MgOwo1I2tuV8YAGy0+3wj3sr57n1N
         xnTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795678284; x=1796283084; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0MO5Sggy9dIKYUZzgsC6cSV3LFpYteqN8TEvQ5hWShQ=;
        b=zSCItGFgjikK+EzDGuJrjO2zxnjTktx5pyLB+lZc4K45wJzk74hs1TD68+RWi8ktnV
         1pXRLVWowwQGEhYv7cnesFN5kE4NYJidyl1+5KkKJBT/IL1utO+/hNKsz4SZ5HpVE52t
         jJS+u8sXAFId1Hz2nwV7LvgEUqd2qu6+Gue2uVjZGVOqQrVSKBT6ROlAkCiHAgJblCPd
         ZDaD7F6tYfWwb4T5ekJniFKHU9PMNjqltSJBsFpex5iQ9pwZsIAjRgJ7HnP9TYYvMiU9
         275cNahrjvqrWj0YNDe2BmNTZGxdMI0CnYLkv76jQcOS7/lBfQJoWjmfiB+ZuM9XvE0X
         LoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795678284; x=1796283084;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0MO5Sggy9dIKYUZzgsC6cSV3LFpYteqN8TEvQ5hWShQ=;
        b=ViCZQW3u9/SEtfa/b+eU6834RoR0zwX+2MPDnNBgkF26Otr3w6su4Ouja1aUg2wKSZ
         sba/r3uAmiUUxNUs4afo4cUuoB4PrgC0/INrAh1NwK5YiAa5SpvQc8BLqDh0W5+oSSx+
         CpvNU5Tgl059eNzH1UevWHbScW+W7GyZrDEbn3FkielKFKz6IEW83rukCqK4+zIYq40G
         PcSIfu5lWAql9dMbkBD4Gie/cooq3kaxH3MCjpqkVYZyPFo5+xYWjX+q9CPlxhU/crIz
         Q9qblTsBC6W+9h+PyWvXf2p+XDh2QeDkVtclkPXSoH918fuxZawOiCfbC8lRWsHzn7CM
         KXUg==
X-Gm-Message-State: APuU4Z+7kecaJUKGq9PeG4vGbCLcBL9oJfTcESFwXL3JTKJxU+Fmn8qR
	2xA4z+ruzm82Cda/WNu6dP3ofbVJYyKUqswfdeML1O5YY1EkfI14T2W1b3WTkxi/gVf9kv4Whaa
	N9DwvbjPimQiRQpKXs9u3wQu7TCsskjQ=
X-Gm-Gg: AZFdTZc3PPo6WJbb1ieGXrHLAwAoVNyN1q9J3WZH303RUiUBiFDoo+MtY0futcB62nd
	xEE2AkE2WiPumiCWkJuyzWmGbSkwdAPOONtYlVgQw6mXujsZ3O+H7//P6F3yP8tk9RqED9H93VS
	rqEjvVY06rQFwu45+XIaHfJHA1dvfym9tIhL4Lh1K1TiYeXRzS8U2zIDzVBICl09wWXmc3N1JM8
	eFmSWuGepdlj8EUHDAZgRNtWTL4bDFMGJsBOpouVO7sv05w0Yg1lxt+kQAZmBNl4RtbigODxQM6
	NPlCPqXXkZAffjIGV4mfSRgue3+FKTXRabCACbJ622BthwCyjy91mkodMyoRIGrI3lZFInm6zQK
	nNV+o6Krw67NhRCCn5qAxykMUKez/bwiew1BjoCfttsHm/LcSmOIjDYmYgWA4Pmr2AA==
X-Received: by 2002:a05:6820:f02f:b0:71b:7deb:6545 with SMTP id
 006d021491bc7-71b7deb6b6fmr2348857eaf.15.1795678284270; Wed, 25 Nov 2026
 23:31:24 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 01:31:23 -0600
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Lee Youngjoon <getfeus@gmail.com>
Date: Thu, 26 Nov 2026 01:31:23 -0600
X-Gm-Features: Aa3M54pLCS9IJOK2jzXO-IchEHoyTH6C6_20WaxUIm41poi1YX-z4yURil-io3I
Message-ID: <CA+m4KrA14J-3ovbau1EGjvwc1R4Maya3wzqD+n-_khotDhcRFQ@mail.gmail.com>
Subject: [PATCH v1 0/2] usb: typec: ucsi: gaokun: Validate and defer port updates
To: Pengyu Luo <mitltlatltl@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On the Huawei MateBook E Go the EC reports UCSI connector changes (0x21)
and USB port updates (0x22) on the same threaded IRQ. The connector
callback currently waits up to two seconds for an event that this IRQ
thread would dispatch. Also, a failed port-register read is handled like
a valid empty mask and can generate a PAN acknowledgment.

Patch 1 validates the EC reply before selecting a port or sending an
acknowledgment. Patch 2 moves the missing-event recheck to per-connector
delayed work. A real USB update retires only the matching recheck. The
existing two-second interval and the first-set-bit policy for a real USB
event are preserved.

The IRQ wait and the mutable port-count bound were also raised in this
earlier review:
https://lore.kernel.org/r/20260607214621.9586A1F00893@smtp.kernel.org

Testing was done against usb-next, building an arm64 Image and modules
at each commit. To exercise the firmware-facing behavior without moving
cables, substitute the D3 register reply at gaokun_ec_ucsi_get_reg()
and capture the connector argument to gaokun_ec_ucsi_pan_ack(). For a
two-port reply, use update mask 01 and port data 04 00 02 00. Queue a
right-port connector change and let the timeout expire: there should be
one D3 read and no D2 write. Next deliver a real 0x22 with update mask
02 and port data 04 00 09 19: the driver should process the right port
and request an ACK for port index 1. A valid zero mask on a real 0x22
retains the no-port ACK. These cases replay EC outputs on the host and
observe the resulting firmware inputs. They do not emulate the EC's
decision to generate a new interrupt.

The two patches use the existing EC API. The separate EC transport fix
is needed for the parent to report all short I2C transfers reliably.
This series does not add speculative firmware ACKs or change DP training.
The isolated series has been tested in host-side replay. System suspend
and resume on hardware remain unverified.

OpenAI Codex assisted with source inspection, the fixes, regression tests
and drafting this series.

Thanks,
Lee Youngjoon

Lee Youngjoon (2):
  usb: typec: ucsi: gaokun: Distinguish empty updates from EC errors
  usb: typec: ucsi: gaokun: Defer missing USB events per connector

 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 138 ++++++++++++--------
 1 file changed, 85 insertions(+), 53 deletions(-)


base-commit: 90d6263e867be7089b3d3323bef8d2accd327c77
