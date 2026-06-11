Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A0E3EFFA0
	for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 12:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180525; cv=none; b=pzrHbXG9XAYV19zARQx2MbroIdsOr/mIxxydX+2q7E6kAs/hR3ZkwWE2Hoqbl9mHvJhuxbr7PwhCj5Fz2Eo2V5wQQcUeXHStIZolM7H+mO3sxdrciuRz/VwSZvecj1LmhXIt6oxdzDsvuwj50cH4QAjLhdUPyj9chdBq4vaidqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180525; c=relaxed/simple;
	bh=MQyHY4f963WwCTQyCeea8DIp46+w9Pg1xT/clz9h6kY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dk0kYYZ5BbpSmK2xYOGEcO+QYfECJqr3+KCZoFgK+PxpSYGiIpNyN0EcIs2PC1fb7dJfg0LG/acCngBzyler0LuqOSWVXRgeh75rp1ko1HbT7hDpN3nLvG80PKBow3x3/vm/j2XqvzUUmOoiK+oTc1HT0nFpfI+i7blu6lICOlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WcmNn9dU; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WcmNn9dU"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6913160c9ddso11396736a12.2
        for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 05:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781180520; x=1781785320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzlXUmksLf131RJxobn+VkQluf1vGnZUGqJ97AH7vq0=;
        b=WcmNn9dUgOwNIxK7lkDEIrWhXuFhOtU/h8RjCn3NjXKZK/qZDlLp0q6GlWEyj6yuZe
         3kV94Y+G62fQGmxmv7jZ3nlp8jugh4nu+hTvJXZwW4vL5/dvpuT57pAU7AUCvutUruOR
         xuRTJDNcWO1CQw13ucQW8HIONrO88FCaNQgk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781180520; x=1781785320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TzlXUmksLf131RJxobn+VkQluf1vGnZUGqJ97AH7vq0=;
        b=lvEqANtFPd3e9TAtpY8D4zQDYQSw2NMceNj6cXhCDmquKIQaHOPL5T5WFNfsbqjTVM
         2FZJJU4VwMcnlEH3tBeVKuQTRjovqGkoxs2i5qId1x2NjU2Z7YzXaRaTuOzG9cVSGfeE
         YLSPswYBq8Og1Z8G40x8C0VxQJtKwLvzk2VNhSL5x5OKkBptQHShu/WD/UeIarXz6/fv
         LP4Zr/I7L+WntfDmZQFhd4yjLKBvNufBL/+QJJEzmcR3s8cBy3FcZ1NhTTWG95NeCSzj
         xo3gJha7c+Ap2wk8YNgFSf0/I1Qhq3+DOxeLb30vkB40QY8vA9kYWE8FRACI4FEJsxq4
         nBBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/QhVI1SnFh8WJbNOGpRpjMuF9iTDFheJL5V/AimWX0DAT+ToLuKAx916zB7GUovx0XmTmgU0wy5EU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrBo3LT9+S8NOzxiIILWyY91iBD/oP04LDNK5I6qXAVVAC7y5t
	/Boi7oTvd/zRHtFn0mWRW2Ximx1NHeBm+ANoUVcafZYaK8fJo6CVL0puh6tTXiEYxw==
X-Gm-Gg: Acq92OHsLVR+drF0UldESTzpTYQuAUszzmNpZ+xtSKqPrYv5YkYdc8i9B8s+0Gm5PC8
	GRRgrLExeieElDCXhPJ60jATNFH5GDWzMyIaZ9sUPCdk6ib6XEtgn0Ag2Bi3PT41Fy6fznpGWDS
	S4/uPbgjPXwbSCOXo9ChTN5uLvEuY4EgVhIxGQc4AcJ0cTTg3jBpR6in2Yo3N3YIN1uhFiT+C9o
	v80GXwGDYTBkLvte7jXAyDDlkSaaxpCu+70xaQV7oJ4QcBXS+InWWpGiHhK/LKETVUZ7dcYnh/W
	Jz+k6zO07deNphLADYeXxDhfVSbFd+way0o3ev7EV/gUoA9+COd4VjWSD0XeWVkE863tiiMbhDY
	tCSqGAHBYowFOjh0AGyAajxdcLoRmEmfV/TpWA/BEJyuKs0tDJjFXHc2Nwbea56PHEWUCPl0I52
	Ncz35lmyiRcJX8fVIwyyXgQqX/3rmrEXPbaX91ENE4Q8tcFsWnQmZO1foRt9iIeEXWKa1KI53j5
	Ke5z5yXrQuYkldGfZTgku5sH3FQD30=
X-Received: by 2002:a05:6402:51cb:b0:691:5f30:37ec with SMTP id 4fb4d7f45d1cf-6930e2e95a4mr1196922a12.25.1781180520028;
        Thu, 11 Jun 2026 05:22:00 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (208.220.32.34.bc.googleusercontent.com. [34.32.220.208])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6914f3b583bsm6853113a12.29.2026.06.11.05.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 05:21:58 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v1 1/3] usb: typec: Add helper to check cable altmode support
Date: Thu, 11 Jun 2026 12:21:44 +0000
Message-ID: <20260611122146.262184-2-akuchynski@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260611122146.262184-1-akuchynski@chromium.org>
References: <20260611122146.262184-1-akuchynski@chromium.org>
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
 drivers/usb/typec/class.c | 35 +++++++++++++++++++++++++++++++++++
 include/linux/usb/typec.h |  1 +
 2 files changed, 36 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 0977581ad1b6e..f7f1adbaab7e6 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1429,6 +1429,41 @@ int typec_cable_is_active(struct typec_cable *cable)
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
+	plug = typec_altmode_get_plug(alt, TYPEC_PLUG_SOP_P);
+	if (plug) {
+		typec_altmode_put_plug(plug);
+		return false;
+	}
+
+	cable = typec_cable_get(typec_altmode2port(alt));
+	if (cable && cable->identity) {
+		const u32 id_header = cable->identity->id_header;
+		const u32 speed = VDO_TYPEC_CABLE_SPEED(cable->identity->vdo[0]);
+
+		if (!id_header || PD_IDH_PTYPE(id_header) == IDH_PTYPE_ACABLE)
+			unsupported = true;
+		else if (PD_IDH_PTYPE(id_header) == IDH_PTYPE_PCABLE)
+			unsupported = (speed == CABLE_USB2_ONLY);
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
2.54.0.1099.g489fc7bff1-goog

