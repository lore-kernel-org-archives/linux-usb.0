Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FD137FF41
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 20:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787086651; cv=none; b=GfVBBdIwlfABHz8FK9frZZeSQ9lBvoCuCYQP9/fCT8XJz5zHP8iyERHMayZxwk9YmX6juqWmG8OaLY03MbKtnVsMOt4E4Ur16Q9ZCra0GOitp9r76vwfRhL+K/oQ/1PeBdBD3NQ7+cRu9xcEKubdE1XSF2ObLNaC5fZ6p0YlAd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787086651; c=relaxed/simple;
	bh=NbBlOo7NTJaG6oAmparK6IlCJeTyS24qMGJz+OZfZNs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=j3BIkeIkjSxTvE0oXrw7QXzdPVhq9VvV98vTW9QJByarr4K2RRpiQ3ZTXQ3Nx44Ucv7pW+dCn2/4N2nC132bis2Wg9f6m8/7i/xjjcLy6hPUcHwB2ldzugWum8x8HTRIrqgAWNygDHe8OacG46PcKDuA3h55vd45Qu49qbM96cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tN+Tg5Er; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tN+Tg5Er"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbedbd182f5so140368a12.1
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 13:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787086649; x=1787691449; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R0nX0jhN3JBQqm+1BONg8WcZGuPuvMazpDXdPY4cftM=;
        b=tN+Tg5EruOfWjqLDx5euXdwX/1KA39qDTPGcFHtMM+cle/3KFdKhShoi6AqQOsXiD6
         CCxSmcPOlqZUn5jFUUCJuWW2OdP+rD1VLVU6NtGetTxX0pKVQ2vfUsi6UZPl+CMhq6FP
         Xbopf9iu1heS/6TyIdhT28K7TJL7dc/V0zkoj3gsy/+UX0LpOTngV9hQsS/BB5z5V9Wu
         X33Ctk+dBvYlNxbNyAz2ZbNB1aZm0wwKS8nkaX3x++vc7u3+njhi2toTMgPn1FptR0xe
         c1RzGJq4qjKWqZzR4vZNLKlLgStG0bTUKb2H8vdVPufnfSss8D6F2EjLLeuaflO9YbPj
         RjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787086649; x=1787691449;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R0nX0jhN3JBQqm+1BONg8WcZGuPuvMazpDXdPY4cftM=;
        b=hxhJMTplnK1KTL9ah7AmW6DHowqZZ70tlDl2VhVaU3kFapFppLXi3gqvcfP7mJHgsC
         PZhL+FDyWRhEp2uIF8lJ5ZIg4qxIYxwBV84HBEI8HN5XWtHUic1GfP5l/zpF6qtWqMd+
         Ln+1/Md0GwsC51yjcJWJKfE86eT14eFQvHIlGnugJgfm+3VtTorgzX6GR0W6F+CXc2f2
         ns+1PQ8EcND21+HGRtM7ygUky3K1zYvVAqninhtJoMN9sdA8t+YxnO79xYZlqU9NdqbY
         DH5/SIsL0BhV4oMMeEp2MpY2AS39YMsXhPzaK4alzkLieQEDJ5l40k/2CkuWWC6goips
         5r9A==
X-Forwarded-Encrypted: i=1; AHgh+Rp1+5hOz/5LMVtIdih+zTkr/dqye46TyZdPt3mNJ8fxM97twb3t/iTLgRYXTShcFG2OUQcN3nNmPTk=@vger.kernel.org
X-Gm-Message-State: AOJu0YynWG4XhhztMks/mXyz8fJ2qtXWvUBVI7HTT8aUu3XoXKtzG77G
	pudzjEQngrQHcNdnwc5JHk0VaJ+rBKRvoQ+fakad8qCpMLOHNV6TbBbnflKr6Hp6qfxQk289aIm
	GLcuPMA==
X-Received: from dycqw13-n1.prod.google.com ([2002:a05:7300:c00d:10b0:327:b7dc:6167])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2446:b0:39b:bc11:9ec5
 with SMTP id adf61e73a8af0-3ccded40c3emr8744782637.13.1787086648471; Tue, 18
 Aug 2026 13:57:28 -0700 (PDT)
