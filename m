Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891815;
	b=oPxCLkdIpY0jErdDmTWqNCQGoGZBRM11rU4xwVOdXvJYifLFxlawfszPoF79P0nNo7XJ
	 seIClBWLk5TRHMmcu11W+DECOKoSrULsYuLi74rPRGUIj/PZ9Ri/ll/7sYBJrDv6Voh+k
	 lKgII1C6TV+l41DjxxTf6ACtgqLv3BBGbc1gtW6wWRXve6gsvgr3MymauYZz5PLhf/hFj
	 2Cp2xXjSeuKZeTqjTJ1Z/lEDcnm/jKI68CmIW+wAa5pr8rWNO+P2sRclqYsyOgXwFRGeF
	 z3mfrk7LyuiYGUQhz3JGfDCrqmA0r4N1V1/9YzpOChZ1WQh1bTtBr7wwii478SBhIKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=d1DBG15Qs677IqV1qKCXQt1NSsOYDVjlbEUzBHqWXEY=;
	b=tn0q4WZuP0O2qBgVgQhO0BJYhRQPSN6b30EZR6zDni3JtiHU903eVeugvHJ8ZgS6OEkN
	 O+fzVWQEwwuq3M9IdKEM0SCaLwBn6kXZpKFKEvEyVUa+11q7f5WGfMp8ShtgyXynm4VdW
	 QqUtg14iGzmbCzvJsl58H5fqeub1cJsSyqy3YHbx7xb3+F90+Kz7KuCN5ECzeBhvyzvLo
	 anC0p7Rv3zGr59hKuA4wQAMbf4jXeDgOYwgEd5cGoZWwo9Y0EiU+ecqF9xlomSRfq2GcA
	 yGTwopGjfSodEAY88g3BVSKZVQpnAPBkdQbsbCzdWE2UnwF/QOJClmQ0NUsBuJnS8vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvZ+cmBd;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE24606D83B
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 15:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACE24606D83B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvZ+cmBd
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-353804b591eso3792887eec.0
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 07:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793891814; x=1794496614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d1DBG15Qs677IqV1qKCXQt1NSsOYDVjlbEUzBHqWXEY=;
        b=fvZ+cmBdmC87qpW5m5qCIIUpSoJ4VzUCW6AloefJYZFgBVngGXLgK1+mRPhi+XN8Xb
         4JVQnTmOOay5FCdPife/oOhKv2QR1w9MjuE4obKVnkcJoI8+o80E2d+ZK3msyyumremi
         snegt0mUU8p3z1SOCth0R5tJKk+SrTiPWkjxvJUoZdDLadbOljnyO7kAd4O2k7xrIMaE
         stV77oMB1QviJUMRR809xbdT6BidVXOlW3/MKsgTXqF5ZLRiBJVy1TCTaQhUUOQ8HEkn
         n+eBxsySN5Tla/QBOnMn1Ay0isU1OdMKu+3mOf9yNZZcQRiHrwT5CyJbwfO3TbIFbI1M
         m4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891814; x=1794496614;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d1DBG15Qs677IqV1qKCXQt1NSsOYDVjlbEUzBHqWXEY=;
        b=p9YTE0QDzKi9kKMpyFWf0x9HcXnsD+0BCVshS5brh6q7QPmcVVnY3F3yZt5ym7X+FJ
         vmN5utPvE771nBiBnb8nFALrmwbieeGezBah5NElf90OXOf1xnASVSO18q+lx8B6rKdb
         ZBaTuEYJRBJkbw61Fr0iYS0qevV14r0I6rtjMAhzeRsSA3jJBaPFyqWWFQ3opiETCN5/
         +rFLtNwvjqgUmVmlQCAz4NsE72o2yxEgG+hwTLT3f+v11QXoORg9c86ZpuF2DD+kE6+W
         uz30UFuXCT/1pRbi+iaSSM5ah9cvO4h6AfAz4flt8qBmLq2vh4+ICZOGlVmZDPPR6bv+
         cT2A==
X-Forwarded-Encrypted: i=1; AKwUvBwl4bOW1Zo4y0X1BPligxItmHKFFjRnbIs1xSZ9C1PmZKqmmo0hz0P3uihpy5FOVqUSNVtJSdH+AuI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tNh/tSDX69j9ZyUmEQqZOy9/eNZkxQLSLPOZKjfuZmKsXCegg
	D7zu6JwsdfUUm2bhPf5928pvffcLMSr7OL+aUwoFQJ5fHVE9VlC6sEKs
