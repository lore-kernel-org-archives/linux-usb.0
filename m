Return-Path: <SRS0=szhW=EO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09640C388F7
	for <linux-usb@archiver.kernel.org>; Sun,  8 Nov 2020 00:18:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B54092151B
	for <linux-usb@archiver.kernel.org>; Sun,  8 Nov 2020 00:18:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MrEvtgBz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726493AbgKHASl (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 7 Nov 2020 19:18:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbgKHASk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 7 Nov 2020 19:18:40 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67B40C0613CF
        for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2020 16:18:40 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id l10so5672046lji.4
        for <linux-usb@vger.kernel.org>; Sat, 07 Nov 2020 16:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=veQp2P7DrYXvwVV7d9MfC5kCF4EEdF+TkL5G1Cl/t7Y=;
        b=MrEvtgBzQOCHQ/tHMCdz5nq+IN3G+FxXz9KURcYRwolP6wnBl/WZJ1pIU0MduaRlAs
         gkYDpET7Y6mSRvnoMeT2uPvVb2sYTB4ZrY2vXxAepWxtyeKy13Ph97zkO/aQTyRCSsGE
         ikumib6BzV5QTPZEKKkcY5LY8HCtsk0hdepILsb+EysVS9W0E+WmiLQtdxXRh96gih22
         THBvdVoxxQU6zFGoAktx7gFZ67e5E8Axf4NgbNa0ZpNa+Gih1W0SzKeJLR3Q7OdWrm/O
         Ct3JmHi/3DWiaQLd+9JTl+7dc6vkrTn6D4nd/38oXsREZ8iz13XWNe1bs87PahKsK+qG
         zYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=veQp2P7DrYXvwVV7d9MfC5kCF4EEdF+TkL5G1Cl/t7Y=;
        b=IOvl2/jTZqKTAXeA+XVAFl9jGwm6WN0QufxIoQFNLNtsiHvDbCM4WV32tK2Pi7ZS8V
         A5rQIqEGYvSrFfVy4ctW8CgpvtVJx4MilYFsC0V6/QTzby27SDiwyllySw2fAvIluyu1
         Wox9k2FyfX04Q4gO/zP+2vLV5JKP1jKG/VyDJikgT99/+bCzyTgNkVcHxeMVkgvZ5u75
         JwUV9jTzwL2jx0Kd0azabEowWxD7dIzrcHQJHKayZ0dS6kVR5eiif+aEaVoE9KNjZjw6
         eQUiBGAbWYUA26DuF3sjwbH/vpqC3czUxXkF1+Jl+3xCEsONe2tEEQrLq2Our4BKCKK8
         lq5g==
X-Gm-Message-State: AOAM531IuqbGzXP8ei9e9p/KfH4KK0pHGj/h+VmuG028lKPZduJHXimi
        U7jpFpVLw/PUiYhw8qlEdpzmnmN+010=
X-Google-Smtp-Source: ABdhPJxiph41GA4gYCPYYupNc/EE5imoMLYh8WLvWcauYsKfDzZQeDBF5GPq76U/dNCzdMREzH+C1w==
X-Received: by 2002:a2e:93c9:: with SMTP id p9mr3579429ljh.444.1604794718798;
        Sat, 07 Nov 2020 16:18:38 -0800 (PST)
Received: from localhost ([80.64.86.40])
        by smtp.gmail.com with ESMTPSA id 27sm809713lfy.195.2020.11.07.16.18.37
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 07 Nov 2020 16:18:38 -0800 (PST)
From:   Ruslan Bilovol <ruslan.bilovol@gmail.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, gschmottlach@gmail.com
Subject: [PATCH 3/3] usb: gadget: u_audio: add real feedback implementation
Date:   Sun,  8 Nov 2020 02:18:31 +0200
Message-Id: <1604794711-8661-4-git-send-email-ruslan.bilovol@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1604794711-8661-1-git-send-email-ruslan.bilovol@gmail.com>
References: <1604794711-8661-1-git-send-email-ruslan.bilovol@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This adds interface between userspace and feedback
endpoint to report real feedback frequency to the Host.

Current implementation adds new userspace interface
ALSA mixer control "PCM Feedback Frequency Hz" (similar
to aloop driver's "PCM Rate Shift 100000" mixer control)

We allow +/-20% deviation of nominal sampling frequency,
that usually is more than enough in real-world usecases

Usage of this new control is easy to implement in
existing userspace tools like alsaloop from alsa-utils.

Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
---
 drivers/usb/gadget/function/f_uac2.c  |  4 ++
 drivers/usb/gadget/function/u_audio.c | 93 +++++++++++++++++++++++++++++++++++
 drivers/usb/gadget/function/u_audio.h |  7 +++
 3 files changed, 104 insertions(+)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 3187ad3..ebdb2a1 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -487,6 +487,10 @@ static void set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
 
 	max_packet_size = num_channels(chmask) * ssize *
 		DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
+
+	if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
+		max_packet_size = max_packet_size * FBACK_FREQ_MAX / 100;
+
 	ep_desc->wMaxPacketSize = cpu_to_le16(min_t(u16, max_packet_size,
 				le16_to_cpu(ep_desc->wMaxPacketSize)));
 }
diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index 33c9288..ae9e1f3 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -16,6 +16,7 @@
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
+#include <sound/control.h>
 
 #include "u_audio.h"
 
@@ -596,12 +597,87 @@ void u_audio_stop_playback(struct g_audio *audio_dev)
 }
 EXPORT_SYMBOL_GPL(u_audio_stop_playback);
 
