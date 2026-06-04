Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D556477E58
	for <linux-usb@vger.kernel.org>; Thu,  4 Jun 2026 12:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780576782; cv=none; b=H1X5vSGDwDzta4dx+8ptXJaRwm/1PKtTHGLHtQwym0UGg/aMbAbnaeY1sQdS6BIfWiNnPltNfiCgH9trPqj731W9sKKDJq3Ms9p+GpS/U0EL/dVLWuZNhXJd7qhBRpMj6UqzIRgMT+YacLU4ECtfsS4RJ58BxXC2cFUnQK2NzQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780576782; c=relaxed/simple;
	bh=FP7mukO1CpC1QnxAoCv/QPxuYFUYcoaJHyOEZgnzLHQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=YWqcW/WjdJ+htTgfp1Qwpso9h7mN6IdNfz/RjdQX0JBDxhr7ENdUK3kg0kivvf0nabRLMkw3xMcXGXVznU7RV1OGZezRruN45bjUSYXtOeWaqGLc6hIH11QFqhYNZ7poeT1jQR+1ny5uQyqpFBZPKeXCq+CLdIgxT7PpU+TeZCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gpuKaCPj; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gpuKaCPj"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c0c32f6ce1so4405885ad.2
        for <linux-usb@vger.kernel.org>; Thu, 04 Jun 2026 05:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780576778; x=1781181578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4FZYJeQ0sH02KrpSH96sChGTnTwSSKIPBt+bgZNmU1Y=;
        b=gpuKaCPjp2xmgr3S1FypgniUBL2JGCpfyXowt7RkYF3Zt06A5XmkeTgSEF+NAUurmG
         7zD2QmGCjPpCvRI/YkN/DqPzFPbc8GnHEda1fpSYj/XZqiS8Lj0dLc9Hp51Trzi2fZud
         G65h3ps8xTCeBeE2wRaDWu0DobkBKh1RWxKg8Pa4Xa0+jS2UaeBlYKpewt1bSH/HFXv2
         eFu4+khC/cl9ObiHufwAd78jMpywrynk65W+zCrRc7qkEid6bZh9W2r8m687RyVslSB5
         ruTY6/Ogl/+TiIa5xHo8B1oXPACj1phr1Zr6XmZm5gpI5/6d8EEjnmN7n+oXSnhIiv1Y
         Msww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780576779; x=1781181579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4FZYJeQ0sH02KrpSH96sChGTnTwSSKIPBt+bgZNmU1Y=;
        b=AJTL2Gbh+fiGFLVeYmINSS6yUlCGa7Ax5DLvy5z/fDy1TjEu0DkZkYAg5LYXQZX/ap
         yeCB7CKOGXia/d1wn02NpqalGMisHeSmnsl98OdETszW7HyHwODqEb98zzSfml3AMupM
         YORqXYpcDGE4kr6yC98vyA8FFV/oNIO/Rg9YjChIZPJ7opBxE5wZRDPHtHKcuTEskiB9
         zMWw87kVc4jc5nOgdp6HKgS3f/GiibLJwDFPlbBK0GDntI5o578BR5xYWS5Ego+BvOXN
         5M5hNTUW9UgmTVia+QrpUxl2rMiJxkDNxytq45EYd7wVGNaZGMbpXo4lUUv9unFBqKUd
         V+SA==
X-Forwarded-Encrypted: i=1; AFNElJ92frQbtIzTZxqKZawKx+T97rJFFMwsSPS9FAJWijEC7yTYllqM9GwDPsVi5nix+6l3sgOqbmi9Mj0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgz9pXjuIK5oUVh5NeUj6FHpEDAwkabyAR071nGzJYD2XSVtXK
	rTw5aAqCL2Ff6381Bv9q834bMHLsQCdJbmH/OlGhLziwH+woi+CO7YeL
