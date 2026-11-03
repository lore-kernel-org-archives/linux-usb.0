Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.129.46.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740488;
	b=mIAsUrug5OVACXqUe30F77rSEnkxkJR0ql27BwingdiTTH2NLt81TbI2PRNXdeexH+7w
	 8Lorn6L7HhWUE3p8B1iso4PTQL02mXAwYxHX4tBiSgSsnMkiOnppMrQb/SLBWc+A0w0rh
	 Pz/bHZ1Hcj3u3zTLsXQ/F5D8mCVYAigl9X4yilJABiDej1GbDPO/6lGjFdzP1Q0rUPJMX
	 6m4ejEug5NBXmWa1ocVZjKIeV1fMj0Y5+7gNnmFexotrVYszLLlKrgBkseUzukZhI4lTf
	 3dgtZcsA6HWh9pom/wSTJO0zT2Am/G6wLuihdyOFl/zF5RckKXPKeGdIMEVbw5L4Mcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740488;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wCu0CpTcAZb97qrWbEXkbAG7Jyeyr7fDSmKm3mqVfgk=;
	b=IsNfHLoRFVxdgOs0B3lSoBS32xG2nkLMiPIVGgEflSHjKBfOzIUL+f8d9BcIfVLNK6oK
	 +2XNRty0HI2eHVaALYyslU11M6i+rAUKVRF9oI8C215F0ULSw+4QWZDVUJdC+LU5veQ+h
	 9Ong7AvaP08RY03ECR8xgSy0GcOmhJuUnLs0Zf7U73Pvi8kb24VN6ccC1MLyxDFC/AlKU
	 B2iGhnwUWXxnnq9+saookz/3PuHQ+UahPaC0hELNN4/oQaIgILNDLYh6WYOmUC87T/sus
	 eWyPaxxQH86eb1eYy6G59i5mVAlwyqQR7Gz+IuRI/sjs8QoeiGv49VhUW9rUhfV6SxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nwlink.com;
	spf=pass smtp.mailfrom=nwlink.com;
	dkim=pass header.d=nwlink.com header.i=@nwlink.com header.a=rsa-sha256 header.s=mail header.b=uX+skW9X;
	arc=none smtp.remote-ip=52.129.46.36
