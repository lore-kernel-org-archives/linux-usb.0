Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.129.46.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793056246;
	b=gjkomCUuPWmPwlK8CRJGKmmTHeLOA/2965RyHSIIVXb36jUKd/myfOx7YcQNHGXIVRHf
	 hEyBQOiFMYcNFHBatBjInnCtbZxdtCNVNV+n1lnYW9DesJzA7qSxBNbOc7w3DaqQgVL/U
	 4a0xOCBt9nQYqa811qX30j6tuEZbpW7SZq19Mf/4u0C7uVVIsXHBgLPVJhPaC1HMuXkD9
	 1f7wfmHkiC67J/z7nP+TG56j+lyAhE2c8+0pYqa7ATV8THnetQoL+j6JBA5GKX+HKVCSO
	 N+i8OsqNhGVOjWXc4ffon0XxgEf47p1vLxZ+SKs5GWCjutglEP0e9gwjY04AMYXk2Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793056246;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=UbQTiQioBTc1B08jMg8fpk+q5bpoL0hG89VT3Y0uP14=;
	b=v3Jx/agCrPNB9fArM43zftlgMURa45ffpCvbFGTWiWX6uiyuv+G7VmjlqBc4PrMkxfgc
	 kE5xmOJv8o6MZpWAOql83AV/stHw7reKQD2CFq1rnQNOtyj9QZXWCtiMp8vaIWksy1XYu
	 kgQDg81ojf0clfstICuNgabQx4CHB/BanQz67knmPFfmSLKxZ4huCfqB+mwWxrgP0URYF
	 8Hg/BTGNoo+xLCSVMzWnZP+zamR4ugJ3ltX8qynOf7Ppvifqvx0WF1cJz+6/3s7zVFSMm
	 +GaEUZRGi27iNc5bXQDj5XGLuo9AWjGzs6K/yLkJTlcJMaDHW6nMFFRgqjmbBTjDT1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nwlink.com;
	spf=pass smtp.mailfrom=nwlink.com;
	dkim=pass header.d=nwlink.com header.i=@nwlink.com header.a=rsa-sha256 header.s=mail header.b=bkv9yYqd;
	arc=none smtp.remote-ip=52.129.46.35
Received: from smtp1.iinet.com (smtp1.iinet.com [52.129.46.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F7A606A31B
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 23:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91F7A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nwlink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nwlink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nwlink.com header.i=@nwlink.com header.a=rsa-sha256 header.s=mail header.b=bkv9yYqd
Received: from porter.hsd1.wa.comcast.net (c-98-203-133-45.hsd1.wa.comcast.net [98.203.133.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kaf@nwlink.com)
	by smtp1.iinet.com (Postfix) with ESMTPSA id C7626C00467;
	Mon, 26 Oct 2026 16:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nwlink.com; s=mail;
	t=1793056238; bh=UbQTiQioBTc1B08jMg8fpk+q5bpoL0hG89VT3Y0uP14=;
	h=From:To:Cc:Subject:Date:From;
	b=bkv9yYqduBagqc8POk5RV9e+w1myeG2NoQ0uU8V2004QLuQNX9ERa6NMePG/9bs4O
	 qIrkA0yaOTzxHTr/pW0wDiiU2lrAEXsSmccokuqOS9YXJtPJRuKTGlpWUO/6aTLSe0
	 MnlVHnmYaMsVl0y3zkTfOZoNOWmb1l3Nab7urJKJPcMEvkXetz2O4ZR+I4tmKmbeG9
	 E5Y2XK/0nRf7uHXvMr0IVgxSr7sABWJMINQMT2wGOQhbyRcPrlg2kfH8QcTxOy41qv
	 ctmCdE7+WwV62AD8ZWuTwZlIOYSvMLbyvn6kObKiRq9rt6Pc66NjcJ9uwZdeye4+r+
	 rOW5pXTnLjNPg==
From: Kyle Farrell <kaf@nwlink.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neill Kapron <nkapron@google.com>,
	linux-usb@vger.kernel.org,
	Kyle Farrell <kaf@nwlink.com>
Subject: [PATCH] usb: gadget: u_audio: don't exceed maxpacket when adding a residue frame
Date: Mon, 26 Oct 2026 16:10:26 -0700
Message-Id: <20261026231026.721536-1-kaf@nwlink.com>
X-Mailer: git-send-email 2.34.1
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

u_audio_iso_complete() clamps the base packet size to ep->maxpacket
and accumulates fractional-frame residue in p_residue_mil. Once a
whole frame has accumulated, it is appended to the packet without
checking whether it fits within ep->maxpacket.

Only append the extra frame if it fits. Consume the accumulated
residue whether or not the frame is sent, preventing it from growing
when the additional frame cannot fit. When the frame fits, behavior
is unchanged. Otherwise, the stream cannot sustain the requested
sample rate.

For example, with 27 channels of 32-bit samples at 19200 Hz on a
high-speed link with p_hs_bint=3, the required packet size of 1080
bytes is capped at 1024. The base packet is 972 bytes, but appending
a residue frame increases it to 1080 bytes, exceeding the allocated
request buffer by 56 bytes.

Fixes: 9bb87f168931 ("usb: gadget: f_uac2: send reasonably sized packets")
Link: https://lore.kernel.org/linux-usb/sashiko-outbox-174688@kernel.org/
Signed-off-by: Kyle Farrell <kaf@nwlink.com>
---
 drivers/usb/gadget/function/u_audio.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index f0ee83abcebc..f73d1085c1d1 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -230,9 +230,13 @@ static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
 		do_div(div_result, uac->p_interval);
 		do_div(div_result, 1000000);
 		if ((unsigned int) div_result >= uac->p_framesize) {
-			req->length += uac->p_framesize;
+			/* req->length is bounded by ep->maxpacket above. */
+			if (uac->p_framesize <= ep->maxpacket - req->length) {
+				req->length += uac->p_framesize;
+				pr_debug("increased req length to %d\n", req->length);
+			}
+
 			uac->p_residue_mil -= uac->p_framesize * p_interval_mil;
-			pr_debug("increased req length to %d\n", req->length);
 		}
 		pr_debug("remains uac->p_residue_mil %llu\n", uac->p_residue_mil);
 

base-commit: bdf12cde30830d46a8ef1ba93986356f1164b4f1
-- 
2.34.1

