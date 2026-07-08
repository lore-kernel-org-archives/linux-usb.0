Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEEF25A642
	for <linux-usb@vger.kernel.org>; Wed,  8 Jul 2026 02:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783477076; cv=none; b=Ztx388Uwhn7Nw8WNcHOma7MYokrWnr8y7noLBgnG8x57Pw3+PHuS45JVsLx3DXd0WnyT5hcwEqxLoC4PcEkvecreh85HE/NbKkW0zK5GszwCDLW2KlNWAAJqgh2obheRfTPWr5AcKjpcGVS+OUU2R0bf1TRdTyAl0lMQS5lM+Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783477076; c=relaxed/simple;
	bh=VPwkPMdxR5Le8eiRVm7HNv1079YUN1aG5WKdXK3itWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fiMxAHr3PrsWPjWI+jY70I+T2gEqnMouW3sAfPrg+ko09XqAG7b/gFdFGfULJL0z/A6Y9m6UN1wt2w0iWGv9lmiIazUGB7V+oZae+s8qD1C+5Xa+SD84LuWnFYrKQi7TdkVmvx81jyKqCCiXuZ/jmxsDXXsb8qWJ0Ixq00sKHn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OlJ6UuLY; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OlJ6UuLY"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-845eb7b96feso179530b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 07 Jul 2026 19:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783477074; x=1784081874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KrKTe/BPoZPkQGNzQWcAOgRlpjOvzQ2dqAZlUwjn/6k=;
        b=OlJ6UuLYIr6bJ5I+6WNKkL4bCZhSe/oG+EfjWYYyQqti3+QwvbT6+IHuhRYu9Z5B5x
         7xRLq1XwDjkhZt1wISPS7Vd9Pah2nwDqWDT6WlokleTedJmUuL5TCpXzVfyvyUxXL87n
         h4fAw58RTVOr8mZ2fZHG4Y7d+U2l31ZvFr/uB/TqeJMSelIX4eQ/hZG0tprux+k42lbv
         gwkKzA5FKzmi7ydYBpsc7kj1GATYv9Hbxv2brCV6brZqLrqd1ueBmsEV1TWyLD64Y236
         IJJeVJb/2dhhGzSfGzh5cTHhAdXavv1Baj9g+JCO11cOvvisRnMWZpsiuEz2eBZoE1v0
         BvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783477074; x=1784081874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KrKTe/BPoZPkQGNzQWcAOgRlpjOvzQ2dqAZlUwjn/6k=;
        b=bI5oYKy0WZ/41ffqrbjvTM9a0QXhTOo4l63emHgYcLOzWYzf6MuzhauFt/HG95hBrQ
         kDv3a/tbFIBZvjoAVgLRSijY3mcgH3TJo3wUULhGNuWU6EVvxJwkSvIaikEhh/kyZWc2
         uTrh2JvmpWNi4lQ1uxlj6SiR8fEmvH7Y+mVPMH0Wsm2/RqVWTUW6RNLJrxzKJ4jTw39F
         8kw/kDquP3P0iEl6GPzIX5sEvOaSK0qKHYBmaCiqZnKmaFB1jQUsxz8r5XxAlcXB/Jpl
         n4d0POVpP653s97MsAnyweP4CeVy7KrcGmpCfoCNIu99IGtipecYqWTD0+y9rh7xKhnr
         zmnA==
X-Forwarded-Encrypted: i=1; AHgh+RqkrCes0YLLB3nIlfElkize6GDpKnZOj1p1/P6hDvPizfqbFo6QARFd3bPTXPYNCLk0ixxUTQn4VRw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5vu91B6Jjh7y/RbWHkZzmq6VRZ3mbUQJ2JGVdsItl6TsC+HAx
	xbG9BzWxEAlkBj4QirvI58SfvxaQGpiddyODAI59NrDewxT9+RxlHArb
