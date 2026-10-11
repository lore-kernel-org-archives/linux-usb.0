Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F131A37107E
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 08:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791705910; cv=none; b=RZxyWC+RkqNMgSULwDAd1YmZBq6C8q85DWxjuJPW0ksilkPLhOLqSpkzk2gdgqJrAw4Q/LYFW+a0cGIVe6A4066qFySOjplQvHjVHqKqFla3MIiWFiZYEAed4Y+uoNwfjWLlShrkwhtl+hGGBVaGfcfKGM0G1JkyQmTL6aq7/3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791705910; c=relaxed/simple;
	bh=Dd0AlETCrLfBhwgPv/+aAB35OnDGld5JfQtHhBHb438=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ugbWVtSrIwRehIpbxD/7e+lQd911eFEQ/iczUcVKiy+wguJT+/fguRy3zQ/7WC8OupPQp2HMUWFmIhR45UrNJh82vrCFeTgaMvWKgHYPWxySZECnntSmnryJFAwPFdhfCiOmHq7S4prJuU0nQarqYh09gPwvFW2VsczyKIFXHCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J++zvAya; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J++zvAya"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso9790425e9.3
        for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 01:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791705907; x=1792310707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sHRwnViPe+B6SXPirxdpPYH3hzjizazcvdZWVcjfRYc=;
        b=J++zvAyadO9f+fK/sTclCsfwvrhcCgYj9XP+SmLag421FySxbP17MCb395sQKvw5Fh
         OGu42LDgxxLDkv/JOCj5GaqmpvGyX30Y5MNyUf7dV3lJAOG5b6Be52im/0AGVP6T0XcC
         rnkr2RbKFqLPKmCM8EW3ZwmyJVBqk9LWRWx0542kc5iVkTjxpIVkVFAzzDBGcx1IrQLh
         JifnUIrnGSnhNU9xar78mTzokMbbPcUcZh40FmdNDhJjY9h4AdHD53emI6DnYENC2gSb
         79SKnK40BTjK4UM5zrFgkcKI+2dZulNXEAN3c9M6YLpISAt5jUKrU6G1e7HK9AXP9ElH
         nNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791705907; x=1792310707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sHRwnViPe+B6SXPirxdpPYH3hzjizazcvdZWVcjfRYc=;
        b=0HdOn2Ox4+Hum1Anz5Zy/wIraV6cXgepJFyV27yI4TXZM/8BNoJxyJFf+sd5SlvddK
         EPww+BciVUxojjcpedTBq/reRe89wX625osnHtiEYF8DgN5E/w9ZzCgmyKkW7LflTlsB
         o/C9i3dmnnBdX0ecyg66TJ09zrZDdVejz6osRPRHPvJfZPg4+nO362jf5EYRDqD1LV8A
         0xeXrcnilpT5pKuvmcStY5FULG7BH8MENqGNNRINvbttEFIpgB/bv69yAB1OyMVTgWxQ
         Haz/pbuXiHCiT6oA1vU9u5drEWdDghYy9w2gxcvsNrqzZgN3APLUKlgd9ahITu3zabXy
         Nz2Q==
X-Gm-Message-State: AFq9FYIBavImijEs7pGCAlUwbalNGLlCR6jbHGjPMsjtW5VNI3hYB4wc
	bBsoBazsbA7Xt3x3i2WxX5bXpZt6iWemvPIL2Om3hYAmV7BHRFRF/zbv
X-Gm-Gg: AYBFou3CZvsYyq/l40wYkiulvKZwhbxoZqjEiguvR8AkCoamulgK6g+qm4ImLMxkdm9
	E0IAE9PadtDKa0B8y/9BEPuGzF/rb2iNaJv6vNzatPn4CCJPXYNoA1+hLe5VJ6cFnf9W00hYA9W
	30sV/1aL9iZTdI+PFP3rvWB3qwxUYMJebgittYROQvuGhOGZsrAC4dCBU7tRt4xxYqnnOzddVsW
	foLBt/4psXgGJZmSKuSwWTjjjQbD8GuW5E13njDhpHhkWjXIqSan+mNXjeOR5BklYKtIj4WAVs2
	+pOJUsu6pDfROC1szF/TcDFPnBzR9vHKhxZUjsJhfif5/pbusXkaq5iPdEAIwHQavIwxjsPGxrD
	plIqkZQbdEGM8NJu8Wcc31VjGfyN6FPN648gKzuJi/bmcJHtiYE1158DZpaDSmBK/nVsPJ2gnBu
	1+vXBxZ2sLbp8SHJFHEJ3mbU6lmba8qcCw426WK2VsbHxANJqLk1R/I4/Zlqn6xP07sAN275wPW
	7G2BaJ0ZsVoEpnKx2pn5doxvOgkxw+8mYeneQ5khzVHAFkhtwVrcV3FKhI7iyqKysMlyKr3/EP/
	hlNRj83PWONvGoxnGA==
