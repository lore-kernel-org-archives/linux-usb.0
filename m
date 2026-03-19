Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB823DABE3
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 14:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773931648; cv=none; b=O6gRoDHhtwesq4c4fzznamTwUFSfTPUlr1Wz1Ga8cnJ6H3bfMsfJ1y6f3di9nkGhu46gzrMvJXNid19fvhf3fLO7ycQOvMuS4SbY0kCrjfIItJG50pP+tJCAo63WFCKE8b0+l5E+Z7ADAtzdcw4ci4KTKdRA8KJVVUoD3gPdaMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773931648; c=relaxed/simple;
	bh=OqiJllbHP7KV9Y7pCJm06l+dCrLRvRbJ7hu1vqd0ywI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZjC7XAZOwfQcDAnow8aODgohaG92srmjeJi5YZ6T7KJOJLTwYitl14uVGqWKcfZAmzrSZraZbdvw1qwDVe4Ynxl7P1SBfjYK0T/a5g77y8FF/HsPB4mnN9M/bw/rjvG3yrwmhJa5hrBpautAlrxFCZ3EHbrfjPALXcbD97FNVqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=bpwLzOMk; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=bpwLzOMk; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="bpwLzOMk";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="bpwLzOMk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F40274D258;
	Thu, 19 Mar 2026 14:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773931643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wszag2x45Ta/FvfnIR0o9gpS4Lc42+2QPu4TaBcJ/0Q=;
	b=bpwLzOMkxsWjaBicAv03Dmy0p6NIYJCeboFc/xqlejWwZrCy8fdCO/jOUhmmPZCzasoo5S
	ibtiwf35m2MTqPb/LO//tYRKEIQHAbq9Ubx9fiWim1ZFjHVBiFGLNj8Yin2caPYCAxclX7
	UfullLpokrvMeNYujnEWU/HcBR67wPw=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773931643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wszag2x45Ta/FvfnIR0o9gpS4Lc42+2QPu4TaBcJ/0Q=;
	b=bpwLzOMkxsWjaBicAv03Dmy0p6NIYJCeboFc/xqlejWwZrCy8fdCO/jOUhmmPZCzasoo5S
	ibtiwf35m2MTqPb/LO//tYRKEIQHAbq9Ubx9fiWim1ZFjHVBiFGLNj8Yin2caPYCAxclX7
	UfullLpokrvMeNYujnEWU/HcBR67wPw=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D5A564273C;
	Thu, 19 Mar 2026 14:47:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OJv5MnoMvGmPCwAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 19 Mar 2026 14:47:22 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCHv2 2/2] USB: uapi: add BULK_MAX_PACKET_UPDATE
Date: Thu, 19 Mar 2026 15:46:24 +0100
Message-ID: <20260319144715.2957358-2-oneukum@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319144715.2957358-1-oneukum@suse.com>
References: <20260319144715.2957358-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

The spec for Embedded USB2 Version 2.0 adds a new feature
request. This needs to be added to uapi for monitoring.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---

V2: improved naming and commenting
 include/uapi/linux/usb/ch9.h | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/include/uapi/linux/usb/ch9.h b/include/uapi/linux/usb/ch9.h
index 62771e38a83d..c3e593378377 100644
--- a/include/uapi/linux/usb/ch9.h
+++ b/include/uapi/linux/usb/ch9.h
@@ -123,15 +123,17 @@
  * are at most sixteen features of each type.)  Hubs may also support a
  * new USB_REQ_TEST_AND_SET_FEATURE to put ports into L1 suspend.
  */
-#define USB_DEVICE_SELF_POWERED		0	/* (read only) */
-#define USB_DEVICE_REMOTE_WAKEUP	1	/* dev may initiate wakeup */
-#define USB_DEVICE_TEST_MODE		2	/* (wired high speed only) */
-#define USB_DEVICE_BATTERY		2	/* (wireless) */
-#define USB_DEVICE_B_HNP_ENABLE		3	/* (otg) dev may initiate HNP */
-#define USB_DEVICE_WUSB_DEVICE		3	/* (wireless)*/
-#define USB_DEVICE_A_HNP_SUPPORT	4	/* (otg) RH port supports HNP */
-#define USB_DEVICE_A_ALT_HNP_SUPPORT	5	/* (otg) other RH port does */
-#define USB_DEVICE_DEBUG_MODE		6	/* (special devices only) */
+#define USB_DEVICE_SELF_POWERED				0	/* (read only) */
+#define USB_DEVICE_REMOTE_WAKEUP			1	/* dev may initiate wakeup */
+#define USB_DEVICE_TEST_MODE				2	/* (wired high speed only) */
+#define USB_DEVICE_BATTERY				2	/* (wireless) */
+#define USB_DEVICE_B_HNP_ENABLE				3	/* (otg) dev may initiate HNP */
+#define USB_DEVICE_WUSB_DEVICE				3	/* (wireless)*/
+#define USB_DEVICE_A_HNP_SUPPORT			4	/* (otg) RH port supports HNP */
+#define USB_DEVICE_A_ALT_HNP_SUPPORT			5	/* (otg) other RH port does */
+#define USB_DEVICE_DEBUG_MODE				6	/* (special devices only) */
+
+#define USB_DEVICE_BULK_MAX_PACKET_UPDATE		8	/* (eUSB2v2) bump maxpacket to 1024 */
 
 /*
  * Test Mode Selectors
-- 
2.53.0

