Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.129.46.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740490;
	b=Vht+2eSieIZLM/fyKwEJXRTZ+0dDp11QFXSPAOnVHdFhIMC0N27mCIYU19c3wLdrXunI
	 iRwiS+iOZJcFnh29ElJ16mvhd62Vs40XHiuyLCJCrhqByeyzNDvZosX03aWsaf5TB1ew2
	 AFeMl6KhPlH5162XgO/twINATC04HVAizxrDD72vN15KGZZP7tJPpVy8+79EPQ67kB588
	 LqUVmVdoOQOWJiK9FybPOBOkiztNDoYvZjser5mHXYb4odYUZvfYABE4D+pLwEgxwGSDi
	 k0jZOaSQB9KXFDz82INLDBx9GeFNOm7U0FoickAMvTyvaYqy15X1Fhh8gtADBKKnNCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740490;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ga700n/x+gJ0Lv+isd5uHFWJRv5Qt4ynojbdYKV3pD4=;
	b=ibAIYIKFYxKZSz0M/by5zWcKasR4/Q/SAaCpvNO1HsMHCbil4x4Blc6sPiB17fQSzapQ
	 CTjAuyLaTNqRqpSIJlHwcl466hKarqvgvgywLTl3BRj+O3PlbXq8H7PA7vAzByNgrakE3
	 Uyejg4gy/MEUy0TqlsKdNps43LPlhw3lIE3i0BrIfIwLaSbXZ7Q32OYaJvfIA86LJ+MFp
	 4IhoaAmR95a7u/r1SQQb3U1jCyr73NbjFcXQE3oiSxOXrqf5UJFgq7KZ112T8dzZmPbV7
	 A8yahBeuef/ftnxztBxYDgp2Fcnd3DjRzM4yASbtMXVVd0j8ZQutI16DsAh6/J49cFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nwlink.com;
	spf=pass smtp.mailfrom=nwlink.com;
	dkim=pass header.d=nwlink.com header.i=@nwlink.com header.a=rsa-sha256 header.s=mail header.b=mtkTTcy3;
	arc=none smtp.remote-ip=52.129.46.36
