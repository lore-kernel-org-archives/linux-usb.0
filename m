Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378492;
	b=qFgLgposP28+Mf//3zsm46hIcLwqbF4T5SMgigxD1v+0pvXAnDHlt0U1Ji3R+QzOQ+8q
	 bzTvPwPX/hPRFhUAsvNoCYbA3vySCr2R8IpwtFMsqJ0tWdEJvs7YJi4GiWNTILqOLAjBa
	 KyInKGtJ/Lzk7dkvgI/8LD/R6bculkVoRfwC8kDlzwuCUubWASotBftFZT2ImQiynBXTt
	 dfPL857bNhPZT5DznHUi9WhuVexC8ii8zY/MnBw2S7C4T3HDXcSYUDWPoOKued+djXG6N
	 9JxDF/80z/nYivGAQExg+uOeFUipDXB8HXhzX2eUI0YgdgvIeWJUo5512+uS24qTx2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=0Km0h2iOCvFZqTKILVGhHRK3Gv7l7EoR1wSPCZ8eiUA=;
	b=Xr4HYKpJTtqPqehWLLjj+xzqUclvsdlHs+gt+EM7SyJ4JFMH1a1xEaTwjeS/XGDzxGQo
	 Z2FDLcLdMz+2+iJJb774D82m8ePnboFO3eDIwBfiggQ12x9lXOUwqJi6+9VaIVYyNykG8
	 sWZY6GYEAVmeO+Rbw2R6wMtn3/JKC3aaVRQzSnb1+5MkhQTK2RsOY0ym9lySFUMRp3V2R
	 4h5ruxSqs+37iuI4RxZWtI4pqldaG2mvtDSw6Kef7BGugLotyePEL3rWTW9uOWcPmRexi
	 BWAcQoGNYfXqBkGZzz5fJfAyXY+r4YRD8wxa2taEreMwsfspx1FsQsTqD6YbcOuIBvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tooangel.de;
	spf=pass smtp.mailfrom=tooangel.de;
	dkim=pass header.d=tooangel.de header.i=@tooangel.de header.a=rsa-sha256 header.s=google header.b=rOHokmDF;
	arc=none smtp.remote-ip=74.125.228.133