Date: Tue, 18 Aug 2026 20:57:17 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.737.g08866a6d13-goog
Message-ID: <20260818205717.1492247-1-jthies@google.com>
Subject: [PATCH v1] usb: typec: ucsi: allow retries of ucsi_resume_work
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, bleung@chromium.org, 
	gregkh@linuxfoundation.org, akuchynski@chromium.org, 
	abhishekpandit@chromium.org, Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

On resume, the UCSI driver will re-enable notifications by sending
SET_NOTIFICATION_ENABLE. The LPM/PPM may be busy during system
resume causing SET_NOTIFICATION_ENABLE to fail and preventing the UCSI
driver from receiving connection status changes.

Change resume work to a delayed workqueue to allow retries on failed
SET_NOTIFICATION_ENABLED commands. Additionally, cancel resume work
on suspend to prevent pending resume commands from impacting suspend.

Signed-off-by: Jameson Thies <jthies@google.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 18 +++++++++++++-----
 drivers/usb/typec/ucsi/ucsi.h |  3 ++-
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index bef3f9b71d71..5c67f0990dd3 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -2158,7 +2158,7 @@ static int ucsi_init(struct ucsi *ucsi)
 
 static void ucsi_resume_work(struct work_struct *work)
 {
-	struct ucsi *ucsi = container_of(work, struct ucsi, resume_work);
+	struct ucsi *ucsi = container_of(to_delayed_work(work), struct ucsi, resume_work);
 	struct ucsi_connector *con;
 	u64 command;
 	int ret;
@@ -2167,6 +2167,11 @@ static void ucsi_resume_work(struct work_struct *work)
 	command = UCSI_SET_NOTIFICATION_ENABLE | ucsi->ntfy;
 	ret = ucsi_send_command(ucsi, command, NULL, 0);
 	if (ret < 0) {
+		if (++ucsi->resume_retries < 5) {
+			queue_delayed_work(system_long_wq, &ucsi->resume_work,
+					   msecs_to_jiffies(500));
+			return;
+		}
 		dev_err(ucsi->dev, "failed to re-enable notifications (%d)\n", ret);
 		return;
 	}
@@ -2187,6 +2192,7 @@ int ucsi_suspend(struct ucsi *ucsi)
 	 * EC is stopped for suspend; state is re-read on resume.
 	 */
 	cancel_delayed_work_sync(&ucsi->work);
+	cancel_delayed_work_sync(&ucsi->resume_work);
 
 	if (!ucsi->connector)
 		return 0;
@@ -2200,8 +2206,10 @@ EXPORT_SYMBOL_GPL(ucsi_suspend);
 
 int ucsi_resume(struct ucsi *ucsi)
 {
-	if (ucsi->connector)
-		queue_work(system_long_wq, &ucsi->resume_work);
+	if (ucsi->connector) {
+		ucsi->resume_retries = 0;
+		queue_delayed_work(system_long_wq, &ucsi->resume_work, 0);
+	}
 	return 0;
 }
 EXPORT_SYMBOL_GPL(ucsi_resume);
@@ -2299,7 +2307,7 @@ struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops)
 	if (!ucsi)
 		return ERR_PTR(-ENOMEM);
 
-	INIT_WORK(&ucsi->resume_work, ucsi_resume_work);
+	INIT_DELAYED_WORK(&ucsi->resume_work, ucsi_resume_work);
 	INIT_DELAYED_WORK(&ucsi->work, ucsi_init_work);
 	mutex_init(&ucsi->ppm_lock);
 	init_completion(&ucsi->complete);
@@ -2365,7 +2373,7 @@ void ucsi_unregister(struct ucsi *ucsi)
 
 	/* Make sure that we are not in the middle of driver initialization */
 	cancel_delayed_work_sync(&ucsi->work);
-	cancel_work_sync(&ucsi->resume_work);
+	cancel_delayed_work_sync(&ucsi->resume_work);
 
 	ucsi_debugfs_unregister(ucsi);
 
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index dc594388dcd0..1996f04ed5e6 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -484,7 +484,8 @@ struct ucsi {
 	struct ucsi_connector *connector;
 	struct ucsi_debugfs_entry *debugfs;
 
-	struct work_struct resume_work;
+	struct delayed_work resume_work;
+	int resume_retries;
 	struct delayed_work work;
 	int work_count;
 #define UCSI_ROLE_SWITCH_RETRY_PER_HZ	10

base-commit: bdab5605259ba5d6ff927c1a85cc83eb3ecfdacc
-- 
2.55.0.737.g08866a6d13-goog

