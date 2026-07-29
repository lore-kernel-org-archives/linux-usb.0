Received: from smtp1.iinet.com (smtp1.iinet.com [52.129.46.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8213639A4D6;
	Wed, 29 Jul 2026 06:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.129.46.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785305612; cv=none; b=OqyCFjYVAqIsSrRqzI6ju11/K1EzroHLHPW4FQUUA8zit1vH6o+kb80JylD7NXfbvXweCPjTZejFgANOxqgEyaiAc30YFEF8vLtC7ZNxJVeG7CSpmbv3/OQTOmxAtdrfoImuJkKaICaKyPmUMlZwPHHQwMaGlMpnHA833jSEHPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785305612; c=relaxed/simple;
	bh=99O4X65DV03jMgCqV/52gV4u8oC64fKmeL8rJ6LEwqs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eLwwBMd059h9Y14ZqLfbSK+tKbPl734M2Ov0mcGsTb76DGV08tY/mqABojuewjktUc5ZH+qJiNtawyz+vfSDTq4jN59/CfBXjxqSWqIr1qZsldCPTAvHoWlI/2HZFPi6GpB1Mt5EYPEgSnieZJ8BhiVH359kR3FG/WMBRgX2eTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nwlink.com; spf=pass smtp.mailfrom=nwlink.com; dkim=pass (2048-bit key) header.d=nwlink.com header.i=@nwlink.com header.b=aVw3H+UP; arc=none smtp.client-ip=52.129.46.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nwlink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nwlink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nwlink.com header.i=@nwlink.com header.b="aVw3H+UP"
Received: from porter.hsd1.wa.comcast.net (c-98-203-133-45.hsd1.wa.comcast.net [98.203.133.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kaf@nwlink.com)
	by smtp1.iinet.com (Postfix) with ESMTPSA id 33230C008C9;
	Tue, 28 Jul 2026 22:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nwlink.com; s=mail;
	t=1785303695; bh=MSuf/ds3M3fgwdMnn8X9jT+VO+EUqXDL2uQS5XRVBZQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aVw3H+UPB02Ckkg5Yh7nk4GN/97D+pQMA79gaq9+AbLNTI/oe71S6CPxl1xTBWm+3
	 TwM1sgBsEqL0wz1hd+jQSm40KGB+IpGQwXbjAqja21YxPTTE912Gv699UVE8SeQgIn
	 nYPKo3GLeM9rOg6QLsza2gmQDkhceDCrap8wIPGJEB3i3cN/o9HVc8/OTsLx/pxHFQ
	 BiKyP9f7Iv4X5EzNICVpf8vpms1xefLL3QZK2lzP93Wjv9tFPP0TPSlqZfQupMKFoO
	 rJLagrV5sc86okw4cgliDa+WOLrDPG+8ZebTMV27HS9RsTWuK0eBTON8Lj0vCE6N3C
	 PWFOp6dnD8zEg==
From: Kyle Farrell <kaf@nwlink.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Kyle Farrell <kaf@nwlink.com>
Subject: [PATCH 1/2] usb: gadget: u_audio: pass channel counts explicitly
Date: Tue, 28 Jul 2026 22:41:14 -0700
Message-Id: <20260729054115.889174-2-kaf@nwlink.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260729054115.889174-1-kaf@nwlink.com>
References: <20260729054115.889174-1-kaf@nwlink.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add playback and capture channel count fields to struct uac_params and
initialize them in the UAC1 and UAC2 function drivers.

u_audio currently derives the channel count from the channel mask in
several places.  Pass the resolved count explicitly instead, so the
shared audio implementation does not depend on how an individual USB
audio function represents its channel configuration.

Initialize the new fields from the existing channel masks, preserving
the generated descriptors and user-visible behavior.

Signed-off-by: Kyle Farrell <kaf@nwlink.com>
---
 drivers/usb/gadget/function/f_uac1.c  |  2 ++
 drivers/usb/gadget/function/f_uac2.c  |  2 ++
 drivers/usb/gadget/function/u_audio.c | 32 ++++++++++++---------------
 drivers/usb/gadget/function/u_audio.h |  2 ++
 4 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
index 85c502e98f57..51cc49f097c0 100644
--- a/drivers/usb/gadget/function/f_uac1.c
+++ b/drivers/usb/gadget/function/f_uac1.c
@@ -1448,6 +1448,7 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 	audio->out_ep_maxpsize = le16_to_cpu(as_out_ep_desc.wMaxPacketSize);
 	audio->in_ep_maxpsize = le16_to_cpu(as_in_ep_desc.wMaxPacketSize);
 	audio->params.c_chmask = audio_opts->c_chmask;
+	audio->params.c_channels = num_channels(audio_opts->c_chmask);
 	memcpy(audio->params.c_srates, audio_opts->c_srates,
 			sizeof(audio->params.c_srates));
 	audio->params.c_ssize = audio_opts->c_ssize;
@@ -1461,6 +1462,7 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 		audio->params.p_fu.volume_res = audio_opts->p_volume_res;
 	}
 	audio->params.p_chmask = audio_opts->p_chmask;
+	audio->params.p_channels = num_channels(audio_opts->p_chmask);
 	memcpy(audio->params.p_srates, audio_opts->p_srates,
 			sizeof(audio->params.p_srates));
 	audio->params.p_ssize = audio_opts->p_ssize;
diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 897787d0803c..b8735b9065c3 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -1308,6 +1308,7 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 	agdev->gadget = gadget;
 
 	agdev->params.p_chmask = uac2_opts->p_chmask;
+	agdev->params.p_channels = num_channels(uac2_opts->p_chmask);
 	memcpy(agdev->params.p_srates, uac2_opts->p_srates,
 			sizeof(agdev->params.p_srates));
 	agdev->params.p_ssize = uac2_opts->p_ssize;
@@ -1320,6 +1321,7 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 		agdev->params.p_fu.volume_res = uac2_opts->p_volume_res;
 	}
 	agdev->params.c_chmask = uac2_opts->c_chmask;
+	agdev->params.c_channels = num_channels(uac2_opts->c_chmask);
 	memcpy(agdev->params.c_srates, uac2_opts->c_srates,
 			sizeof(agdev->params.c_srates));
 	agdev->params.c_ssize = uac2_opts->c_ssize;
diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index e53f2927b539..3c923a73b8d0 100644
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
 
@@ -730,8 +727,7 @@ int u_audio_start_playback(struct g_audio *audio_dev)
 		factor = 8000;
 
 	/* pre-compute some values for iso_complete() */
-	uac->p_framesize = params->p_ssize *
-			    num_channels(params->p_chmask);
+	uac->p_framesize = params->p_ssize * params->p_channels;
 	uac->p_interval = factor / (1 << (ep_desc->bInterval - 1));
 	p_pktsize = min_t(unsigned int,
 				uac->p_framesize *
@@ -1185,7 +1181,7 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 	struct snd_pcm *pcm;
 	struct snd_kcontrol *kctl;
 	struct uac_params *params;
-	int p_chmask, c_chmask;
+	unsigned int p_channels, c_channels;
 	int i, err;
 
 	if (!g_audio)
@@ -1198,10 +1194,10 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
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
@@ -1225,7 +1221,7 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 		}
 	}
 
