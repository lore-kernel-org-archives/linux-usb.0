Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610740;
	b=D9tJ0YoDaYCXSjnMFC4nqBH4Fta5rnjUUpT6jWYd1T9Av8e+KsqSwr9zzkVM2efX5n2j
	 14BMgnNZmNjuu+YV8VB7rkFHO8CXCQ7x3H8AGsV1+FEly6orLOu2RpAQRZOy1F//XBcFf
	 dnFsh+LRbdjC8dhl4hdGiIIsEjq2euCuf7YQrt/mTSo+ZI4UgOn7NMcu0yJdGspJvmmS1
	 m5Y0iF9aC7yNLrDVaUA7jqhW7tweRvOiXHpAaeOfrMqe2MdfezxY6yVGRYALg+Ksi06gX
	 lrY7DIC5pjsLL2oKJdcVJEq/8vuSBJ1g7z5DDhFuVnhrWxYO8oMS8vsjLx1RIbp5I2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=qCN9DtRdE/+gcLb8xRI6LYPt6eU/gxBRp9uUHYDGFwU=;
	b=HPLCmwdLMbkk0P1Vz9p7vfFNq8cs5VLAATpQlTctXjDgVa/cvdQTbWMLgowMIx0N8Nba
	 b/dPg8zU1hLA5g5sZsi05GiaVOX7/H9LO4Qs1wDPH6kMB4NJQTv8X7/Z3JurH42JIyWHO
	 vSbO5Sjdvv71Om5gIHYOYsTbepadCwH0Cqz84Y4GXFBb4KCyFb1Oh1dGPHi0AiSAmTtMG
	 hZH2dDItuG/ve3s7nbG6c4CBk2JFEp8h8DyMymWVEpnhmgsP6LTTOUf9brR+vMh405MU5
	 W6W07lNygp7qVLk/ElXlQZFB38JOtVLOHch5UAfvbAe9W/qX1PCjy4pIjzZIAufBf9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vud2LTlg;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C424606A333
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 12:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C424606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vud2LTlg
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so49430285e9.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 04:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795610738; x=1796215538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qCN9DtRdE/+gcLb8xRI6LYPt6eU/gxBRp9uUHYDGFwU=;
        b=Vud2LTlg4bg+1/37o+Cst/0aGdxrJ6W3Tp/rVd6l2vVhvG4dFi3TP84W8UhlkRa4td
         +64nQiKhh/jBsVID2R3Ud4zwks1TJP6oDt30N+qHCzT7MVd87U31fZ4WGJNYfoMeJbPT
         Ngz+Ro6FI0edvNEiJG8sPHIy0I+c7lBshMWlM+cFNaE223Obwrrw4tCKFAzjrb65gl8H
         AGdXlyrHueMZb+UvN4yF81GbdMCB5yp2LgksHKzQRhb84YCQvkzwLfAsvJqs29CoqD8i
         zmuPB6WrWXVF7E9jyFuyNI1PXxER2zZcT4WaM33KpCL2qby8Y+Iq1UHJpjx8ZeLoVtcF
         PlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795610738; x=1796215538;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qCN9DtRdE/+gcLb8xRI6LYPt6eU/gxBRp9uUHYDGFwU=;
        b=aOyFgL/YL/wFOp+cyJyjcjqV+WyD38VLtOiUyryli7Y0slEJf149qABMSxIdRvqC/s
         r+muZkwh3qUi0aNMIBVnogpOeQjHtWAYo89u9HSegrusiaYofq00uyKeM4kfbW6msIZg
         u3mDmT4XDMW/h8LjPxG4MBpHQ8kaQvB9Hv7/uhWij4+yKEoS3joRI9TmQoM3FMwVOTGY
         ibAjqPY7cdKxBnDBOCo6IDwbmEu5ZSR9/hHji9CBZ5DujIhEELvyLh9FRKjE4Ywd11yK
         wMcg83ocgAxzYpS92GebbYhEmDGK3OahAylpmoTydQR9DnLZNACOnCOCzUZRcktUNoOV
         68Dw==
X-Forwarded-Encrypted: i=1; AL+hErGlVPvyZmRTQ9kEoPOq7/xtEam6zdQDH30VNSThgIwhHOQK01biNOeaSSucu2emignYqNG+Juy/deI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mEc049CfLFqnRr25aBto9qtI6jaD86kdPfdapB0VG/Ezhsyhq
	v2I0NyoyAIoiYY1Zz4fctGvw0uVhotN4n0hm1wJN7goj2FoTJZjS8sK6
