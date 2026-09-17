Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FD049AA26
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 21:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789680000; cv=none; b=q6OOrPqLgxW9ykVTtpBBrwkWMynE7mIk4yb0BD5Q+H0GLGg7+1Xt9mUqn90xPdhlZIHTNG8GHeoCT9bK8zS64kureUoko/JYwr3a5kdi7uvofG0xxF7juTlv27uW/PgEE5HMqP7l06ilIKbR7sBpIL0pEyvc4+SQS+vRRtSR8/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789680000; c=relaxed/simple;
	bh=0yG5Mzjj5RRPDhIbFihrV0EOzpaeq5JgcYZ/sNLs0LQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wb964RXbu+lMvDyJaQQr1+G2fYDdUXaLAG8Kk6dVSDLm61MXMQJhDpgOLAKv8yjdKHcb2cyfANAivvYJtXVxMtm9G1WN/8xB4Swh/amEMNMq20bSnTjBXMKOmROTkCrRmRraCPfbDhCxrv08/K6lju3txjNoyQEdueL8oYBu4pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=QANsuZGs; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="QANsuZGs"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633cd80so8300f8f.2
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 14:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1789679996; x=1790284796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=91ImVwNngQnn0ksChHIZQSGgHwJR1v4uR7PjsKwQ3bY=;
        b=QANsuZGsVAr/g35glxaH3WidlAiIflSYiJQWA4JDfXAu89gXaEXWQABlxDfPuaZjjG
         Ax+9lC68i/1CPaeBnMhSmUuMJ7EewLNnoD3lAIDUKHVBYcNdyThKUo1f8g8uUbybDA5A
         217wO4FIjVDdGJQd5LhjnTC6EJ2WGOsozBrOL+fEPslMsBOOc2KwtFJ595x1ghF9Yjnq
         Ou+d4+FIvaifiXwd57a2Sw22SvDf0xRiS6i0/71P/wmdvhlGO2kXSfvT1bOW2Up8PUy3
         f1ocDJ7aY7xQFy1rhL11b70ZBUXZTZPmm46fITkxZX5QsYucGIvZaEbUxvl3AmPrm++I
         mUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789679996; x=1790284796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=91ImVwNngQnn0ksChHIZQSGgHwJR1v4uR7PjsKwQ3bY=;
        b=QpCDt19KZa/Np1QxssRuCufTVbLq/oSHguRxRyTuZBFX0zqbh4j4L2h2SQpEmSCGPk
         qFp0hkmejvkXfTplr9EYg5/8ZWBKzimE1c+MpPVKtJ1iSW88HF74YM23Y2FP758E+dnT
         wHkKagZXZFfdQI31F2VorszqCYxozyXtrTL4owzHVMi/fCXs3QbYEmM28he7uPR+togE
         b895y+XrJmCh8s6YK8GBJJP1SUv//6jepu/wSleeSbLXt73sUNhglCuVAN0Lf/XavY+D
         HFk+FLad6/hun99J11kHNmTAkCtQlcwSCq+1d0H/v3i43wkNQI5oCRhXYQAe3T3frsnc
         Bo3w==
X-Forwarded-Encrypted: i=1; AKwUvByhB8eX8kqPQxj9Wwasy5YJqthj1O81lv2pwCHky0G029sQzjmhfpsmS5aFe9K642L9Hv5dMEFaUWw=@vger.kernel.org
X-Gm-Message-State: AFuF++mwnTuynrHG7DiJeFj7XqHhwS3lf5ChKCxRO0aJNQvWdUsLtdeY
	kQpU1S6ZOIcinBeXVaSLz1F3Ls3It4yAkrUEdlRzeWPWMN63eLdrD5uCsVpshtYvoA==
X-Gm-Gg: AYBFou163/mqevnlIn47VLb8fenVQX6lhuHxRfUrNXLxneu77HDVM6XPF8MPVnxorhS
	obOdmA0wCIj91smydy2s3bE36mmX3ET2SJa+LsNQczcc5E0zb9vru/55q8dK2U6seBGKbLkPFNm
	tU1eTE/JuWOGKx6h9k1Ufku6q3e6bOs91MGKBB2Zq+lRbKLgcA9X9HT7QMhs0UL1TWcG6n/EdfR
	9Wc/A5FnRjtVnRVlwp0OpU8xYYKbqAizJEv0TIWI0zVyWvlgFDiCKurlOc1yFbWDnfLDFPmkh3e
	ycPdnk2/FUyjkzmscpmNGQUibKq5Tp2D6xIhGeZfmAI8SD7HTwPhbSvSQ4Cdh0qABt5WmHqp5Vk
	IK9OYGVhouVQgWTppstl6Wzp6U0/stsW9VS/Q35L930BPR1p2BtgiVafOqfRivKQwCSeRqD1Fq1
	OZaf3ChsSUG6YrhIM+ejRxqHXA4X9GqZrrmvAPt5XtzDDjFUxwRSgxIMjNAy7BdkxY5upkw2PSC
	bKERtUdfzAKj6TrJOLAjxNLpQ==
