Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE09D374A06
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 19:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788203234; cv=none; b=gRJoKfs8VMYmb40zDdonmqVNkkAMGbf4WJXlXnEl+kKiSBuj1z0wdExEJZz5jbXaxJzPCkd3OIJryp6RAVLTooK5Z+plSYRnNInKqK7QGcTS46om2rxNol7esilOVjUzYdpGDpsrEHlxYCT+mjnMNgvk4JvgaQG93Tz0V/eku9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788203234; c=relaxed/simple;
	bh=YfZqeRZrcJPBWry4Smdt/KH6SXG+19VL5sgSi8beNLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DC9yUUSrLCWhB7SaOkot6fVNnpx1QC5Y4TX66cATTfR+PzCOo7p+Ai7/JbHMPoA7oLP+9iVgtNQxpR1Z5CnVldsmz6jL1QZKDCI3+mr0I8zGb/6lABCGTGC0nqn7erygT0giV60pd0Z5hwVt5k6hTVoJ1vBh1rnTWcN8M4cYfb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aVxOY1im; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aVxOY1im"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc149372c14so103086a12.1
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 12:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788203232; x=1788808032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hhr6N2Xsb/i2x+PD9jyfBlndkAPLcSMGtFPyBSSzCz0=;
        b=aVxOY1imqlB8dB0UcfYnOn/zmcm7xzkdt5r5jxzay3eBVTLPs+WmcUddQE0DAkWbNQ
         uO3T6Ts0Rg5cktaCbamw8HUamRy8QiESAfk5KwepDoKJuZ0sjVQ0Wl49nnchOhWLYkgq
         5a5XDWnWW0ZG031ldKyUJYe1fWfkgyLeanqYEqCFxiqh7XjFRO8FvPnVPW89JOps8oL9
         9Ng8/shhxcAiONr3Reni3kjlVcXMEDO12Yhrb7bDUvHTaZ+IKE2+pl2Q2n0FNjS4dAZW
         gqV23SEFdIRrOf6bb0LLb67Ehz/y7WaHGEiN++pzFY7CD9n4JxwJPm5FOODktr+Xp6+j
         A6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788203232; x=1788808032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hhr6N2Xsb/i2x+PD9jyfBlndkAPLcSMGtFPyBSSzCz0=;
        b=DHaKgh1XxIoAPc5guqnhGWuIMo2E4EvRRCzPEuJ1RxJ4kHP6MoloDKKmvQZnzl1xjF
         xE85XjBVFEFs738uBXi6rVEXc2GujlWYla9hRSH1P4ow3INksYk7NroPY1J5d4CdHMty
         tr1H2C4ffHt8pRFrkMwiCh5A4cGzWH8wwppiwiMHLjO5cgHFr4ZM7VPbvLHWF4+KWkDp
         zv3srxkpDE754WOSnOfieCX9J/9793l9jHL8qB6ehVRmqLxeq613+rK/drLc+Bc2MPQX
         vp4QZZsVR3f6c9UV3cz23DwGBdewDRgp5ilHk9uvAPKKMZm52smibEPQTnSgtsCAuq0H
         wy2w==
X-Gm-Message-State: AFuF++nIQEZ01ZKbruev8wjuSQXYMtNPywBC2N/h5JnXXqHHgoeE5ZTq
	I2KwfbvCo/8xFhGq5Bzj6YtT3OfDpoq37oJVDE1S1Si/82Q9JHEJrcyyr+R18qtk
X-Gm-Gg: AYBFou2TAtFJ5QyDWi/Vui0VnbvQt+S6fnqhYKhWev7vrWeu38dkI7d0KEZPk0WvZKf
	XG1ypVmHkd9yif0jxs6PgGzO8rrYjTrbIp8LrzsI8TqafdYw4z6PJlJZ8H3PD/b8hy8AtX1AeFM
	ThDywGf9RbGl2kKYoDbNANesgDLBO/XbP7MiHtEl+6WjR6ZmKYH6VHkaevp4Ac4Du4S505oOXkt
	vlJMsI8L3N96dEZuOTy5kU+8Q+xxMY3gWUyJJVP2q07w6nQU8UUYoyhxCKgqa2wk8XXOEz2eS1S
	+O/Fm0kzEHDA+Bms0pK386T6xdczVMTxmI4qQ2dmJJHRiXf1tKEy+Bz08NacnGE1bbKfsc2xAsy
	UZlhkqvSg3KJmElQTn0GwcptqHhpOYZvvTLrNf/yxiLVIXCsde6ID7zOQtrjnqNyoMnEwpL11VJ
	HMV1wY2Jyz1j6J9/MKSyjyf8sH3YOlAY8kS88/QoyqrgW9A6SWe/uAdiWdrJDH/ZEHjdwwiy77b
	pFtlNGLUx6oKFVF3GtW/AWUPyvlT2CPLWB9kps=
X-Received: by 2002:a17:90a:e7cd:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-396d0e71ad7mr40889615a91.7.1788203231598;
        Mon, 31 Aug 2026 12:07:11 -0700 (PDT)
Received: from localhost ([2409:40c4:13b:7a31:95ce:ef4b:57cf:6fd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm46219699c88.4.2026.08.31.12.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 12:07:11 -0700 (PDT)
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathieu Fluhr <mathieu.fluhr@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	regressions@lists.linux.dev,
	stable@vger.kernel.org,
	Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Subject: [PATCH 2/2] xhci: drop 120ms U3 LFPS wake retry wait from runtime resume
Date: Tue,  1 Sep 2026 00:33:49 +0530
Message-ID: <20260831190349.29590-2-lovekeshsolanki00@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831190349.29590-1-lovekeshsolanki00@gmail.com>
References: <20260831190349.29590-1-lovekeshsolanki00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On auto resume (is_auto_resume), xhci_resume() used to msleep(120)
when there were suspended USB3 devices and no pending port event,
to give USB3 devices time to resend their U3 LFPS wake (at 100ms
intervals) if the first wake signalling failed.

The hub driver now holds the SS root hub awake for
USB_SS_ROOT_HUB_U0_WAKE_TIME (120ms) after a resume, which covers that
same window and lets the pending port event be picked up through the
normal hub event path. Therefore, this legacy wait in xhci_resume()
is redundant and can be removed.

Cc: stable@vger.kernel.org
Signed-off-by: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
---
 drivers/usb/host/xhci.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index a9e47e178c28..b0caba8ebf18 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1083,7 +1083,6 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 	struct xhci_segment	*seg;
 	int			retval = 0;
 	bool			pending_portevent = false;
-	bool			suspended_usb3_devs = false;
 	bool			reset_registers = false;
 
 	if (!hcd->state)
@@ -1245,18 +1244,8 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 
 	/*
 	 * Resume roothubs only if there are pending events.
-	 * USB 3 devices resend U3 LFPS wake after a 100ms delay if
-	 * the first wake signalling failed, give it that chance if
-	 * there are suspended USB 3 devices.
 	 */
-	if (xhci->usb3_rhub.bus_state.suspended_ports || xhci->usb3_rhub.bus_state.bus_suspended)
-		suspended_usb3_devs = true;
-
 	pending_portevent = xhci_pending_portevent(xhci);
-	if (suspended_usb3_devs && !pending_portevent && is_auto_resume) {
-		msleep(120);
-		pending_portevent = xhci_pending_portevent(xhci);
-	}
 
 	if (pending_portevent) {
 		if (xhci->shared_hcd)
-- 
2.55.0

