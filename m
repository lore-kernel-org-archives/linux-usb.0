Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019251;
	b=RZbimlSTsIA2oqysQ81lV38Zmyc7OMhQ1uOPCY0q558Hrpv3Cv7rvS0XZxIg+yewwdNO
	 OpPHMqGkAuL+pJaisp0BNvNUT7r98DE7IxjxO9SuYPib/1CCfBCOmczpS8+og90mn2aJg
	 72eSLRY92qM5xGGJQ/kdFeZ+Cp01MsRiDEdGjz+DtKUXuALJZ16aM4oGMeiahlyRr05xb
	 0HUtgmfk41LOqJmCT1mvLa9Mo8caNWgsu1kPQa2Qs7SQr80ScV5qtTrG9KsRmgstbfxvs
	 Tf2Krd4lTrWG2QE3Q6Aw0Of7ntTwuvk95Ofgbv2/g6c4pMSoanS5wNtCjnja8dbbd+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ON8KGnTevtZaUMygjMJTRTjAtMpKsCSCYzE2GSlB3gY=;
	b=YYGlW35hgAZ/vFgdBmH/1feDWKQ7Kqg0Yel4KrTijOBSFQnF3qUpRgjvP2gJS4ld1j00
	 KXLevwKdyVw5YHSt/WLcEdA+jGv9Vp94h8VNfY1AKrVvINYv8++UbG9KbLF+mrShARXf5
	 tjMFmvuF2s3gUEV2wry4EnlK39sR20zdsMlQt32TnSVE9RuddbA06qlaMQYfTULkf7iUN
	 0hpIXjGUSaGoKuOroTmv/gXPEg/cbd1eA490juLqXM9ZNGt+c9nquuTNFUWgmQjYMB0u8
	 FCsKGBEez5Ddt+dQFKzO340f9GpPWR8s0zhBDROi6SKKJtMU7YEjyn/s/Atmk8z0brw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sDzSYXyZ;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7FC606A31A
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 12:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD7FC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sDzSYXyZ
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso151525e9.3
        for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 05:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793019249; x=1793624049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ON8KGnTevtZaUMygjMJTRTjAtMpKsCSCYzE2GSlB3gY=;
        b=sDzSYXyZ+vq7imqkUMma+W4UryInipeJhv4L1VqQXgNeOkXQ9tXO5KOjHRy+mtSIBJ
         3oFO5wnoY5pIBDXr/qSlv0WPbNVpJYl5uwf9Pgn7s0e73c6O219ohm34LJR5Qa2JiRGR
         +hozkl8ry4ddwlERmcvMSVXj4bIk1tvjz8t3IAn0wnOt8XcR2YVk7xORkQQOT96wlndJ
         a9ZWeY3Q4HYsCw8R09bpMVdpJyDbVDl4xvRtSW/O9oK+DzBBfRMChCk4ep5XyTt4NBPT
         +k9+5P3daotYgtB0Pk4s55r1FjBy52GVe4Mt1VHiujzkg5zSDtoG2JWz/TdBeEpIm7Zh
         IKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793019249; x=1793624049;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ON8KGnTevtZaUMygjMJTRTjAtMpKsCSCYzE2GSlB3gY=;
        b=i0wD5eT0VW8EeJCl1XdYJM2jf8wNcfuUk1vyG5Du2Px/SxmFfdaiygqT0oguKKoJjB
         3JTAS3160yMdUfvCjVoDqF2eADURc1HV3ftYzQu4ARmYeHe+LqFoiZjACEt4gvfAlKxC
         e+dle+W3q19vpGqtP/3XhbQm7UXt7oT8J0NQB/lBQEpOT7Jh1Ytk5SuN4ats+O1dqvpu
         tdPJlc3a9FRWNMAZNh1YmqXY3BzkncvK9Mj6XC44RBhT+3UffRixYQx2z6hLwt1HWNsl
         pzCDcf9jfOdkDuFJz+7OjzegBenLK1U5OdzhdWhkHFoCONDkgUAlyV7WtltL+IeCblPN
         oIvw==
X-Forwarded-Encrypted: i=1; AKwUvBxmByJbBO55xMoSwH83jFbspXkEjgRnogCpkimt3ulM76J1JRsZprvn0sLSIG6tmxXLikIXkcKRTKQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7j9bN8ofHhMKMMIZMFf7SfcVGgKnTcEvYciR5+kM6SQpSoE+v
	tPk/RXq5FAoZVTLbjBkkiK0zwByo9z9xdMsDXHsF+HEE5XXY4fgb4DSI
