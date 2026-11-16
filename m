Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830454;
	b=PKmhxbpqWpaBRyHVf5jM/6JDZv1kobuyM32iuS5/w4nU+bzJUlnw4YP7vmLA+oboVh1Q
	 xdkQFkE/KrBp3n9DBr5v/b9et1bXgAookcqaBjeLu+KOFRJuifF0dHESrwO6LHMXx3c1z
	 oj+TDyJZ4iVfQAjHtS6lJHim5rTIzmoOTTIDmqjBfEYp+HNw0rRXmKybt44HBh/s2XLpn
	 iiv8O+ToJJru+00Ny8BZ47xZzDUAJqevONyBvvs07VR1DMbsjPev9FWbuC8lj2oMrdVN/
	 Y7SMjqIhJ78EN6Twrjr1PrUhvcP7J3z15sC+voY/PtzY7DsBxmrR6UWwAdWU5f/rfUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7GrrfPTtSiFf3eqOfS5BMereeBw05VZ56XZNeLfVvKc=;
	b=KpJBBwBnjKRrUGYY81DT7SSr8IKDbVIg2K76b8KiJGndec3vXQ2UqB/SUv5yS+Ktx/Js
	 P7qPaMtvwZiaHIb1yghlb3FMh5tsD/PxXaJ2yw09dVzcNbIBvGTPlc4VK+059F46lNnD4
	 lgEJ38JknAwzYFxmshfCBEHQBaK8NQuIhWe3PfkcQp1pMTBhqZ5QXUsCHIuJHlgIxErP/
	 MFSxoOJelZG9wDGiaWPWEJBD0rsXr/TZaN5Lct5YtCvpAW+55bE6PFQc1dl2/i3UMI/kR
	 AVscPv4CPC9cKEfCd007lFFhMd/vdewOrFiO89JlxRv94yCaJlSrvsxNDApBEQkcn8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OJ1T4FZP;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B6E606A323
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 12:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04B6E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OJ1T4FZP
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso22322915e9.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 04:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794830452; x=1795435252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7GrrfPTtSiFf3eqOfS5BMereeBw05VZ56XZNeLfVvKc=;
        b=OJ1T4FZPLnEjhpZLRMscVm6TOrD714DlttVfFF9Pcqur0ovOiJigLjAYbysaNsYEhK
         p0Cp4RLKGHi8p3EUmd4ZHBMhfUTeJpXA/HArJL0ahopo5ab/POfIaNcD8vAp/m8vRlMQ
         v8lhaheuFY6Bg8YyyeDyH6SQ8pe3+LnMZXkkR1x5E0z0FTfM+IytG9vEF5PjnrwL1GIq
         jrgM0IC+/j7kCK+wk//bKWutt5fJeR18H44UYjA76NrmI4pOa2ccQwnbSOChGpTjPS5Y
         zPlEjiX6SQ60rRpFgCBbkt1UTKi1z+WkitWjT2RjYz9pKGbfX8vvWW31msbJDdu4o4vY
         96Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830452; x=1795435252;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7GrrfPTtSiFf3eqOfS5BMereeBw05VZ56XZNeLfVvKc=;
        b=mlS/095Ne9xTFg+AVngaJohqBkJSogfR9zIB44IMYzX+zIMh7Obg6NFLP5fuVLSDIe
         Fl0XU2vGNLLH+wPJWjOKBOZbox4SPp/+9g4Jp5p7XBP9TLxPzk1/+X/lvM3FWKssEm+M
         GL0uEgggNJriVXmic8z1zOBW2tSMXcL9/z6+mXygVKR5eZng979rEX23x/rVCBsqlbnD
         tPTUad50muuDUbXzbMKA1uuS2pYVL6DovtrvbCV4xuo7DR/FP5asAwklBDwbR3m2A8QU
         BP1VQJwNsyxkKD7Qm2bx6+/R0+Rq+czKbxOkVy+M0abzNrakCH7vTXKWS+FoZ0Q/mboT
         pmOg==
X-Forwarded-Encrypted: i=1; AL+hErGPOwG6yJXjfGQR2hYatdyBks2Rxhv9oeEdWvVc0axfyHno9OlON9FXbafbMi9Z4TRyFfSEhjFjdzE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sjqP0x18ACbxjwiBFqtqZ9e8qAWlGrujyZ0Amjxz9VJ+ER4VA
	ADxo/yLiigieNzb/M7CoGruuBzZgI0rNoJ4LEiy3q+zxc16XZSatkrYk/YMoYHanQ5o=
