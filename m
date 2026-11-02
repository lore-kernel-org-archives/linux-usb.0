Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624961;
	b=IHiN3uYpUfL9MtZVDru8szFrXWpN7YH0CeYv3sydk2Hiw6BMpe4YCAFpU+wnx/Yne4ji
	 8PtfsAwfqitJCiNhZC9QvhVexCEGEaWlfnfyTce76BdNnT80hzzd7s9Rixh2n3XKK3SAr
	 w+h1PeULQLBLzs5bGOmojNWChL9kFPKrEFBa0J4IxHO4HkOuhMdQ6cOCTp5eTAbQ9glP1
	 iOXzPPWM9S3uZ3nnoXwJ5IDlUbC2h0QUqrFdDrsNzADObbTm1GsE7oZWjWpRNuj3db/a2
	 405ZAOZ3S/NJtxZgSnjyV2fJZbyA4vuIrrya86tPkoykirdx5F5mstPd5+Vmamovmjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yRxvXKtdENZrT5ZRlgClS+vF6Rur1KNJc6XxfZ08fMo=;
	b=mTzxAT2+L2u9urJ+hsOWlaZwv94P0eUEKH/vUzB0URS0lhy8RCPviZMadMQWQap0CK4C
	 rRkE/iYwKrPkbMAifkyMM+xpYJa68rDOwGiozsZvvuivcPLva483rg2nz6D62YBl27DLB
	 i278X2WgtXTJ8FgK8V0OyVOlxw74tH5TF120MUnXRn1EguJ1k+pGteQRfWyZv17BOLusw
	 tkxWv/TSTXuh0ajMWK97g1ZlgKBqZlL2+iLTA9vmCEqUPsDwcRu7w1CeuRVZfBD4lvYtD
	 1iL1yc9wJFSPcE1AFwtEBlCB3byo8KA/VTex8PhD5hdN6IGbDmecYbVPo5BTy36c1HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=6+FWIuNV;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734A9606A326
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 13:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 734A9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=6+FWIuNV
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so19608695e9.1
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 05:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793624959; x=1794229759; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yRxvXKtdENZrT5ZRlgClS+vF6Rur1KNJc6XxfZ08fMo=;
        b=6+FWIuNVyTFdJ7aJhGYkpX32QTveys6sOEcbU3g3eynEfqCg2g+TqSL9M+/rGJJth/
         81V+rjaKSxzeHRrRsBfONAj4Ua9ItATefk3SYUhyQvrpbw6f0KlFYmNBLclG7ON8AYrX
         RlLqdp3dejqrE76MEFyFeNGbXTG4UhE1Vs/Orl6VLraYEGPe/m/0MnCc/6Vfdcl8UN7t
         ghufsy36VMlXpTWMHvBz2ggj9aXwQSLHUo2WQdEZysWcYf0wuXaBO46zFjQBWkG2Llyf
         UkS6bhGDT7oS9dMMX7QvoLARQnIY6c9/wItWWis25KxymsdFZseSYiDg7NFTOtuW+p/z
         hqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624959; x=1794229759;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yRxvXKtdENZrT5ZRlgClS+vF6Rur1KNJc6XxfZ08fMo=;
        b=tjU3GHj5bR9roRYv07+ateAe+gcnkl2NkGECpk+JfU4oUx3UY/7VA5V9Jd9vhwNwRA
         YdHIPVUVp7nX9/kFaeNvfZHMMLJVfzA8tf95XYppwOgDruJBYXBZC9ida0//tNeyQB9Z
         jY4nY83FLkfxoTp66pu221w48GC1V10uEy64Cz8faGpSYEiACMCqsPRUtxoh8yB30Kew
         NnbyyZZshommy7dvQWRK5Hlt94AiLIqSoiR+od+3ncNiCkWMFazTlNpiDazACXq8UtYh
         +wmCcpIsfHEHhV77CMCrHIgzcQdT56SOe0DmidaoiRKykd/ouQIoGDtZ+Fe1PbjjC5KY
         1NtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzd4uGAG70nKvyfp0CTUedpTPTHbLg5OLE76Q8UyzZMArGsPUpF1MkePnLjqrSaSFJVJjQxeFxqklY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMWEWwzeFDYsrugIkbhn/bN2GqpXNyHDB7aQ48+gbtqPDE/O1H
	qbNH8U23FhQuTXLFpgrPRWIdPhPBgi3g+BEEwdIpvDIloo12eBpDtQ75d4+n3ZomZXo=
