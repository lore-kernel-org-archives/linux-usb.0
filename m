Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095D242317C
	for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2026 14:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783433868; cv=none; b=n7UM+L2p/TfruedGSIhTjm+4hRt7TwcbKh7LOHbmxAxvh59UfJqfSo9Ulx5pr/D0ZIZzZcJ0QSvzlBY3YVqAUrK6NwuKlRREjhVo6JTkp3n65a0GWwdHQ9mMsI3/nha/G8kgLUBYqAJw9TC6exFNDdobJFMT2L0mjeWI5194hag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783433868; c=relaxed/simple;
	bh=JNRMrbb5OEze61V+JypFOazAcSxi7/13i/xrfkhYpUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jhASBGu3v6hHvAbFtY4PR8b5Qu5jjpmiQGD+hhtJzKJv8iWmbZvYtgISKd7CgrJFieYEhiCwmeRJWChMzi4uRNUNoKiaIPHuOZRU8ftzcnLbh4BjweY8H1R3W38lPnEkfcYxBDaopqm242q03sGUXiQvnF+yQNIqajhff9FuwwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MIXsec/a; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MIXsec/a"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-698bf053053so6296330a12.3
        for <linux-usb@vger.kernel.org>; Tue, 07 Jul 2026 07:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783433861; x=1784038661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FHI2Oy1d15fEP4M9liye51QpOZL8T3aeN/VQtQoMGgQ=;
        b=MIXsec/aVbobYu/Uf9o86l7StzmlDAOuk/H/lELvIfJjPT4xU0xZ5b3Uo4zqD2x9hr
         qRp/p25n2EzvQRi2wxuwZRpqvBstTuZ00l4nGeBxkWnNRR/iLILxX9jmFZMaxYZZ7miV
         qFaP3kSH//FU3hktZt+aGuYxtG0076WkUzPAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783433861; x=1784038661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FHI2Oy1d15fEP4M9liye51QpOZL8T3aeN/VQtQoMGgQ=;
        b=n3EAESKnlxQ7jBnETyh0iq9YATYvbHiOt3PMuUQ51UdCKCxce8CP9m6o0RXAk6tcGv
         NjGPEaFdD5p+f6GmWSEyKZTg6r2lEtmTi+LOSn5BGtd4brZSOwnzRS7nbH3Km0BhjBpB
         vMUyinXx+oWW+M5x23/5hpxWGFd8h7yfVvhBwwXpFIJ5Qjmw1nGCWExCMMMTzE8OfgvU
         5q7QKGZHRDNkkwUlBzUkF4pWjb/h1psncYo+Ok93NB9iV1n80chn+DLDshaskn8bhYc8
         2jKYms/yujLH5qvnrk/L2vFO7dPTy4rzTcdGPVD7I5YJXwFWdbF0ww6AtxLbUOkpWCbV
         rXKA==
X-Forwarded-Encrypted: i=1; AHgh+Roblp7VPEIPwonKGXyun/7xefIRtH5Ymaj2noUJOchpZmV2eXZwCo8EGlPfflDzA1peMB3NGePSRf4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN7PjoxGPuhk4pXm7cBUtQhf0VPdjC57K211mlLetWZx6Y0uIT
	3Z+USQH1w/DFw2oqI2ZBfdnXRWLn1R3TN6sLMi/lPPc/bnpMP2vMOQ2KPV0d1UIo2w==
X-Gm-Gg: AfdE7cmZBWcmsXOhH95VZz8/aAUV3CnxkV1nG4zlfY+4MnmDhedRL5U7PRPc9FmX1FF
	wfjAd4qggPHrAhO8sXmUtC0RNb3sT9XTLFYWl1DX4q1fqVaz8BRTGO/zpJ62qMq3f8clomzmP3j
	9q7ArywQhDnyUMNqZIzcTtmMgSEX1YziQMtptUefeZrcZXxoPs+layLJJM5aQHAAQapHPKfDKP3
	xpym5TbsAEkeVH/SAHRjDc1f/wmM1Ek2d+//esEcpk+/B7Sd/hQ6jZXo36/fL/lT8SOUnNNXRep
	gYOUHiKxs13jNtHB8A+iGZ58NfTHQzzaiCvzdfHOyH9SfW1sSe4tel6RP7NHmYmRaJU71d9pgbo
	M6IPCJt+8fN3BkYmhk7BLgiaAMJdl0GUj6GprXDPD/xzTaJXnzKXhqLREDudBnoNd8d+J+pPPgY
	oxDHFKBoscRmv3ShLX2c7jwDudmbroMdDZkAFIyk9lwwknKpDZYO5J2Y9oT2Ynt0i38IktLZ/6D
	1GrwBZXAg==