Received: from smtp2.iinet.com (smtp2.iinet.com [52.129.46.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597AF606EEBF;
	Tue,  3 Nov 2026 21:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 597AF606EEBF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nwlink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nwlink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nwlink.com header.i=@nwlink.com header.a=rsa-sha256 header.s=mail header.b=mtkTTcy3
Received: from porter.hsd1.wa.comcast.net (c-98-203-133-45.hsd1.wa.comcast.net [98.203.133.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kaf@nwlink.com)
	by smtp2.iinet.com (Postfix) with ESMTPSA id B06CDB404D9;
	Tue,  3 Nov 2026 13:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nwlink.com; s=mail;
	t=1793740483; bh=Ga700n/x+gJ0Lv+isd5uHFWJRv5Qt4ynojbdYKV3pD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mtkTTcy34pksBrdUd8Dft9Qe7WS4l7/xjuCSpArmIC9ci/Uhm/dd3J+0TI+FjNGG9
	 EjB5mhihrB4+EZOL1amcU+j25czjHyr51nntjEX5/X+7mHoYrUEnKuTRxxgszYVdXf
	 hNpF7l8tjyGXfMwmoR0RPn/zfZGD7X/vL9k8KYQvI3XQJLo/q3zthcuTMdsutwUK9q
	 68L4SOHLFdU+ouWzpxoG4MPjvhIimLgL7ph3G9ChsclWLesfHVsqSclXPxEg+LQhor
	 EZqXag4qHQTjaOOZ2A8JLSCHG6gZvOXGWKlerpIVvzhKjgtfo18PjgSFIZY7c+n39+
	 4w8sPJsHzGLgA==
From: Kyle Farrell <kaf@nwlink.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org,
	flavra@baylibre.com,
	Kyle Farrell <kaf@nwlink.com>
Subject: [PATCH v3 2/3] usb: gadget: u_audio: pass channel counts explicitly
Date: Tue,  3 Nov 2026 13:14:33 -0800
Message-Id: <20261103211434.996135-3-kaf@nwlink.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103211434.996135-1-kaf@nwlink.com>
References: <20261103211434.996135-1-kaf@nwlink.com>
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

u_audio currently derives the channel count from the channel mask in
struct uac_params in several places. Instead, pass the resolved count
explicitly, so the shared audio implementation does not depend on how
an individual USB audio function represents its channel configuration.

Initialize the channel counts from the existing masks in f_uac1 and
f_uac2. Remove the now-unused channel mask fields from uac_params.
Preserve existing behavior.

Signed-off-by: Kyle Farrell <kaf@nwlink.com>
---
 drivers/usb/gadget/function/f_uac1.c  |  4 ++--
 drivers/usb/gadget/function/f_uac2.c  |  4 ++--
 drivers/usb/gadget/function/u_audio.c | 32 ++++++++++++---------------
 drivers/usb/gadget/function/u_audio.h |  4 ++--
 4 files changed, 20 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
index 7a81cd176abd..7d912696cec2 100644
--- a/drivers/usb/gadget/function/f_uac1.c
+++ b/drivers/usb/gadget/function/f_uac1.c
@@ -1447,7 +1447,7 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 
 	audio->out_ep_maxpsize = le16_to_cpu(as_out_ep_desc.wMaxPacketSize);
 	audio->in_ep_maxpsize = le16_to_cpu(as_in_ep_desc.wMaxPacketSize);
-	audio->params.c_chmask = audio_opts->c_chmask;
+	audio->params.c_channels = num_channels(audio_opts->c_chmask);
 	memcpy(audio->params.c_srates, audio_opts->c_srates,
 			sizeof(audio->params.c_srates));
 	audio->params.c_ssize = audio_opts->c_ssize;
@@ -1460,7 +1460,7 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 		audio->params.p_fu.volume_max = audio_opts->p_volume_max;
 		audio->params.p_fu.volume_res = audio_opts->p_volume_res;
 	}
-	audio->params.p_chmask = audio_opts->p_chmask;
+	audio->params.p_channels = num_channels(audio_opts->p_chmask);
 	memcpy(audio->params.p_srates, audio_opts->p_srates,
 			sizeof(audio->params.p_srates));
 	audio->params.p_ssize = audio_opts->p_ssize;
diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index b519382df0b3..19578fbc6af5 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -1309,7 +1309,7 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 
 	agdev->gadget = gadget;
 
-	agdev->params.p_chmask = uac2_opts->p_chmask;
+	agdev->params.p_channels = num_channels(uac2_opts->p_chmask);
 	memcpy(agdev->params.p_srates, uac2_opts->p_srates,
 			sizeof(agdev->params.p_srates));
 	agdev->params.p_ssize = uac2_opts->p_ssize;
@@ -1321,7 +1321,7 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 		agdev->params.p_fu.volume_max = uac2_opts->p_volume_max;
 		agdev->params.p_fu.volume_res = uac2_opts->p_volume_res;
 	}
-	agdev->params.c_chmask = uac2_opts->c_chmask;
+	agdev->params.c_channels = num_channels(uac2_opts->c_chmask);
 	memcpy(agdev->params.c_srates, uac2_opts->c_srates,
 			sizeof(agdev->params.c_srates));
 	agdev->params.c_ssize = uac2_opts->c_ssize;
diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index f0ee83abcebc..de0622ee72ab 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -390,25 +390,22 @@ static int uac_pcm_open(struct snd_pcm_substream *substream)
 	struct uac_params *params;
 	struct uac_rtd_params *prm;
 	int p_ssize, c_ssize;
-	int p_chmask, c_chmask;
 
 	audio_dev = uac->audio_dev;
 	params = &audio_dev->params;
 	p_ssize = params->p_ssize;
 	c_ssize = params->c_ssize;
-	p_chmask = params->p_chmask;
-	c_chmask = params->c_chmask;
 	uac->p_residue_mil = 0;
 
 	runtime->hw = uac_pcm_hardware;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		runtime->hw.formats = uac_ssize_to_fmt(p_ssize);
-		runtime->hw.channels_min = num_channels(p_chmask);
+		runtime->hw.channels_min = params->p_channels;
 		prm = &uac->p_prm;
 	} else {
 		runtime->hw.formats = uac_ssize_to_fmt(c_ssize);
-		runtime->hw.channels_min = num_channels(c_chmask);
+		runtime->hw.channels_min = params->c_channels;
 		prm = &uac->c_prm;
 	}
 
