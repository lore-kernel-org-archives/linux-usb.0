Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E57A288C30
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 07:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785742437; cv=none; b=jOS2WRcUMn55LIHrlmPIlWWaJ5Xur7khEgP3fC/oxURZA+Te5H7phCZ1EQPFI/4lMYVtadWEh7kQxCcMbEio53Ru5Fng1QUnMHt5gUV+OfK2pW1zjp6uPQbdz8nETbWMdanlJorFeC/2hAvT0veHGYnDVNwa84wKndGmbnyGZDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785742437; c=relaxed/simple;
	bh=/DmVr1I/uwji10ZFfwhluNchBTHGN9354X6a+AWJeRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xhot50BZhwkdd8lDQ48ivyBrOPIDb9n6x66U58sEObWdzJU7KbjPzh9xE2VJ2pEXnBhcHqLK8pTvve1SxYbR4HuWT3dl5h59UM9X3YoR/GqwZsWHkPuFhSdvBSSr4jlDQgPhExQ6vZHq5jqnAzW0qavEY+UYwRLGdyHqesYYm7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rmCscYgv; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rmCscYgv"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cf452def93so28168595ad.1
        for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 00:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785742435; x=1786347235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/DmVr1I/uwji10ZFfwhluNchBTHGN9354X6a+AWJeRQ=;
        b=rmCscYgvDJeAXeIuP3zDYzn8E4Ra/yjaGenXiulNX58lw5etwE8S+dQ82quCJ9kxwz
         yKZxHFGItzQKbTjGzvtsXV5B5mm0AdXfsquHUlt3TXnoWGNmA4NwXn8RmtR8AHswGVnT
         cRgmNL6+xk6eXeVRO2YCr86sMw+loHIdFxo/JZM1Qk7zWH3lAkrLPxrBL+yckDKUrTu4
         W1c5t7d3w+Va1lwj1DEPwrAtBFxAaAUPI4BAHlaYF/fmOeziLlHFPrxWL+Nr4+9vZRuQ
         nEkBG271Xf0ZY/gmU+mZDMCfJSJBZ0cZqJWjog0CXIo958SJZauE368MtytrT+B+x/ic
         mazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742435; x=1786347235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/DmVr1I/uwji10ZFfwhluNchBTHGN9354X6a+AWJeRQ=;
        b=BimPluM09QUIbDp351qccEsaECNMmOC4ub0ZElbCGhLT8UfNCvheH7ctbkagIWZGOF
         uoGKYi6tI/xpSVMKiQDGNmJoHjetRhSKdGt1t9td+gTbgESdJDGg0edRE5PME4t6xT+S
         hCVGNldheHJFD4u82fuhbKsJnuqGvh2HCiJKspZsgPMkoeI7WsWkRWjDuL9HeUrxn6RT
         EM+gsGXN8E653cqKZkLKz+Vk+pFIDkj/JGAffUUHRuITZT62SyelI9Q1KegoSdvOd9Yb
         iCTqh1DL2XgcrwWaOm4OC20H5wrBmOuJCf7kYa4hlpBbQU6S3yT1+QA8xQkSduD+hoD5
         8oyA==
X-Forwarded-Encrypted: i=1; AHgh+RqXyt/s9rj3usk74qNP5S74Jaq/n9A7jODWYGZGP7gNW2bXw1IZe8R32H6MAYb1E+Qx+FGDhEXjxE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqBJ4oMoAYkd+gAhxmgcX5uSWt3WnYySQGvN8k4UmqbeAtVGz4
	S6XDzbtqqMT9YUdlz3WDPfItdv1feEWqknmHp1YauD8xOH+7jxcMIuq6
X-Gm-Gg: AR+sD12iBjoqFXHmNWs2PsD5ELdm35/J8+9UhujluQ6neAD5NBwcjzdFpnBDbj7mC5t
	jqg7pqsaT7HKAyZaQPtmzIEzjV+Cz76P5V+rdIh3FWIaumfoaOHYwVccfQQ/IGS/rf6keVmJo0g
	uCi8rkIlMGsF4QhHs3ZnUlUyGitJcPMUeJMbsPXY3NYERzRuJG4mdoL59jIxTZFK2NSxH33XbXo
	HtdG7cuzFbdDjvwUJJu+ZwO05+UQZ4gy6GIrv/AshtEDwCUEaPYbXRx+kO6X+rsXiUjwM+IludS
	Xa4nHv/Dl+dsuoe5dKUUItBlkiMyPkDjSiWL68e56uATg50rTzXiyUmnNHwvL7q2TWWUHkvJI7c
	i4f5Ad3a7N9/K/mJACc7B4PF1BZgtahcghkdwvQzdkS0210blNOAUDreUjj0maYbpzgEyiujjT+
	osvVi62hbLqe3PJ53GgpKzwPY80EDFfjbGD6fO5xVyCAoQ2Kti6jLTx39ayGnu788=