X-Received: by 2002:a17:907:d301:b0:c12:c936:86f6 with SMTP id a640c23a62f3a-c15a676c68amr319735666b.12.1783433861112;
        Tue, 07 Jul 2026 07:17:41 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (12.127.147.34.bc.googleusercontent.com. [34.147.127.12])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad882342sm144491666b.28.2026.07.07.07.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:17:40 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Myrrh Periwinkle <myrrhperiwinkle@qtmlabs.xyz>,
	Linyu Yuan <quic_linyyuan@quicinc.com>,
	Jack Pham <quic_jackp@quicinc.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: Fix race condition and ordering in port unregistration
Date: Tue,  7 Jul 2026 14:17:36 +0000
Message-ID: <20260707141736.1635698-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A synchronization issue exists during port unregistration where pending
partner work items can race against workqueue destruction, leading to
use-after-free conditions:

  cros_ec_ucsi cros_ec_ucsi.3.auto: error -ETIMEDOUT: PPM init failed
  BUG: kernel NULL pointer dereference, address: 0000000000000000
  RIP: 0010:__queue_work+0x83/0x4a0
  Call Trace:
    <IRQ>
    __cfi_delayed_work_timer_fn+0x10/0x10
    run_timer_softirq+0x3b6/0xbd0
    sched_clock_cpu+0xc/0x110
    irq_exit_rcu+0x18d/0x330
    fred_sysvec_apic_timer_interrupt+0x5e/0x80

Fix this by ensuring strict ordering and proper serialization during
teardown:

1. Move ucsi_unregister_partner() to the beginning of the teardown
sequence and protect it under the connector mutex lock.
2. Ensure all pending partner tasks are explicitly flushed and finished
before the workqueue is destroyed.
3. Switch from mod_delayed_work() to a cancel_delayed_work() and
queue_delayed_work() sequence. This guarantees that items currently marked
as pending won't be scheduled an additional time, preventing a double
release of resources which leads to the following crash:

  Oops: general protection fault, probably for non-canonical address
    0xdead000000000122: 0000 [#1] SMP NOPTI
  Workqueue: cros_ec_ucsi.3.auto-con2 ucsi_poll_worker
  RIP: 0010:ucsi_poll_worker+0x65/0x1e0
  Call Trace:
  <TASK>
    process_scheduled_works+0x218/0x6d0
    worker_thread+0x188/0x3f0
    __cfi_worker_thread+0x10/0x10
    kthread+0x226/0x2a0

To ensure these rules are applied identically across both the normal
teardown and the ucsi_init() error paths, consolidate the cleanup logic
into a new helper, ucsi_unregister_port().

Cc: stable@vger.kernel.org
Fixes: b9aa02ca39a4 ("usb: typec: ucsi: Add polling mechanism for partner tasks like alt mode checking")
Fixes: b13abcb7ddd8 ("usb: typec: ucsi: Fix NULL pointer access")
Fixes: fac4b8633fd6 ("usb: ucsi: Ensure connector delayed work items are flushed")
Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 82 +++++++++++++++++------------------
 1 file changed, 39 insertions(+), 43 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 92166a3725b16..d9668ed7c80ea 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1845,6 +1845,42 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 	return ret;
 }
 
