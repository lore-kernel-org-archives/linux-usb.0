Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794144852;
	b=YWzXA7AkYXYXo1DLZehWzfUQSkw4uNlmyAvBbLk2yomBo4S3NIvyi9770ODHZVJOMibA
	 UX85X6Nk0K9sZmFV4gNZkmw9vxxRfffUcDwuWoo/P5oO8+XL9La7U3Zemxegla+Ul6kiV
	 OfAiyuB3SFvA0RDjFx/PEDBrOVzdKf4zPaSIYnqGwyG51CedS6fSW4SKSuEyV8UIzC0bu
	 yQr/4qdE63CH+kuRCmF0l19ZIOFutyWcalJHmPWtcFDkr+LDnAZU9mOtu8ZZHDEPx4bTJ
	 TBiZ+CAKOHBxxwoqnTZLRehl9sMcw5i7oQI8Qhz1vKf+udR9W4hESevUrtGuWlT2H3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794144852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=WqqCEjBjFTz/7JWOrhHOCcopzO2CMgNevCdyqdkVM2g=;
	b=QcW02C1qvqLIz9FWl68svOYYThnwLjEaC3lWEE+lO5p3X3A/eqthn2xdf4f3R5WRYyQc
	 bkKPTTgd/KO6lZ0lzX3QwV8VoqwHPsyej5sT44pBO7ixEYwG/V82kdrIJszunDUjIpdex
	 VC13vOGEa0ljK+/WvpB5BAZkmsuRdcnNNnRElJGGPzkaVuZD+gR3QeWPh7k0Vx9nJoLIH
	 37ztPOb+9jkIlGii8bstA3Ai59bjwLgppqrrk4sgcmb23w6W7rzjjxlX6KS+hx70zPgdz
	 UwbLCSF1EXPijOcCG2j/habeQVAs84bR86K4EjxwrM4N8IyxxsoPMADUQt1oO9IEtFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="C8IJRU8/";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C5A606A320
	for <linux-usb@vger.kernel.org>; Sun,  8 Nov 2026 13:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16C5A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C8IJRU8/
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so349085e9.0
        for <linux-usb@vger.kernel.org>; Sun, 08 Nov 2026 05:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794144850; x=1794749650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WqqCEjBjFTz/7JWOrhHOCcopzO2CMgNevCdyqdkVM2g=;
        b=C8IJRU8/cWjiRvuGWCsvSlg5moRUe+xwzyIrkfA1kbPLEslpCnD+N8gt4g3UCTrAJu
         XvRohtunyoUorBXRMO2faBCnNpG81bUoLqkcfc/A+dG7S56Z7XOar3NOC3a9ZB9ileqZ
         D+nI5A+3LMRNtb9C6/150hmxKt6tWagfNmJU497iXyLB7cCIP2FiVi7h4IWdLcgKZXAb
         fA/VKWwioAs6jDVl5zflLef1HRvMiNFMQuNc47TI8WEC20gRfQ+XFQwcj0GcjiDrGcqD
         LcRfKqrCWWdZ5ajcoT2Qlya5xyfRaT6KIL+pepPPCJ+JqGTMs6C2bEoIFGTfXD/sXVHV
         T9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794144850; x=1794749650;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WqqCEjBjFTz/7JWOrhHOCcopzO2CMgNevCdyqdkVM2g=;
        b=TwFG7B/b+M0BjyW4pamVVn+TZcWe9A+8YxMrgy1X87gcESmt0Er18l/VW7EqdTRDHj
         vnO4SSCo/qUMcWF8QOrFxkx4CkN9ExrLCEEnt8qH1QoNRKTkTIjgMqbCDaaeES+yFKw3
         Mhe8Dvei7ys2sXmlpRm7hjZqNgfy6wnwmyDPpk+7qjwFhw1593n31NluYM3JQKgiLSW1
         JJjG5e9RfG9tqsjsdwdFrjwSsDKks98iaXLXX68UlnT8f6YVjH2Q4dfD4uF8qjExVSgI
         +pwV1MwM1gwKIEIo+EXOgMn8AI03n1pQy/5qSr1QmIY5MSzhwC/G0IBSC9lUL2RI6BXk
         bbcQ==
X-Gm-Message-State: APuU4Z/p0EBv86eiuttx8U69/4+v+Hz9U2XWZI9WYQIaBNdcVqBGqHrR
	A2EWSI8ofzkmyKH8x+j6bJ9JxrvXpxhjxa1P7QEcpQc6q1QSepLit3lC6E70Zg==
X-Gm-Gg: AYBFou0l21d7qXhoMEDLsX995gL+FG5CH3zejgrBvVzo8ftPYzXZrRDRwWI60xfVEwY
	9jcV0Kq8tip7Rh1mJxq/nyT7/ZhkFnNfWncmxPkpIGbylzCl26e+atmMOTnr6q3+kmAnJkwVSPv
	qHGIdbYUQRsc9k91wFsK6izU3HzSAOyVBHkEte8nf5mG51h7LItLXYUksxOmZ3fwW/TL5cFTVIS
	+nmls/d3aLWc9XrVmlHnTykfqS599ojfEd/IoblR0G9nY9Kvvlv88oPOBsT+J4s4WaiRtHy/GHK
	gX4NDn4aTVtetFgT1JxHLknWZodvns+BR5Na7iMDN232fUF/VhhMO11OCPWtUELgJ0vlsCe0Vhc
	FljnA+FvoTzmWaFIInGU3jbQCi9xBGVZsGPSox3SlrpQ9tDvteNGvDHVKXM8m1MfUCYs45RIuU4
	J/Kof/NhnjTZM5uuEFSCm8AHlzrda++hC1VkewvdNxGX7hLwdEYf6AcUhfHD1AeQ8T7pGLyS2AS
	R8X3Wc+S7WUq3bIrwcUV5ZB3k8Ew3PBOV8q2/BbA15/fN6r2JrTP1dO7dJ1KVpP8qRmezCWxWe1
	1BQbZ4DFSVsnajVFZoni9qx36sQlpO0YVEyMWCTIMzhbId9nHJWQWcJnJTe9yAwU6gIhX3Hx0ZN
	KC/EusGLzUUHowxhbTf3t0RkJsMUbRhYDatTslJq+NjbBUQ==