X-Gm-Gg: AYBFou10XFwhIYdfSasM8d9ymmAT/2uYLjo6D3spBdQkoJif3vsJsViIahppZLl6gPY
	E0tVTMpFIHRuSXByw/YmxtGxUn69PMGHe7FFtYOW/onL7apXbxT1jnWiCVX/Y+UMxfbivSjdhsy
	3F7JbcPzG6LcxCdSnAWo6EiOA+rUFTxKJ7Cqo3MoXDd+s/rchFE4vdRnCMWdrFp9y0GCZs83LyY
	wWwxEu1CHqaVPANJ4b9TNZpHkEVStTZmxKhmP52TgVJTA5QvSnCnaglTROuRUI6mU2Ffi8yf6KC
	9lgCzt8MynXFfmGMQOztPxdU6GcClEjVnTY4cnY4YbA+SeUgbmLvqW6kpF7pAT4IcwrvBVrwKzk
	MNY9eXhR4gDGhMqLbxYweBEO3pO0SczyH8IHiTLsO7TzsJG+PTpc2YH0MOgD6wMD+hS++95YpDs
	qxpUo1akG3B0MCIJBASw/d5M3ZpYsT+tjzSLDbcuNxjuDXD5To/nYWqAu1Ugt8KQoWFv8XBOzcJ
	V81pwjwZmfCwAk6wnYYXcPavRNS4ghJ4gPBDFhrFIS25mbyA1wekgsRnMproPhXPdDcQRBp6HCs
	nq5uMrJmy3SpQ/za
X-Received: by 2002:a05:600c:524c:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4a35ac8bdc6mr121818255e9.8.1793019248846;
        Mon, 26 Oct 2026 05:54:08 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a046fefsm245927875e9.5.2026.10.26.05.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:54:08 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Fan Wu <fanwu01@zju.edu.cn>,
	Huang Wei <huangwei@kylinos.cn>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [RESEND PATCH] usb: typec: ucsi: acpi: fix use-after-free on driver removal
Date: Mon, 26 Oct 2026 09:53:50 -0300
Message-ID: <20261026125350.816530-1-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ucsi_acpi_remove() destroys the UCSI instance before removing the ACPI
notify handler:

	ucsi_unregister(ua->ucsi);
	ucsi_destroy(ua->ucsi);

	acpi_remove_notify_handler(...);

ucsi_acpi_notify() dereferences ua->ucsi, so a notify arriving after
ucsi_destroy() uses freed memory:

  CPU0					CPU1
  ----					----
  ucsi_acpi_remove()
    ucsi_unregister()
    ucsi_destroy()
      kfree(ucsi)
					ucsi_acpi_notify()
					  ua->ucsi->ops->read_cci()   <-- UAF

Simply removing the handler before ucsi_unregister() is not correct
either. ucsi_unregister() drains work that needs the notify path to make
progress: ucsi_handle_connector_change() issues GET_CONNECTOR_STATUS and
ucsi_unregister_port() drains and destroys con->wq, and those commands
block in wait_for_completion_timeout() on ucsi->complete for up to
UCSI_TIMEOUT_MS. That completion is signalled only from
ucsi_notify_common(), i.e. from the notify handler. Tearing the handler
down first would leave cancel_work_sync() and destroy_workqueue()
waiting the full timeout for a completion that can no longer arrive.

Moving the removal between ucsi_unregister() and ucsi_destroy() is not
sufficient on its own: at that point the connector array has already
been freed, so a late notify reaching ucsi_connector_change() would
queue work on a freed connector.

Teardown therefore needs two properties at the same time: no new
connector changes once connectors start going away, but the notify path
still available for command and acknowledge completions until that work
has been drained. Whether the PPM actually produces those completions is
a firmware matter; what changes here is that the path able to deliver
them is no longer torn down first.

Introduce a quiescing state, local to the ACPI backend, that provides
both. ucsi_acpi_remove() sets ua->quiescing under ua->notify_lock before
calling ucsi_unregister(); ucsi_acpi_notify() takes the same lock and,
when quiescing, reduces the CCI to the bits that ucsi_notify_common()
consumes for completions. ucsi_notify_common() looks at exactly
UCSI_CCI_BUSY, the connector number, UCSI_CCI_ACK_COMPLETE and
UCSI_CCI_COMMAND_COMPLETE; keeping the first and the last two preserves
the completion and bogus-data behaviour unchanged, while clearing the
connector number makes ucsi_connector_change() unreachable. The CCI that
the command path inspects is unaffected, because
ucsi_sync_control_common() re-reads it from the interface after the
completion.

The resulting order is:

  mutex_lock(&ua->notify_lock);
  ua->quiescing = true;			-- no new connector work
  mutex_unlock(&ua->notify_lock);

  ucsi_unregister();			-- drains work, notify path still
					   available for completions

  acpi_remove_notify_handler();		-- unlinks, then flushes
					   kacpi_notify_wq

  ucsi_destroy();			-- no notify can be in flight

which gives the following happens-before chain:

- A notify that acquires notify_lock before ucsi_acpi_remove() runs to
  completion while remove() waits on the lock, so any schedule_work() it
  performs happens before ucsi_unregister() starts cancelling.
- A notify that acquires notify_lock after remove() released it observes
  quiescing == true, so it cannot reach ucsi_connector_change() and
  cannot touch ucsi->connector.
- acpi_remove_notify_handler() unlinks the handler and then calls
  acpi_os_wait_events_complete(), which flushes kacpi_notify_wq, so a
  notify already dispatched on another CPU has returned before
  ucsi_destroy() frees the instance.

