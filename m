Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=68.168.211.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795244341;
	b=40tEguBzKe5UIxnSba5Cbpl1rW1VC2xC+0CfdGmT8jH33wUyppwp4YHIHMBkR2l6esxU
	 HCEK0h+BGP1CRhD5NpBdzuRl+RjvV1uCbn4xr75XLsilwW7bzbvFew/1EK/MfDEuHJ5Dw
	 MKCheUlf2rZ5Vd9obniF5P9Zw7rbQcwxKOr/hjaTI75ogspmWAtWhAfymctxem3JCr6bD
	 6b/JEIyicic18fYe9H25LjT1O6LKUVkH5hHkDN/W/q7iM9/D5NytUEma5hd8bSKW3urQO
	 47/Wpd6hOZOwOolhuq+iunMnuj9OBoxjtjVCikI+Zn5J7dlga8i6zh7pg1SH0jnMV9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244341;
	h=DMARC-Filter:DKIM-Signature:Received:X-Zone-Loop:X-MB-ID:Feedback-ID:
	 X-INTERSERVER-ORIGIN:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:Thread-Index:Content-Language:X-AuthUser;
	bh=vB6aW7KMflR4R3MBYU1ro1EnDsiSwPynpZxpAQKLXS4=;
	b=QKx1r8hguXki/mU5wj31p25CoicrcyftV2nwSeIpiTJemU+18uXvzJWV8ObjglZGezIB
	 YipVZdaKpFDWrPNIUwHhsIkRi8wAAZbu30QjtdG4J2Y1jVJn3nTaMIi0V2evM+WLdl9zO
	 kOGAdbDEjK9SSi2PKGJnJ94KMzEfiwetoTj6B9bNFG6yyvc7YmIIy9zLRViQoIXZs5YD9
	 O78GzfxX995NdrMADpg6iPFceZgQsM6lu8ny1CvKbC8h055cu2liu3MWkwZ0Ud6ICOOEC
	 xRHWBbXS9w7UklZiBhaKqTIqQeZoJ2jzDR/KYCAHmvbty97t/sKLJ4tD9r/4/FL9d7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=albefly.com;
	spf=pass smtp.mailfrom=albefly.com;
	dkim=pass header.d=mailbaby.net header.i=@mailbaby.net header.a=rsa-sha256 header.s=bambino header.b=Urusk4JF;
	dkim=pass header.d=albefly.com header.i=@albefly.com header.a=rsa-sha256 header.s=x header.b=KcSUItTm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=68.168.211.173
