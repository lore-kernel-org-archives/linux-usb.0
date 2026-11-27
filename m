Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795756185;
	b=wsoD0ozlW8tn80Lt9U34CBfYNXoErG8QYgF40xLo35v59XrNGYvMFqbxwKFcsUjy1UjM
	 8Z5qeMD8fACbRZcAuK31Wvck8Wv7QK4c9wGkBRsnAsAVQ/bv36Fr9Ow0ab17zHDXoRis/
	 bxPvTdln824w7mtuZSesaeUu68PXqeV/hfYpJ8+xqFRxl1bEeFxuCVuUtzqqSysKQQ4XY
	 XSxbII4b42UW7DxetguyN51CIQg7Hbt3gcLvnwZYHhneqpSd6HrNYFVw6hhnfDqAfNsR8
	 Gak1/3FpQsYYJZlxSo1ng2ToEe2Oka58itrvcweOwR78QZumWjviwohsbmQj6v3HNAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795756185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F3iJsoOA8LR3I1iVxCQSl+sH/70ZE2dj3acrGl06Vjg=;
	b=5htV3Bmm7vKUTu1T2vNgSqDwme8shMhqstNreHLDcSbCTmizBNR75MUmpIg61TxSnVJP
	 vpzQOJvFb6YP0QSfbmV2kJdAlnLZhNb7ELu8a5zGStWjpg1pKfLI15qUFBq3QVeKY4g3K
	 QalMmSs0PB7b3tpmBG8O+6O03VztTbp2bSxqQ/bmlVRlHwHDiLa5GcurmOLCGzfY1g1hd
	 Ayw+wp2JHNRbwvT8XaLFMfKKjVAF4V/kJIFYt7y1aTf1RfeITx7VRIwWxX/a40J2qR4j4
	 TZPCkRAsi+ziXb/h2YNRLv2Qv4zW1MfUc6fWHFbbXMhrts+LS5gIrEffzvQ209KP+fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mXKPaBn9;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F344606A321
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 05:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F344606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mXKPaBn9
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-9215934a14cso54951226d6.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 21:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795756183; x=1796360983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F3iJsoOA8LR3I1iVxCQSl+sH/70ZE2dj3acrGl06Vjg=;
        b=mXKPaBn9BMNng2HLY0raCRf2NRFDUHWhLZ88tNUmL6gvA6gGLLmFpU7cJzeWBJDFGO
         TJZbbbVMvB6cdysB5SwUjR2lDm4619PZUm6VZy3XNLmoOFMmQ6ohG3rI9SKTUbcqX10z
         jKON6mQPE15FcowEaupElflRcHdPYLeQ1VsL17dlGhBxyIZjLhoIEdN3clXatACSoSZ1
         Qk62/4O8HQ6b2/JczpCAsGBV+qbYmLw5bi2eS18y30q2uei5+hIRIcKqK0YXdn82vDC8
         SY7/l82jJyT7Wdp7cBQfDULkQXcbGulxB+id2EczOVCDnDnaKYtj8R/YhF+biibB4TID
         2HTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795756183; x=1796360983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3iJsoOA8LR3I1iVxCQSl+sH/70ZE2dj3acrGl06Vjg=;
        b=gyTDy6oHBfXdvt9VeAjx40r+K6e4/bsRMEUBQNDDu1sx1gSAT2D0hh+NVmuhVBYjGG
         RnEkc0cKGduXn2MXOuzQqUteBXOPTECvLqi5q0MHrFkvjpVjUTfG6SGEurI7Ba2Hz8gW
         NmuhuW0jX1cousFYj+bhqRUTRSMOBOjTh828FV/kpMb6mAYgbC/h/FG57lP/iKMbgYOJ
         icC3hd9ivH2FhemgOvJDD0Nqf3cAd7sVvYCidbz5GAdOtjiF9PtnAeux5bFpC9N6a20W
         LI2mSHq2ekSIZXoKZenbmlz93yqdnIwO61UFenmJYjnj2RsR/vzg80tebmfzbrVHcuCC
         99ow==