notify_lock is never held across ucsi_unregister() or
acpi_remove_notify_handler(); holding it there would deadlock against
the notify work those calls wait for. It is only ever taken as a leaf:
ucsi_notify_common() and ucsi_connector_change() take no locks, so it
cannot invert against ucsi->ppm_lock or con->lock, which the drained
work holds while waiting for the completion. The handler runs from
kacpi_notify_wq via acpi_os_execute(OSL_NOTIFY_HANDLER, ...), i.e. in
process context, so sleeping on the mutex is allowed.

The probe error path already removes the handler before ucsi_destroy()
and is left unchanged.

Fixes: f56de278e8ec ("usb: typec: ucsi: acpi: Move to the new API")
Cc: stable@vger.kernel.org
Reported-by: Fan Wu <fanwu01@zju.edu.cn>
Link: https://lore.kernel.org/all/20260718021142.3146566-1-fanwu01@zju.edu.cn/
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
Reviewed-by: Huang Wei <huangwei@kylinos.cn>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Resend as a new thread per Heikki's request. Same code as v2
<20260903232121.271776-1-ivanrwcm25@gmail.com>, with collected
Reviewed-by tags.

 drivers/usb/typec/ucsi/ucsi_acpi.c | 53 ++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 5697ccc24ec3..2dd8e6d00c73 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -24,6 +24,15 @@ struct ucsi_acpi {
 	bool check_bogus_event;
 	guid_t guid;
 	u64 cmd;
+	/*
+	 * notify_lock serialises ucsi_acpi_notify() against the start of
+	 * teardown, so that @quiescing is observed by every notify that has
+	 * not yet run. It must not be held across ucsi_unregister(), whose
+	 * drained work may depend on the notify path, nor across
+	 * acpi_remove_notify_handler(), which flushes notify work.
+	 */
+	struct mutex notify_lock;
+	bool quiescing;
 };
 
 static int ucsi_acpi_dsm(struct ucsi_acpi *ua, int func)
@@ -213,11 +222,31 @@ static void ucsi_acpi_notify(acpi_handle handle, u32 event, void *data)
 	u32 cci;
 	int ret;
 
+	mutex_lock(&ua->notify_lock);
+
 	ret = ua->ucsi->ops->read_cci(ua->ucsi, &cci);
 	if (ret)
-		return;
+		goto out_unlock;
+
+	/*
+	 * Once teardown has started the connectors are being unregistered and
+	 * freed, so a connector change must not be reported any more. Command
+	 * and acknowledge completions must still be able to reach the core:
+	 * ucsi_unregister() drains connector and partner work that can be
+	 * blocked in wait_for_completion_timeout() on ucsi->complete, and that
+	 * completion is only signalled from here. Keep exactly the bits that
+	 * ucsi_notify_common() needs for that, which drops the connector
+	 * number and with it the path to ucsi_connector_change(). The busy
+	 * indicator is kept so that bogus CCI data is still ignored.
+	 */
+	if (ua->quiescing)
+		cci &= UCSI_CCI_BUSY | UCSI_CCI_ACK_COMPLETE |
+		       UCSI_CCI_COMMAND_COMPLETE;
 
 	ucsi_notify_common(ua->ucsi, cci);
+
+out_unlock:
+	mutex_unlock(&ua->notify_lock);
 }
 
 static int ucsi_acpi_probe(struct platform_device *pdev)
@@ -253,6 +282,8 @@ static int ucsi_acpi_probe(struct platform_device *pdev)
 
 	ua->dev = &pdev->dev;
 
+	mutex_init(&ua->notify_lock);
+
 	id = dmi_first_match(ucsi_acpi_quirks);
 	if (id)
 		ops = id->driver_data;
@@ -290,11 +321,29 @@ static void ucsi_acpi_remove(struct platform_device *pdev)
 {
 	struct ucsi_acpi *ua = platform_get_drvdata(pdev);
 
+	/*
+	 * Stop reporting connector changes, but keep the notify handler
+	 * installed so that the work ucsi_unregister() drains can still be
+	 * reached by the command completions it may be waiting for. Any notify
+	 * that already passed this point runs to completion first, so no
+	 * connector work can be queued once ucsi_unregister() starts.
+	 */
+	mutex_lock(&ua->notify_lock);
+	ua->quiescing = true;
+	mutex_unlock(&ua->notify_lock);
+
 	ucsi_unregister(ua->ucsi);
-	ucsi_destroy(ua->ucsi);
 
+	/*
+	 * Now that no work is left to serve, drop the handler. This unlinks it
+	 * and then calls acpi_os_wait_events_complete(), which flushes
+	 * kacpi_notify_wq, so a notify running on another CPU has returned
+	 * before ucsi_destroy() frees the instance that it dereferences.
+	 */
 	acpi_remove_notify_handler(ACPI_HANDLE(&pdev->dev), ACPI_DEVICE_NOTIFY,
 				   ucsi_acpi_notify);
+
+	ucsi_destroy(ua->ucsi);
 }
 
 static int ucsi_acpi_suspend(struct device *dev)
-- 
2.43.0

