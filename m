Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794562109;
	b=LQlksyNHn8hT4+Fc2BwvikzOwCu3ifeH3sZ27Pt9qYhlJoVyDlu4vq3ZHCzaEJj9ZO8K
	 21fkY8QbTSAV3vY+oT5r3b6pcV2a0mJD05rM+qoE0MI7yl6+DMELld/PwNRZKr1Wl9fO5
	 vXw77LtZ1JQSOB+6FVI8zgiwsnimXqBiWEb9TWBy7kFVtnD1AmX6GGnU9FB4b4KlK+Tuq
	 k8Y4SQJSzJxk5v96L9Y4cSICpEl1YQhGmkFDvwwHEV4YRYxEGZt18SVHoSnaCsQYRmOzS
	 Qrt70mz6UtTLa6wsF3GUCEHussBtt++XlsCJR/MGLsX4GkHFPtk8ikz2he26zPcU6sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=OuPd/zrEz8bnoQVi0hWUxELIPusz8UbhZBM1Yuhapas=;
	b=q3+zZmVJjF2kM72DJiwItxyJTDm9PkxWNdN82HMaW6TMQE7QfPyHOi2m6ylMw3HC+85T
	 B46OZyJNyd3nKWayI+CBzQ0FAKmVeXV2xPuAx2cbpHMZiTSDJVZ0laujSjIpSLejRDnbI
	 4K7ywwH+1y4I074EmD/giiz+A9rCGs9aXK+Zt2t5mwhoMEQ1Id8ySFRyojA0DCY80V75B
	 icaNIGHL9R5QmtYDgvwiB7JCItbbpfpCptnSlTW2ez03FfSoIpjTnOPqYA7W+OkM7KJMs
	 wDYCybyG2m/nTW2SSbwB3mnduGlv4KRNOlccrQmUKn04MTB7uUZ0OL06zGOQNv52j2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=tsNIBQol;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2329E606A327
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 09:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2329E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=tsNIBQol
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so10177495e9.2
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 01:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794562107; x=1795166907; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OuPd/zrEz8bnoQVi0hWUxELIPusz8UbhZBM1Yuhapas=;
        b=tsNIBQolbzZNJZ2w3Q3Osb6G4TLdxYgu0qX4HZu2gVwtNQ2SAfLjTclJnIdZ+akvme
         Pfh4siZ+9dWWl8ASBUC+3UXC+uffRozmiSH1VhCCu4MvthLg5qwhw4qrc6lPogCGowZU
         rmaGVO8bJGgcMbi5SXkHo1t43K9TPhV6NpVvj9+Wc7Wcr9W4uO0C8qBFgvhP3iB3TYlh
         uCBgd3eW7/klaplqWtycSg4IvArrFtYccESnyWHo6fFg+xaddCQ/tkF3JsfpEz0+/jAs
         Ldrr52a3Yzsaq2XiyKfZFlrnCv5CHhZbDeijVBv8C4N1EfmPChIqUY+P4WrxApALMAI0
         VSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562107; x=1795166907;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OuPd/zrEz8bnoQVi0hWUxELIPusz8UbhZBM1Yuhapas=;
        b=GfJ6inuYH8Q8GHpT54RbrWgqqSkhrqGkBPwvAoabsU4HyZo5MbItoOQcjo6F3dwcme
         ZJFSBtkao4W71e/4XWx7IjiZh2AAcG0P4Ia5YYbJb0TadCmV9eRlNUUFIuLOAfUqY/SC
         dkt6NQUD0pvdvun1ogr3WfydJZimhv+IVTFW+naR5jZKJR/5HP62lpd6xgRO3Et9JQaf
         0oZAU+1la9rlihYsDNpVoTu/8JpVXmiIc/7gHjmHdo7WDc4kx9ZPfejbbukkQUg/ieaU
         aKLP0Rt/AxL/+3mD6fRHXbLG7WfZobWGqKgoggcsAQMeFYWIaSObO+sbo9zWnN2Dd09x
         aaUA==
X-Gm-Message-State: APuU4Z9ye3ZpjCgwcSuEcmkftdO5oECMn54lPzSyauTycYNbPgN6uoHT
	O3frbyh8bw4M1kWUJCWLDmhL/Wh33Cq5Q3Y2sdzlDO7phNVJR8ZqYHJnHAI90yW2FtKW22nC9Kq
	zDY5tos1OAQ==