X-Forwarded-Encrypted: i=1; AL+hErEZtSTCRayjg85mNHzwkZmm4PfrmOxXpxky+s6XXvXVehrbtc3nzGVdLDcCJnj4bx13OVuasmSfIVg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IBQAc1aiV4camyQYmJrCMmqjQR4ejhwieOWFJN59zsohrC0fM
	eknBQXbPJeqbvLFlXNOiMRdt3JMUmA1p2BMj2h/Yc60UljSBM3ySb7AyRlNv4FZXwd+Eow==
X-Gm-Gg: AZFdTZcnBLqeFEiUiaZC7JpRiZbZvd6BX+NlLyJBQMrIyPQH5m6Hur+uNm8BbV/x5r/
	oGlEZi7Uw0N+FhzMZoM94hscy+HeltK3FhUXiQ9jJzt3DtJFBSi2cXwEiyJbGVEHBZSOE8DoOMv
	Mrn6K9eSmSEscfFlbHnvPo3HHtqbFO0ES+IyZca5mnE48PNjnFKirwwph3jkDYskw6SxekgA6Fs
	FQmKxz0xbjq0GTyLxK4oS2+ShxLjORDjfExnJFMQx6TiolLX3FCcAj5W8MRPYzhj2FaDuvjhYWM
	RTVeC0R5LPhWRHSFkmtE9FJnhK7zUarma/NnhZGD27r16/3WtxUhNswBu3CrWgOF9oMWkiIjbr8
	SBRLuvwXb0W8G4I/kLShf+GlJxGyL9IuJrWFxLfyxhpUrG4VLYVDyzKxJWmbG9+pGg0tPY1aFJK
	H/mjnx2OB01SISp4xAUFThR5d72W1NxJZ4LzVBkfsD7J0g+scun2AlEoQE/g8t2HLJ8WLIpjKuO
	4F03G5tNgaQ/H42yEPHjav9uYoqEopYdqlLFZrH80DShBmHk06FF+xZNIZfQgebaxboTkF2hIC3
	A7dKTiCbExyhiZY0LePHE1m0bftq/DaY1WpdcXIh7V72G4izy9JAHCl8BniahCAGdOnZ53WtL1r
	T7ixQqob29RnalDpjdKsiiDw/iznHH/+5z1MKE16uOKo4t5o=
X-Received: by 2002:a0c:f012:0:b0:91c:988c:6df6 with SMTP id 6a1803df08f44-92134afdf51mr377852396d6.56.1795756183091;
        Thu, 26 Nov 2026 21:09:43 -0800 (PST)
Received: from zeppelin-x.sky (dhcp-9-244-177-183.gobrightspeed.net. [9.244.177.183])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a1d948sm206309376d6.40.2026.11.26.21.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:09:42 -0800 (PST)
From: Felipe Infante de Castro <felipe.infante.de.castro@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Chen <peter.chen@oss.qualcomm.com>,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Felipe Infante de Castro <felipe.infante.de.castro@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] usb: dwc3: qcom: Restore DP/DM wake IRQ trigger types on unbind
Date: Fri, 27 Nov 2026 00:09:38 -0500
Message-ID: <20261127050938.2150497-1-felipe.infante.de.castro@gmail.com>
X-Mailer: git-send-email 2.56.1
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

On suspend, dwc3_qcom_enable_wakeup_irq() sets the DP and DM high-speed
PHY interrupts to a single edge, chosen from the speed of the attached
device. The IRQ mapping outlives the driver, so after an unbind the
mapping keeps that single-edge type.

On the next probe the interrupt is looked up again from the device tree,
which describes it as IRQ_TYPE_EDGE_BOTH. The lookup fails with a
trigger type mismatch against the existing mapping. Because the wake
interrupts are optional, probe still succeeds, but without the DP/DM
wake handlers, and USB wakeup is lost until the next boot.

Record the trigger type of each DP/DM interrupt when it is requested and
restore it from a devres action. The action is registered after the
interrupts, so it runs while the driver still owns them. Unmapped
interrupts, unspecified types and types that already match are left
alone.