X-Received: by 2002:a17:902:ea0c:b0:2cf:41ba:96c2 with SMTP id d9443c01a7336-2d05366b5dfmr76364185ad.12.1785742435408;
        Mon, 03 Aug 2026 00:33:55 -0700 (PDT)
Received: from Inspiron5409 ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae5abbbsm33637465ad.22.2026.08.03.00.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:33:54 -0700 (PDT)
From: Jianhui Xu <neuromoments@gmail.com>
To: mail@birger-koblitz.de
Cc: andrew+netdev@lunn.ch,
	andrew@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	hkallweit1@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux@armlinux.org.uk,
	netdev@vger.kernel.org,
	neuromoments@gmail.com,
	pabeni@redhat.com
Subject: Re: [PATCH net-next v5 00/13] ax88179_178a: Add support for AX88179A-based chips
Date: Mon,  3 Aug 2026 15:33:48 +0800
Message-ID: <20260803073348.2190800-1-neuromoments@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260802-ax88179a-v5-0-dcb9fea4acd4@birger-koblitz.de>
References: <20260802-ax88179a-v5-0-dcb9fea4acd4@birger-koblitz.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Birger,

I tested v5 on the same ASIX AX88179B adapter (USB 0b95:1790,
bcdDevice 0x0200, firmware 1.3.0.0).

The 13 patches applied to net-next commit
df13c1df8147675470213ffff29dd5762fa321f5 and built successfully as
7.2.0-rc3-ax88179b-v5. The focused W=1 builds for ax88179.o and
ax88796b.o were clean.

Unfortunately I reproduced an intermittent cold-activation failure, so I cannot
add a Tested-by for v5. In four fresh direct-kernel QEMU starts with complete
diagnostic capture, the old lease was released before starting DHCPDISCOVER. Two
reported 1000baseT/Full carrier but timed out DHCP, while two succeeded
normally. In both failed runs, RX remained at zero while TX increased. Reloading
ax88179 and ax88796b recovered DHCP, RX, and bound traffic in both cases.

Before this follow-up campaign, in the earlier v5 validation session, I observed
a separate 100baseT/Full failure: the adapter negotiated carrier after I changed
the advertisement to 100baseT/Full-only, but ARP and bound traffic failed.
I then tried to reproduce that result with three new advertise-0x008
transitions. All three negotiated 100baseT/Full and passed bound gateway
traffic; two also explicitly passed traffic to the test host. These repetitions
included tests both with and without a preceding module reload. I could not
reproduce the earlier 100-Mbit failure.

That earlier v5 validation session also produced a separate guest ACPI S3
failure: after resume, the adapter returned with 1000baseT/Full carrier, but RX
remained frozen and traffic was broken. I then performed three new S3 cycles.
All three logged QEMU's same emulated-XHCI resume reinitialization and USB
reset, but returned working traffic with increasing RX counters immediately. The
final repetition also recreated the earlier speed, EEE, and pause setting
sequence and verified working gateway traffic immediately before suspend.
I could not reproduce the earlier frozen-RX result. This remains a QEMU
emulated-XHCI test, not a physical-XHCI suspend test.

While reviewing the speed result, I noticed ax88179a_bulkin_config() selects its
table using ax179_data->speed, while ax88179a_mac_link_up() receives the speed
argument but I could not find an assignment to that private member. The new
passing 100-Mbit tests do not support linking that source observation to the
original one-off failure, and the same pattern appears in v4.

EEE disable/restore, pause enable/restore, EEPROM read, module reload, and USB
detach/reattach otherwise worked. I also tried Wake-on-LAN in QEMU. The driver
accepted magic-packet wake, ethtool read back Wake-on: g, and USB wakeup was
enabled before the guest entered S3. QEMU was configured with USB remote-wake
suppression disabled, but the guest did not resume after directed-broadcast,
limited-broadcast, and unicast magic packets. I consider that result
inconclusive because I did not independently verify the physical USB
remote-wakeup propagation through QEMU.

Please let me know if you would like me to test a fix or collect a specific
register trace.

Thanks,
Jianhui