X-Gm-Gg: AZFdTZdHYlMtp0e0ukfXLIEc9Qg1dLSTBGP5E92YpMufIulRShPspv7Bda/RZZ1Kmn/
	uvEmRB28/wtTTlOxzRyUfSde1pHaEqQTPukJ8g9DHI5qkF8csG01vaGnhg7FC3tSUn9kdfsAdFp
	FpIRJZtuHV9ENh9TE1PZlKRxINw7dIqCoK92bk9zE6xL0NE7zJF0ayiFNRdqAjj6opXFBBOlpcr
	S0j0H37zV1ouHZ/7nTysLdFojbjB+7OxwBle0NsDkWP/AAUr9rsTdTayfN6EaOD+BarGke1AxMb
	S4VwqG5exeev4GMsPRkLl9Nw1ab+i/tczUryCSAdiffhUeocY+Y8TWMcgF2V3GIKOT0zUQcHHo3
	eCnK8/etZapkEgGLG69oWniN7wdMgRgyXNbHpNbAGeZ+ajrQjT2TQ/HjUsnd2n4oifoErcLPlMn
	u6OkP89EOn92yZCi8TCqGmicmWxxEUA0ozM9z0T3W1FRc9+8pmwrKm/Sf6gFSDgE8bTfxh52Ald
	u9bwRElHhwxA3AZC8zcPlFlBhpsRuZ5jBoc30+IXnERmhuAmHNKY/PBuvyWWjgJ5+HrZGzFrJ88
	q1zCOKL10hssPhi68ktAoxFX1eMlsI7gf/F/ySvZmKVmZklTeN1alr2XT5YNnDZsszgwCvHfG+M
	ZtlFyKTRsAWk=
X-Received: by 2002:a05:600c:8905:b0:4bb:6816:127c with SMTP id 5b1f17b1804b1-4bb861468cdmr344483245e9.8.1795610737633;
        Wed, 25 Nov 2026 04:45:37 -0800 (PST)