X-Received: by 2002:a05:600c:34ca:b0:4a1:e92b:ae4a with SMTP id 5b1f17b1804b1-4b963c91362mr25383465e9.21.1794144849702;
        Sun, 08 Nov 2026 05:34:09 -0800 (PST)
Received: from 01-linux-usb-report.eml (host86-185-73-183.range86-185.btcentralplus.com. [86.185.73.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f38e2bsm4196074f8f.8.2026.11.08.05.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:34:09 -0800 (PST)
From: James Taylor <jrtaylor11@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: thunderbolt: AMD Phoenix USB4 host advertises Gen3 Support=0 in SB LINK_CONF with TB5 device, link stuck at Gen2
Date: Sun, 08 Nov 2026 13:15:45 +0000
Message-ID: <1794143745.17311.hermes@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

(Resend as plain text. The first copy was rejected by the list for HTML.
Mika, apologies for the duplicate.)

I'm reporting a link-speed problem on an AMD Phoenix USB4 host with a
Thunderbolt 5 (Barlow Ridge) device. I think the register data points at
host firmware, and I'd like to know whether the connection manager has any
supported way to influence it.

Setup
- Host: Minisforum UM890 Pro (AMD Ryzen 9 8945HS / Phoenix, "Pink Sardine"
  USB4 NHI 1022:1668/1669), BIOS 1.06, AGESA PhoenixPI-FP8-FP7 1.2.0.0a
- Device: Minisforum DEG2 eGPU dock, Intel JHL9480 (8086:5786), NVM 62.42,
  vendor 0x41f device 0xd002
- Cable: StarTech TBLT5MM50CM240W (0.5 m, TB5). One retimer is enumerated:
  1-0:2.1 vendor=0x7fea device=0x1032
- Kernel: 7.2.15, software CM, thunderbolt.host_reset=0 (also tested
  host_reset=1: same result)

Symptom
The link always comes up 2 x Gen2 (rx/tx 10.0 Gb/s, 2 lanes),
usb4_port2/link = "tbt". It's deterministic across replug, host_reset and
reboots. A USB4 v1 device (ASM2464PD enclosure) on the same host port, with
a different cable, trains Gen3 x2.

Registers (debugfs)
Host 1-0 port2:
  LANE_ADP_CS_0 = 0x003c01c0   (supported Gen2|Gen3)
  LANE_ADP_CS_1 = 0x4828003c   (target Gen3, current Gen2, width 2)
  PORT_CS_18    = 0x00002f00   (TCM set)
  SB 0x0c LINK_CONF = 03 d3 03
Device 1-2 port1:
  LANE_ADP_CS_0 = 0x0cfe01c0   (supported Gen2|Gen3|Gen4)
  LANE_ADP_CS_1 = 0x4828003e   (target Gen4, current Gen2)
  PORT_CS_18    = 0x00902f01   (TCM set)
  SB 0x0c LINK_CONF = 03 f3 1b

The two LINK_CONF values differ in bit 13. If I map the fields in the USB4
order (enabling decisions, rsvd, enabling requests, rsvd, bonding, Gen3
support, RS-FEC Gen2/Gen3, SB channel support, TBT3 speeds, Gen4, asym...),
the host advertises Gen3 Support = 0 and the device advertises Gen3
Support = 1. I took the field positions from a protocol-analyser field list
rather than the spec text, so please correct me if the layout is wrong.
Under that reading, the host's link characteristics exclude Gen3 even though
its lane adapter supports and targets Gen3, which would explain Gen2.

Experiment
With a thunderbolt.ko built with CONFIG_USB4_DEBUGFS_WRITE:
- Writing "0x0c 0x03 0xf3 0x03" to 1-0/port2/sb_regs fails with -EIO, and
  the value is unchanged. So the host router appears to own this register
  (set by platform/PD firmware).
- Toggling LANE_ADP_CS_1.LD on 1-0 port2 dropped the link. It did not
  re-establish when LD was cleared, and recovered only after reloading the
  driver with host_reset=1. Possibly worth handling separately.

Questions
1. Is my reading of SB LINK_CONF correct, i.e. is the host-side Gen3
   Support bit what limits this link?
2. On AMD USB4 hosts, is there a CM-visible way (router operation, port
   config, or reset sequence) to make the host re-evaluate Gen3 support, or
   is this purely platform PD/USB4 firmware (cable/partner VDO handling with
   TB5 cables)?
3. Is this a known issue with Phoenix/Hawk Point hosts and USB4 v2 / TB5
   devices or cables? (Bugzilla 221822 and 221319 look related but describe
   different symptoms.)

I can provide full debugfs dumps, dmesg with thunderbolt.dyndbg, or test
patches.

Thanks,
James
