Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100774;
	b=viEYcUWdt0etEgoxmrnRfK5tYViCozcxayVQzP6xvsoluQwmohpQOfXNkL61oG8j3jOW
	 HjOSSEG6bL+fbFPf5mRK2hbTmjhs4nhaqLP/doFCOSeYTc/EuCj9ruNKyF+yLaJfnVl9j
	 bdSb3rGgXLMpdeIteENZ8BOq3Qdy5aK2HfjCgVO2J7SiaYgTJKoKxAwVMmPtqrmaNsXgz
	 kkLgoBF1tdhnV4UiT1GcNtr8qGbtJCYWDWL2HQF1WEE1xD7jDI+SIkqX0MVikl/6DabKe
	 HGommPUzQeSU5xfE5Eg4QW97RAvdwLogQmwYjRB+puo/h2E9yRkwXPmHhzxjivywXGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ukZT9Uvz42hF9tsePWJbj6YiDkTGliqE0DSkLIzVtQw=;
	b=kEIoqhdvKz8nhLwGSQ0K+Y61VqUz/Ry2V0p8sTOLm8vCA5BuO+CB1woUsMeakl8AweTH
	 9+6QIF6dDc0qTigVSvyduIa4YouQKEq4sNK9qlpvQGwy9Ocvc/asGuKUqnknTaC5gSYXn
	 FCUzRY1jmUHSpcEr2pPY6PHwSnSTdF6ROxjrO6B9AVq82A9XlgYr+fTv/MbYyrfYH+R1n
	 RltWSelmJezeSmbiQIrKjfQuPulBs0lYZ5vh8E2kk9mkm0oN7MLG3KdX1D96AfLG+lJpZ
	 8Abm+hqAcVCpAaBPpmTfBnnm1E9Ul9klEW2HghzY09SH6/+CiU5lDSTTglvPb76q7UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fPUa7RFq;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2388A60A2605
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 11:32:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2388A60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fPUa7RFq
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd69954c755so2668544a12.3
        for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 04:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793100773; x=1793705573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ukZT9Uvz42hF9tsePWJbj6YiDkTGliqE0DSkLIzVtQw=;
        b=fPUa7RFq9I+H/ioRBw28/y977MYFqIGAOVwu9HVfrEwa3IG0XBidsj5djWMsF7O37Y
         obfa3n5yZc8rjj5HNqCNNH5CqwJCAXlG125YZ4a2nrUpcmFl8vQe9kKqo0Fen7VXnoQj
         6WwXBnmbymp4Zmiitu1nkgH3qTGvf/hf6kK0W9hzt45I8uR2oZ3W49lebKx+G6lhRb4s
         rUnmZl7XxZCpuQXEHEq6nyLDVhDNOxrZ44FL96OwGAHNgUjqgCq4mJ4uCwJX8kwgzk2b
         pOMnbarZTSzoUI6ydVFKlPU8AbiuuHwl1rbjiLD0kx1upLf6MUpGh6N3S24IRVXW6oEc
         IZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100773; x=1793705573;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ukZT9Uvz42hF9tsePWJbj6YiDkTGliqE0DSkLIzVtQw=;
        b=LCFSw9eCq4K/6lTf28J7xfolleCtm+1Q+wtbute9Qai+Rb2eGhVaZcDQVeOg1AUSAp
         3/WF6YqEG7fG2N/uKOMnqgmH29Upns2zFld8TCP2MnYKGGxtB1LIehem69dRGXkd3pfb
         YDu3mLwTFte89LMhMI+m1YVA7strRxcnFOnH51h9q1WqPpm74YcxwKME1pxcRXllUHkA
         a96XRGjKXSZammdPvwrE1hjnPOHu86J0+043OIVLHV+k2M7xJJwMOkr+K54py9vJrzPh
         mpBCxkoclPe/5gNLc6VDotcXuqts1fWIYFqm/nMSmTvey14CdI8mS/XNyyAYADzxk+nL
         Jz/Q==