X-Gm-Gg: AYBFou1+eQOlkQrv367OEJqJfufwx01ArziAMFGF9bM/IuxRuKpysot8L2r4daPUZvm
	z0ANIlbwlav4Z6HwIi/MHeNHkMQG67GoLtAyZV5+5wBwenk4HgwmIpOCSvJlqq5jt/QrjeW9O5a
	PhvOjwQqfiilx7rauFIgY1ej3l6MNqIImk93EQttMvHsi8XoqA/rKz65X3DdSpa0JcHBLD23lfb
	86EZrqACUaP5RoDvX5yt3gllUfGdeBVPJNxbNOM3JhUPbkcJMBo9SJWlPj2b1/mK+p/nJV92ub0
	36047U53+YHcW1yCGPYLeKO7IKwjRiziLK/ZcGzA5EYXmmJCYlMCM0I+Sce4mcd2ydLB6mcYsgo
	Vv6CZubz6hMhjApfi+V/udC8zohCwr2l2ZZQD56VIR+wD3MCB1P7NZS5tpB/jAHX/qdaIB89Eoj
	vadbq7fFqroYosHdxPf0t5iJQb2WOJwoOL1jD6bs2YgoZ1R44qfofIoP2F5ir6ziTSd3PDveIao
	gAMw3YY9vR0KMHbUCCQnYtVrodfrbx+GVj0DpmQcBWmMvYrl8kl0ccLhkUg7l8dJtdJhgOMMkLU
	R3sK+jxkgyqGgxJEBANtW1vkk+kIuoQ6ns1etYm5YsvKSVfWHZSo+gLTctcXSUg3zBW4S8eWFQy
	FySJdE/rXaRNxmlUvaAbBmyJ+5MqVZrj3xnUO+HWcI7taUbiv
X-Received: by 2002:a05:693c:630c:b0:36c:a360:9c42 with SMTP id 5a478bee46e88-36ca360cda7mr9483693eec.31.1793891813414;
        Thu, 05 Nov 2026 07:16:53 -0800 (PST)
Received: from cachyos (2a01cb0c82caf900a186612f304bfea5.ipv6.abo.wanadoo.fr. [2a01:cb0c:82ca:f900:a186:612f:304b:fea5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6d3dsm21567087eec.7.2026.11.05.07.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:16:52 -0800 (PST)
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
Subject: [PATCH v8 5/8] ALSA: usb: babyfacepro: add S3 suspend/resume
Date: Thu,  5 Nov 2026 16:15:50 +0100
Message-ID: <20261105151553.223722-6-i.bahloul01@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105151553.223722-1-i.bahloul01@gmail.com>
References: <20261105151553.223722-1-i.bahloul01@gmail.com>
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
 sound/usb/babyfacepro/babyfacepro.c | 89 ++++++++++++++++++++++++++---
 sound/usb/babyfacepro/babyfacepro.h |  4 +-
 2 files changed, 82 insertions(+), 11 deletions(-)

diff --git a/sound/usb/babyfacepro/babyfacepro.c b/sound/usb/babyfacepro/babyfacepro.c
index 12cfd7fea..06ef1a97d 100644
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
@@ -797,8 +807,9 @@ static int babyface_stream_start(struct snd_usb_babyface *chip)
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
@@ -1497,7 +1508,8 @@ static int babyface_probe(struct usb_interface *intf,
 	chip->card = card;
 
 	chip->dev = usb_get_dev(dev);
-	/* USB autosuspend is untested: nothing in this driver holds a PM
+	/* USB autosuspend is untested: babyface_suspend()/_resume() don't
+	 * check PMSG_IS_AUTO, and nothing in this driver holds a PM
 	 * reference while streaming, so an autosuspend request could race
 	 * a live stream.  Disable it explicitly rather than ship an
 	 * untested code path - full autosuspend support (correct
@@ -1752,6 +1764,62 @@ static void babyface_disconnect(struct usb_interface *intf)
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
+	scoped_guard(mutex, &chip->mutex) {
+		if (chip->streaming)
+			babyface_stream_kill(chip);
+	}
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
+	guard(mutex)(&chip->mutex);
+	err = usb_set_interface(chip->dev, BF_IFACE, chip->alt);
+	if (err < 0)
+		return err;
+	err = bf_cold_init(chip);
+	if (err < 0)
+		return err;
+	err = babyface_restore_state(chip);
+	if (err < 0)
+		return err;
+	err = bf_state_apply_flags(chip);
+
+	return err;
+}
+
 static const struct usb_device_id babyface_ids[] = {
 	{ USB_DEVICE(USB_VENDOR_RME, USB_PRODUCT_BABYFACE_PRO_FS) },
 	{ }
@@ -1762,6 +1830,9 @@ static struct usb_driver babyface_driver = {
 	.name = "snd-usb-babyface-pro",
 	.probe = babyface_probe,
 	.disconnect = babyface_disconnect,
+	.suspend = babyface_suspend,
+	.resume = babyface_resume,
+	.reset_resume = babyface_resume,
 	.id_table = babyface_ids,
 };
 
diff --git a/sound/usb/babyfacepro/babyfacepro.h b/sound/usb/babyfacepro/babyfacepro.h
index 1d4c358d9..a32849f83 100644
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