+static int u_audio_rate_shift_info(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_info *uinfo)
+{
+	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
+	struct snd_uac_chip *uac = prm->uac;
+	struct g_audio *audio_dev = uac->audio_dev;
+	struct uac_params *params = &audio_dev->params;
+	unsigned int ffback_min, ffback_max;
+
+	ffback_min = params->c_srate * FBACK_FREQ_MIN / 100;
+	ffback_max = params->c_srate * FBACK_FREQ_MIN / 100;
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = ffback_min;
+	uinfo->value.integer.max = ffback_max;
+	uinfo->value.integer.step = 1;
+	return 0;
+}
+
+static int u_audio_rate_shift_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
+	unsigned long flags;
+
+	spin_lock_irqsave(&prm->lock, flags);
+	ucontrol->value.integer.value[0] = prm->ffback;
+	spin_unlock_irqrestore(&prm->lock, flags);
+
+	return 0;
+}
+
+static int u_audio_rate_shift_put(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
+	struct snd_uac_chip *uac = prm->uac;
+	struct g_audio *audio_dev = uac->audio_dev;
+	struct uac_params *params = &audio_dev->params;
+	unsigned int val;
+	unsigned int ffback_min, ffback_max;
+	unsigned long flags;
+	int change = 0;
+
+	ffback_min = params->c_srate * FBACK_FREQ_MIN / 100;
+	ffback_max = params->c_srate * FBACK_FREQ_MAX / 100;
+
+	val = ucontrol->value.integer.value[0];
+	if (val < ffback_min)
+		val = ffback_min;
+	if (val > ffback_max)
+		val = ffback_max;
+
+	spin_lock_irqsave(&prm->lock, flags);
+	if (prm->ffback != val) {
+		prm->ffback = val;
+		change = 1;
+	}
+	spin_unlock_irqrestore(&prm->lock, flags);
+
+	return change;
+}
+
+static const struct snd_kcontrol_new u_audio_controls[]  = {
+{
+	.iface =        SNDRV_CTL_ELEM_IFACE_PCM,
+	.name =         "PCM Feedback Frequency Hz",
+	.info =         u_audio_rate_shift_info,
+	.get =          u_audio_rate_shift_get,
+	.put =          u_audio_rate_shift_put,
+},
+};
+
 int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 					const char *card_name)
 {
 	struct snd_uac_chip *uac;
 	struct snd_card *card;
 	struct snd_pcm *pcm;
+	struct snd_kcontrol *kctl;
 	struct uac_params *params;
 	int p_chmask, c_chmask;
 	int err;
@@ -687,6 +763,23 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &uac_pcm_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &uac_pcm_ops);
 
+	if (c_chmask && g_audio->in_ep_fback) {
+		strlcpy(card->mixername, card_name, sizeof(card->driver));
+
+		kctl = snd_ctl_new1(&u_audio_controls[0], &uac->c_prm);
+		if (!kctl) {
+			err = -ENOMEM;
+			goto snd_fail;
+		}
+
+		kctl->id.device = pcm->device;
+		kctl->id.subdevice = 0;
+
+		err = snd_ctl_add(card, kctl);
+		if (err < 0)
+			goto snd_fail;
+	}
+
 	strlcpy(card->driver, card_name, sizeof(card->driver));
 	strlcpy(card->shortname, card_name, sizeof(card->shortname));
 	sprintf(card->longname, "%s %i", card_name, card->dev->id);
diff --git a/drivers/usb/gadget/function/u_audio.h b/drivers/usb/gadget/function/u_audio.h
index 53e6baf..fd70808 100644
--- a/drivers/usb/gadget/function/u_audio.h
+++ b/drivers/usb/gadget/function/u_audio.h
@@ -11,6 +11,13 @@
 
 #include <linux/usb/composite.h>
 
+/*
+ * Min/max percentage of nominal sampling frequency deviation
+ * reported through feedback endpoint to the host
+ */
+#define FBACK_FREQ_MIN	80
+#define FBACK_FREQ_MAX	120
+
 struct uac_params {
 	/* playback */
 	int p_chmask;	/* channel mask */
-- 
1.9.1