Seen on a Microsoft Surface Laptop 7 (x1e80100-microsoft-romulus15) on a
7.3 kernel: after unbinding and rebinding a controller the dp_hs_phy_irq
and dm_hs_phy_irq handlers were absent from /proc/interrupts. With this
change they return on every rebind.

Fixes: 6895ea55c385 ("usb: dwc3: qcom: Configure wakeup interrupts during suspend")
Cc: stable@vger.kernel.org
Signed-off-by: Felipe Infante de Castro <felipe.infante.de.castro@gmail.com>
---
Changes in v3:
- Renamed the new fields to dp_hs_phy_irq_type and dm_hs_phy_irq_type,
  to match the existing dp_hs_phy_irq and dm_hs_phy_irq (Peter Chen).
- Added Cc: stable (Peter Chen).
- Sent inline; v1 and v2 went out as attachments.

Changes in v2:
- Resent with an empty mail body.
- Added the Fixes tag suggested by the Sashiko review.

 drivers/usb/dwc3/dwc3-qcom.c | 38 +++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index a260841..548d69b 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -65,6 +65,8 @@ struct dwc3_qcom_port {
 	int			dp_hs_phy_irq;
 	int			dm_hs_phy_irq;
 	int			ss_phy_irq;
+	unsigned int		dp_hs_phy_irq_type;
+	unsigned int		dm_hs_phy_irq_type;
 	enum usb_device_speed	usb2_speed;
 };
 
@@ -473,6 +475,7 @@ static int dwc3_qcom_setup_port_irq(struct dwc3_qcom *qcom,
 		if (ret)
 			return ret;
 		qcom->ports[port_index].dp_hs_phy_irq = irq;
+		qcom->ports[port_index].dp_hs_phy_irq_type = irq_get_trigger_type(irq);
 	}
 
 	if (is_multiport)
@@ -488,6 +491,7 @@ static int dwc3_qcom_setup_port_irq(struct dwc3_qcom *qcom,
 		if (ret)
 			return ret;
 		qcom->ports[port_index].dm_hs_phy_irq = irq;
+		qcom->ports[port_index].dm_hs_phy_irq_type = irq_get_trigger_type(irq);
 	}
 
 	if (is_multiport)
@@ -540,6 +544,38 @@ static int dwc3_qcom_find_num_ports(struct platform_device *pdev)
 	return DWC3_QCOM_MAX_PORTS;
 }
 
+static void dwc3_qcom_restore_irq_type(struct device *dev, int irq, unsigned int type)
+{
+	int ret;
+
+	if (!irq || !type || irq_get_trigger_type(irq) == type)
+		return;
+
+	ret = irq_set_irq_type(irq, type);
+	if (ret)
+		dev_warn(dev, "failed to restore IRQ %d trigger type %#x: %d\n",
+			 irq, type, ret);
+}
+
+static void dwc3_qcom_restore_wake_irq_types(void *data)
+{
+	struct dwc3_qcom *qcom = data;
+	int i;
+
+	/*
+	 * The IRQ mappings survive unbind. Put their firmware triggers back
+	 * before devres frees the handlers or the next probe can lose them.
+	 */
+	for (i = 0; i < qcom->num_ports; i++) {
+		struct dwc3_qcom_port *port = &qcom->ports[i];
+
+		dwc3_qcom_restore_irq_type(qcom->dev, port->dp_hs_phy_irq,
+					   port->dp_hs_phy_irq_type);
+		dwc3_qcom_restore_irq_type(qcom->dev, port->dm_hs_phy_irq,
+					   port->dm_hs_phy_irq_type);
+	}
+}
+
 static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *pdev)
 {
 	bool is_multiport;
@@ -555,7 +591,7 @@ static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *p
 			return ret;
 	}
 
-	return 0;
+	return devm_add_action_or_reset(qcom->dev, dwc3_qcom_restore_wake_irq_types, qcom);
 }
 
 static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_role)
-- 
2.56.1

