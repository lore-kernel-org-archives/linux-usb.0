Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7DA3EFFC8
	for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 14:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782484037; cv=none; b=P86G889FCiiXOTjaJCKlxELrFbHtaH7UJFXmdjq7vJNzXeWUAy3tulF791AdWfpKHAHmJMFKEwdgO3ShlGLUsek78Lon2M21BsujwCJm9T1SK+OlTFo14pz22Zodke03GUKI/Te+V6qdjVrqz1X/PUXZBg+XNqnBiYDAlLkt6do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782484037; c=relaxed/simple;
	bh=x2uu1ellr0i43e+q8ybl9FUPAJocaRHRLLotF9ztVKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VlLlMg9N2PSx4m7GtOHaUJQP7897GsuNZ8NxGs1EhgjfrzoSSjtaTV4y9KhRqoPD2KJ04qitmRuROj2ClV7XohlHYImPfgWWPzOtaZWarfG2/QkvyLKxC/JjaMq1LubyrTpg4nMUj+zgz4UehdKHeF+0rFXYzzCYi8qtyTtmy2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cffcSudZ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cffcSudZ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bdb3fd39045so142588366b.3
        for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 07:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782484029; x=1783088829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lcpW4k9A5UfDIIIPyGAlobBpqHG09WlpCDTZRLp2JA=;
        b=cffcSudZRvGvGKUB++0/oFWtmo0Y2VD3AtCVdxOfON+LieWal/ykQBYRatmtMmPwU5
         JhqmnCoYQn2vH2a98BeTivi+WpzvM2o7ce/YqSuRvfH6hcDCWiaCQnvCnfKSv3iUtVa9
         vOk7LNAvkH0tW2Q08QzpvpgEyM2Fs7EL5+TtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782484029; x=1783088829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6lcpW4k9A5UfDIIIPyGAlobBpqHG09WlpCDTZRLp2JA=;
        b=rMtA58e68aqyGYfvDiwLhm3vRPrTDE0ymDO2O/EDSOUgaOf1bpxwCXbN1Yls8ONodK
         ni34Tuf3yq/2/57CvzfO8O4pLnKeG6aXkzGrj+/fpyINZh9a6aoDc1ePbMGRHzqvq7J0
         E/ewB05oPN2l3PNOKacb0UzTGQ/kZ6q3ZKbFla+oxOZNBtzdi3cbhLNFDNwWedPWHGR5
         4dEtXt3NQ46D1TUbMm9gRt5K0IITxVNnpPNTXhkxpnO8AXj3NHulDc4jhzVMIC5vcsVg
         2T19zRk/KcK+HoJc3mYgW8TVv3iHIylPsJoVvdsZEs7lYfZd6e/UVHnQeEAGMZ0r044X
         6V2w==
X-Forwarded-Encrypted: i=1; AHgh+RrtNEqOGgBVfDFEwdh/7qgqZZZ1mWsh5Cn7GCQaVoITJ7i8qLMd7YMRYqlKj1YroOAx0Y03FKgz0zY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTxZ/qkkgcf3SmHG8Pd+b/jDH2JXmFnQDsBsiiUAPRsYqXCF5y
	e2HK0WlcVEoKcGDUXQCv7rKk97yrIzoashxpeAs+n0gmGPiJuuBmjVvO/zjgM0yZ7Q==
X-Gm-Gg: AfdE7cmDGvVMKZh+h6D0/bAUgdEa5BsJ6vqwflHxIvjdQXi7c2GVJQngy04R93/aF+8
	kGmjgiS+eJRyWdd78zZK9aLmMG2GvEDvhrxU02Q5wY26yXCIVL6pR0Dq/rPCxi/9HVpei3I+fu8
	2MLdUFfJ4rA2ou6W5KxI1XbVFQdiyHw3//J/GzCZ1bNjbQjpEf2EAiteA/3u2ki1Stcj6ICGnA2
	3qmw7CWAZUQC1Fbuj/NZXZp+16fB10I3c/gDfKuqgYNSlz9W4rdxE/dHTUjSJZo8PzI1iH9Qvmt
	9+POQCdSOXsYyFy66M2BFfHjnQTky1KUl3CcBt7gs5Yg2EDU3Q+e7JM1Jejqt1hmqhFOKjNX3ys
	7No+xM5SsrWTcIyQ6fLYyr5smVRRh8z9OJsmGTmxCoJ4gN0duIv1yZNMKzqxVqz5cXA3twCcg5r
	Ayb5uU960RcbQwQLTNHo+DfVfIpoYju3spfYMa7ZS+Gu6STcqc412UVGigIe3T/IQbnnYu+mhmS
	KYexkWvNw==
