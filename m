Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.97.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795761419;
	b=0/UPc/we8pT2EAfLsl8sBl0r2YHs265dDALihPxCWN7/2Cd2Ji8ElF4J/f7+7xy9ul96
	 xhdPV1mCaOZhdfh50T3jFAeTWpqqFw+ZGDppsh7n6i2EC5hh1GCelqkvOKBivOTvwPWiW
	 bP8Eg6tF5o+fjkoepau7huvHFv6yeHX0v3Fb0Ms6m5RhceHDyNeB0TxTQZKYA5X7YfP8d
	 Jo3R/l8qTjphb8HXePu5cw1ILD66IO1u6qE9PuJwRK5Esw4rbbFBz3K+C9t7UX9DoD3v1
	 MrkKpLj8piSfufSStYSAcD+lU4iWCGWFFDk7//RZnIkDLUonedHpQkMAYEApjpe/INw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761419;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=U/JED6gqrFsldejNk910iBMJvn8RzMqcYuQeJonvUuc=;
	b=Ff/mkti463m9rAozLQ9NOpkDtR+Dk5o3vkqA9wInoBJEOjd7n4yG2VetRy+3lYIwKlD0
	 FPOXf5rR33hz+RXr6ynPVjQKxE2fjcHVGPFFF8O7SQ16vXXCb8zLn5PQD3EScAL5yxY9t
	 J/+dnLftyOviLu4FYpoi2uG84wLk9WAUmmCYm1DTeZBKLCPfrduyh8myXpG7RzWOQPVoV
	 p+h8b7QveMWw5KBctPymwLAtdY1bgxrIiQEQ8S4H+hLP5Ill4izj1BAft98mxOBzDsnmY
	 n23L1gFcY+0Qc/DNK2K4eofHZv45dUVx2ubgJiCikKaDvkD33Rl0CwD0MnHUWjERwkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=birger-koblitz.de;
	spf=pass smtp.mailfrom=birger-koblitz.de;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=kxo7Ngq5;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=ryfURbSR;
	arc=none smtp.remote-ip=23.88.97.239
Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20916606A31E;
	Fri, 27 Nov 2026 06:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20916606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=kxo7Ngq5;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=ryfURbSR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1795761411;
	bh=UF4VXwcGZ9wKEKH1E/5tOVd9WWpb3zDxgXIBqaC5p1A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kxo7Ngq53IN6h9sLKu3Ow3xKhtp6uuMmEtvsHovBRQR2WYKDISvJZttGmhNYNI3KR
	 p0By84cwmq3HPYaQ6Q4OK5YCD0LXiPrWFt1Uo0KtYjlsS9y6zYKgTBSPUNANVpKoGb
	 Wf/ZUTN77LvlexnJwKniNhPMdocjorwC5CjehvjgknuqGroUNmMnArFPnVuxGDQgtj
	 zh9EVo1GT9iZzb20QOeKiRxuxf9TKPbR/ZPG9C/PGivH+VchEX8hsV+1CCcVMP9mfj
	 uEdxvKe/bmDP0rRlehiVa15uaaqA73WzJ2fyqn6BVc+k2MussnURRetE2xk7V1333n
	 0WBIBlJ0Bf0Ww==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 4C35C4963B; Fri, 27 Nov 2026 06:36:51 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1795761408;
	bh=UF4VXwcGZ9wKEKH1E/5tOVd9WWpb3zDxgXIBqaC5p1A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ryfURbSRr2QA/Muq0p2Dut0Ep8Bex7Gx8pJB6kgf24dIYwCm0I2CaK7SnK7NxuL8b
	 87X7SD4EuAldxjv7GAHN+Wh2BaSTC8KbTMeZmbuMuQgcD9d+457TKvUCYHJuX22IDR
	 Bd/iZWYfYFHVCA4ykt+ifh0BmsqT8UUhKLB/Xqvl2QwfdD6ssR0gCylPBc+UZgHeie
	 oMQDmvwq1rv9xRecM1uwdcY5L/dxIbLqegZN+UzP8OJNqRk3sWrhrteTffrgFHuFc2
	 /4k9M+VMFdzRJqo7HPcAmBrNmKAdhEiaclh+GXGmHXrg/yF5kh5t/4gZaPqtZlnaOA
	 mR+Bs4cdzrKSQ==
Received: from AMDDesktop.lan (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id B1F3E4962E;
	Fri, 27 Nov 2026 06:36:48 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Fri, 27 Nov 2026 07:36:26 +0100
Subject: [PATCH net-next 1/2] net: usb: ax88179: Make receiving FCS on
 AX88179A configurable
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
Message-Id: <20261127-fcs-v1-1-0c4ede015bf5@birger-koblitz.de>
References: <20261127-fcs-v1-0-0c4ede015bf5@birger-koblitz.de>
In-Reply-To: <20261127-fcs-v1-0-0c4ede015bf5@birger-koblitz.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 Birger Koblitz <mail@birger-koblitz.de>
X-Mailer: b4 0.14.2

Make reception of FCS on AX88179A configuration-dependent.

In contrast to what the name suggests, AX_RX_CTL_DROPCRCERR
actually instructs the MAC to leave the FCS attached to the end of the
Ethernet frame when sent by the USB-adapter to the host. This was
tested for AX88179A.
For the older AX88179, the behaviour does not change.

For AX88279-based adapters, the flag must be set in order to receive
complete frames, however, the FCS is not necessarily usable, as it
is only part of the transferred up-to 8-byte padding area, and for
some frame-lengths only 2 of the 4 bytes of the FCS are transferred
to the host.

The AX_RX_CTL_DROPCRCERR flag has no influence on dropping of corrupt
frames already by the USB adapter.

Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>
---
 drivers/net/usb/ax88179_lib.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/ax88179_lib.c b/drivers/net/usb/ax88179_lib.c
index 821ee9cd8ded1b8f1e425bcef493fb175ed30376..85d774bf214f8d228d3828d15af6fbfda89421bd 100644
--- a/drivers/net/usb/ax88179_lib.c
+++ b/drivers/net/usb/ax88179_lib.c
@@ -356,10 +356,12 @@ void ax88179_set_multicast(struct net_device *net)
 
 	data = dev->driver_priv;
 
-	rxctl = (AX_RX_CTL_START | AX_RX_CTL_AB | AX_RX_CTL_DROPCRCERR);
+	rxctl = (AX_RX_CTL_START | AX_RX_CTL_AB);
 	if (data->ip_align)
 		rxctl |= AX_RX_CTL_IPE;
-
+	if (net->features & (NETIF_F_RXFCS | NETIF_F_RXALL) ||
+	    data->chip_version != AX_VERSION_AX88179A)
+		rxctl |= AX_RX_CTL_DROPCRCERR;
 	if (net->flags & IFF_PROMISC) {
 		rxctl |= AX_RX_CTL_PRO;
 	} else if (net->flags & IFF_ALLMULTI ||

-- 
2.47.3

