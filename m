Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2988B3B7B98
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 02:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788229681; cv=none; b=MZvrUtNIcVZw0yhlzqf1+knIObodQ59TYzyKCCM0Axz3XpqeneGSaeoZsc01+T0IWF5OyH54+tsTG9RL8BLMXcwgkcbQsDl6V02lx/tNgo4L/+PBMD5T35hJ5h9zBLiWQ3Gbame2BhpsTKVVFJuu15jLjQAReUY8Dy+AOl2nmYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788229681; c=relaxed/simple;
	bh=aJOqvp+m9yw8vXbrKDLmTt+ksd0xUEQcYggk/0JrfpE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bXffWoBZctU1YliqJ4VEQ7H/i+z5GVck9tMMUyC2QolU6pGhqVxNgQFgD7NnzBMw9QGBbVp0VVF9KYYk0lbR94vkVaNd7EYPw5Q3/5ZFjPoe7xkyJJxgeCMRlrKQlDFrdpVXLTcplhYKvrHsFXrgyDjVFIQZ9PcegnO7N2UeZ2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0zBt5TY; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0zBt5TY"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc1cb472b76so3877552a12.0
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 19:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788229679; x=1788834479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qf8oy7qaKirN8ICo0JJ6d8Lc9hgixjHXp2cKregM+M8=;
        b=g0zBt5TYnDRL5qcqS2VW07ENseaYnoz4qKCtmNrVWYHtQawo4YqborPZAt1kFU8D5d
         u8LCoJyEZ9s26Zhp47wWUsqUwjtJa/BqOsNJDXHQhmnU4lu5XExJ+75DSbOlkFJLwsXC
         JTMYd5tZXaofPQHZeIS8Tk6SFUvkd4AbqVB7vStz0uhfaELLkaOijL5vJcOoZIZ8o0Hf
         AJ1uUz1DZz+D0ri3W0Z+pvS13yQ3ocW31FL/oRHVPzdAMEPYemdOc6dPjEiXqBhAWYce
         ymTe0SfCuutAiyjYaDxR47LZwESRBnNhdyEGpIS/ME/y1v38vXElJALggNqALaQea3rC
         7Knw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788229679; x=1788834479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qf8oy7qaKirN8ICo0JJ6d8Lc9hgixjHXp2cKregM+M8=;
        b=fREeoIG6A+V2arLYO3W9ntZTtF1Dif72KKCW9QHOQivl5e9eBA9aRCtrkVifDfmpjM
         6DGEjgVwc69OrelPHzuqOFCUqGJUwXdLBQHhvDu9OS9sFnSRwszkL80kt4Y6MxDhjTru
         21Ritf/u+wADiQuJdBIqYv6hEdqx99HWld4//il1h4yjd+aDSFWMZrqG/+Ar3UHqgfi2
         6fHG2FGOMApG43jikFLRIF1McLHkGoSYz6fuB43MNzqILu2LKWFbscNTot78fReaEP2M
         VU7omnhlgVpxFIGrTzHJv25b/hge/CiV3Z2moXfFJKH9z5rLnyFY4myWR8UXYlqpvm7/
         2qzw==
X-Forwarded-Encrypted: i=1; AKwUvBxjVQ7BXOoah6sWfAVLS6i5ERTnNBjf+fgQakybUkuXbWP41Fe0vYzh0w00c5aur9W8Jik8UsanO/4=@vger.kernel.org
X-Gm-Message-State: AFuF++kWn7Vei98pIjv9qZjP54wo5ROHNLTxur+bbjzwwNUFacybnZoh
	UMmOCJF0i6aTWZamBxoruCwYkgK9/gDPKUL/QGryQ+BguAJyJywImukcERS9tMBU
X-Gm-Gg: AYBFou1Zf+qExxvXqPjtYiK1pn0XTCOjSoXYndm3itOgbEdS/kQHvpHT6+G98n3K8bU
	YQzabSpBqKeWqfeaGdLd9CWoz32hmKY/11vUfnxJj0d86HkBY2EkSPTJQ1u6Wlz3XBCUaONFSCm
	1jIl3U2zoamhKmvXqFoXvARYGMy4eHM2kmeWR8c11LAmrFSBxhujIcT7nT/Y5bYN69PONriVxHd
	KP0q15BeuXAYfc6tu494Bc93ptN1zHg9E7BxzgR6V3cI/S1x0zwlaW8DGgednJ7FzNGPQnPGLMO
	xWQ5uYoovONlhPKrvUp1gdhScPg7BZxbDbuFnvB8j0YZNR/x+EjD46J/QoaOaBoDIyyaHntxTxt
	1rO/64pDex5bTZliUMCXgsvKd2498opZBSrujvM759AV9+TqIPcdkgOY3PL8CqZZ6bcjJMHskcW
	h8aqKSzfNeJ3VoRusimBJ/qsgEujZC0bmsJFznl3xe2Dnhx/Tav24ArL+n7r55Pe/bouxM6ES2e
	UsrT0epZ7tzOu22
X-Received: by 2002:a17:90b:3f50:b0:381:a766:efc9 with SMTP id 98e67ed59e1d1-396d0df72e2mr45995759a91.7.1788229679378;
        Mon, 31 Aug 2026 19:27:59 -0700 (PDT)
Received: from localhost (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d802787sm2997055a91.16.2026.08.31.19.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:27:58 -0700 (PDT)
Sender: AceLan Kao <acelan@gmail.com>
From: AceLan Kao <acelan.kao@canonical.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Benson Leung <bleung@chromium.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] usb: typec: ucsi: recover from silent PPM completion in sync_control
Date: Tue,  1 Sep 2026 10:27:54 +0800
Message-ID: <20260901022754.3102934-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.53.0
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
v2 -> v3:
- rebase and resolve conflicts against v7.2
- Invert the post-timeout completion check so the empty "silent
  completion" branch falls straight through to out_clear_bit instead
  of being an empty if {} with the real logic in the else, as pointed
  out in Greg's review.
v1 -> v2:
- Add Cc: <stable@vger.kernel.org> # 6.14+ as flagged by Greg's patch bot:
  the Fixes: tag targets a commit already in released kernels, so the fix
  must be nominated for stable.  Scoped to 6.14+ because poll_cci only
  exists from that release (absent in 6.11-6.13).
- Guard the poll_cci() call with a NULL check to avoid dereferencing a
  NULL function pointer when a backend does not provide the op.
---
 drivers/usb/typec/ucsi/ucsi.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index bef3f9b71d718..0363ed127a567 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -92,8 +92,28 @@ int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
 		goto out_clear_bit;
 
 	if (!wait_for_completion_timeout(&ucsi->complete,
-					 msecs_to_jiffies(UCSI_TIMEOUT_MS)))
-		ret = -ETIMEDOUT;
+					 msecs_to_jiffies(UCSI_TIMEOUT_MS))) {
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
+		/*
+		 * If the relevant completion bit is not set, the EC has not
+		 * completed the command; report the timeout.  Otherwise fall
+		 * through to out_clear_bit, which reads CCI+data normally,
+		 * and ucsi_run_command() will issue ACK_CC_CI as usual.
+		 */
+		if (!((ack && (polled_cci & UCSI_CCI_ACK_COMPLETE)) ||
+		      (!ack && (polled_cci & UCSI_CCI_COMMAND_COMPLETE))))
+			ret = -ETIMEDOUT;
+	}
 
 out_clear_bit:
 	if (ack)
-- 
2.53.0

