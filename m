Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794036110;
	b=z+NNZyWcFs3It+nagdFZAlRNePNQsXFag9aL8up046AWbEDC1TApCzWyAlhHPmI2j5pb
	 8n/zL0a97AgLnsNTDHqI/2qre05QIWnbjk4qaEv/mMmF2oVJpisxnBb8vNa6yQrSv1eeh
	 X/t9gZf4PWk/Z/s4zRfJS54dg3TRr5epatJ9EvXpbqjep4PElfAe3/KH9Cuiq/CFozr6P
	 q9YdwkHe20b6+Sqn0yI1txnbOhOzsnZ0dyiBUK/ejx/UlmbuA4BrkfJIsFJNV9zvJcKkQ
	 ep4xIWVP8g5tcnCQuGzv1InJOj30o7jjt4skuSog8M3B5Ig8DvlnBbf7SGj8UVax9Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794036110;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DKxlC+1NTY8XXG/9D3gcKeRJ08ZGKqVFlznMSdbE3mQ=;
	b=bXC7Rsoy2Qn8X70YaP7mAF/+TbbTXFXQwf2gIKCYe+SbkbCmw9NHgLr8ixD58T1os1Yg
	 DA+LzhLjN0nr/eMldvBhiAANYq/UIQH/4g8+vxCEcu7XWE9uvDfPEjPB0FgUAtU6qB+cJ
	 L8ySLNlskvJphqqlod2w9qVIBgSA27Eb4yOAoar9qSXZy9a6odsFGzCYR7sKT0iUncXbg
	 iDEZVjOc02wszKFuTXZ/YeMNRnKBctzWpUA5jBoxRG8VQaziI9fudFUWKB50t0plYiD9k
	 r5UKbJtNtaUEsDrvqqidZQ7Rux8She8KJYOMggCZaYWT/CZ4bIiR8HlxB5lhcFkWxyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kD8HhKMX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84A6606A326
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 07:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kD8HhKMX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 101731F0089F;
	Sat,  7 Nov 2026 07:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794036109;
	bh=DKxlC+1NTY8XXG/9D3gcKeRJ08ZGKqVFlznMSdbE3mQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kD8HhKMXDix5DUGOavLBBwb5ieToSO6yCTKikhosSnV0cq2NwpQ7JQ3p293DfIaTP
	 meXUjD2OhzevuRdu3m5ZJ2Tvl48ln9ItOV61PTUcIM7r9j012NlAq/+4BYUntNWWq0
	 yzC9428NKh9ljBN86x2YCXM2kvU7euhLtPK2Ki2yExosyoY1SoshEHDf9c6AsKtlzF
	 +VcESdmVsfCkxZV+N9GTrc+8qNMSunnutYLEj3kYavi7k8UbHPkXygRDDiGCoSNeMt
	 EkGb9wVIswVJYB+nHm4r7A/W+JdWSMH2p6KWt3xXYE4HWNtTqKD7lUAbSzjh6fXG4q
	 B2s6PaWfbYF7w==
Message-ID: <sashiko-outbox-202691@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 01/13] phylink: Add phylink_mac_interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-ax88179a-v20-1-37b5a1189983@birger-koblitz.de>
References: <20261106-ax88179a-v20-0-37b5a1189983@birger-koblitz.de>
 <20261106-ax88179a-v20-1-37b5a1189983@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 07:21:48 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add the phylink_mac_interrupt() function to phylink, which
> passes a link-change interrupt received by the MAC to phylib.
> This function can be used by drivers which want to avoid
> polling the PHY and instead rely on an interrupt received by
> the MAC when a link-change happens.
>=20
> Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-ax88179a-v=
20-0-37b5a1189983@birger-koblitz.de?part=3D1

