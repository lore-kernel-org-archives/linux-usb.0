Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1ED1A304A
	for <linux-usb@vger.kernel.org>; Sun, 25 Jan 2026 08:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769330120; cv=none; b=TdNhrj4peqOP2yp32oRTSWMPCv4ZhWKOsVOCzC+cuBULZLt4DrKALkcnYXp+MLpDrrSrsKQ+thpzRa00V8qAOihVx3UFOyVZS5QTBMkkV5WkzRPnpvJtpe90V2EIs5q61NImgpdDljpKk2WNxbPiZyi5afY7gle1I6iE83o9uZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769330120; c=relaxed/simple;
	bh=nptkR/F3z/bZnGUFQjrT1hdRyKnPvglcmVwbtmg/si4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PI0I0xSExU1AsWcdEU5AbgYIXry4JiQa0dPuSG7a13Fqpm9p1dC6QWBQq8As0NpSR1X7RTzEF7drK7p9DgVi6V8qNXDhoInGaM5DgUO5O86Dl5Rb/YE2VAZTAuiFKlJy9vR4Bv1Dci/roxrAITqJ4xO8rVIPJ5xm1ufh2WKSyzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DXW3hwS2; arc=none smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DXW3hwS2"
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-2b6b0500e06so4503691eec.1
        for <linux-usb@vger.kernel.org>; Sun, 25 Jan 2026 00:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769330118; x=1769934918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dYChDDJqwd3nSz4SLjzCMME+PV2qfla0x9dNDwR4fTk=;
        b=DXW3hwS2+1xPmd/Q5JhsQXeNOnsMuomB7vM/hgquIpTetmz1m82Whempcx7WNDzxcM
         k0zurP7al1uEGitDG6zrSMmQduwOzWZjMEpOIc7HXJqewTv/dxbzy5qA5VhcTiTYLxXp
         +MVTKIzvNtvcF7S7COZYY6y+5PVEvGEFkPaWFBFxk/xR+/CLjq7F9veu89PRzC6bI4zO
         sO8eKAtP76k3xEJNNpMyw72FlFYONb7svVTlJUNz3rxoZAPtaZaJKGOu/gtCz4E0XOiP
         ngZUWxIXVl+rLyQvRc2hiOLCfeQyK04Tk8/ZqV+ED6UrNIybXGKIIR7AjXAFXPm37PZX
         E7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769330118; x=1769934918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYChDDJqwd3nSz4SLjzCMME+PV2qfla0x9dNDwR4fTk=;
        b=JjRCUDFgScLbdiTt2VJ0sCn2FAG0AYZ/jLY+VjH7osv1eGsi43aWxUjoxhcRRogXgU
         MpQPDD8sPQh8Br/puVtbmSfFif+7A9+05ZO0HtYL3TZi7KRGdtFkyDS/ojvWHmnUSVv9
         GvTYklvYWa3NAv3ArREt1Wb+1iuLgkjI2xUuzOp5P30wshlVd1UcTE22RfiywdKQRVY0
         pdnZavHnXbaci9MmYd1owowgjlr/HfxVt3kXaQzgts2oAIUyBaXFH6rWyEGhpJ9Po5hI
         n8x3OTluH5mF4rh8kcoqsFnaBVXRZYEPYJcwUtfu6KJJ8Cm7P7l92IMNEMlpjvi4iV2G
         leUg==
X-Forwarded-Encrypted: i=1; AJvYcCUAbKI2IqWnDIv0n4y/ST/2+D8QRgpOBhEvcEgGfSzeSgQbCWwjly+NGXKVde2KuW7S7kswHP29qx4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFcVvPnoCdtymPtCS245XFYICPupWeMhMb68XBv/Xx4UFSTHc8
	0TO914KGgjPVIjV80pnB+AEdzbsotcr+BrSw1Od9xSOS0DdkOiOvZQYd
X-Gm-Gg: AZuq6aKjmpfQb7fxLDc217nSKLeXigWdUGu0W3eHp+1sLXOSKmwZT6t35I7CgnUX/bN
	mwUIO0EmVVCYraBg+/ZYOetCGZ9yHRQnRp4zohx+bjoi+QR+HgemXGJJo2k3V8atpbHNAyavf5b
	1FIgkvDGrT5yl4WiMx3IIgeoOj+PscapGO+WTl9IhmCOeEAGn42JgT/NpUAt064sDIGvkmtdLCg
	gE3z+7o7uGPdEDge/IpUidswBQl5dndcN0J6FCeIZJsl4uVxlOIpHMPY/UJ3Gd6Cl74NHMBrQkt
	WFaVtkQBmymvjnxjnc7kDpjH4WnNgPNmJTkvdmCUO5ie7asPHquJ1IpFXdHZMQxs968+anSpdHG
	jA1h84J49fWYprHLjyH2lopZTU/T01kE6q4ewRvGzk8mF2VbPwLQW6QsaN84uLB6fPocKuPZBjF
	EXMgOElAkfUk9B7xNrTPAk91TjyaJKG8+xdMww0mY3znv559+7nLJSSB+sycAKpmwEnlxbvRO3s
	8ANQHEp41A0ORagyX8BSHFHNFfGOjvIcbVLsYfQU+Rmikv1mvbmuuNxCI5NqaQtD2UKqck01+ig
	I6ce
X-Received: by 2002:a05:7300:2211:b0:2b7:2263:3d3c with SMTP id 5a478bee46e88-2b7644f99ccmr342032eec.24.1769330117511;
        Sun, 25 Jan 2026 00:35:17 -0800 (PST)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7410615c0sm7994977eec.0.2026.01.25.00.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 00:35:17 -0800 (PST)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Petko Manolov <petkan@nucleusys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 0/3] net: usb: adhere to style by removing typedefs
Date: Sun, 25 Jan 2026 00:34:54 -0800
Message-ID: <20260125083501.34513-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It violates kernel code style guidelines to define typedefs for
non-opaque types. Update the USB network drivers to conform to these
guidelines by expanding such typedefs in their code. Also make small
style improvements to code modified in the process.

Ethan Nelson-Moore (3):
  net: usb: rtl8150: remove rtl8150_t typedef for struct rtl8150
  net: usb: pegasus: remove pegasus_t typedef for struct pegasus
  net: usb: kaweth: remove eth_addr_t typedef and bcast_addr definition

 drivers/net/usb/kaweth.c  | 11 ++---
 drivers/net/usb/pegasus.c | 92 +++++++++++++++++++--------------------
 drivers/net/usb/pegasus.h |  4 +-
 drivers/net/usb/rtl8150.c | 68 ++++++++++++++---------------
 4 files changed, 84 insertions(+), 91 deletions(-)

-- 
2.43.0

