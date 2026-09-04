Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23CB38A711
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 12:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524306; cv=none; b=V8/bSECe07OGjgn2OX4w3j/B4Mw/8/tazb37DeQyDBDosIMO7ecOok63JhMEULTUhSrHMrCq31TFm4ANrfnxS7StjfLgQK+4EPhh24DDlHrrS/7FMlo/DzqvDhGHXo+mYhg9Iw9ga/jsm0ne+m9lemNo6FRmtCaazTWl8W3p4bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524306; c=relaxed/simple;
	bh=fhFe03uXtuJjHdWNnkNZhWHk5eyor9PjO6gBO+wSF70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=szg+WIRPmgMN4XosgXow07ch7QeeZhfkNc2iGnjW6dy+upK1D7m4xScez+d9BEAZ5l5W1j8xrp/X++u00GHX9ll8Bug4x4YIKL+kPH7Jf2mG7/AxscC1Mv4+SSy1gldf2DI8RHTZXQfSCV4ossUmoW+Ztv4JxoQIf+DfEQLxH10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i4dw864M; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i4dw864M"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1cc1b42b5so1052427a12.2
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 05:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524304; x=1789129104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f+iaj7uAIqLQ0zXKTnQ5GgaFQgbx+QY7l0WvzVqhy34=;
        b=i4dw864MCwvaXP4184Pz4MowhBujfjQvIPuI8xxCq6PjEsQVo4Bh69IrIetr1T8Hb2
         Qc0T/cx97PaTiBK4IKwlPfyDpaydehSq4LkfqgnU13/yGNZ8CFJYm+TMVUsatfaqlk65
         GButeM2s82Y/0Xsf1uzXgIOeo3rphyild0XLu/04ViKQnbb3faQgDNkTSD8v4CVk3ULe
         L6PcNXI2b9W0dtdfQAtxmO6/MI257IJBuNA6z+jbsaNql1TK2YJjSfDSpSi4A1H5Big/
         /HHJDJYNTHeBsJQ4vjVikP3Ogk8bWV+vPkssu09HcIPbNlFIuGeMo7cZG36WNhWm1/px
         7Uvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524304; x=1789129104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f+iaj7uAIqLQ0zXKTnQ5GgaFQgbx+QY7l0WvzVqhy34=;
        b=eov9BI53qZIm7kdMPZvM8tN5djdSi48yR58Q9WU10mkFt77bkYdy0zVWqNeY/fHzKf
         NA3KN+BmVjpmR8RwodgLh5M+uGOpHybdWHTUlm86JJw9EvuqEfQmCeW4Q1zgmXNIVK7t
         TCdl5Ya/MsDx6lJYR3gsNwGbDpEf9rOKkNdfuFnonSRY2WIDnDaLbfkUAoGfjf+r7M3R
         n3DcxxQixMX5U6p8RyhHnaToPm+WW6up4FKPKFic1t64+T5jLuh2NZoaCqU6cZGlOwZF
         44Im/DKVP9ldAxY4j6LhgAJP9cO3eMgDzufj4XopTxki/if7wSxU+SG4cNdO5Uuy5p6x
         3nLA==
X-Forwarded-Encrypted: i=1; AKwUvBwOrvyLObELR9miNuDydCAQVyOLnkeHbYZ7EenHCqxLm2fEQkyoWab+37lN7G8F3aIrpQ36LMzCKJI=@vger.kernel.org
X-Gm-Message-State: AFuF++m0M0mdosBFF//I3u2mYOzpesz5QY9nbLrYuIfVg8K5uAoLwRDW
	kXarhKEq5BPep5kikjRj3D1VK3Ojp1oUqj3AECw6ZG6ttLEi2djAA0YF
X-Gm-Gg: AYBFou1r9bsfZ6Hv3XWhdeQ8tt70sb9I3oa9cXhE9V5oMrocYBUZ/3qLesbWG76jlmJ
	HzgUrwv4sPelUD7OE3IpekICzvX3f+jtzZUv7YotjLtz107T0YPK0KI5iTRO2SkARvrAxSxbGI7
	cPs1/CA8B8/om1OSZIKmDKkXSAcNXZIfHAjSpSFo+/NjrV7AJIN35FtHaCjC/xLnFw+l8lLKQsE
	PiodnDMCtjcTd+wGTsKKpBgluYUqtP5itbKnEBMcF8aort0E+LJXn11aGBxXFQWPcqUbQHIHUsv
	wtIYquqAgdEMC3znJUqPPmCZj3mGVldql2Yg5IokRURueRQzESFZngDVGOINA9tOs9of6IYFuI1
	9tPCmdLeMhQXWZM/wUsqFSb/am2ohay0F/kfSVspsxKckT8k4E1yTltKEECtr0MQEG9FNP1ufWe
	Q1XoNDOurTTX6sVuBpgS6G1bK5+4dQ9JDWMocPPL0Lk2L+kb2gWjQRnE7WhPjbEI14TtKILY7CT
	yeI5CQV0o1lG+E=
X-Received: by 2002:a17:90b:5344:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-39b261b1a47mr9830027a91.13.1788524303344;
        Fri, 04 Sep 2026 05:18:23 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm7181575eec.2.2026.09.04.05.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:18:22 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 2/2] usb: serial: fix repeated words in comments
Date: Fri,  4 Sep 2026 17:48:11 +0530
Message-ID: <20260904121813.26714-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904121813.26714-1-hemanth.selam@gmail.com>
References: <20260904121813.26714-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop words accidentally written twice, reported by checkpatch.pl as a
possible repeated word.  Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/usb/serial/mct_u232.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/mct_u232.h b/drivers/usb/serial/mct_u232.h
index e3d09a83cab1..f79a1f1b6a98 100644
--- a/drivers/usb/serial/mct_u232.h
+++ b/drivers/usb/serial/mct_u232.h
@@ -273,13 +273,13 @@ static int mct_u232_calculate_baud_rate(struct usb_serial *serial,
  *  Bit 5: Data Set Ready (DSR). Reflects the state of the DSR line on the UART.
  *  Bit 4: Clear To Send (CTS). Reflects the state of the CTS line on the UART.
  *  Bit 3: Delta Data Carrier Detect (DDCD). Set to "1" if the -DCD line has
- *	   changed state one more more times since the last time the MSR was
+ *	   changed state one more times since the last time the MSR was
  *	   read by the host.
  *  Bit 2: Trailing Edge Ring Indicator (TERI). Set to "1" if the -RI line has
  *	   had a low to high transition since the last time the MSR was read by
  *	   the host.
  *  Bit 1: Delta Data Set Ready (DDSR). Set to "1" if the -DSR line has changed
- *	   state one more more times since the last time the MSR was read by the
+ *	   state one more times since the last time the MSR was read by the
  *	   host.
  *  Bit 0: Delta Clear To Send (DCTS). Set to "1" if the -CTS line has changed
  *	   state one more times since the last time the MSR was read by the
-- 
2.48.1