X-Gm-Gg: AYBFou0Gdgs9Lxjlu6RMT9oNw7wL2O/sjL5otKtkOlx+bShRWuVxWnBIqwsc7QF6bg7
	I/3qrKSdKGM8TUj7OFXMccc/OvUqxmEfsyl+WzGgRPHsEmjpjeAf507UJDet+yze5bC41zHi9vu
	fyUVX12Of8xUzSDl06wcWxmm6Q1APjGTSyitWl5SyeJxyA1adbTWnTnv5yo5iYe4yZVybV63UKz
	CXcn+1GVE9ouluyld3h2cO3tXU2BIOogP8iJ1pU+35UJJUEeQTcn9OUajoCERXKReyFQWshkvX2
	twROdxSUjfFktm3EjUCReSorxbkfAgeuggPYespimavsPDQRQTXlMfPxUtutXV8/1dRErXCXonO
	ZazYUto0vw4mK/XdO9DR71pU6nrjgPFeWuCGDCLpd4XGTBmksWGbjh1WKJHdPgCt3ICpxhQC9Xx
	3zeygsUdpX+i9iFVmwGpDH9Lcei23cOo0gBqkmqlTjebI+wbiCQndUGzedxR9ybW+2G40c2E9TA
	p/zTI5wMy8HXNzFjb2GEb1hUSTeUHNi91Spok7+q8UQ2SElbmjHRzd0jeY8WEpdWIcLPmLohMp3
	xDK/ZSrAF2+obD3jH5Z+aNCO1LFAq6Q4nbskeqvJ3Sv5Hs0etAswA/gt6bCXTnl+qH+c73jiddl
	ajuLRQxkL
X-Received: by 2002:a05:600c:6219:b0:4b7:6aac:7406 with SMTP id 5b1f17b1804b1-4bb55a23b41mr34227575e9.3.1794562107357;
        Fri, 13 Nov 2026 01:28:27 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm238668335e9.1.2026.11.13.01.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:28:26 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v2 0/4] usb: gadget: udc: Rework when the gadget connects
Date: Fri, 13 Nov 2026 13:28:15 +0400
Message-Id: <20261113-udc-connect-v2-0-f51b11f07eb8@flipper.net>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0JmbQ3TKgZX3MOwkDKVMaY0LTQa0
 rvb4tblS95/f4NAninAtdrAU+TAs80gDxXo6W4fJHjMDLKWDSJKsY5a6Nla0otokGqDqE2rBsg
 L58nwe6/d+h+HdXhmtSSKMXFYZv/Z7yIW7385okBRK31R8tw2Jzl05sXOkT9aWqBPKX0BBkDpp
 LoAAAA=
X-Change-ID: 20261112-udc-connect-61e0f11cf93b
To: Neill Kapron <nkapron@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Alexey Charkov <alchark@flipper.net>, stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2015; i=alchark@flipper.net;
 h=from:subject:message-id; bh=xKH6JPBEauAk2qY839jB1Vb1ODWV8srGYLrwZWkSfMU=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9u2GhF7TnQpTsY981pxvzjWQkFq97fyshWeGj2Y+NT
 mvfFJrO6ZjIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCqw4oZ/le9ez6r5t3zZZ/exX7S2LE9xZtvkcmVVK+nv5TLQ8/VbRVk+F9/5+k
 vqetfROPPrTom4Pvpp2z9/9r2OawsvuL2u7yfbuYDAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The UDC core decides whether to enable the gadget's pullup in several
places: bind and unbind, VBUS events, usb_gadget_{de,}activate() and the
soft_connect attribute. Each applies its own rules, and
gadget->connected records both the pullup state and a request to connect
later. Since commit 62911bc82b03 ("usb: gadget: udc: skip pullup() if
already connected"), a VBUS event before bind leaves the gadget
invisible to the host until it is rebound. That happens on every boot
of an RK3576 board whose Type-C port controller sets the device role
before userspace binds a configfs gadget.

Patch 1 is the v1 fix, small enough for stable. Patches 2-4 implement
Alan's scheme: the gadget connects only while a driver is bound, VBUS is
present, the driver hasn't deactivated it and userspace hasn't
disconnected it through soft_connect. One helper records that in
udc->allow_connect under connect_lock and switches the pullup to match.
The UDC starts and stops only at bind and unbind, and the deactivation
and soft-disconnect requests are forgotten at unbind.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v2:
- Add patches 2-4, reworking the connection control as Alan suggested.
- Link to v1: https://patch.msgid.link/20261112-udc-connect-v1-1-03c73259642b@flipper.net

---
Alexey Charkov (4):
      usb: gadget: udc: Clear a pending connection when starting the UDC
      usb: gadget: udc: Forget a deactivation when the gadget driver unbinds
      usb: gadget: configfs: Leave resetting the deactivation to the UDC core
      usb: gadget: udc: Decide on connecting in one place

 drivers/usb/gadget/configfs.c |   1 -
 drivers/usb/gadget/udc/core.c | 197 +++++++++++++++++++++++-------------------
 include/linux/usb/gadget.h    |   4 +-
 3 files changed, 111 insertions(+), 91 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20261112-udc-connect-61e0f11cf93b

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

