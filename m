Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794688907;
	b=lFmWgJsiKR/fiLWxJqd6AB+6T44QC90/pVmK/yvDqwd1r2wQhSQuzcvTDDoPB6LiwVsC
	 vGREIUB0zQsO8Fz5LOPFHai/XuO1DYxLHLKtA614QAaNHntTQhTC2K9aqpdwEA145odEX
	 WoMwZuNWG7++WODmDufePf+nk9Vrbse6/j3cpKZpduXQBIqFYx1OJVlzuWbH5wu295sgi
	 kgFm+uFIxhxweRjyUA8eC6qU+hkjk+eM17gemzsayoS4RZSJFkr+gfqIPThuNuomPKDgx
	 tc9VQ9vCO7aOFMy5uhfKIndZ5p+9ID2yQ/tC9zbhHmxeVwRnAGaFif2R+9PB8K3pNfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794688907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Cc:
	 Date:Message-Id:In-Reply-To:References:Reply-To:User-Agent:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=mE9Sedw/703cZ9nfOoh/aVccbGtgviENZgA4BkRHVjc=;
	b=QmQ7Icz3DBMXqbQP2A8TZswGe+48UVcrV2AK2kx8mSQLbaoavA9aT7B8xUpfG2bzOoZq
	 ZSAjEI6+L7Yk2gaNwdImNqvv78BVX5ekofbkVl0QiWyrOb1FTZ5bcPQwytJZFkkwQrmYP
	 R5Fcr4hrsNxi5aU4r84VUqr3tt0jY/FsORun/7/syB/N7VzvNgAbJsUYlQnm1abk8f1G4
	 D1RO9T6g0a63zbBkFD0rK/KnNzyqvgvYDwDOwHWPsr3InxgeAsZlWPJfdaoZSqFo9lzDm
	 Pn9mQdG/a6D86qhvFWvLAFInP5r10/kYSam3nw1pE97FV/U8XKdzZBSczithXoDD0UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=muy5EMs9;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70617606A323
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 20:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70617606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=muy5EMs9
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so2789295e9.1
        for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 12:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794688906; x=1795293706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :reply-to:references:in-reply-to:message-id:date:cc:subject:to:from
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mE9Sedw/703cZ9nfOoh/aVccbGtgviENZgA4BkRHVjc=;
        b=muy5EMs9RSqtRX/+sU5YUgvISTSYHg35q0Axxa3dABvajlhZ2xHiePNjj1wFNVfpB1
         0IEdSvLPuV3DHiy2/rA/pgKJJfFwY786URO4mo4wSoGBXlgeCNHQk5Ms3jmLRlohbXu3
         73zCJ+P+MZIlR2Vo3vlEjc72en+69pJicyYKy8IArJ7OrdY8pGmsDbGM3Xj8Rv+yvHf8
         FZhESVzSn4BDAmROoEQ19zQh/Rw6mer9ywasU7dH9mtv+XuBJ1vmf9up7jge2t/OKiNh
         qVHtEZLCL8Nuqbe0LdwKpylOovBg7iPY1xT82odlPf/7R05ekLvC5sXYLTnIgb9niD1w
         Jx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794688906; x=1795293706;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :reply-to:references:in-reply-to:message-id:date:cc:subject:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mE9Sedw/703cZ9nfOoh/aVccbGtgviENZgA4BkRHVjc=;
        b=jykKUtLiO+uxZxUIuhv1IKg6hKvzkV6RBsvyv8ooyAR6kRlfDY+eO54P4jnyGuNv+z
         O3dXdK0vVOISaKpxOI/eMk2q9RTDX2EQ1WK4VvuflKhuUzHJU0iLHz7yq5Rv87WuH5Sn
         SX7pZ6JnSRWGHLFTlP4gELsH/231X04njqMtuBJagSBz6Dwq0Gqx7A79p9MpmJtx6B4t
         CaR9fSWKgR+HY84FcWlQ9qG2sbETDB3gIqoSpdc9jC1zvVU3a7Kw/I3BxMwtmlh8PRng
         n3ZSp7Xd9FdoA5GsjZ9qH4Mel+C3hWW0dFplO69wQ4rwxpsbBeQR2SZM7aB28q+KrYvv
         7n1Q==
X-Gm-Message-State: APuU4Z/2PtD52P6LgAgTfasY2Alra8lhrtENvvSY5lG7ASVhLA0WlTma
	u5PT8HuSTUBkpn/IiAqLMHNwudWTLDRhIVUvnz7Hj/fz5Y0aC7XvEAqEEjyvSg==
X-Gm-Gg: AYBFou13y+V5hclwFLdbsIdL4ZfJlapIrnz9DgRsDmwX5vR+gPkqrRbzS/BQAECIpkl
	7INplU9/qkks/BuzU2Lfhpz/ARtNs4jvooorqyU66KikKY8RamzbSYQHzDvXonx3ZKKm3e10/JR
	o2i+toX4TgLWro72YH+PDMHWJCwDNtoo8SM5tVRSFXq55vUza0COjrzvwD3PGW6j0nRDbOI5HXJ
	xysXlte2DDFhSh6ffUXzbT2aGaEgOJKYpJkciDsXYPoB8099PXc6AMI9t0kc45NPiin0jbQ2tn1
	JX2YnWMoT2+T9mniwr4QxOjc6lQHG8AAnphYkEiahbFeYei3tq6krxVsAzmSUPO75QMdXiHLQjn
	proyBrcOhroBtS8qGNrf1qTq70ii86UoHutyKjNGeqRlbsLhpza29HiH7181jeXEK3pMhNrF85v
	nsyaaumVIe3VsbsdmKA5NLmIF7pQXLeBL/FyqvsAmKNpDzrX6MAn7lsH+ooHFm2P5wdvUgr+T18
	5WfilQUS9+DtwHGYdHTLMvV147+vjsNswwy+PGgLWXR+TWqNpNUfrFiFrQ7woozgcu+EuxLcdDm
	BtR63yORsY0GthO8RA1zJjl4bmFl6qxdf0U/t2FfoN7arAAIvFG7IjSjr1qdlzpZP5haPCxKXF9
	UZeMf2h5FYdLzlvokRBb7ECynV77SVo7hKXlCNa07d6NYQfh2wDOsrKi693RVAemMisfPDlgkzN
	s1