X-Gm-Gg: AYBFou2pqyGzMXJUtYI/8OtKHUcA8KYnRJeLs8fqQONGy0/cezAHNIrSMTFoKFD/j67
	1phnbqCQ3PDK+p3/6NcveAsZb06PEEDWxSn/4J1WdnqW1MuJFsz9n4b9lwt1kka4+y2Ibu5aM4d
	SyUwPsOlc+E02Ez7XbtpBe8fLfockvNl39rgLHU49IhjvNpbWEMrzwCSsPFRIDnH8MgxJFtLkVf
	16hL0J8IN/BIXcBKwaJzQIAKEHu26EqSN4OEgOiwTUYBMuzoQZQkkk/3XIhBpUg8V0b86gV2Zf/
	uDwjUZdFLS6YTBzEEHn3z5hRD08a+O9FcSww/VnMqZiyptcd7p3K4vLTbzBQ7c0vYtHSEEnZHeC
	zQF0XlC+Lu6RjV0hcwCWuWUB7R2i4V8QFCY17JMew15oOZrdixZzITlS7YgLjT9i9Zz+Ua3C4Tw
	ApanoRhD+C4KCphKeaYeez0XgQ3TkVq1yEs45uXnr2BbtfSmSj+gvYeW5gTa9sny++UEbZ93KJm
	OH2CioE8HFTJi4HXhWCkQaf1k5hUi4351iasyQZCZGHCVV/NUtefNoAMv/Gc67eVfuRhrXy4xKM
	hfQzldpdlC33iXTyvvoyH4+5OIvBeztVUlLPQI6o6aQhT0zZxMp86mUugf2pB1c9nYGdPgaV
X-Received: by 2002:a05:600c:b86:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4bb55a67c61mr228790365e9.26.1794830452167;
        Mon, 16 Nov 2026 04:00:52 -0800 (PST)
Received: from ?IPV6:2001:a61:13bb:d801:1801:5442:bbc8:29a9? ([2001:a61:13bb:d801:1801:5442:bbc8:29a9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f6a40sm110447535e9.2.2026.11.16.04.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 04:00:51 -0800 (PST)
Message-ID: <69bbe579-d296-4bef-bd0f-da30f12b466f@suse.com>
Date: Mon, 16 Nov 2026 13:00:50 +0100
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
Subject: Re: [PATCH v4] usb: uas: ignore UAS for ASMT135x bridges (174c:55aa)
To: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>, linux-usb@vger.kernel.org
Cc: stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
 usb-storage@lists.one-eyed-alien.net, stable@vger.kernel.org
References: <20261114174929.53871-1-olivier.kaloudoff@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261114174929.53871-1-olivier.kaloudoff@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 14.11.26 18:49, Olivier Kaloudoff wrote:
> The ASMedia chip detection in uas_use_uas_driver() assumes that every
> device with idVendor/idProduct 174c:5106 or 174c:55aa reporting a
> config.MaxPower of 0 is an ASM1153 with working UAS.
> 
> ASMT135x bridges (iProduct "ASMT135x") share the same 174c:55aa id and
> also report MaxPower == 0, so they take the "ASM1153, do nothing"
> path — but their UAS implementation is broken:
> 
> - The first READ(16) issued by sd probing times out after 30 s;
>    enumeration only completes after a uas_eh_abort_handler plus a full
>    uas_eh_host_reset_handler cycle:
> 
>      scsi 3:0:0:0: Direct-Access  ASMT     ASMT135x        0  PQ: 0 ANSI: 6
>      sd 3:0:0:0: [sdb] tag#26 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD IN
>      sd 3:0:0:0: [sdb] tag#26 CDB: Read(16) 88 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00
>      scsi host3: uas_eh_host_reset_handler start
>      usb 6-2: reset SuperSpeed USB device number 2 using xhci_hcd
>      scsi host3: uas_eh_host_reset_handler success
> 
> - Under concurrent load the bridge stalls: all inflight commands (20+
>    UAS tags in the captured incident, mixed READ(16)/WRITE(16)) hit the
>    30 s UAS timeout in the same event, forcing repeated abort/reset
>    cycles and eventually a USB disconnect.  Writes dropped mid-flight
>    during these resets returned zeros to the filesystem (observed as
>    XFS metadata corruption on the mounted volume).
> 
> - Sequential-write throughput is ~45 MiB/s under UAS versus ~136 MiB/s
>    after disabling UAS (usb-storage BOT mode), which is fully stable:
>    several tens of GiB written without a single error.
> 
> - Bulk reads of healthy LBA ranges do work under UAS (~190 MiB/s, no
>    errors); the failure pattern is command-timeout at enumeration and
>    under queue depth / write load, not a broken transfer path.
> 
> An extended soak was also run at maintainer request: the device was
> rebound to uas and pushed with ~640 GiB of mixed I/O over ~2h45
> (randrw/seqwrite at queue depths 8-32, disk util ~100%).  Result: zero
> uas_eh events; the queue-depth wedge did not reproduce on demand.  The
> enumeration stall did reproduce once more at the first UAS probe and
> self-recovered via host reset.  Per the maintainer, an inconclusive
> load test still warrants the blacklist given the filesystem-loss risk.
> 
> Since 174c:55aa is shared across several ASMedia bridges and enclosure
> rebrandings, distinguish the ASMT135x by its product string — the same
> approach used for the HIKSEMI MD202 check a few lines below.  The
> product strings of working bridges using the same id ("ASM1053E",
> "ASM1153", "ASM1153E", "ASM1351", vendor rebrands such as "YZWY_TECH")
> do not contain "ASMT135", so the match is safe.
> 
> Verified on an ORICO C10 enclosure (iManufacturer "ASMT", iProduct
> "ASMT135x", bcdDevice 1.00, stock firmware) attached through an Alpine
> Ridge TB3 dock: with the equivalent usb-storage quirks parameter
> (174c:55aa:u) the device is completely stable.
> 
> Signed-off-by: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>Acked-by: Oliver Neukum <oneukum@suse.com>
