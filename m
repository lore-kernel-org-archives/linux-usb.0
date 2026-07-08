Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FB7379C5D
	for <linux-usb@vger.kernel.org>; Wed,  8 Jul 2026 12:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513982; cv=none; b=rmEaCaolXR+QGeak3RraE5ND7xprc7dc9c/XwZULVPTdshRKuL8RFaRFpcm0xlHh8hZf5FufCczJH1Bic0MNDpqsOWKT0FRKljgKs5p/84OA09uSos+o+sR9Wxn8FozVqDQq0dxUdD5qvfdlKSzCwCr2yFxFYLoPTz9y+cqfjLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513982; c=relaxed/simple;
	bh=xH4djh0sbYjVRw6abJvUXGH+Vf4ZFWs8OUuXAVwTQ8Q=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=u2W7nFgX7sXZ3IOQbX+KLWV4ZmlXyOxgxGYPAKCEZjL/fPBkRFGlTFx3cH9fnuf9D8ahi1mAMbk4WJfE4FJUUBNpEinGzlLFVi+Iv1M2gMEnUj3bq6OvEEGsacyLkuSRLux0rn0maeG3wQdMbuzNwtYkos4OKju1jN7BbyaWMXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OiZbWn0o; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OiZbWn0o"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so501057a91.2
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2026 05:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783513981; x=1784118781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kf32tRnVCLRfVL7z9Id9IOmCImCdXN4Q3ZRAbbNnSB8=;
        b=OiZbWn0oivTAtxmkAVhcVbIXdyKH7wefQXk/DOCdJKT+dLNLCcdTYmbq//AIKiThCH
         olps5lwTn/fEdF23oJV9xzD4/+880PvDJgIsz1MpYf9QN6Z2D8O+CCUTfTAiTAx5oLdj
         GF18puUa/BLAnkrdQimz4MoHHQSVnMyz54N60I26sq/eiw37RuSaZdy2p3+7fMxQdMB3
         4Lnx/XttSJB/rRjmFPQSfG+kjxYZJJO4yT3/7Z4yR+M863D/xz/XN525XEZ3xAWbjf1z
         aqlaBhQ9jDDNBGjVQDHlhHN3Jyg3ESDJ0iDt7iWtmpEr8/UvZ5R1yBHMv57UWsn3EIv1
         K+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513981; x=1784118781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kf32tRnVCLRfVL7z9Id9IOmCImCdXN4Q3ZRAbbNnSB8=;
        b=Xhle/p6dg2Y+oW9LTFzJfp3BG4Ob2bf0DwV7LIbSy0DzVuXRyH3+KmobbcHcLR2vNn
         mqhQPUZorDai4wkaahr2u0F0CMxe4VTsrAF8iDYGYUlukjHQTL3kmtrktWs5qXC6U1Qy
         zyz4aOJFm7enG0UzDLMB2CV2keGBSa3iOwbI2VoCykWkm8f5c0c3svJwKolQ0Y9Xbgt7
         lz+vNnd/moxqThPUpMj58WnSQTaSyyeBC9op+h0DWiaUglkjfAXqczeKd4O4ocSMcaQ9
         7tj5owrYnpKMkM8SftfBpcXqNuHyIun2c7zBAlQ8Hea/0rPqSiekq8/+BZIbKB8nG3Nh
         RaMA==
X-Forwarded-Encrypted: i=1; AHgh+Ro89aEEc8PTmhgcs5Yx4JnUMTdRWySMi5pGwsTVWLBIJtfRXtWXbUiEFha49dpUCprl+DKNtAI7XjE=@vger.kernel.org
X-Gm-Message-State: AOJu0YweDrzVih8bUNry8ecM6Btcq6EkgNmRGKsfmTkUa8IlIQUUWvz1
	PJzudcO0QQj5zf1uNK/he+0ereT1fRmVxf+b2kEFSGGJzWKUpl+8Nz61