X-Received: by 2002:a17:906:385b:b0:c12:34f0:f7c2 with SMTP id a640c23a62f3a-c1234f0f9c6mr23933066b.65.1782484029044;
        Fri, 26 Jun 2026 07:27:09 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (208.220.32.34.bc.googleusercontent.com. [34.32.220.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbba6787sm355968666b.6.2026.06.26.07.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 07:27:08 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v3 1/3] usb: typec: Add helper to check cable altmode support
Date: Fri, 26 Jun 2026 14:27:00 +0000
Message-ID: <20260626142702.1941182-2-akuchynski@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260626142702.1941182-1-akuchynski@chromium.org>
References: <20260626142702.1941182-1-akuchynski@chromium.org>
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

Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
Changes in V3:
- Extracted core verification logic into a static helper function
- Added an enum to handle supported, unsupported, and unknown cable states

 drivers/usb/typec/class.c | 71 +++++++++++++++++++++++++++++++++++++++
 include/linux/usb/typec.h |  1 +
 2 files changed, 72 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 0977581ad1b6e..e9f34eb14ceff 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1429,6 +1429,77 @@ int typec_cable_is_active(struct typec_cable *cable)
 }
 EXPORT_SYMBOL_GPL(typec_cable_is_active);
 
+enum typec_cable_altmode_support {
+	CABLE_SUPPORT_UNKNOWN,
+	CABLE_SUPPORTED,
+	CABLE_NOT_SUPPORTED,
+};
+
+static enum typec_cable_altmode_support
+typec_cable_check_altmode_support(struct typec_cable *cable,
+				  struct typec_altmode *alt)
+{
+	struct typec_altmode *plug;
+	u32 speed;
+
+	/*
+	 * Check if the cable has an e-marker, supports modal operation, and the
+	 * SOP' altmode nodes are created.
+	 */
+	plug = typec_altmode_get_plug(alt, TYPEC_PLUG_SOP_P);
+	if (plug) {
+		typec_altmode_put_plug(plug);
+		return CABLE_SUPPORTED;
+	}
+
+	/* The identity is not specified */
+	if (!cable->identity)
+		return CABLE_SUPPORT_UNKNOWN;
+
+	/* Non-e-marked cable */
+	if (!cable->identity->id_header)
+		return CABLE_NOT_SUPPORTED;
+
+	switch (PD_IDH_PTYPE(cable->identity->id_header)) {
+	case IDH_PTYPE_PCABLE:
+		speed = VDO_TYPEC_CABLE_SPEED(cable->identity->vdo[0]);
+		if (speed == CABLE_USB2_ONLY)
+			return CABLE_NOT_SUPPORTED;
+		return CABLE_SUPPORTED;
+	case IDH_PTYPE_ACABLE:
+		/*
+		 * Active cables must establish an SOP' communication
+		 * node. Since that check failed at the beginning of
+		 * this function, this active cable does not support
+		 * this specific altmode.
+		 */
+		return CABLE_NOT_SUPPORTED;
+	}
+
+	return CABLE_SUPPORT_UNKNOWN;
+}
+
+/**
+ * typec_cable_altmode_unsupported - Check if a cable restricts altmode
+ * @alt: The Alternate Mode to evaluate
+ *
+ * Returns true if the connected cable is incapable of handling the altmode.
+ */
+bool typec_cable_altmode_unsupported(struct typec_altmode *alt)
+{
+	enum typec_cable_altmode_support support = CABLE_SUPPORT_UNKNOWN;
+	struct typec_cable *cable;
+
+	cable = typec_cable_get(typec_altmode2port(alt));
+	if (cable) {
+		support = typec_cable_check_altmode_support(cable, alt);
+		typec_cable_put(cable);
+	}
+
+	return support == CABLE_NOT_SUPPORTED;
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
2.55.0.rc0.799.gd6f94ed593-goog

