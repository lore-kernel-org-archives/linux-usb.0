Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2E237C118
	for <linux-usb@vger.kernel.org>; Tue, 16 Jun 2026 02:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781575250; cv=none; b=nGR5ny/OMa2c1WaaQxRS6ANIIeWb+1zvWp4XSMCcKQbKBbQ6ICoAdY8BbjLVO3LG1hjrAtUOaPWt7FfHwn9Ie1m5ET0MY9/DWzPW0ySppd/129yJ4OTiTWhAGLBa05qFbScf8IchCtxrbJsN1Q8jlWpdmjJMTsgSpGFeDdCffhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781575250; c=relaxed/simple;
	bh=XOFiYvMOGgs0nTHV/aLPqquz2Tp90j+AGrLy5/QgvBc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZAYuAx6IB9sQv94feKGDGB8UQaAyG/RWatx0hvYYg64ltAP5OOt/M5cDcR8xR4iSLLNCMa1FdeqnD3kKI3DSTVlyH3Sz42fhfTMBvcJki3dCYnmgpogpiK/aG7BCfCviGq9QXbLNB5Ef12kxfb5FAI26k3G0+f1kN7QH3q4MI5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oHWAesnq; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oHWAesnq"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30b6dad2382so3441348eec.0
        for <linux-usb@vger.kernel.org>; Mon, 15 Jun 2026 19:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781575248; x=1782180048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3Jgejmm3N1yCN3+ML3uG6lCibMporoBOXdWWEfDL3k=;
        b=oHWAesnqDuNlAEPZeOYBK1Nd02dKWWnKr8tgSwC0Gao7tAAloq8bdXt7b8fb6dPeyT
         Fb9w0bYungPqTYjPKH5txH9gVvaNnlieQ6TAg8iJ6xjhgoArYOGoYPGrflI6PWoZXgHx
         AtgQ0946gW1nZOmv2POpXtYczLnfenS2EMZErb42SAdPqBAh0q9p/W8GqpMh/t30/5fW
         auDk4W+da8pvcEAQxWYhxcQpUb8K3R0XqKbgK3adg/PQdw5js1zv6Cw+GkVTa7enjnA3
         o3J/b/R5UUHm0Yv/zW1IQfv9OjLIVU29AS/PpSSekPiY2OTlqSEWU5uaeMmHGAsT154g
         M5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781575248; x=1782180048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3Jgejmm3N1yCN3+ML3uG6lCibMporoBOXdWWEfDL3k=;
        b=IP3+uVzW6RwBZe5focbnXVTBAqxI1ZuF1qGxtsEVDoWO7/cQkV/UWpHMK5F+jd1dbJ
         FcIIqblGLrdFGEI0OI0dKrQOA2bLhesztCfYcvmn9EF6YSSyMlDGr9VPbQFogqU0Dke0
         wMVORSmgeTZ3oub1v9R66w9E6Ln5zkjN2mJecd69zTey1WvbJucpDFwRuxQh5claJq8/
         zx4onnObRqZDXUtU9ZvXzy3qShf3I219hMM/BGrK/a1UFc0/4EO6fDb3OXclw5eZyvNo
         G2txg1RqxBANi9V7eSOLnJFcVogMkhFta36rW64o7booJvzXBVwZ4+C0GqFcYU1ueoJO
         EoiQ==
X-Forwarded-Encrypted: i=1; AFNElJ/nhbhPfjFWnn/2g9pRBt3Bmz39EJxDDP84naoHyJD9yPKr87KtJks9tVKazWIFvt4Dbx0oDk/v4wA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGXAtfYImI1QuyYTQErsTOdK/1mMVkOWY63GVN20RBv1oGjdIy
	SkkV3AIKshwHrUB426sEN+27+khfRmdONVwUM7eHlvQPWVUesbCyKz/v
X-Gm-Gg: Acq92OEOuBjvxD0Ji6s4BbdI59+ajoyjeCOIdciNXKDWWurouAB9VofTAG+Ghuiw15i
	v5ShfZp+xNJSkSmSkCIEcRHnS7QQHNRIJIkkOe1WdJJOzUGwKNOIIU2i794hPXSItwdN4gbi7Bb
	fLQn+CMEjkQ3lGQ7yuYU2+vjGqs2ea6t6N1jpES2QD8nh6ZzoVAD7jMLQM4FytMR+meL0+MIK3T
	vmGS9TKDjhxoKbFtr9R4Lw1wPFg5/5N9vubWdZmjuMdMnHS4tQCFW6dpMKQSU7JgXl+9dv08zQc
	F7sqAscA/qZMuh28zqK5heo0nCna3DFORLZzdy8f4lmQ95UHMowLS26SpHXkrBMgG19ES8YarGV
	q2tL728NBGXdEvrbPInc8lq4qLj4/cXyLQYGMSQYjNFNpf2VSyfkEy68FeYvU40eUn8jQy++N70
	amR+lmZpXz/2caeKSnsd0HdeTtEau5L2lmfrkb4LmlQfwsEAcUf1Q6
X-Received: by 2002:a05:7301:5792:b0:304:cefc:5fe3 with SMTP id 5a478bee46e88-3082005f0afmr9580953eec.18.1781575247395;
        Mon, 15 Jun 2026 19:00:47 -0700 (PDT)
Received: from localhost (118-163-61-247.hinet-ip.hinet.net. [118.163.61.247])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e4898c0sm17547344eec.3.2026.06.15.19.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 19:00:46 -0700 (PDT)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: bleung@chromium.org,
	jthies@google.com,
	myrrhperiwinkle@qtmlabs.xyz,
	pooja.katiyar@intel.com,
	abelvesa@kernel.org,
	yuanhsinte@chromium.org,
	johan@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: recover from silent PPM completion in sync_control
Date: Tue, 16 Jun 2026 10:00:44 +0800
Message-ID: <20260616020044.1646085-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Fixes: 584e8df58942 ("usb: typec: ucsi: extract common code for command handling")
Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 9eeb38e7472c0..ed5b10d8b58ef 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -91,8 +91,28 @@ int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
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
+		 * If poll_cci() fails, polled_cci stays 0 and we correctly
+		 * report -ETIMEDOUT below.
+		 */
+		ucsi->ops->poll_cci(ucsi, &polled_cci);
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

