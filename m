Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168424;
	b=34bsj3Y3fYOv5snszLKbhumMgYI/cAeTXO1Xcov6YCkcEh0PddApuloZXf+wprTQbhHQ
	 H06TBKOWQSkad/VvEfjviyti1ihJ8ywMgggzNZvgP9M3iDbBuyaUX+QBDBE7NlfxGx3Xt
	 N54hDuPvd5e8P7yiukPM67zETN8iw4z25tLcoUT4wg5rel+zTmzSQnZIDMuMYSKcSKO5B
	 6U4gbJB+XrWnk/da1UHNb8Z88FO0s4cgFiESf6Bf/a7HYK+nB9v6Fu5I+s8soMG5J8YEk
	 JtcgSv5sZJfPKoJHAaRPxEPVvk3xmOZS14RCONnY88BT9+PGtCSF56ouZCPEd7TxjOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168424;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kVAcCf7YdsZJpIS81TVP41dIPlcYyJk0wj4QR9M2Nb8=;
	b=HFtkXN+DluUC1kV9u4m801UtWF/u8qhM4eKpjrQihSWvxgtOazf43iOq6sdxF499zltl
	 UN31g7HNf8jkJ2n3Baa8p9p/3pVcbQ2dyUyw/Gh9LHCqcgO/AyvI14P97DXOmjilzAr7C
	 7JM73dPkbTMfG0+W17sajLhRHSzFKMj1rZqmW4vKjQKtjsAvFyW5JdR86XY8YfQjoxNLg
	 zGdbJqBXLlYfJuwpupkNNvYquSZqN34VheQPCa3AYyqJXLClD+eu4UeipVkcmPs6+lY5d
	 4LkkeXH740xVNFG5OdlfmkW4EGDpTSndaCppEARNIky0L65hwAlEoQq0z9KfmV52aBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=jKc5z3qn;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 138B9606A339;
	Fri, 20 Nov 2026 09:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 138B9606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=jKc5z3qn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=jKc5z3qnKaFLYzTTaMZdrjHSZGTI6l4WURly0La+uATyMXCkG+81DAVnbeIfu4zIqYKzQBT99uMte
	 d2WIixcAirOlJcrEqqAHv+Rb3lAcr/8rYhKCvDLnDldu7+q2iVm/bw0Te7eRXI3kRR3GqqM0jSaLP2
	 eiTTlxyRCuek+oTk=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26b0018a3f77-645bd;
	Fri, 20 Nov 2026 17:53:39 +0800 (CST)
X-RM-TRANSID:2ee26b0018a3f77-645bd
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHD-W7400297 (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96b0018a1aad-20e06;
	Fri, 20 Nov 2026 17:53:39 +0800 (CST)
X-RM-TRANSID:2ee96b0018a1aad-20e06
From: Aibing Chen <chenaibing@cmss.chinamobile.com>
To: netdev-bot+sinfo@kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net: hso: cap the MTU and drop oversized frames
Date: Fri, 20 Nov 2026 17:53:37 +0800
Message-ID: <20261120095337.1088-1-chenaibing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <179513801218.3291.4900870389760727017@kernel.org>
References: <179513801218.3291.4900870389760727017@kernel.org>
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

Hi,

Same provenance as for v1: the missing bound was found by code inspection,
after the automated review of the companion skb_tx_buf fix in this driver
reported that hso_net_start_xmit() copies skb->len bytes into the fixed
2048 byte mux_bulk_tx_buf without a bound check, and that hso_net_init()
never sets max_mtu.

The overflow itself was not triggered at runtime; it is statically
decidable from the code.  The additional paths listed in the review of v1
(AF_PACKET with PACKET_VNET_HDR, tpacket_snd() with a vnet header, and a
route MTU metric above the device MTU) are covered by the length check
added in v2, which drops such frames with SKB_DROP_REASON_PKT_TOO_BIG and
tx_dropped accounting.

Thanks,
Aibing Chen