+static void ucsi_unregister_port(struct ucsi_connector *con)
+{
+	struct ucsi_work *uwork;
+
+	if (con->wq) {
+		mutex_lock(&con->lock);
+		ucsi_unregister_partner(con);
+		/*
+		 * queue delayed items immediately so they can execute
+		 * and free themselves before the wq is destroyed
+		 */
+		list_for_each_entry(uwork, &con->partner_tasks, node) {
+			if (cancel_delayed_work(&uwork->work))
+				queue_delayed_work(con->wq, &uwork->work, 0);
+		}
+		mutex_unlock(&con->lock);
+
+		destroy_workqueue(con->wq);
+		con->wq = NULL;
+	} else {
+		ucsi_unregister_partner(con);
+	}
+
+	ucsi_unregister_altmodes(con, UCSI_RECIPIENT_CON);
+	ucsi_unregister_port_psy(con);
+
+	usb_power_delivery_unregister_capabilities(con->port_sink_caps);
+	con->port_sink_caps = NULL;
+	usb_power_delivery_unregister_capabilities(con->port_source_caps);
+	con->port_source_caps = NULL;
+	usb_power_delivery_unregister(con->pd);
+	con->pd = NULL;
+	typec_unregister_port(con->port);
+	con->port = NULL;
+}
+
 static u64 ucsi_get_supported_notifications(struct ucsi *ucsi)
 {
 	u16 features = ucsi->cap.features;
@@ -1971,22 +2007,8 @@ static int ucsi_init(struct ucsi *ucsi)
 	for (i = 0; i < ucsi->cap.num_connectors; i++)
 		lockdep_unregister_key(&connector[i].lock_key);
 
-	for (con = connector; con->port; con++) {
-		if (con->wq)
-			destroy_workqueue(con->wq);
-		ucsi_unregister_partner(con);
-		ucsi_unregister_altmodes(con, UCSI_RECIPIENT_CON);
-		ucsi_unregister_port_psy(con);
-
-		usb_power_delivery_unregister_capabilities(con->port_sink_caps);
-		con->port_sink_caps = NULL;
-		usb_power_delivery_unregister_capabilities(con->port_source_caps);
-		con->port_source_caps = NULL;
-		usb_power_delivery_unregister(con->pd);
-		con->pd = NULL;
-		typec_unregister_port(con->port);
-		con->port = NULL;
-	}
+	for (con = connector; con->port; con++)
+		ucsi_unregister_port(con);
 	kfree(connector);
 err_reset:
 	memset(&ucsi->cap, 0, sizeof(ucsi->cap));
@@ -2194,33 +2216,7 @@ void ucsi_unregister(struct ucsi *ucsi)
 
 	for (i = 0; i < ucsi->cap.num_connectors; i++) {
 		cancel_work_sync(&ucsi->connector[i].work);
-
-		if (ucsi->connector[i].wq) {
-			struct ucsi_work *uwork;
-
-			mutex_lock(&ucsi->connector[i].lock);
-			/*
-			 * queue delayed items immediately so they can execute
-			 * and free themselves before the wq is destroyed
-			 */
-			list_for_each_entry(uwork, &ucsi->connector[i].partner_tasks, node)
-				mod_delayed_work(ucsi->connector[i].wq, &uwork->work, 0);
-			mutex_unlock(&ucsi->connector[i].lock);
-			destroy_workqueue(ucsi->connector[i].wq);
-		}
-
-		ucsi_unregister_partner(&ucsi->connector[i]);
-		ucsi_unregister_altmodes(&ucsi->connector[i],
-					 UCSI_RECIPIENT_CON);
-		ucsi_unregister_port_psy(&ucsi->connector[i]);
-
-		usb_power_delivery_unregister_capabilities(ucsi->connector[i].port_sink_caps);
-		ucsi->connector[i].port_sink_caps = NULL;
-		usb_power_delivery_unregister_capabilities(ucsi->connector[i].port_source_caps);
-		ucsi->connector[i].port_source_caps = NULL;
-		usb_power_delivery_unregister(ucsi->connector[i].pd);
-		ucsi->connector[i].pd = NULL;
-		typec_unregister_port(ucsi->connector[i].port);
+		ucsi_unregister_port(&ucsi->connector[i]);
 		lockdep_unregister_key(&ucsi->connector[i].lock_key);
 	}
 
-- 
2.55.0.rc2.803.g1fd1e6609c-goog