X-Gm-Gg: AfdE7cmRbbGHr2p8yomWehhYrDu3J884i4Z71wG9OO9HqwJ+cVjcTmZ3PjP+qPlBPfK
	7IBkffpo8xuaGLq+NsvgkTX5XtORj0vBC8p07xjnbbE+opnpwyYV39PStBuKJYbzhrSfe1z96pN
	+V9ZO36bad0ofvRpV7JPU6lmRuBbDf42La8yntHG6MsbYMimjB1ogiz5Bx4FFNbdyLINl5jeMhy
	os5x6winqatFX6cksF+5tuRa6sG5/Yxn8v/x42WN5vFIvDqS13KdW4k3P/XKAxLkDogRTaYiwn2
	cWnsKekQSz2tM1xlbvU8fkvckg1YVN3Eog26DHYcmpjkAA4sGPb+iYGgfOvSbNcNpOZeD6RMrpr
	boBoI6aOpSEHXE7myHouMOysJdSUzAswBd8jDSbOjy364i1o8f9Mb4tn4RnZ4MYtoGEHG9yqihU
	1KdPtkN/+aqKL+XU4yaCx4k+ByUIekJigGJ7I/DT2/4emc280gbXBOdzf+t7EH6+rM/q6b
X-Received: by 2002:aa7:88d5:0:b0:847:902a:57c1 with SMTP id d2e1a72fcca58-8484356dc2amr569884b3a.57.1783477074116;
        Tue, 07 Jul 2026 19:17:54 -0700 (PDT)
Received: from acelan-Precision-5480 (118-163-61-247.hinet-ip.hinet.net. [118.163.61.247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8484519580csm126796b3a.32.2026.07.07.19.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 19:17:53 -0700 (PDT)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Myrrh Periwinkle <myrrhperiwinkle@qtmlabs.xyz>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: typec: ucsi: recover from silent PPM completion in sync_control
Date: Wed,  8 Jul 2026 10:17:45 +0800
Message-ID: <20260708021745.3909079-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026061632-gleaming-resend-9a5f@gregkh>
References: <2026061632-gleaming-resend-9a5f@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some firmware completes UCSI commands and sets COMMAND_COMPLETE (or
ACK_COMPLETE for ACK_CC_CI) in CCI but never fires the ACPI notify that
would wake ucsi_sync_control_common().  The driver then times out after
5 seconds and returns -ETIMEDOUT, even though the EC finished the command
successfully.

Fix this by polling CCI once via poll_cci() on timeout.  If the relevant
completion bit is already set, the EC finished silently; fall through to
out_clear_bit so the normal read_cci()/read_message_in() path retrieves
the data and ucsi_run_command() issues ACK_CC_CI as usual.  Only return
-ETIMEDOUT when the EC has genuinely not completed the command.

Guard the poll_cci() call with a NULL check: if a backend does not
provide the op, skip the poll and keep reporting -ETIMEDOUT rather than
dereferencing a NULL function pointer.

Fixes: 584e8df58942 ("usb: typec: ucsi: extract common code for command handling")
Cc: <stable@vger.kernel.org> # 6.14+
Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>

---
v1 -> v2:
- Add Cc: <stable@vger.kernel.org> # 6.14+ as flagged by Greg's patch bot:
  the Fixes: tag targets a commit already in released kernels, so the fix
  must be nominated for stable.  Scoped to 6.14+ because poll_cci only
  exists from that release (absent in 6.11-6.13).
- Guard the poll_cci() call with a NULL check to avoid dereferencing a
  NULL function pointer when a backend does not provide the op.
---
 drivers/usb/typec/ucsi/ucsi.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 9eeb38e7472c..deda7123b5d1 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -91,8 +91,29 @@ int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
 	if (ret)
 		goto out_clear_bit;
 
-	if (!wait_for_completion_timeout(&ucsi->complete, 5 * HZ))
-		ret = -ETIMEDOUT;
+	if (!wait_for_completion_timeout(&ucsi->complete, 5 * HZ)) {
+		u32 polled_cci = 0;
+
+		/*
+		 * Notification from EC did not arrive.  Poll once to check
+		 * whether the PPM actually finished without firing a notify.
+		 * If poll_cci() is missing or fails, polled_cci stays 0 and we
+		 * correctly report -ETIMEDOUT below.
+		 */
+		if (ucsi->ops->poll_cci)
+			ucsi->ops->poll_cci(ucsi, &polled_cci);
+
+		if ((ack && (polled_cci & UCSI_CCI_ACK_COMPLETE)) ||
+		    (!ack && (polled_cci & UCSI_CCI_COMMAND_COMPLETE))) {
+			/*
+			 * EC completed the command silently.  Proceed to
+			 * out_clear_bit which reads CCI+data normally, and
+			 * ucsi_run_command() will issue ACK_CC_CI as usual.
+			 */
+		} else {
+			ret = -ETIMEDOUT;
+		}
+	}
 
 out_clear_bit:
 	if (ack)
-- 
2.53.0