Received: from smtp2.iinet.com (smtp2.iinet.com [52.129.46.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F06A606EEA1;
	Tue,  3 Nov 2026 21:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F06A606EEA1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nwlink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nwlink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nwlink.com header.i=@nwlink.com header.a=rsa-sha256 header.s=mail header.b=uX+skW9X
Received: from porter.hsd1.wa.comcast.net (c-98-203-133-45.hsd1.wa.comcast.net [98.203.133.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kaf@nwlink.com)
	by smtp2.iinet.com (Postfix) with ESMTPSA id 62AB4B404C8;
	Tue,  3 Nov 2026 13:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nwlink.com; s=mail;
	t=1793740482; bh=wCu0CpTcAZb97qrWbEXkbAG7Jyeyr7fDSmKm3mqVfgk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uX+skW9XUpKGIquRsafmfuMdi5G72zH9cB0yE1kz+otcb9qK2M75YD4Mxu6CpkY2c
	 3NjVeFsAllYbu8ZC0Fjl3iC21SsnA77pzBkujgtJ3xhdbdltbHU7kMFVeTcEQ76Pka
	 MZnjplOWJNubt5A9qveMBI10kQ1GWkqn6U1RiQO74m/lwyX/B7RYn4o5D2xokbKBqG
	 reEmWU1L9Q469pU5x4R72g/mUpQXovTFQqZduW+bVCvGJbCLasrPC/HanQrg5zSwEd
	 PtLjOX1cTlcNdxWzNZNTw2jI48hjbdRQbIjnuTqwErQvzXdUm7g6h81/BrZnQAv7sW
	 lCwL90/mOnD8Q==
From: Kyle Farrell <kaf@nwlink.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org,
	flavra@baylibre.com,
	Kyle Farrell <kaf@nwlink.com>
Subject: [PATCH v3 1/3] usb: gadget: f_uac2: avoid truncating calculated bandwidth
Date: Tue,  3 Nov 2026 13:14:32 -0800
Message-Id: <20261103211434.996135-2-kaf@nwlink.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103211434.996135-1-kaf@nwlink.com>
References: <20261103211434.996135-1-kaf@nwlink.com>
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

get_max_bw_for_bint() calculates the required bandwidth using 32-bit
arithmetic and stores the result in a u16. A result above U16_MAX
is truncated before set_ep_max_packet_size_bint() compares it against
the endpoint maximum. The truncated value can appear to fit, bypassing
the clamp and warning and advertising a too-small wMaxPacketSize.

Use u32 for the calculated value, the return type of
get_max_bw_for_bint() and the caller's local variable, and print it
with %u. A packet size above the endpoint maximum remains clamped
before it is stored in the 16-bit wMaxPacketSize field.

Signed-off-by: Kyle Farrell <kaf@nwlink.com>
---
 drivers/usb/gadget/function/f_uac2.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index d8cf710085a0..b519382df0b3 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -668,18 +668,19 @@ static int get_max_srate(const int *srates)
 	return max_srate;
 }
 
-static int get_max_bw_for_bint(const struct f_uac2_opts *uac2_opts,
+static u32 get_max_bw_for_bint(const struct f_uac2_opts *uac2_opts,
 	u8 bint, unsigned int factor, bool is_playback)
 {
-	int chmask, srate, ssize;
-	u16 max_size_bw;
+	unsigned int channels;
+	int srate, ssize;
+	u32 max_size_bw;
 
 	if (is_playback) {
-		chmask = uac2_opts->p_chmask;
+		channels = num_channels(uac2_opts->p_chmask);
 		srate = get_max_srate(uac2_opts->p_srates);
 		ssize = uac2_opts->p_ssize;
 	} else {
-		chmask = uac2_opts->c_chmask;
+		channels = num_channels(uac2_opts->c_chmask);
 		srate = get_max_srate(uac2_opts->c_srates);
 		ssize = uac2_opts->c_ssize;
 	}
@@ -689,11 +690,11 @@ static int get_max_bw_for_bint(const struct f_uac2_opts *uac2_opts,
 		// Win10 requires max packet size + 1 frame
 		srate = srate * (1000 + uac2_opts->fb_max) / 1000;
 		// updated srate is always bigger, therefore DIV_ROUND_UP always yields +1
-		max_size_bw = num_channels(chmask) * ssize *
+		max_size_bw = channels * ssize *
 			(DIV_ROUND_UP(srate, factor / (1 << (bint - 1))));
 	} else {
 		// adding 1 frame provision for Win10
-		max_size_bw = num_channels(chmask) * ssize *
+		max_size_bw = channels * ssize *
 			(DIV_ROUND_UP(srate, factor / (1 << (bint - 1))) + 1);
 	}
 	return max_size_bw;
@@ -703,7 +704,8 @@ static int set_ep_max_packet_size_bint(struct device *dev, const struct f_uac2_o
 	struct usb_endpoint_descriptor *ep_desc,
 	enum usb_device_speed speed, bool is_playback)
 {
-	u16 max_size_bw, max_size_ep;
+	u32 max_size_bw;
+	u16 max_size_ep;
 	u8 bint, opts_bint;
 	char *dir;
 
@@ -749,11 +751,11 @@ static int set_ep_max_packet_size_bint(struct device *dev, const struct f_uac2_o
 
 	if (max_size_bw <= max_size_ep)
 		dev_dbg(dev,
-			"%s %s: Would use wMaxPacketSize %d and bInterval %d\n",
+			"%s %s: Would use wMaxPacketSize %u and bInterval %d\n",
 			speed_names[speed], dir, max_size_bw, bint);
 	else {
 		dev_warn(dev,
-			"%s %s: Req. wMaxPacketSize %d at bInterval %d > max ISOC %d, may drop data!\n",
+			"%s %s: Req. wMaxPacketSize %u at bInterval %d > max ISOC %d, may drop data!\n",
 			speed_names[speed], dir, max_size_bw, bint, max_size_ep);
 		max_size_bw = max_size_ep;
 	}
-- 
2.34.1

