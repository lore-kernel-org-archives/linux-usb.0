Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5FB3B7747
	for <linux-usb@vger.kernel.org>; Wed,  8 Jul 2026 02:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783477467; cv=none; b=eGiPpupjdQh0OrAIiP7Lr/36iBjnvqfG9bb+TkaaIRoAU6MjACI2mL9CluuSpBgzk3dDj2saVo2f3/10JagRib5LsLeZBuZzbpPGKBbYh6fX2ltPImN+zyZLoE8/1plE1OEcWsw2fmxVMzQUhx5IFWH/GZOn22Yf4/mZ90Eigbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783477467; c=relaxed/simple;
	bh=MC26tX7oP/qI0UIQTdFl/O/42lC5DWPETn3rrlq2K9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W+EnaFc73RR5cd4TsdEgKnSOsaoOIEwag1x0LxAhFJWImSznRANyUoXl+6XkUCthywZymqwEnuvfQi+QjU7eIovB7mCUvEOVqJ1gmh2/CMtJj+QKmmfzgNc5tQuzJQ44Z+8TAPkwZIy3pp6UjRTTSLkGZKyGZgRmSqjqSEkEvRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OuCFlUCw; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OuCFlUCw"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cab973140bso2738725ad.3
        for <linux-usb@vger.kernel.org>; Tue, 07 Jul 2026 19:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783477465; x=1784082265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zVNpBSi2vriOb2Hxfs3mAutcEA0jCYKDj+8ioXyoF2Y=;
        b=OuCFlUCwK1hX/qFJ0wDEZa9WoWCKgyJyTe0NyWMneiKVAqS/YtHjpdGV2LpqSsMwzF
         cr8jVYttaJCVkBoRIeRX0Uum6uRyrD24UiWZWRAmQdd6fKmwqqLgN7spwCHQxzpan9sl
         v2RQD67lvPS2SWJ2pNNENhRxHfGeaRSehl03WeinjxH3Yhxfnb/HpDn9BgRTtb+aa1W6
         Kbpy2lcvBDsE88E2EVeEWULxg03xg4zqmht/8a1GV/xAGS1QmbnnDhbmbppt0KoIEx5E
         51Gls5Fk2TgDpziE83G8l0Jy9y6heWjQSrAj5J9z9PyDRZjw1LEfGxWRv1rlbdFLqeFn
         4A7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783477465; x=1784082265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zVNpBSi2vriOb2Hxfs3mAutcEA0jCYKDj+8ioXyoF2Y=;
        b=oUSLKnCNdigpi1uXQzrV8s9myiiT7w1C7juxhx5/WPXAOpm8OmIdLz+CRcGia8VSGf
         zsgq1SraATYALUah/Qc3+Zf5dTg4hqxoLnfnocCrhxcXnasJiNfQbwGYwMLi5DKHVs4a
         51Qumzo//3lz2iTO/TRe5smcjUDWUxS6qVLP8yBOD3quURCyKGaUZZyxHHqc4C8zze0X
         Lx0TKKaOWYxA6p4+wUGsV6hPQO4YQHdVaNdnLBEHiRHad+KZmZWDlDMo4YuwfGYszyYn
         j9ZLcQ12nYyKgnXY1I8fOVeXJjR1dcym/A7AwNzBYklK7dh6pWTBna2evv9wqk0nM6Ua
         8ZSg==
X-Forwarded-Encrypted: i=1; AHgh+Rpg2+bhjvSrveo5kvb1oEbfr75fziUB4Z0gL3RbqPX8pT68xrl1Okh8VrVg9AyV8UlPUyJ7a2U+AE0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxImy6RmDoADCy2Zg/Q18n56cuETxUGOk6ZLU47CJSAitMfk8hx
	non+dpwG8oW+etMNiolKSBboYoSHMnp7tLTfsrFlh7svMffSfMh/TC1y