Received: from relay2-r.mailbaby.net (relay2-r.mailbaby.net [68.168.211.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DC7606A32A
	for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 06:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47DC7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=albefly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=albefly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailbaby.net header.i=@mailbaby.net header.a=rsa-sha256 header.s=bambino header.b=Urusk4JF;
	dkim=pass (2048-bit key) header.d=albefly.com header.i=@albefly.com header.a=rsa-sha256 header.s=x header.b=KcSUItTm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbaby.net;
 q=dns/txt; s=bambino; bh=vB6aW7KMflR4R3MBYU1ro1EnDsiSwPynpZxpAQKLXS4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:feedback-id;
 b=Urusk4JFn9QczbPxyUdbGXL2eiSRkl6qPThApYODwsllZr5X7hJcWHOS0VPHUsjgTB6Gnr+WP
 dLxkhQryphS8d93zJQlC4HflBS3T4T2/aFmcXokkU0AXeCkGjfOCtenPyCznvAkmGiOi5vpmpai
 DRX2Ov5YVIBybSyeXt8zYV4=
Received: from da900.is.cc [216.158.229.242] (Authenticated sender: da900)
 by relay2-r.mailbaby.net (MailBabyMTA) with ESMTPSA id 1a1fce67fc1000625c.002
 for <linux-usb@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 21 Nov 2026 06:58:47 +0000
X-Zone-Loop: 4445dee6191ed36e437582500312ded207d6f24dd2ea
ARC-Authentication-Results: i=1;	rspamd-cluster18.mailbaby.net;	auth=pass
 smtp.auth=da900 smtp.mailfrom=alex@albefly.com
ARC-Seal: i=1; a=rsa-sha256; d=mailbaby.net; s=detka; cv=none;
 t=1795244327;
	b=oe4Ubao6bAfdyKGCXOVTSatJYt/HLF96ehjVQIklMMO6IJo6r7iIJ/A6ZInRRsk/RfM/im
	ICiKKnEtMxSJV6jVrcK81VyMPEazRf2fduuQPpAMW2pN6fVofA/eAC04/DuuOpAfRo+raV
	5PF9kBJYRWLLJjf8odCTlTHwmdEyi7iNsYdWVmMCvmHCBTK8+SFbhTv+/dRZcmSFYIeIqp
	x8WXfrTNwZJ/T8gTFaHXFGGXbBTZ+xjSzFKBVF2HiKIunI/rMoUrJHo6Ebeg97QaFp8jwv
	OBBcRsFx61Hrvuenj9jfGSqlVrKDrkTXdGKo1Kk8496bXkunPe3+x593zL5cxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailbaby.net;	s=detka; t=1795244327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=vB6aW7KMflR4R3MBYU1ro1EnDsiSwPynpZxpAQKLXS4=;
	b=eq61z1Qyz9P8+PNBdp3XLolNQUA6v9mcjd9xUcudrp7L53zg4IvubDfRKuYsvlqwIwqIGq
	nLj4Epn7crMdEfqyBmHoZ+XNki9b+F1225P7kp3QtsS2hazqhUMLlsazFl/Y1xOter8IOy
	Y8NwPDwwI8aJGCUOANxpYSfNnXtNmlFcdZ8eusQxFmV4WTstzO0HkNHGA+AimEPuL8dH8f
	Vg5ZxJu/RQjUq9h3hKCsqiup5jgxC/4ZM56hmYlKo71+wOZj263sZNultM06T9yjlGrM/b
	vf8puckz9le0Lq8haCE4UXq6nkMP1btOLH4lKYQ3XJFr4GvKienXbM72BHlCoA==
X-MB-ID: da900|alex@albefly.com
Feedback-ID: da900:albefly.com:5b7b42465846515d4153555a4b5d78:mbaby
X-INTERSERVER-ORIGIN: PASS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=albefly.com
	; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vB6aW7KMflR4R3MBYU1ro1EnDsiSwPynpZxpAQKLXS4=; b=KcSUItTmusTHWoKKsO4jADOWNc
	K7FkQWSP1ymG8ZbcIS89btaU9DIXtSnOW6O8ZzqOLLlf6BGDelRU/oyaLxs999hDEOLVeXJv05HY5
	QC0hAe1s+/l1h6WxiiWZ2JTWXJGKdORWqhzw2EQgwp3xbHwr+kll3krBVD+IobTM+VidUxgVEIAph
	k5GvHOH5J1SXixJSOBmBAbdmILTqjtp9Kv5Ih/vcs4+DINKPjVRfeckJTx+L+mNUenFbkWfUd5rE6
	h3ZWaO/mpMnQICYm5R0Jwhcrtn+qQo5qmTn7d0i167t8eVKqdPK9/5nTGodwYJkAITlmZ55tvgihm
	AVpKY+OQ==;
Received: from [47.197.78.70] (helo=AlexDevHomePC)
	by da900.is.cc with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <alex@albefly.com>)
	id 1xUf3f-00000000CBi-0XLl;
	Sat, 21 Nov 2026 01:58:47 -0500
From: "Alex Kononov" <alex@albefly.com>
To: "'Mathias Nyman'" <mathias.nyman@intel.com>
Cc: <linux-usb@vger.kernel.org>,
	"'Takashi Iwai'" <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>
Subject: xhci: unratelimited "buffer overrun event" warning floods log (~7000/s) with USB S/PDIF capture device
Date: Sat, 21 Nov 2026 01:58:44 -0500
Message-ID: <001801dd7985$c068fc60$413af520$@albefly.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Ad15hWqKoBIPiDpISteJoxeMD+Y/bw==
Content-Language: en-us
X-AuthUser: alex@albefly.com

Good day Mathias,

With a USB S/PDIF TX/RX adapter (Savitech, 262a:9123, UAC2, high speed), the
xHCI driver logs an isochronous buffer overrun warning for nearly
every microframe while the adapter's S/PDIF input has no signal:

xhci_hcd 0000:00:14.0: WARN: buffer overrun event for slot 2 ep 4 on
endpoint

Rate measured: ~433,000 messages per minute (~7,200/s). systemd-journald
sits at 100% of one core and reports "Missed N kernel messages".

Setup:
- Intel N100 (PCH xHCI 0000:00:14.0), Debian 13
- Kernel: 6.12.117+deb13-amd64 (same code in mainline 7.4-rc3)
- Capture stream open continuously (CamillaDSP), 48 kHz S16_LE,
  EP 0x82 IN isochronous, adaptive, 125 us interval
- TV feeding the S/PDIF input goes idle -> no input signal -> flood.
  With a valid input signal the count is 0.

The device is clearly misbehaving (it sends more data than requested when
the S/PDIF receiver is unlocked; it also reports its clock source
as valid while unlocked). The driver handles the events correctly and audio
recovers fine. The problem is only the logging: the warning in
handle_tx_event() for COMP_ISOCH_BUFFER_OVERRUN is not rate-limited, so a
single misbehaving isoc device can generate thousands of lines per second.

Locally I changed that xhci_warn() to dev_warn_ratelimited() and the rate
dropped to ~100/min with no functional change. 
Would a patch rate-limiting this message (or demoting it to xhci_dbg) be
acceptable?

--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ handle_tx_event()
 	case COMP_ISOCH_BUFFER_OVERRUN:
-		xhci_warn(xhci,
-			  "WARN: buffer overrun event for slot %u ep %u on
endpoint",
-			  slot_id, ep_index);
+		dev_warn_ratelimited(xhci_to_hcd(xhci)->self.controller,
+				     "WARN: buffer overrun event for slot %u
ep %u on endpoint\n",
+				     slot_id, ep_index);
 		break;
or

	case COMP_ISOCH_BUFFER_OVERRUN:
-		xhci_warn(xhci,
-			  "WARN: buffer overrun event for slot %u ep %u on
endpoint",
-			  slot_id, ep_index);
+		xhci_dbg(xhci, "Buffer overrun event for slot %u ep %u\n",
+			 slot_id, ep_index);
 		break;

Endpoint descriptor:

Endpoint 0x82 (capture), from lsusb -v:
  altset 1 (S16_LE): Isochronous, Adaptive, wMaxPacketSize 104, bInterval 1
  altset 2 (S24_3LE): Isochronous, Adaptive, wMaxPacketSize 156, bInterval 1

/proc/asound/card0/stream0 while flooding:
  Capture: Status: Running, Interface 3, Altset 1,
  Packet Size = 36, Momentary freq = 48000 Hz

Thank you,
Alex.