-	if (p_chmask) {
+	if (p_channels) {
 		struct uac_rtd_params *prm = &uac->p_prm;
 
 		spin_lock_init(&prm->lock);
@@ -1262,7 +1258,7 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 	 * Create a substream only for non-zero channel streams
 	 */
 	err = snd_pcm_new(uac->card, pcm_name, 0,
-			       p_chmask ? 1 : 0, c_chmask ? 1 : 0, &pcm);
+			       p_channels ? 1 : 0, c_channels ? 1 : 0, &pcm);
 	if (err < 0)
 		goto snd_fail;
 
@@ -1277,12 +1273,12 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
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
@@ -1298,7 +1294,7 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 			goto snd_fail;
 	}
 
-	if (p_chmask) {
+	if (p_channels) {
 		kctl = snd_ctl_new1(&u_audio_controls[UAC_P_PITCH_CTRL],
 				    &uac->p_prm);
 		if (!kctl) {
diff --git a/drivers/usb/gadget/function/u_audio.h b/drivers/usb/gadget/function/u_audio.h
index 9512b8fccfaa..46e1d6b5ca4e 100644
--- a/drivers/usb/gadget/function/u_audio.h
+++ b/drivers/usb/gadget/function/u_audio.h
@@ -41,12 +41,14 @@ struct uac_fu_params {
 struct uac_params {
 	/* playback */
 	int p_chmask;	/* channel mask */
+	unsigned int p_channels;	/* resolved number of channels */
 	int p_srates[UAC_MAX_RATES];	/* available rates in Hz (0 terminated list) */
 	int p_ssize;	/* sample size */
 	struct uac_fu_params p_fu;	/* Feature Unit parameters */
 
 	/* capture */
 	int c_chmask;	/* channel mask */
+	unsigned int c_channels;	/* resolved number of channels */
 	int c_srates[UAC_MAX_RATES];	/* available rates in Hz (0 terminated list) */
 	int c_ssize;	/* sample size */
 	struct uac_fu_params c_fu;	/* Feature Unit parameters */
-- 
2.34.1