X-Gm-Gg: AfdE7cmXxTYF7Yz9u3sK7SRjqfj0vUSKlB9TIBKui5p4i8bxhjcaaCTFdSb2e4jX31X
	SMWprmdzNalulhwJsq8J5hFSmFVXJ8vi6COjjH4Z885yBAD7pLoYWy2qXuX4bmFk3gI+V/ZlpIQ
	zjEZvwU6lcRi6Czw7VqFoL1V6LevoNr3ZrO5KTJTbUy+ixmAqKVMTJ6mTXxfVcbj2l4n2cELfPn
	d4Rs3OLvV40dzy+9Fb7XHfuP1pirrMfFu2N4x/K147hPWL4NArj/MpomEZFQRCV9TJHIKw1zudw
	KoeZyAZLD4FPs44E7stcOrOu5gSZxmf84XgxjCtwe2r0k17dIhtFkSi1f3zpYaRbO1fDMfsvq8M
	8CUDMES/mxDRz2jLMKq3cwPF3N60xdQLJfSLduYxsPlJ7IGJC5KAX3ie6htdFAsWBOXxy04VkrA
	AJJFw0oFZ2HbI4BIpgKpi6w0MM4b+E4UG2vQLspKD7eQ==
X-Received: by 2002:a17:903:2ac4:b0:2c6:90ec:f601 with SMTP id d9443c01a7336-2ccea36a13bmr6397835ad.8.1783477465165;
        Tue, 07 Jul 2026 19:24:25 -0700 (PDT)
Received: from localhost (118-163-61-247.hinet-ip.hinet.net. [118.163.61.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5fc81sm19972105ad.83.2026.07.07.19.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 19:24:24 -0700 (PDT)
Sender: AceLan Kao <acelan@gmail.com>
From: AceLan Kao <acelan.kao@canonical.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Myrrh Periwinkle <myrrhperiwinkle@qtmlabs.xyz>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: typec: ucsi: recover from silent PPM completion in sync_control
Date: Wed,  8 Jul 2026 10:24:20 +0800
Message-ID: <20260708022420.3914391-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026061632-gleaming-resend-9a5f@gregkh>
References: <2026061632-gleaming-resend-9a5f@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>

Some firmware completes UCSI commands and sets COMMAND_COMPLETE (or
ACK_COMPLETE for ACK_CC_CI) in CCI but never fires the ACPI notify that
would wake ucsi_sync_control_common().  The driver then times out after
5 seconds and returns -ETIMEDOUT, even though the EC finished the command
successfully.

Fix this by polling CCI once via poll_cci() on timeout.  If the relevant
completion bit is already set, the EC finished silently; fall through to
out_clear_bit so the normal read_cci()/read_message_in() path retrieves
the data and ucsi_run_command() issues ACK_CC_CI as usual.  Only return
-ETIMEDOUT when the EC has genuinely not completed the command.

Guard the poll_cci() call with a NULL check: if a backend does not
provide the op, skip the poll and keep reporting -ETIMEDOUT rather than
dereferencing a NULL function pointer.

Fixes: 584e8df58942 ("usb: typec: ucsi: extract common code for command handling")
Cc: <stable@vger.kernel.org> # 6.14+
Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>

---
v1 -> v2:
- Add Cc: <stable@vger.kernel.org> # 6.14+ as flagged by Greg's patch bot:
  the Fixes: tag targets a commit already in released kernels, so the fix
  must be nominated for stable.  Scoped to 6.14+ because poll_cci only
  exists from that release (absent in 6.11-6.13).
- Guard the poll_cci() call with a NULL check to avoid dereferencing a
  NULL function pointer when a backend does not provide the op.
---
 drivers/usb/typec/ucsi/ucsi.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 9eeb38e7472c..deda7123b5d1 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -91,8 +91,29 @@ int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
 	if (ret)
 		goto out_clear_bit;
 
-	if (!wait_for_completion_timeout(&ucsi->complete, 5 * HZ))
-		ret = -ETIMEDOUT;
+	if (!wait_for_completion_timeout(&ucsi->complete, 5 * HZ)) {
+		u32 polled_cci = 0;
+
+		/*
+		 * Notification from EC did not arrive.  Poll once to check
+		 * whether the PPM actually finished without firing a notify.
+		 * If poll_cci() is missing or fails, polled_cci stays 0 and we
+		 * correctly report -ETIMEDOUT below.
+		 */
+		if (ucsi->ops->poll_cci)
+			ucsi->ops->poll_cci(ucsi, &polled_cci);
+
+		if ((ack && (polled_cci & UCSI_CCI_ACK_COMPLETE)) ||
+		    (!ack && (polled_cci & UCSI_CCI_COMMAND_COMPLETE))) {
+			/*
+			 * EC completed the command silently.  Proceed to
+			 * out_clear_bit which reads CCI+data normally, and
+			 * ucsi_run_command() will issue ACK_CC_CI as usual.
+			 */
+		} else {
+			ret = -ETIMEDOUT;
+		}
+	}
 
 out_clear_bit:
 	if (ack)
-- 
2.53.0

