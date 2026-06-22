Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57B339E6FC
	for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 09:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782121160; cv=none; b=ikjlPDuBCjeF3QDa8cyIkO3p+C8Q+tWKkzwtnKgDOLFZjbRLutjDQyL9h865ntVKzElceuAncMiTZp5m8V39fPbiAAcHRwRenOv5ZVB1M4ZiZt0Tw46gyIszjFbp9drSkeIkwYtXDYd2K9NRrCB8CxQxku9cUK7inkh8C60seGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782121160; c=relaxed/simple;
	bh=W/hxCxFm3JSr3l16UWLcD/2KmwUb7IDk9ZJdrIhdDpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LWm1hfekKu7422jTbCN/qjhPnuhh+maHZ2vsC4kukfhQ/Gf4+J0nmkZ1KdFr9ulJO3qrLx3Dc9cEWBAyPn4gU6pQ+BbGVNT9zWXZMcw5rw6E3rrjJyFfxKe+LWvJtPv4MJxpVIQwz6GxV8vFB5IumIPMbHSCP/QlvWuWil0QIPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EG0qIL4J; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EG0qIL4J"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bec43ee8ff0so644893066b.1
        for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 02:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782121157; x=1782725957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/auvlQ4YTi8Y85gn6vldbCwdOq0jgt+QLellMT7drJ0=;
        b=EG0qIL4JnlRtCj69JCHVKpzYhQI07Gy84lB8tDdthHorcPIsqyeSJTpxhiODSVYQmH
         pVgvfrvUWuU+7qZ7mOok4IQjHtFWoE87WVAUuHTip7SHQsb00kqmLLZ07Eetp3dDL/2u
         zT9D2xOXv72zfkCg5Y8gKSHSdwtQ8KI0SfE4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782121157; x=1782725957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/auvlQ4YTi8Y85gn6vldbCwdOq0jgt+QLellMT7drJ0=;
        b=Fh9vqld1Zy0p7RJKZ4Mm4v5aylrvgson4XN8th9RFdGeuQ3EhJdm+tEiyOirDVtSM5
         mrc3WQUGv7++94ZGKqZxE7XzoaLsUD7Y5fSQkBrO5W59wD95tLqWIrz9iFfLnaOEDp2I
         73YNfnuBnJarTLb0P6bCZScbzbLmy8ECbQCkzzK/ZnmSvNAbKtd6FuwYZL+K49mK5zvj
         r3yzQDVZ08s8s38OxLr6WWcJxJJEvumGJx46znp967K123TZI472w0vBiKLkdoc2dg79
         SCJgprQBq7ldXIVyBJHnyPgDzFYt6mK8nVrwrzTJo40+ULLeV/w8T/Ln55NDrMywCP6d
         qCvA==
X-Forwarded-Encrypted: i=1; AFNElJ+hVFH0sQ/AZMMa1BEdLz1Gfbzcokjwx/dmAUPUJMK9mJ3/zJckMrWh1NKrqhLlIEgJiLySdvhG1bg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMXylGwAM2i3XedMdFMmsk0/tt5GoLCHoZvb/6helb62EBtr7m
	CTHhIBCNTHxz0wFMzuQf4sBWEjec18GmjbFQgPZpaGUtguEHOmWeDc318lGaVD1AxQ==
X-Gm-Gg: AfdE7ckVQZQANBGvXyRgTsM4kPIKDpW25TxDJU+NBjd7VxRy9Na7d/mL1UXMdcfi+p2
	ok/nbeOPNC4L6YDXGWK06yhxevretAmu4boKE9iBYhi7iqYNsB73Am+j5wfN4VEZld+v8c6snPO
	Xxvnyp2/YBDkjCi6PN7O5OM5XSINyGpO5ViD5wg100EfWdtxzMINpvB7IChBwkW+OUv3d1+Eqls
	5Rfgfc4qGqXa+Pftom5e6SrAOj4qIkM6U4C0SlNdOuCm5IToRKdWC6eiuY/kkUAyMOFZx4VjyBc
	j/LMIQ8Wb8zOg44iPmqsLlmodGWHHHROHM54k4PTB4EFBDTb5pkT2rVy6AGROouddg2NurZHoLD
	VJ3YTexnRsNUvoi/LKtAXuV2Xy853aS125RZRiAWY194DqLp64ZpVFpa9eA7l3TbKN6pSAlTSOu
	S8qBY4HOFhNShync4yYWtesG+quFs7+qq50RzsbDM2uabaQwAU2bTaSt4bjtWBcFPNbwMW4u2A4
	8mwTOqzAw==