X-Received: by 2002:a05:600c:19c8:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4a18e4adcdbmr114834925e9.14.1791705906973;
        Sun, 11 Oct 2026 01:05:06 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dc1b30075sm9520337f8f.19.2026.10.11.01.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:05:06 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: octeon-hcd: keep SOF interrupts while a pipe needs them
Date: Sun, 11 Oct 2026 08:05:06 +0000
Message-ID: <20261011080506.2394708-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011072236.2381546-1-orgads@gmail.com>
References: <20261011072236.2381546-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cvmx_usb_schedule() now sleeps on an hrtimer until the nearest future
periodic deadline instead of counting frames down on every SOF. The scan
that finds that deadline only looks at pipes with

	next_tx_frame > usb->frame_number

which is right for picking the deadline, but two kinds of pipe that
need a SOF to make progress are invisible to the decision:

- A periodic pipe that is due and was *not* started: no idle hardware
  channel this round, its split window is closed
  (cvmx_usb_find_ready_pipe() rejects both), or another pipe owns
  usb->active_split. cvmx_usb_next_pipe() looks at the isochronous and
  interrupt lists only when is_sof is true.

- Any pipe that has sent its start split and waits for the frame its
  split complete may go out in (split_sc_frame, also checked by
  cvmx_usb_find_ready_pipe()). A control or bulk pipe on a full or low
  speed device behind a hub is in this state between its two halves, and
  with SOF masked nothing guarantees an interrupt that brings
  frame_number there.

When some other periodic pipe sets a far deadline - a hub's status pipe,
whenever a hub is attached - the driver masks SOF, arms the timer for
that deadline and these pipes wait for it. That is hundreds of frames;
the code allows up to 8000 (one second) before it falls back to SOF.

Before the hrtimer this could not happen: any pipe with a future
deadline set need_sof, so SOF stayed enabled every frame and the pipe
was retried on the next one.

Note such a pipe and keep SOF enabled while there is one, whether or not
another pipe has a future deadline. Nothing changes when there is none,
which is the case the timer was added for.

Other control and bulk pipes are excluded deliberately: their
next_tx_frame is not updated on completion, so they are almost always
"due" and would keep SOF enabled permanently.

Fixes: aebbc7d63407 ("usb: octeon-hcd: sleep on an hrtimer for far-off periodic transfers")
Assisted-by: LLM
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
v2: the Sashiko review bot found that v1 missed two cases:
 - due_now was only looked at when some pipe had a future deadline, so
   a due pipe with none still left SOF masked;
 - a control or bulk pipe waiting for its split complete is in the same
   position as a due periodic pipe, but v1 excluded all control and bulk
   pipes. split_sc_frame tells these apart from the always-due ones.
 Compile-tested only: there is no full or low speed device behind a hub
 on the test board, so the split path is not exercised.
v1: https://lore.kernel.org/all/20260915081724.25637-1-orgads@gmail.com/
    and the resend 20261011072236.2381546-1-orgads@gmail.com

diff --git a/drivers/usb/host/octeon-hcd.c b/drivers/usb/host/octeon-hcd.c
index 256e459..9477a1d 100644
--- a/drivers/usb/host/octeon-hcd.c
+++ b/drivers/usb/host/octeon-hcd.c
@@ -1923,6 +1923,7 @@ static void cvmx_usb_schedule(struct octeon_hcd *usb, int is_sof)
 	struct cvmx_usb_pipe *pipe;
 	int need_sof;
 	u64 min_due;
+	bool due_now;
 	enum cvmx_usb_transfer ttype;
 
 	if (usb->init_flags & CVMX_USB_INITIALIZE_FLAGS_NO_DMA) {
@@ -1964,15 +1965,32 @@ done:
 	 */
 	need_sof = 0;
 	min_due = ~0ull;
+	due_now = false;
 	for (ttype = CVMX_USB_TRANSFER_CONTROL;
 	     ttype <= CVMX_USB_TRANSFER_INTERRUPT; ttype++) {
 		list_for_each_entry(pipe, &usb->active_pipes[ttype], node) {
+			/*
+			 * Do not sleep past a pipe that is only retried from a
+			 * SOF: a periodic one that is due but was not started
+			 * (no idle channel, closed split window, another pipe's
+			 * split active), or any pipe waiting for the frame its
+			 * split complete may go out in. Other control and bulk
+			 * pipes are left out: their next_tx_frame is not updated
+			 * on completion, so they always look due.
+			 */
+			if (pipe->split_sc_frame != -1 ||
+			    (pipe->next_tx_frame <= usb->frame_number &&
+			     (ttype == CVMX_USB_TRANSFER_ISOCHRONOUS ||
+			      ttype == CVMX_USB_TRANSFER_INTERRUPT)))
+				due_now = true;
 			if (pipe->next_tx_frame > usb->frame_number &&
 			    pipe->next_tx_frame < min_due)
 				min_due = pipe->next_tx_frame;
 		}
 	}
-	if (min_due != ~0ull) {
+	if (due_now) {
+		need_sof = 1;
+	} else if (min_due != ~0ull) {
 		u64 delta = min_due - usb->frame_number;
 
 		/*
