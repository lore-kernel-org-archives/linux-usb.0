Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B934BE430
	for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 23:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790812018; cv=none; b=OTImN6mYLiDrmsfVPSxRG+NXLO32ZMeD1TkuUz/Nz2N56azWXkqzDIap/L3I4mmSBhooeZXAMCoQfVxoNeCZXngcNUfhMua1mk1HFYgHi9Yrl8brGF7QEMgTW8qDG72kTTZvp2vXte4lp+z8KyV5HO3SSuj0FR1ESztcUmyyHIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790812018; c=relaxed/simple;
	bh=J04w6m736rx7ewf6/jKvl5BzfuXA+8hHFvMZDOWRIOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gErVIazpxuBm+yzaBz/ZaMQYxtvZ98FjXWvA4USAZ2bMlM29J5kXfdD+ChFPGHyR8VcW1HlhKg788WzstHVt9E7uChMdBqYl3lr8F2pRU8VAUCUbO7vcS5Y6wTub9TdjPqB9fLfwhfbCa4mEwvM1erdNdjHf/IM1aM9vNIeKq9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gl0GQQvK; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gl0GQQvK"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3410209aa6aso167963eec.1
        for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 16:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790812015; x=1791416815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nu8Cl9d5kdkeLBWfcAAawSaGHAduQcU752rXCWMacQA=;
        b=gl0GQQvKsHGa+qinYpbejun2ZIuRVObrIdiBVMMPkhDQcTlVUCljxvV65p1da5ayM1
         gUp3lKGysnDQOLFG8TahRa3CXTeS7omggEBs4g3D0mP4VEvtEHKo8g630RxQkF5JO12h
         qc1Pwc+rkQ0itiw3Vsy2/reUJ3zhxIiFcAVLuxv+Nkuemlj5sjNnNOtyIgfL3jfulQsU
         X7simCfILBw3pa/Y/4G1sEpRAqmd7JO4r3vCbPM51cIjtSeMYsrP3evDtcl64WvFMIVw
         T9Uv62qg8YnI0jJKIZU1kCcDoCntdSk5AaGyVMwJ6l+YuekyUnl1opXOwilsiRAVfTCK
         kvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790812015; x=1791416815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nu8Cl9d5kdkeLBWfcAAawSaGHAduQcU752rXCWMacQA=;
        b=1KcqFzOfuOwO7NIYOuzGDcZooUOH4ckH5wFdDZNAaTblceA6RqhrkJyDXgh/53GQY2
         ++KCYL9BQ6+p/Vy+f8CSGZNqcfeMOt//N6vjPfhBjVgX0eh1u0SpxWeYiucGgmeK1vkb
         2+eaWxZ++EbRlom3f6ZnIR62S1uNeTkED/W6Sd6b1+/OQWWViYcCrxSoXQ8MMFTTxZz1
         9fpJAXnyuNq2kIXpaqDwQPaQyXHISS3+R9v0UglkVrmXVBiDDKOZpDUEfFUJH1ru4ivc
         V7BsXYdIjbwMqs9s9NB1IAxZA+JkmX0oB7S/OiLw+Wo4cO+JFnIpiuDn4Z1ZuDAHe95Q
         xuMQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2gUJbEL/fSaQu0LsUL/2S6nZ1R5U63xn8wt1aLClUQR9FOd7AqHcBCdIjk3Ux7VWCZtSOuKuc9uQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lPT2aDkG6G01v7U9tc60mPWL5yIr8J/JF6KDOQ/Y0jOeWf62qS
	kQTkUT6o0Q+Ah41m1gyJ4EDIam/r1WHz9RFlNioZXZnyIpxQeUJv1rcn
X-Gm-Gg: AYBFou3ZPkxsT4z3P9RnUUadJNi/57hFZLtFy/kld/ihyHsE0w79nGxQvT8tzdfEvwH
	go3jMByao93W0Hlm98dV6qhwpj0QtusJ67p+VqEnEAPJ90iTtYf6KiANSdLUkXrizamd6bOjcDF
	tURAGYbSiKYNJ3Bl/240dEuzQtEzaCI3zgbtWVzpJpDzs2zLUmsD2+t2CIlUKHDzjNx6M43Vrmf
	rNvGpykrZS9lOHrTNwZek6L6IQ24QWsw0xQASXafnrnPQCelhmloepSjTrSSnDy4vsmzucSBckd
	yur74gTQoSMHz4NZBTGtraSv+CqmvsLWCVlmYMRBXSnorp74KR/1Y2MBIXiEzo9Z0+fr/wAXA4k
	2nOGB4tNAGwJ6GBcEqDIGlO4mJYJoJZTqeKrAe3pT5/oYNkOIUzwQj1CHzHOBl0gu7eBRop4Xoe
	XW/amD3f3nys9dDSZnKyb6zNp013i6dwjYlzG+5vLkglbcNZjvRk0X9FTI6pR4KGavFctme64TP
	VwbBpNEbRykNLMdShYSs/3LCjCNjnef38gUFaIoOEvUQUE=
X-Received: by 2002:a05:7022:281:20b0:146:84fd:7b58 with SMTP id a92af1059eb24-14dd07fca11mr934446c88.9.1790812015144;
        Wed, 30 Sep 2026 16:46:55 -0700 (PDT)
Received: from Gris-Laptop (gia.grisge.info. [67.230.185.89])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14df359ee25sm1768367c88.5.2026.09.30.16.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 16:46:54 -0700 (PDT)
From: Gris Ge <cnfourt@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Gris Ge <cnfourt@gmail.com>,
	stable@vger.kernel.org,
	Benson Leung <bleung@chromium.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Jameson Thies <jthies@google.com>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: typec: ucsi: Skip CAM query when partner has no alt modes
Date: Thu,  1 Oct 2026 07:46:08 +0800
Message-ID: <20260930234611.468765-2-cnfourt@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since Thunderbolt alternate mode support was added,
`ucsi_altmode_update_active()` is called on every Connector Partner
Changed event.  This made the driver send `UCSI_GET_CURRENT_CAM` to
PPMs even when the partner had no alternate modes registered. Firmware
that does not support the optional alternate mode details answered Not
Supported, which produced a spurious error on every partner change:

```
ucsi_acpi USBC000:00: GET_CURRENT_CAM command failed
```

Fixed by skipping the command when there is nothing to update.

Fixes: da87d45b1951 ("usb: typec: ucsi: Add Thunderbolt alternate mode support")
Cc: stable@vger.kernel.org # v7.0+
Assisted-by: Codex:deepseek-v4.1-flash
Signed-off-by: Gris Ge <cnfourt@gmail.com>
---
v2:
  - skip the invoke of `ucsi_altmode_update_active()` in
    `ucsi_handle_connector_change()`
v1: https://lore.kernel.org/linux-usb/20260927021649.8967-1-cnfourt@gmail.com/

 drivers/usb/typec/ucsi/ucsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index bef3f9b71d71..c392afdc27ae 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1519,7 +1519,8 @@ static void ucsi_handle_connector_change(struct work_struct *work)

 	if (con->partner && (change & UCSI_CONSTAT_PARTNER_CHANGE)) {
 		ucsi_partner_change(con);
-		ucsi_altmode_update_active(con);
+		if (con->partner_altmode[0])
+			ucsi_altmode_update_active(con);

 		/* Complete pending data role swap */
 		if (!completion_done(&con->complete))
--
2.55.0