@@ -736,8 +733,7 @@ int u_audio_start_playback(struct g_audio *audio_dev)
 		factor = 8000;
 
 	/* pre-compute some values for iso_complete() */
-	uac->p_framesize = params->p_ssize *
-			    num_channels(params->p_chmask);
+	uac->p_framesize = params->p_ssize * params->p_channels;
 	uac->p_interval = factor / (1 << (ep_desc->bInterval - 1));
 	p_pktsize = min_t(unsigned int,
 				uac->p_framesize *
@@ -1205,7 +1201,7 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 	struct snd_pcm *pcm;
 	struct snd_kcontrol *kctl;
 	struct uac_params *params;
-	int p_chmask, c_chmask;
+	unsigned int p_channels, c_channels;
 	int i, err;
 
 	if (!g_audio)
@@ -1218,10 +1214,10 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 	uac->audio_dev = g_audio;
 
 	params = &g_audio->params;
-	p_chmask = params->p_chmask;
-	c_chmask = params->c_chmask;
+	p_channels = params->p_channels;
+	c_channels = params->c_channels;
 
-	if (c_chmask) {
+	if (c_channels) {
 		struct uac_rtd_params *prm = &uac->c_prm;
 
 		spin_lock_init(&prm->lock);
@@ -1245,7 +1241,7 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 		}
 	}
 
-	if (p_chmask) {
+	if (p_channels) {
 		struct uac_rtd_params *prm = &uac->p_prm;
 
 		spin_lock_init(&prm->lock);
@@ -1284,7 +1280,7 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 	 * Create a substream only for non-zero channel streams
 	 */
 	err = snd_pcm_new(uac->card, pcm_name, 0,
-			       p_chmask ? 1 : 0, c_chmask ? 1 : 0, &pcm);
+			       p_channels ? 1 : 0, c_channels ? 1 : 0, &pcm);
 	if (err < 0)
 		goto snd_fail;
 
@@ -1299,12 +1295,12 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 	 * Create mixer and controls
 	 * Create only if it's required on USB side
 	 */
-	if ((c_chmask && g_audio->in_ep_fback)
-			|| (p_chmask && params->p_fu.id)
-			|| (c_chmask && params->c_fu.id))
+	if ((c_channels && g_audio->in_ep_fback)
+			|| (p_channels && params->p_fu.id)
+			|| (c_channels && params->c_fu.id))
 		strscpy(card->mixername, card_name);
 
-	if (c_chmask && g_audio->in_ep_fback) {
+	if (c_channels && g_audio->in_ep_fback) {
 		kctl = snd_ctl_new1(&u_audio_controls[UAC_FBACK_CTRL],
 				    &uac->c_prm);
 		if (!kctl) {
@@ -1320,7 +1316,7 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 			goto snd_fail;
 	}
 
-	if (p_chmask) {
+	if (p_channels) {
 		kctl = snd_ctl_new1(&u_audio_controls[UAC_P_PITCH_CTRL],
 				    &uac->p_prm);
 		if (!kctl) {
diff --git a/drivers/usb/gadget/function/u_audio.h b/drivers/usb/gadget/function/u_audio.h
index 9512b8fccfaa..2e39b49ddacb 100644
--- a/drivers/usb/gadget/function/u_audio.h
+++ b/drivers/usb/gadget/function/u_audio.h
@@ -40,13 +40,13 @@ struct uac_fu_params {
 
 struct uac_params {
 	/* playback */
-	int p_chmask;	/* channel mask */
+	unsigned int p_channels;	/* resolved number of channels */
 	int p_srates[UAC_MAX_RATES];	/* available rates in Hz (0 terminated list) */
 	int p_ssize;	/* sample size */
 	struct uac_fu_params p_fu;	/* Feature Unit parameters */
 
 	/* capture */
-	int c_chmask;	/* channel mask */
+	unsigned int c_channels;	/* resolved number of channels */
 	int c_srates[UAC_MAX_RATES];	/* available rates in Hz (0 terminated list) */
 	int c_ssize;	/* sample size */
 	struct uac_fu_params c_fu;	/* Feature Unit parameters */
-- 
2.34.1