X-Forwarded-Encrypted: i=1; AKwUvBx7Lvep9iowZmVYwbvVDbA0Fg0kHWZNc6NpfOjs6RQ/5nrjeOepNj12vKQmG16oMKgYD0ECs+ckN60=@vger.kernel.org
X-Gm-Message-State: AFq9FYKN1nLNNjyX0UEdhTNnOeYKCSScDyaeUhFcGU7WUfPhGkcVCtTh
	/X1DrcywEhvcVcQHvGa6a27Vb3pyUaZDbTz5DebHlQ5iXPYSNmJ/usCn
X-Gm-Gg: AYBFou21qwtOuczaa/Q6tVVOHRzyM+tagZjJXo6qj/rrq15F7yctSAo2BehDUDyCKYI
	LKvQZ89uWLFDy0EFDUYBshgyajZGgcy9Uav3HXEpxD7+2Ahn65c+N+J5nV1mnVb2rvom8W+PJYc
	hPFZf5ND3wXUAFxQxZGCd77odLe7B6eCG5CBBnrvu5Zu3xyaSMyfI7Fz+D8s3Qad/2AD4DYlgBX
	11Hh9jcgr4i+Mtg15345Lt4dclZJGrpsxIvFTf++ZzZHHMBsqg0IxrMdSMkMae4vZ7kwwApLBXs
	30nxnR3zi1mUdgDLOmNq/LOWs6yx/+2sjwoMLbScm18m6OIDRg3CuUBy32pldtzvw0K45Ihgm6s
	GzJQypBZnl9dWwBEmYdeo7jTlxrcQIu9KPyrxp6R05lNxeVYgKePcN1bV7e1NUEcxJhIZZxA4G5
	7z0B3eesGLHPCa3jIELA5yN5CRPRXmL/vnacOTjXQIgEY78oV1qh/il2eUOYJ1LAOSIwRj8gLEv
	POlYGeODEk7JegtXE4Rq2zF4dJGfPgtbfhrpjYcsjyB+Wtp2aIb9a91SCdQtWRgKR8hADisMRE6
	AEHZuKJTikZgs8ZJTDV58vddLOsvvAZSVZUSRZTWZFukHuDhEdYcaiVw28dm6fj4e9UCU2gjB9c
	=
X-Received: by 2002:a17:90a:e18f:b0:3ab:2737:3395 with SMTP id 98e67ed59e1d1-3adeafd1e96mr8128640a91.42.1793100773401;
        Tue, 27 Oct 2026 04:32:53 -0700 (PDT)