X-Received: by 2002:a17:907:25c5:b0:bec:52f4:28ef with SMTP id a640c23a62f3a-c09b9c6e67cmr637445166b.22.1782121157156;
        Mon, 22 Jun 2026 02:39:17 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (208.220.32.34.bc.googleusercontent.com. [34.32.220.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c610e526asm324855566b.51.2026.06.22.02.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 02:39:16 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 1/3] usb: typec: Add helper to check cable altmode support
Date: Mon, 22 Jun 2026 09:39:08 +0000
Message-ID: <20260622093910.1210089-2-akuchynski@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.738.g0c8ab3ebcc-goog
In-Reply-To: <20260622093910.1210089-1-akuchynski@chromium.org>
References: <20260622093910.1210089-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce typec_cable_altmode_unsupported function to evaluate whether an
alternate mode is restricted based on the connected cable's properties.

Implement validation logic that parses the cable's identity to catch
incompatible setups early. Alternate modes are restricted over:
 - cables lacking an identity header
 - passive cables with USB 2.0 speed
 - active cables unless they have corresponding plugs

The function returns false if the cable is not registered or the identifier
is not set.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
Changes in V2:
- Replaced the if/else chain with a switch-case block.
- Added detailed inline comments explaining the USB PD cable specification
  constraints.
- Separated the check for non-e-marked cables.

 drivers/usb/typec/class.c | 65 +++++++++++++++++++++++++++++++++++++++
 include/linux/usb/typec.h |  1 +
 2 files changed, 66 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 0977581ad1b6e..972c870e3ce51 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1429,6 +1429,71 @@ int typec_cable_is_active(struct typec_cable *cable)
 }
 EXPORT_SYMBOL_GPL(typec_cable_is_active);
 
+/**
+ * typec_cable_altmode_unsupported - Check if a cable restricts altmode
+ * @alt: The Alternate Mode to evaluate
+ *
+ * Returns true if the connected cable is incapable of handling the altmode.
+ */
+bool typec_cable_altmode_unsupported(struct typec_altmode *alt)
+{
+	struct typec_altmode *plug;
+	struct typec_cable *cable;
+	bool unsupported = false;
+
+	/*
+	 * Check if the cable has an e-marker, supports modal operation, and the
+	 * SOP' altmode nodes are created. If yes, then altmode is supported.
+	 */
+	plug = typec_altmode_get_plug(alt, TYPEC_PLUG_SOP_P);
+	if (plug) {
+		typec_altmode_put_plug(plug);
+		return false;
+	}
+
+	/*
+	 * Check if the cable is registered and its identity is specified.
+	 * If not, the cable altmode restriction cannot be checked.
+	 */
+	cable = typec_cable_get(typec_altmode2port(alt));
+	if (cable && cable->identity) {
+		const u32 id_header = cable->identity->id_header;
+		const u32 speed = VDO_TYPEC_CABLE_SPEED(cable->identity->vdo[0]);
+
+		/*
+		 * A cable lacking an ID Header indicates a non-e-marked cable,
+		 * can only be guaranteed to have a USB 2.0 data path (D+ and D-).
+		 */
+		if (!id_header) {
+			unsupported = true;
+		} else {
+			switch (PD_IDH_PTYPE(id_header)) {
+			/*
+			 * If the speed field explicitly declares it is a
+			 * USB 2.0-only cable, altmode is unsupported.
+			 */
+			case IDH_PTYPE_PCABLE:
+				unsupported = (speed == CABLE_USB2_ONLY);
+				break;
+			/*
+			 * Active cables must establish an SOP' communication
+			 * node. Since that check failed at the beginning of
+			 * this function, this active cable does not support
+			 * this specific altmode.
+			 */
+			case IDH_PTYPE_ACABLE:
+				unsupported = true;
+				break;
+			}
+		}
+	}
+	if (cable)
+		typec_cable_put(cable);
+
+	return unsupported;
+}
+EXPORT_SYMBOL_GPL(typec_cable_altmode_unsupported);
+
 /**
  * typec_cable_set_identity - Report result from Discover Identity command
  * @cable: The cable updated identity values
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index d61ec38216fa9..10a783b738efd 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -337,6 +337,7 @@ void typec_unregister_cable(struct typec_cable *cable);
 struct typec_cable *typec_cable_get(struct typec_port *port);
 void typec_cable_put(struct typec_cable *cable);
 int typec_cable_is_active(struct typec_cable *cable);
+bool typec_cable_altmode_unsupported(struct typec_altmode *alt);
 
 struct typec_plug *typec_register_plug(struct typec_cable *cable,
 				       struct typec_plug_desc *desc);
-- 
2.55.0.rc0.738.g0c8ab3ebcc-goog

