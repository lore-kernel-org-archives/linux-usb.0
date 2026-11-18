Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001004;
	b=2N4+2RmivSYAQqAkUBKHLGGx5rEYzzh77WA8oGJbEMGhbpBj2HigBaoWarToCDdewVNa
	 4a52WqFcxiOLtcjhki50+Z7ae8PaTBrbMNgihrY6tIvJeqTuhPdnVW99LDn+ZBJomDZO7
	 EUIPQtJFU4upL2cZpSu2GKpxqzypZBpb7K6Z1jDN7084RIhDNcJ24L/gl91hfVXQgkUmL
	 YPC6Q6M88LOIjX126qnFetiovl/3zhgqtl5QaITfyS6g//tOHwCx7+JwCqcRgkp+k1H7V
	 fo8jkQpqW5GWqQAT6TDlAwzEWLN1k6ZyHFQU60hINzzbgHYdubJcjfMz5i/L2SsT+yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001004;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=W6x2pelBr3wYOCPRTKHiPfM5HE9jBdaWLd+H8cG1qSs=;
	b=JE7H/XsIR2NfLhsRKLKCrc6vF2Kk/nuQDmqSoq8MSS2WA5qJ8oMxnTBGkZF0SdGvsLtl
	 DMuBf089AQBKvx6gY+Uh4Op99BmXS0PtOPAzAva+RIafAiioYUgeIFrUsVgusIJ8eu4GV
	 K6EiVTYDlyOvl9SnZeSeUP3OLVpNMbwz26taA/++yZqrARbk9N2syCUScHiZ/HKapYfX/
	 9+0oLuJw2bF4z6re0UQNu8GrrYu/48I5cOqjhHzhFOHqmuY8rFpQRy2F2YdtMTPNtN8+7
	 GWucdQ+Zp7pIDaY8H5D15E7aBmPa1yvGkJ7fSKrEUH3giiubCGcf2WkJZy1KJJ5Q/dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=posteo.de;
	spf=pass smtp.mailfrom=posteo.de;
	dkim=pass header.d=posteo.de header.i=@posteo.de header.a=rsa-sha256 header.s=1984.8680eb header.b=h7i9IytE;
	arc=none smtp.remote-ip=185.67.36.66
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F240606A31C
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 11:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F240606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.a=rsa-sha256 header.s=1984.8680eb header.b=h7i9IytE
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id A7CA3240105
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 12:23:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de;
	s=1984.8680eb; t=1795000994;
	bh=W6x2pelBr3wYOCPRTKHiPfM5HE9jBdaWLd+H8cG1qSs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=h7i9IytE/1gaX3YfY32QyXasyHloxSLIWgiFlf/gIlmFEow9rjvE+AwtqWLWF2B1X
	 bG5gqP10n8Jlq4dyuxsmU+JB2t9ZkPV+D16pjmL8yeAnkIjUy8qrz8MkBwXw1UkK49
	 rGhRa7COC9VQ4Kiq0U+AUvCRCHHp4fM2oUJ01KvjOmy19jkuJTDibnhFg5ssxxzOHw
	 uI/QBk/dHaNJ2zlAwFjZhUg0t5UPoGpuV6KP/Ofk6tDUrXj1TWgGNFlQhGVLuQg0eX
	 skCrQGlLggBIRn4e6QnIy/yWSX+08dhqXDq8qRvpDc/85RYk0OiyZDI3wg+RfdCpS+
	 rAFacqO68BF9A==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jTzjs49lrz9rxF;
	Wed, 18 Nov 2026 12:23:13 +0100 (CET)
From: Freimut Diener <freimut.diener@posteo.de>
To: Yang Siyuan <hsyysy@163.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: phy: generic: request the vbus supply only when
 it is described
In-Reply-To: <20261117094539.13527-1-hsyysy@163.com>
References: <20261117091956.12103-1-hsyysy@163.com>
 <20261117094539.13527-1-hsyysy@163.com>
Date: Wed, 18 Nov 2026 11:23:14 +0000
Message-ID: <87a4n6v0wv.fsf@theta.mail-host-address-is-not-set>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Tested on the NXP i.MX93 FRDM board. The patch eliminates the spurious
dummy regulator warning.

Tested-by: Freimut Diener <f.diener@pengutronix.de>