Received: from cachyos (2a01cb0c82caf900a186612f304bfea5.ipv6.abo.wanadoo.fr. [2a01:cb0c:82ca:f900:a186:612f:304b:fea5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4041fafcsm4523962a91.0.2026.10.27.04.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:52 -0700 (PDT)
From: =?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-usb@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	=?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>,
	David Fredman <davfre@gmail.com>
Subject: [PATCH v7 5/8] ALSA: usb: babyfacepro: add S3 suspend/resume
Date: Tue, 27 Oct 2026 12:31:36 +0100
Message-ID: <20261027113140.134257-6-i.bahloul01@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027113140.134257-1-i.bahloul01@gmail.com>
References: <20261027113140.134257-1-i.bahloul01@gmail.com>
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

The device loses its registers across a system suspend.  On suspend,
let the PCM core suspend the substreams (applications get -ESTRPIPE and
restart), then kill the session's URBs before cancelling the stream
work their handlers queue.  On resume, re-run the cold init and replay
the cached mixer state and flags.  A resume that follows a device reset
goes through reset_resume instead of a re-probe, so the cached state is
replayed in place.

USB autosuspend stays disabled: nothing in the driver holds a PM
reference while streaming.

Co-developed-by: David Fredman <davfre@gmail.com>
Signed-off-by: David Fredman <davfre@gmail.com>
Signed-off-by: Ismaïl Bahloul <i.bahloul01@gmail.com>
---
 sound/usb/babyfacepro/babyfacepro.c | 96 +++++++++++++++++++++++++----
 sound/usb/babyfacepro/babyfacepro.h |  4 +-
 2 files changed, 85 insertions(+), 15 deletions(-)

diff --git a/sound/usb/babyfacepro/babyfacepro.c b/sound/usb/babyfacepro/babyfacepro.c
index ed4555c71..e0eb0ce9b 100644
--- a/sound/usb/babyfacepro/babyfacepro.c
+++ b/sound/usb/babyfacepro/babyfacepro.c
@@ -3,7 +3,8 @@
  * RME Babyface Pro / Pro FS - proprietary-mode USB audio driver
  *
  * Core driver: USB vendor requests + cold init, interrupt-URB PCM
- * streaming, and the card lifecycle (probe/disconnect/module entry).
+ * streaming, the mixer-state replay after a resume, and
+ * the card lifecycle (probe/disconnect/PM/module entry).
  *
  * See babyfacepro.h for the shared device state and register map,
  * and babyfacepro-ctl.c for the ALSA control surface.
@@ -198,9 +199,9 @@ int bf_pitch_write(struct snd_usb_babyface *chip, int pitch)
 }
 
 /* The cold-start init (cap_coldplug.pcap), verbatim from the user-space
- * reference (protocol::streaming_init).  Run at probe, where the
- * device state is unknown; a session start does not need it (see
- * babyface_stream_start()).
+ * reference (protocol::streaming_init).  Run at probe and after resume,
+ * where the device state is unknown; a session start does not need it
+ * (see babyface_stream_start()).
  */
 int bf_cold_init(struct snd_usb_babyface *chip)
 {
@@ -267,8 +268,17 @@ int bf_cold_init(struct snd_usb_babyface *chip)
 	return 0;
 }
 
-/* Re-apply the whole cached mixer state to the device, whose registers
- * the cold init cleared.  Caller holds chip->mutex.
+/* Units probed since the module was loaded.
+ * The SELECT selection is not in the readback, and the values alsactl
+ * restores right after a probe are the ones of the last alsactl store.
+ * After a boot that is the last shutdown, the newest there is.  A later
+ * probe of the same unit (a usbfs claim released, an unbind, a replug)
+ * may follow SELECT presses made since, so bf_panel_select_put() needs
+ * to tell the two apart.
+ */
+/* Re-apply the whole cached mixer state after a resume (the device
+ * lost its registers across a system suspend - TotalMix does the same
+ * re-apply).  Caller holds chip->mutex.
  */
 int babyface_restore_state(struct snd_usb_babyface *chip)
 {
@@ -390,10 +400,8 @@ int bf_state_apply_flags(struct snd_usb_babyface *chip)
 	}
 
 	/* Re-apply an engaged DIM (the fixed -20 dB Phones pair + flag).  The
-	 * level DIM releases back to is not persisted: it always tracks the
-	 * Phones master while DIM is engaged, so rebuild it here - otherwise a
-	 * DIM released after a re-probe would drive Phones to
-	 * silence (dim_saved still zero on the fresh chip).
+	 * level DIM releases back to tracks the Phones master while DIM is
+	 * engaged.
 	 */
 	if (chip->dim) {
 		chip->dim_saved[0] = chip->master[1][0];
@@ -838,8 +846,9 @@ static int babyface_stream_start(struct snd_usb_babyface *chip)
 	/* A session start is what the RME Windows driver sends
 	 * (cap_audio): the trigger pair, the URBs, the arm.  The device
 	 * keeps its mixer state between sessions, so nothing is cleared
-	 * or re-applied here; the cold init runs at probe only.  The rate
-	 * is written first: hw_params only re-points the speed multiplier.
+	 * or re-applied here; the cold init runs at probe and resume
+	 * only.  The rate is written first: hw_params only re-points the
+	 * speed multiplier.
 	 */
 	ret = bf_clock_write(chip);
 	if (ret < 0)
@@ -1546,7 +1555,8 @@ static int babyface_probe(struct usb_interface *intf,
 	chip->card = card;
 
 	chip->dev = usb_get_dev(dev);
-	/* USB autosuspend is untested: nothing in this driver holds a PM
+	/* USB autosuspend is untested: babyface_suspend()/_resume() don't
+	 * check PMSG_IS_AUTO, and nothing in this driver holds a PM
 	 * reference while streaming, so an autosuspend request could race
 	 * a live stream.  Disable it explicitly rather than ship an
 	 * untested code path - full autosuspend support (correct
@@ -1788,6 +1798,63 @@ static void babyface_disconnect(struct usb_interface *intf)
 	snd_card_free_when_closed(chip->card);
 }
 
+static int babyface_suspend(struct usb_interface *intf, pm_message_t message)
+{
+	struct snd_usb_babyface *chip = usb_get_intfdata(intf);
+
+	struct snd_device *sdev;
+
+	if (!chip)
+		return 0;
+	list_for_each_entry(sdev, &chip->card->devices, list) {
+		if (sdev->type == SNDRV_DEV_PCM)
+			snd_pcm_suspend_all(sdev->device_data);
+	}
+	/* The URB handlers queue the work: kill them first. */
+	mutex_lock(&chip->mutex);
+	if (chip->streaming)
+		babyface_stream_kill(chip);
+	mutex_unlock(&chip->mutex);
+	cancel_work_sync(&chip->stream_work);
+	return 0;
+}
+
+static int babyface_resume(struct usb_interface *intf)
+{
+	struct snd_usb_babyface *chip = usb_get_intfdata(intf);
+	int err;
+
+	if (!chip)
+		return 0;
+
+	/* The device lost its state across the suspend; re-run the cold
+	 * init and re-apply the cached mixer state.  Suspended PCM
+	 * substreams are woken by the core - apps get -ESTRPIPE and
+	 * restart (prepare starts a new session).
+	 *
+	 * This is also the reset_resume handler.  Some hosts reset the
+	 * device on resume; that needs nothing more than the cold init
+	 * already does here, and without the handler the USB core unbinds
+	 * and re-probes the driver instead: the card goes away, open PCMs
+	 * fail, and udev's alsactl restore then loads the mixer state
+	 * stored at the last shutdown over the current one.
+	 */
+	mutex_lock(&chip->mutex);
+	err = usb_set_interface(chip->dev, BF_IFACE, chip->alt);
+	if (err < 0)
+		goto out;
+	err = bf_cold_init(chip);
+	if (err < 0)
+		goto out;
+	err = babyface_restore_state(chip);
+	if (err < 0)
+		goto out;
+	err = bf_state_apply_flags(chip);
+out:
+	mutex_unlock(&chip->mutex);
+	return err;
+}
+
 static const struct usb_device_id babyface_ids[] = {
 	{ USB_DEVICE(USB_VENDOR_RME, USB_PRODUCT_BABYFACE_PRO_FS) },
 	{ }
@@ -1798,6 +1865,9 @@ static struct usb_driver babyface_driver = {
 	.name = "snd-usb-babyface-pro",
 	.probe = babyface_probe,
 	.disconnect = babyface_disconnect,
+	.suspend = babyface_suspend,
+	.resume = babyface_resume,
+	.reset_resume = babyface_resume,
 	.id_table = babyface_ids,
 };
 
diff --git a/sound/usb/babyfacepro/babyfacepro.h b/sound/usb/babyfacepro/babyfacepro.h
index a6e231f5f..259f7d3a0 100644
--- a/sound/usb/babyfacepro/babyfacepro.h
+++ b/sound/usb/babyfacepro/babyfacepro.h
@@ -12,7 +12,7 @@
  * snd-usb-audio quirk.
  *
  * babyfacepro.c holds the card lifecycle, the PCM stream and the
- * mixer-state persistence across re-probes;
+ * mixer-state persistence across re-probes and resume;
  * babyfacepro-ctl.c holds the ALSA control surface - the hardware
  * mixer.
  *
@@ -386,7 +386,7 @@ void babyface_pcm_stop_both(struct snd_usb_babyface *chip, snd_pcm_state_t state
 void babyface_stream_work(struct work_struct *work);
 extern const struct snd_pcm_hw_constraint_list bf_rates_constraint;
 
-/* Mixer-state persistence across interface re-probes. */
+/* Mixer-state persistence across interface re-probes/resume. */
 int babyface_restore_state(struct snd_usb_babyface *chip);
 int bf_state_apply_flags(struct snd_usb_babyface *chip);
 
-- 
2.56.0