X-Gm-Gg: Acq92OHoTpaXMmg4synUM3bcxkVaNmC5l6Eq1IXxIzdD5d0kmwHkQ8h1MF/MOCygA+G
	g2bPjYoqxZ5tteh6yTJCih1LAwZsGj2+IqJmCtbO5rK+3f1cZDd+0lSWbN9uXrdRXKmeB0+QCXa
	AhET1lJRV1CehqLkrwm84Wd9X1X9eOaHjOJ+63xVrqzpmiq0y6rX3yzddXJr6hFW3WCM8fZ+ZqI
	+BCOmaq1UMSd1yd6q6AcFsRYTWFXl8mjod2gUDOpZtIHE+Mz5FOnXlES43STZ1r3/77Lu3FBsVl
	K5apdV4lluXzgllTOjQpHroi2MpwlZYTu9lmZn0JhOGLmseN/Q/kumXJ6sg+vA/98ZZoP4NsrYA
	WtfbfZShdBNif92EZJwCLVEqRnWveG678l/ksrvjBNsfwbOcDbHxmalL72tGkoXZZsUUgscy/tk
	+WJB31vJqd5uNeAPMXiLZo0ODVsSJRcjY=
X-Received: by 2002:a17:902:f78a:b0:2b2:ebed:7af5 with SMTP id d9443c01a7336-2c163a1e038mr88420215ad.13.1780576778566;
        Thu, 04 Jun 2026 05:39:38 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2d4sm54302925ad.77.2026.06.04.05.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:39:38 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Mike Christie <michael.christie@oracle.com>,
	Kees Cook <kees@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: f_tcm: fix remaining nexus NULL dereferences
Date: Thu,  4 Jun 2026 20:39:29 +0800
Message-ID: <20260604123929.1427579-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous nexus NULL-dereference fix added checks to the normal
command submission paths, but two UASP paths still dereference
tpg->tpg_nexus without checking it first.

A TASK MANAGEMENT request reaches usbg_submit_tmr(), which fetches
tvn_se_sess directly from tpg->tpg_nexus. The RC_OVERLAPPED_TAG path in
usbg_cmd_work() does the same before walking sess_cmd_map for the active
command with the same tag.

If userspace drops the nexus after the command is queued, these paths can
observe a NULL tpg_nexus and crash before they can ignore the command like
the already-fixed command paths do.

Check tpg_nexus in both remaining paths and use the checked local nexus
before dereferencing tvn_se_sess.

Fixes: b9fde5073553 ("usb: gadget: f_tcm: Fix NULL pointer dereferences in nexus handling")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/usb/gadget/function/f_tcm.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 34d9f49e9987..1717fdd1c466 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -1188,12 +1188,21 @@ static void usbg_aborted_task(struct se_cmd *se_cmd);
 
 static void usbg_submit_tmr(struct usbg_cmd *cmd)
 {
+	struct tcm_usbg_nexus *tv_nexus;
 	struct se_session *se_sess;
 	struct se_cmd *se_cmd;
 	int flags = TARGET_SCF_ACK_KREF;
 
 	se_cmd = &cmd->se_cmd;
-	se_sess = cmd->fu->tpg->tpg_nexus->tvn_se_sess;
+	tv_nexus = cmd->fu->tpg->tpg_nexus;
+	if (!tv_nexus) {
+		struct usb_gadget *gadget = fuas_to_gadget(cmd->fu);
+
+		dev_err(&gadget->dev, "Missing nexus for TMR, ignoring command\n");
+		return;
+	}
+
+	se_sess = tv_nexus->tvn_se_sess;
 
 	target_submit_tmr(se_cmd, se_sess,
 			  cmd->response_iu.add_response_info,
@@ -1271,12 +1280,21 @@ static void usbg_cmd_work(struct work_struct *work)
 skip:
 	if (cmd->tmr_rsp == RC_OVERLAPPED_TAG) {
 		struct f_uas *fu = cmd->fu;
+		struct tcm_usbg_nexus *tv_nexus;
 		struct se_session *se_sess;
 		struct uas_stream *stream = NULL;
 		struct hlist_node *tmp;
 		struct usbg_cmd *active_cmd = NULL;
 
-		se_sess = cmd->fu->tpg->tpg_nexus->tvn_se_sess;
+		tv_nexus = fu->tpg->tpg_nexus;
+		if (!tv_nexus) {
+			struct usb_gadget *gadget = fuas_to_gadget(fu);
+
+			dev_err(&gadget->dev, "Missing nexus for overlapped tag, ignoring command\n");
+			return;
+		}
+
+		se_sess = tv_nexus->tvn_se_sess;
 
 		hash_for_each_possible_safe(fu->stream_hash, stream, tmp, node, cmd->tag) {
 			int i = stream - &fu->stream[0];
-- 
2.43.0