X-Received: by 2002:a05:600c:8905:b0:4ba:4395:5755 with SMTP id 5b1f17b1804b1-4bb55a6a5fbmr89804955e9.5.1794688905503;
        Sat, 14 Nov 2026 12:41:45 -0800 (PST)
Received: from ?IPv6:2a01:5a8:303:cbe0:dc1c:8585:75a5:ade? ([2a01:5a8:303:cbe0:dc1c:8585:75a5:ade])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f6a40sm61873715e9.2.2026.11.14.12.41.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 14 Nov 2026 12:41:45 -0800 (PST)
From: "Andrei Schapov" <andrei.schapov@gmail.com>
To: "James R Taylor" <jrtaylor11@gmail.com>, "Mika Westerberg"
 <mika.westerberg@linux.intel.com>
Subject: Re[2]: thunderbolt: AMD Phoenix USB4 host advertises Gen3 Support=0 in SB
 LINK_CONF with TB5 device, link stuck at Gen2
Cc: linux-usb@vger.kernel.org, "Mario Limonciello" <mario.limonciello@amd.com>,
 "Sanath S" <Sanath.S@amd.com>, "Basavaraj Natikar" <Basavaraj.Natikar@amd.com>
Date: Sat, 14 Nov 2026 20:41:43 +0000
Message-Id: <em5ed5ffb2-e68d-423a-8e00-bc3314532d83@gmail.com>
In-Reply-To: <6af1ec71.fb59a2f3.1b24d6.5d62@mx.google.com>
References: <1794143745.17311.hermes@gmail.com>
 <20261109111852.GQ176724@black.igk.intel.com>
 <1794223545.366398.reply.hermes@gmail.com>
 <20261109142041.GS176724@black.igk.intel.com>
 <1794235167.3657.reply.hermes@gmail.com>
 <20261109153955.GU176724@black.igk.intel.com>
 <6af1e999.9efe04cf.8f35d.ae23@mx.google.com>
 <20261109155007.GV176724@black.igk.intel.com>
 <6af1ec71.fb59a2f3.1b24d6.5d62@mx.google.com>
Reply-To: "Andrei Schapov" <andrei.schapov@gmail.com>
User-Agent: eMClient/11.0.0.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Subject: Re: thunderbolt: AMD Phoenix USB4 host advertises Gen3=20
Support=3D0 in SB LINK_CONF with TB5 device, link stuck at Gen2

Hi,

Another data point: I see the same behaviour on a different vendor=E2=80=99=
s
Hawk Point machine, with register values that match James's report
almost exactly.

Host:    Beelink SER8, AMD Ryzen 7 8745HS, BIOS V035.P8C0M0C15.16
          USB4 NHI 1022:1668, software connection manager
          No UCSI device exposed (/sys/class/typec absent)
Device:  Minisforum DEG2 (Intel JHL9480, 8086:5786), NVM 62.42,
          vendor 0x41f device 0xd002
Cable:   DEG2 bundled TB5 cable, ~0.8 m, passive
Kernel:  7.3.0 (Ubuntu 26.10 live), thunderbolt.dyndbg=3D+p,
          no host_reset / pcie_aspm parameters
Windows 11 on the same machine also reports "20Gbps (Gen 2, dual lane)=E2=
=80=9D.

Result: link always trains TBT3 mode, 2 x Gen2:
   0-0/usb4_port2/link =3D tbt
   0-2: rx/tx 10.0 Gb/s, 2 lanes

Values (read from debugfs regs/sb_regs, not tbdump):

                          SER8 (mine)    UM890 Pro (James)
   Host retimer 0-0:2.1   0x7fea:0x1032  0x7fea:0x1032
   Host LANE_ADP_CS_1     0x4828003c     0x4828003c
   Host PORT_CS_18        0x00002f00     0x00002f00
   Host SB LINK_CONF 0x0c 03 d3 03       03 d3 03
   DEG2 LANE_ADP_CS_1     0x4828003e     0x4828003e
   DEG2 PORT_CS_18        0x00f02f01     0x00902f01
   DEG2 SB LINK_CONF 0x0c 03 f3 1f       03 f3 1b

The same cable and DEG2 connected to a MacBook Air M1 come up as
"Mode: USB4, Speed: 40 Gb/s", so the cable and the device can do USB4
Gen3; only the AMD host side stays at TBT3/Gen2.

The common factor between the two affected machines (different OEMs)
seems to be the host-side retimer 7fea:1032 and whatever PD controller
firmware drives it.

Possibly related: Framework issue #56 (Framework 16, Ryzen 7040)
described passive certified cables falling back to 20 Gbps because
the platform never sent SOP' Discover Mode to the cable; a 2 m active
cable worked, and a later firmware update (reportedly PD) fixed it:
https://github.com/FrameworkComputer/SoftwareFirmwareIssueTracker/issues/56

I can provide the full debugfs dump and dmesg with thunderbolt
dynamic debug, or run tbdump if that is more useful.

Thanks,
Andrei Schapov


-