X-Received: by 2002:adf:e19a:0:b0:486:fba3:b95d with SMTP id ffacd0b85a97d-4871e2161fbmr249670f8f.7.1789679995473;
        Thu, 17 Sep 2026 14:19:55 -0700 (PDT)
Received: from fighter ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1f6cfsm19086828f8f.13.2026.09.17.14.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:19:54 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: linux-bluetooth@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sean Rhodes <sean@starlabs.systems>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	"Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Kees Cook <kees@kernel.org>,
	linux-usb@vger.kernel.org,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-kernel@vger.kernel.org,
	Paul Menzel <pmenzel@molgen.mpg.de>
Subject: [PATCH v2 1/2] usb: core: check ACPI port power during registration
Date: Thu, 17 Sep 2026 22:19:51 +0100
Message-ID: <332acbc859506a0c313a21c14d177a5cde07fb74.1789679981.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1789679980.git.sean@starlabs.systems>
References: <cover.1789679980.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_hub_create_port_device() checks whether a port is power manageable
before hdev->maxchild is set. usb_acpi_power_manageable() looks up the
hub through usb_hub_to_struct_hub(), which rejects hubs while maxchild is
zero.

The port device has already been registered and its ACPI companion bound
at this point. Check that companion directly.

Fixes: 8020c41b39f5 ("usb: core: allow ACPI-managed hard-wired ports to power off")

Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 drivers/usb/core/port.c     | 7 +++----
 drivers/usb/core/usb-acpi.c | 7 +++++++
 drivers/usb/core/usb.h      | 6 ++++++
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b4452b665f59..59c3ab31f030 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -21,8 +21,7 @@ static int usb_port_block_power_off;
 
 static const struct attribute_group *port_dev_group[];
 
-static bool usb_port_allow_power_off(struct usb_device *hdev,
-				     struct usb_hub *hub,
+static bool usb_port_allow_power_off(struct usb_hub *hub,
 				     struct usb_port *port_dev)
 {
 	if (hub_is_port_power_switchable(hub))
@@ -32,7 +31,7 @@ static bool usb_port_allow_power_off(struct usb_device *hdev,
 		return false;
 
 	return port_dev->connect_type == USB_PORT_CONNECT_TYPE_HARD_WIRED &&
-	       usb_acpi_power_manageable(hdev, port_dev->portnum - 1);
+	       usb_acpi_port_power_manageable(port_dev);
 }
 
 static ssize_t early_stop_show(struct device *dev,
@@ -825,7 +824,7 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 	 * Keep hidden the ability to enable port-poweroff if neither the
 	 * USB hub nor platform firmware can manage downstream port power.
 	 */
-	if (!usb_port_allow_power_off(hdev, hub, port_dev))
+	if (!usb_port_allow_power_off(hub, port_dev))
 		return 0;
 
 	/* Attempt to let userspace take over the policy. */
diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
index 489dbdc96f94..5163ef363eef 100644
--- a/drivers/usb/core/usb-acpi.c
+++ b/drivers/usb/core/usb-acpi.c
@@ -37,6 +37,13 @@ bool usb_acpi_power_manageable(struct usb_device *hdev, int index)
 }
 EXPORT_SYMBOL_GPL(usb_acpi_power_manageable);
 
+bool usb_acpi_port_power_manageable(struct usb_port *port_dev)
+{
+	struct acpi_device *adev = ACPI_COMPANION(&port_dev->dev);
+
+	return adev && acpi_device_power_manageable(adev);
+}
+
 #define UUID_USB_CONTROLLER_DSM "ce2ee385-00e6-48cb-9f05-2edb927c4899"
 #define USB_DSM_DISABLE_U1_U2_FOR_PORT	5
 
diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
index a9b37aeb515b..356d36ccbdd3 100644
--- a/drivers/usb/core/usb.h
+++ b/drivers/usb/core/usb.h
@@ -8,6 +8,7 @@
 
 struct usb_hub_descriptor;
 struct usb_dev_state;
+struct usb_port;
 
 /* Functions local to drivers/usb/core/ */
 
@@ -211,7 +212,12 @@ extern int usb_acpi_register(void);
 extern void usb_acpi_unregister(void);
 extern acpi_handle usb_get_hub_port_acpi_handle(struct usb_device *hdev,
 	int port1);
+bool usb_acpi_port_power_manageable(struct usb_port *port_dev);
 #else
 static inline int usb_acpi_register(void) { return 0; };
 static inline void usb_acpi_unregister(void) { };
+static inline bool usb_acpi_port_power_manageable(struct usb_port *port_dev)
+{
+	return false;
+}
 #endif