Received: from [192.168.0.36] (firewall-214-232.seh.ox.ac.uk. [163.1.214.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb4341sm34358805f8f.4.2026.11.25.04.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 04:45:37 -0800 (PST)
Message-ID: <31d3413a-9aa0-4208-8e15-3ba85829ef79@gmail.com>
Date: Wed, 25 Nov 2026 12:45:36 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/2] thunderbolt: add opt-in to preserve tunnels across s2idle
From: Tobias Heath <heathtobias@gmail.com>
To: Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Sukhdeep Singh <sukhdeeps@marvell.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Richard Cochran <richardcochran@gmail.com>, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <8fbb5876-e556-45a1-96b5-4a8061de9e5d@gmail.com>
Content-Language: en-US
In-Reply-To: <8fbb5876-e556-45a1-96b5-4a8061de9e5d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The current implementation of tb_switch_suspend() / tb_switch_resume()
writes ROUTER_CS_5 SLP into each USB4 switch on entry to s2idle and
rebuilds the tunnel on resume, independently of whether the host router
and connected switches actually need that teardown. On AMD USB4 host
controllers (verified on Ryzen AI 9 HX 370; same expected on Phoenix /
Strix generation hardware), the switch config survives D3hot intact,
and the mandatory rebuild produces an entirely avoidable re-enumeration
cascade on wake:

  * Every downstream USB device goes through USB disconnect + fresh add,
    device numbers increment, open file descriptors onto those devices
    are invalidated (audio streams interrupted, filesystem mounts
    unmounted-and-remounted by udisks, etc.).
  * PCIe hot-plug fires for the dock-side bridges.
  * The dock's PD controller is reset, producing a 1 - 2 s
    ADP1 ONLINE=0 blip that interferes with any userspace relying on
    AC state at wake time (for instance systemd's HibernateOnACPower=
    policy).
  * resume_devices takes ~2 - 5 s of avoidable work.

Add a module parameter, thunderbolt.s2idle_preserve (default: off), which
skips both the tb_switch_suspend() teardown on suspend_noirq and the
tb_switch_resume() + tb_tunnel_activate() rebuild on resume_noirq, when
the sleep target is PM_SUSPEND_TO_IDLE. S3 and hibernate paths are
unaffected.

Measured on GPD Win Max 2 with CalDigit TS5 Plus dock:

  Default upstream:  resume_devices = 2.6 s; USB storm per wake; AC blip.
  s2idle_preserve=1: resume_devices = 0.2 s; zero re-enumeration events;
                     AC stable; downstream connections (audio, storage,
                     keyboard) survive unchanged.

The opt-in gate is deliberate. Where the TB tree is not preserved by
hardware across s2idle (e.g. some Intel generations under specific
firmware configurations), enabling this would leave the kernel with
stale state at wake; users are expected to test on their own hardware
before enabling.

One known caveat: a wake event originating from a USB input device on
the host's own xHCI (not routed through the dock), while a TB dock is
connected and preserve is active, can produce a quiet resume hang on
some hardware. The resume path appears to enter but never completes;
no DPM watchdog or softlockup fires. We were unable to capture a panic
or stack for this case. Workaround for affected users: route input
devices through the dock. Likely root cause: tb_switch_set_wake() is
not called on dock-side routers when preserve skips tb_switch_suspend,
leaving the dock's routers unaware of a wake coming from elsewhere on
the system bus; a future refinement might split wake-arming from the
teardown path.

A second, more serious caveat is the reason the companion atlantic
patch exists: unplugging a Thunderbolt device during a preserved s2idle
window surfaces a pre-existing atlantic / pciehp deadlock that panics
the kernel after 120 s on DPM watchdog. See the cover letter.

Signed-off-by: Tobias Heath <heathtobias@gmail.com>
---
 drivers/thunderbolt/tb.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 57c11ba13..f48c365be 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -11,6 +11,7 @@
 #include <linux/delay.h>
 #include <linux/pm_runtime.h>
 #include <linux/stringify.h>
+#include <linux/suspend.h>

 #include "tb.h"
 #include "tb_regs.h"
@@ -49,6 +50,22 @@ MODULE_PARM_DESC(asym_threshold,
 		"threshold (Mb/s) when to Gen 4 switch link symmetry. 0 disables. (default: "
 		__stringify(TB_ASYM_THRESHOLD) ")");

+/*
+ * Experimental: on s2idle entry, skip the tunnel teardown so the host router
+ * and downstream switches keep their state across Modern Standby. The TB
+ * switches stay in D3hot with their config registers intact; on wake no
+ * re-enumeration or tunnel rebuild is needed and downstream USB devices do
+ * not re-appear with new device numbers. Applies only when the sleep target
+ * is PM_SUSPEND_TO_IDLE; S3 and hibernate are never affected.
Runtime-writable.
+ * The suspend-time value is latched for the matching resume.
+ */
+static bool s2idle_preserve;
+module_param(s2idle_preserve, bool, 0644);
+MODULE_PARM_DESC(s2idle_preserve,
+		"preserve TB tunnels across s2idle (default: 0, off)");
+
+static bool s2idle_preserve_active;
+
 /**
  * struct tb_cm - Simple Thunderbolt connection manager
  * @tunnel_list: List of active tunnels
@@ -3109,6 +3126,15 @@ static int tb_start(struct tb *tb, bool reset)
 static int tb_suspend_noirq(struct tb *tb)
 {
 	struct tb_cm *tcm = tb_priv(tb);
+	bool is_s2idle = (pm_suspend_target_state == PM_SUSPEND_TO_IDLE);
+
+	s2idle_preserve_active = is_s2idle && s2idle_preserve;
+
+	if (s2idle_preserve_active) {
+		tb_dbg(tb, "s2idle-preserve: skipping tunnel teardown on suspend\n");
+		tcm->hotplug_active = false;
+		return 0;
+	}

 	tb_dbg(tb, "suspending...\n");
 	tb_disconnect_and_release_dp(tb);
@@ -3175,8 +3201,17 @@ static int tb_resume_noirq(struct tb *tb)
 	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_tunnel *tunnel, *n;
 	unsigned int usb3_delay = 0;
+	bool latched = s2idle_preserve_active;
 	LIST_HEAD(tunnels);

+	s2idle_preserve_active = false;
+
+	if (latched) {
+		tb_dbg(tb, "s2idle-preserve: skipping switch_resume and tunnel
re-activate\n");
+		tcm->hotplug_active = true;
+		return 0;
+	}
+
 	tb_dbg(tb, "resuming...\n");

 	/*
-- 
2.56.1