X-Gm-Gg: AYBFou0a2Z7TeFtnVB8XrfsbKavcrDfxv6SgXf8N8iKgYQKMtfYtKdjU5Dzg3FemHzD
	BUMCdrxzz+IMee5xXOcXGqBihy3mM42x2kjNwJkeGVVagiRYk0rpNIe4O8u6YqTVVgXinHYDVor
	Ta1bH0Qxn0ZRLbf5fi9Oyj4BRveAGLqGC9qR7GEoopUhqmgnIz4EC6rUUwhWRqahxdLcAF/fbxx
	guf4pBRsmpi4hSsyCYwGCPiZHS4lbMc+6u0lXgZIlzCF5mzgPFXWVG6aRGx0RcUNxyl9b2hCF2L
	DqrUS+BwgHl0Gss+yMcLwafo4l8vjhSNZ1WJbQlpo5oQh7mdKoZ++gc4tHPfHpbphVd6vogodLG
	nqw5ldFpowBImr/9UCKf2iKWOsM9UxuVodFSuiLSggjBMwceXlDdM4RYBZqPZ3BH3+heT96ZuiW
	I2+d/rrflUvdJRHOPQlNnZzS/5bF4DSmQAKBo5J7VyLqcOtT39q02gZtH1jD9aho1P5/dQ1zXcl
	hJ5oeG6LN+mqGKvLsEqISCbBjjtCRnhwdPvJ0UlpGad/ssrysle1fR+OAjH3eXegHRgeV/dC10W
	fnvxQt9nao7PualBg8iWlEwtggMKk1amBWjYclgQ2OboN9pJf7xFae8qnb2WBevMHUDnEQhTPFB
	Qpkri08Q5+34=
X-Received: by 2002:a05:600c:3554:b0:4a1:e7ce:107b with SMTP id 5b1f17b1804b1-4ac150b20eamr240844575e9.2.1793624958759;
        Mon, 02 Nov 2026 05:09:18 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7246fsm20324069f8f.19.2026.11.02.05.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:09:17 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 02 Nov 2026 17:09:05 +0400
Subject: [PATCH] usb: typec: fusb302: Drop unacknowledged
 Get_Source_Cap_Extended
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
Message-Id: <20261102-fusb302-getsourcecap-v1-1-26b5bfea4b2b@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMOwqAMBBF0a3I1AbyARG3IhZmHHUsVDJGhODej
 Vo9TvFuAqHAJNAUCQKdLLytGaYsAOd+nUjxkA1W28oYbdUYxbu8Ex2yxYCE/a60QVcPiN46Dfm
 6Bxr5+rJt91uiXwiPtwX3/QA1eD0deAAAAA==
X-Change-ID: 20261102-fusb302-getsourcecap-01c38dccb230
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2628; i=alchark@flipper.net;
 h=from:subject:message-id; bh=VuG0QHFfqb3prMOvkI+Bm8+aE20g3JwMuISbVYq90Ug=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWS96C7PfFRwo35R7FuDrevihIvmfpicv2LWk3tcp9hWy
 61rY1H265jIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCqWWYx/JWeHfn2TFvhlUtt2UI2zydGxey307vCEXlwedPG+e1P7RkZfrN4t/b
 vVlGYezb25teqgsksmeq6JxQEVwqp8jUtzt0zlx0A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The chip mistakes Get_Source_Cap_Extended for a GoodCRC, as it apparently
decodes only the low four bits of the message type. As a result, it sends
no GoodCRC for it, but still queues it in the RX FIFO. The partner never
sees the message as delivered due to no GoodCRC, so it retries and then
sends a Soft_Reset. When FUSB302 receives the Soft_Reset, it finally
raises its interrupt, at which point TCPM sees Get_Source_Cap_Extended in
the RX FIFO instead of the Soft_Reset it just received, and answers it
Not_Supported, which is not a valid reply to Soft_Reset, so the partner
escalates to a hard reset instead of getting a chance to gracefully handle
a lost Get_Source_Cap_Extended.

Discard Get_Source_Cap_Extended, which FUSB302 can never properly receive
due to its inability to automatically GoodCRC it, and answering it from
the host within the protocol specified 250us window without so much as an
interrupt cannot be made to work.

This way the TCPM view of the PD exchange at least matches what the
partner saw on the wire. This lets the TCPM complete a PD negotiation over
the FUSB302 with e.g. an Apple Studio Display, which otherwise always ends
in hard resets.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/fusb302.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 3319f6a2b0c9..96dc48250d6a 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -1463,6 +1463,19 @@ static int fusb302_pd_read_message(struct fusb302_chip *chip,
 	fusb302_log(chip, "PD message header: %x", msg->header);
 	fusb302_log(chip, "PD message len: %d", len);
 
+	/*
+	 * The chip only decodes the low four bits of the message type, so it
+	 * mistakes Get_Source_Cap_Extended (17) for a GoodCRC (1): it neither
+	 * acknowledges it nor raises GCRCSENT, yet still queues it in the RX
+	 * FIFO. Without a GoodCRC the partner never considers it delivered and
+	 * will retry and then soft reset, so it must not be answered.
+	 */
+	if ((!len) &&
+	    (pd_header_type_le(msg->header) == PD_CTRL_GET_SOURCE_CAP_EXT)) {
+		fusb302_log(chip, "dropping unacknowledged PD message");
+		return ret;
+	}
+
 	/*
 	 * Check if we've read off a GoodCRC message. If so then indicate to
 	 * TCPM that the previous transmission has completed. Otherwise we pass

---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20261102-fusb302-getsourcecap-01c38dccb230

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