Received: from mail-ej2-f5.google.com (mail-ej2-f5.google.com [74.125.228.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1540606A31C
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 16:41:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1540606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tooangel.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tooangel.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tooangel.de header.i=@tooangel.de header.a=rsa-sha256 header.s=google header.b=rOHokmDF
Received: by mail-ej2-f5.google.com with SMTP id a640c23a62f3a-c46872a230eso48167466b.1
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 09:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tooangel.de; s=google; t=1793378490; x=1793983290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Km0h2iOCvFZqTKILVGhHRK3Gv7l7EoR1wSPCZ8eiUA=;
        b=rOHokmDFDRfQKns4VT7CcIfPGMluZB89bJdoJsiqN0exEO9UPQF0NfE6FddRSNK6MI
         etcW7X+87KnDYd6V7S9CEa68kcOT/N78WoWM3fWumrjBtWX3on7qG7slxk+r3PB7fgya
         AubLIZTw3tIFtSJCMVFPLdUaHzMox91gYyanQi/ZxEGoGOP10W0xnMlmdbmmRXVacT3Y
         lESBfAmkANw+QtaHwhjswrgER/ovXeeppTuzpWh7L50B+7Q8EEyx0YAyJzQ/J8h86lCd
         SZ995d2q0jgQhVEM9eKGfX8u0H62wblvfHSGT5QrnL8RbBWnFH4RRu4dxJCHwRRZxPFB
         PL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378490; x=1793983290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Km0h2iOCvFZqTKILVGhHRK3Gv7l7EoR1wSPCZ8eiUA=;
        b=rYH7/dqdI9TL9qpwdb4xfvcXufd35ytFzaX4iRuXBZgOCEo+odpp+LR4IkAxSficad
         lqfNWd6dh2qTpS7aHKHTXwikPtt768HLE1HkI6RSxIv2V4850O84lLdipIXai2l+ulFM
         ziFqJ4fPFaVmVtC131gTzIQn2Jf4Ho4yvFfZypUW6Ojf7dDbBpWK2CSujiVcV7VVO3/J
         5jfBxi4BByQLXOuPJ1fZcvsNiryGg66MYk1+2jlR8QPqI0tpLqi5gQTi7us4hLBjmxsw
         VtV/DDCE4FXDEQbrVSjOWPynPHvzXj0zn3r3Pl3PWr6yEkV3u0dbBGkynXrY8eQ14U9H
         s5dA==
X-Gm-Message-State: AFq9FYIM3RNliFEp2q2p5jjQbKcJFN2tvikhw9jSleuO+56Cds4VS2qJ
	nxDpcg5UqTy1qwpj+AMUTVpFy59I9343H9DliefE/3XvIkBOUL0Bg75fJxKawqrZOkbTpJV1uLp
	5Y3OUWom0WmEi
X-Gm-Gg: AYBFou1KPfmQewW3iz9GdEXcq3k78WgwuLXs8SzFlqrSg/H53O5CDyltY4B8hc1xCPR
	H93ESQfHkRHsLYJjgSh5jIV86y5NZMkwXDifBSsdKd88YSjhZ8Pg6ZRvuDr+oFOhQZbt1Nk6+dm
	X8lV6zoPtuU9LGoJFLbmFzEOy0uQAz5bfQHEEnCKnzEBwb/0cunhYw42BZw32wZriaThVJi5Z89
	XwxdnT1qnS4oUcZqNXKJu46LMgZjjajAQbBh4u3ob7SdwPTiMcB1hfiKBzArq36IyXYYK7tVZaB
	APNN9AfjOsDpJ5LO5asLPGq3oTCW+4kDyBt0sUVJ4LpAn45KgjAQIDUXcWH2REidlTS0T532PmA
	i5pwqOfKGtCX5TIOSkq6R2qEf8XuYQXO7IrhQmbYiErN7s0e32miFjLLk1s1jTujNI6qt638yeo
	sRHa/DTe/lihB7rL+slt23vr1gEthSTswaMR2nOxXusGRkTo4U5EYYB0yZOadiVBkWT1SlPGWTl
	IvPejCT22I3Iliv1HNm6ks23tVx8BIGATCJpewo2xs9jOxynMdLMUb6+bJ6nsuSGLL6SQRn044n
	1UNgI/rkmtgJP2XbTRM0U9xIknp8DYAzZ+qLYbG5F2JML+BhAirG7C+Ak3CIsnyyDveBiPvtUHr
	nViXx2Lq3xefifJPUEEaaKWGAzszN3It8mB3rNKT1bRjl3B/bTQ4FT8TLoncWoUa7CX+t8bI9Jg
	nxiY0zdgDpA9gRvNOH35l4ZBvY0PncM/fz+xQ=
X-Received: by 2002:a17:907:3e0c:b0:c49:df95:fd0 with SMTP id a640c23a62f3a-c4ca7ad10a9mr270734666b.48.1793378489988;
        Fri, 30 Oct 2026 09:41:29 -0700 (PDT)
Received: from toogaming.fritz.box (2a02-8206-7d92-9800-4604-5ce9-83f8-6c5b.dynamic.ewe-ip-backbone.de. [2a02:8206:7d92:9800:4604:5ce9:83f8:6c5b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe52689sm88314366b.65.2026.10.30.09.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:41:29 -0700 (PDT)
From: Tobias Wilken <tooangel@tooangel.de>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [BUG] ucsi: HP OmniBook Ultra 14 (Panther Lake) negotiates DP pin assignment D, no altmodes registered
Date: Fri, 30 Oct 2026 17:41:00 +0100
Message-ID: <20261030164100.163449-1-tooangel@tooangel.de>
X-Mailer: git-send-email 2.47.3
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

Hi Heikki,

On an HP OmniBook Ultra 14 (Panther Lake), DisplayPort Alt Mode always
ends up with pin assignment D (2 lanes) with my monitor, although the
monitor is set to its 4-lane DP mode and its USB hub runs at USB 2.0
only. No altmode devices get registered by ucsi, so I can't see what
the partner advertises or try to select a different pin assignment.

This looks similar to a report on the ASUS Zephyrus G16 GU606AX (also
Core Ultra 9 386H), where the firmware picks pin D even though the
monitor only advertises C/E [1]. Two vendors with the same symptom
might point to shared Panther Lake PD/EC firmware, but I can't verify
that.

System:
  HP OmniBook Ultra Laptop 14-kd0xxx (D5EJ3EA), BIOS F.06 06/25/2026
  Intel Core Ultra 9 386H, xe driver
  Debian 13, kernels 7.1.8 and 7.2.11 (same result on both)
  ucsi_acpi + typec_ucsi; no ucsi messages in dmesg

Setup:
  Dell U2722DE (USB-C upstream, fw M3T107, "USB-C Prioritization: High
  Resolution", MST on) -> DP-out daisy chain -> 2x Dell U2515H,
  all 2560x1440@60. Cable: Goobay 74202, USB 3.2 Gen 2, 100 W.

Observed (/sys/kernel/debug/dri/0/i915_display_info):
  TC Port: mode: dp-alt, pin assignment: D, max lanes: 2
  port_clock=810000, lane_count=2

  2x HBR3 is enough for only two of the three 1440p60 MST streams;
  enabling the third fails with ENOSPC in the atomic commit.

  The monitor's USB hub enumerates at 480M, so as far as I can tell
  the two lanes pin D keeps for USB 3 are unused:
    Bus 003 Port 003: Dev 002, Class=Hub, Driver=hub/5p, 480M
    ID 0bda:5483 Realtek Semiconductor Corp. 4-Port USB 2.0 Hub

  Same result on each of the three USB-C ports, on every boot and
  replug I tried.

UCSI side (USB-C port2 = UCSI connector 3):
  /sys/class/typec/port2 and port2-partner exist, but there are no
  altmode devices for the port or the partner, no cable device and no
  identity/ directory. port2-partner/supports_usb_power_delivery: no,
  usb_power_delivery_revision: 0.0, usb_mode: [usb2].

  Raw responses via ucsi debugfs (command -> response):
    GET_CAPABILITY           0x6     0x01100200012000000000000300004044
    GET_CONNECTOR_CAPABILITY 0x30007 0x00000000000000000000000000000201
    GET_CONNECTOR_STATUS     0x30012 0x000000000000000100000000606d0000
    GET_CURRENT_CAM          0x3000e all zero
    GET_ALTERNATE_MODES, recipient connector, SOP and SOP',
    offsets 0-3 -> all zero

  As I read them:
  - GET_CAPABILITY: 3 connectors, bmOptionalFeatures = 0 (so no alt
    mode details and no alt mode override), bNumAltModes = 0,
    PD 2.0, Type-C 1.1.
  - GET_CONNECTOR_CAPABILITY: DFP only, consumer, none of the
    USB2/USB3/Alternate Mode operation mode bits set.
  - GET_CONNECTOR_STATUS: connected, power direction consumer, power
    operation mode Type-C 3.0 A rather than PD, partner flags USB +
    Alternate Mode, connector partner type 3 (powered cable, no UFP
    attached), although a monitor is attached.
  With bmOptionalFeatures = 0, ucsi_register_altmodes() returns early
  and the port gets no_mode_control, so as far as I can tell nothing
  can be registered and the OS can't select a pin assignment.

  The PD view also looks incomplete: the UCSI power supply reports
  5 V / 3 A, but under full CPU load (16 threads at ~3 GHz) the
  battery stays at 100% and supplies only a short peak (18 W, down to
  2 W within 20 s), so the monitor seems to deliver well above 15 W.

Monitor side (same monitor and cable on a desktop USB-C port without
DP Alt Mode, so the monitor falls back to its Billboard device):
  0bda:54bb "U2722DE", Billboard 1.21, SVID 0xff01,
  dwAlternateModeVdo 0x000c0045
  = UFP_D, HBR3, receptacle, UFP_D pin assignments C and D.
  On that desktop the monitor's hub enumerates as a USB 3.0 hub at
  5000M, so the cable and the hub can do USB 3.

  So the monitor does offer pin C. For comparison,
  dp_altmode_configure() in drivers/usb/typec/altmodes/displayport.c
  would pick C here unless the partner sets Multi-function Preferred
  in its DP Status. I can't see the Status VDO on the laptop, but with
  "High Resolution" the hub drops to USB 2.0 there, which suggests the
  monitor doesn't prefer multi-function.

Questions:
  1. The monitor offers C and D, and the platform firmware picks D.
     Is that expected behaviour, or does it look like a firmware bug
     to you?
  2. If you have a contact at HP (or the team owning the Panther Lake
     PD/EC firmware), could you pass this on? Preferring C/E when the
     partner offers it, or exposing alt mode details and override via
     UCSI so the OS can choose, would be the two options I see.

I'm happy to test patches or firmware and to provide more data
(full debugfs dumps, ACPI tables).

[1] https://discuss.cachyos.org/t/panther-lake-asus-gu606ax-no-4k-60-over-tb4-usb-c-firmware-forces-dp-pin-assignment-d-2-lanes/38080

Thanks,
Tobias