X-Gm-Gg: AfdE7cm9j8onnrNXtPlu+SIUgYJDSaT3rmlvXEEmfGbtHd9NWJOq0HT/ay6Hr5HUH9U
	BNkqGtHrp9GlJnDNbClbZtiqmSfZcb2zw0GElUd42zuNPI0McEfnz2cZTJnI2qnk/BmxVqFKc/y
	x9ZpsLJJzWnDYC18YBemOef8rELkrcbSSZ6slyeuJh7BKybxKZ8W4KRD3Co0P1Un7rofePFpcn8
	mKYjfcKiMH9Ycnrjddj6D8Ge/Ca3jaDog3ITWf1oTXftHOCfjrxg7QXFjiT9iWNfgGk8t5bPugq
	nA7E7jD73T9eOxi+WVLh6j9SNuSdjeUaFc5iCfwm6zzfMcytqBFB5Tu5tcPZcXgdS4VxBI+Wnqs
	0opeTTxstBSFSyHljoXcp++W6OX9AvntoPwOKunejwUPOpu/3t60JOnMGDELst+6unMAxKwA=
X-Received: by 2002:a17:90b:3fc8:b0:37f:ca19:36c6 with SMTP id 98e67ed59e1d1-3893fe5d02bmr2236923a91.11.1783513980466;
        Wed, 08 Jul 2026 05:33:00 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-388fe57a4fesm464357a91.2.2026.07.08.05.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:32:58 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kuen-Han Tsai <khtsai@google.com>,
	Kees Cook <kees@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	raub camaioni <raubcameo@gmail.com>,
	Yauheni Kaliuta <yauheni.kaliuta@nokia.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: f_ncm: validate NTB datagram bounds
Date: Wed,  8 Jul 2026 20:30:48 +0800
Message-ID: <20260708123048.760209-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ncm_unwrap_ntb() parses the NTB block length from the host supplied NCM
header and then uses it as the boundary for NDP and datagram offsets.

The block length is checked against the configured NTB maximum size, but
it is not checked against the amount of data actually present in the
received skb. A malformed host can therefore declare a block length that
is larger than the received transfer and make later offset checks pass
against bytes that are not present in the skb.

The parser also validates that a datagram index is inside the declared
NTB and that the datagram length is within the maximum Ethernet frame
size, but it does not verify that the datagram end still fits inside the
current NTB before reading the optional CRC or copying the datagram data.

Reject NTBs whose declared block length exceeds the remaining received
data. Also reject NDPs and datagrams whose declared lengths extend past
the end of the current NTB.

Fixes: 9f6ce4240a2b ("usb: gadget: f_ncm.c added")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/usb/gadget/function/f_ncm.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index c5bf8a448d64..186e0f48cb8c 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -1210,7 +1210,9 @@ static int ncm_unwrap_ntb(struct gether *port,
 
 	block_len = get_ncm(&tmp, opts->block_length);
 	/* (d)wBlockLength */
-	if ((block_len < opts->nth_size + opts->ndp_size) || (block_len > ntb_max)) {
+	if ((block_len < opts->nth_size + opts->ndp_size) ||
+	    (block_len > ntb_max) ||
+	    (block_len > to_process)) {
 		INFO(port->func.config->cdev, "Bad block length: %#X\n", block_len);
 		goto err;
 	}
@@ -1254,7 +1256,8 @@ static int ncm_unwrap_ntb(struct gether *port,
 		 */
 		if ((ndp_len < opts->ndp_size
 				+ 2 * 2 * (opts->dgram_item_len * 2)) ||
-				(ndp_len % opts->ndplen_align != 0)) {
+				(ndp_len % opts->ndplen_align != 0) ||
+				(ndp_len > block_len - ndp_index)) {
 			INFO(port->func.config->cdev, "Bad NDP length: %#X\n",
 			     ndp_len);
 			goto err;
@@ -1290,6 +1293,14 @@ static int ncm_unwrap_ntb(struct gether *port,
 				     "Bad dgram length: %#X\n", dg_len);
 				goto err;
 			}
+
+			if (dg_len > block_len - index) {
+				INFO(port->func.config->cdev,
+				     "Datagram exceeds NTB bounds: index %#X length %#X\n",
+				     index, dg_len);
+				goto err;
+			}
+
 			if (ncm->is_crc) {
 				uint32_t crc, crc2;
 
-- 
2.43.0

