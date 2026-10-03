Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A9A344D91
	for <linux-usb@vger.kernel.org>; Sat,  3 Oct 2026 21:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791064622; cv=none; b=tPvE+I+CvbHIGNisxa6DTWQRZskQ7TS0WaNpWy3/tQsp3jgM/7QVGh9GoTS0CFBNQm6xq0ry4PLqAkRw7P3fIyeQiBULDSmG7azvHZX+N1EiEI0Wlc5xrd4NSXIQ8OKfvsscwGOJSJ9gYrZ70riuRcuY37+4rvH81dnNMRT5wlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791064622; c=relaxed/simple;
	bh=ajVkJJB8cpL6eX6uqehc4WMezW30JEBdSPUbjc0htwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JDd5A0EcVLKFq/QnDgnWu8rTStAkTo5Vn551e+Pd+JCDSXGa5ca69ldeK15YGrKM8VAQZyd7wdIW9NXWHhm3QJFCwIQMqRMmJ9/6lwTE8e5oISthBBUAp1RTzs7mV9BKYXyYnvWD1VpfegnDbnqfl1pD9EgVUvnr7rOszD0PlwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2wkTlra; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2wkTlra"
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93e49d7dc66so40049785a.1
        for <linux-usb@vger.kernel.org>; Sat, 03 Oct 2026 14:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791064620; x=1791669420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nnvam6GPa9oWys6wFkXRnROr1XxM0G1Xp9Ziz6grcVA=;
        b=f2wkTlraiLUvL3OXMOEZbs5S4MbVSUWUB/1/wk3OsSm7sTGG0TUEjDuwtibt4oVi1c
         WtESCrJ79bk5ojq0/zPlc65QBBO3IHOwXpybyq6/VQ8Hr5rpjjRgKm+nEUKhBnOLfJpt
         zab5+fq5jsUyIKaSh9rnx7D5VD/nxIW1EEpb2ClZOb2IFEfDWJvuvmm80s2xGRE7cI+m
         nxPP5lcf+c0uWjo87yO8YUCUDCQ7GVfFKG58bpkMlGm9mv4rv//E0V+8C3qE74h69BZh
         v0y7gMMo7wSzGIy8sgz2kvdC93NtFwu6DC3fh/Ji4Y+P8Gf5ORUjb7l63QCF20GuZKwS
         H+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791064620; x=1791669420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nnvam6GPa9oWys6wFkXRnROr1XxM0G1Xp9Ziz6grcVA=;
        b=TCnDv6J1/2eI4Ye5IgF2snO+JuEtz23H6RnsA/qP+2S9TUsAARjBBpbRN7+PC+zJwj
         jBjXTXoTFn8wU5I3lQNnDUSpRDxtbm2bfknpBNCrAATz2RuvNjMiWHhozss3rVPysMQP
         Ev6pEnsd0aJSeWi+6LJoLidxRq6PJtkI+qW49DmnbVEiD50pIV2Oqcbge7e2D65yy1tD
         FavjrM+rOzyZZLNUPHFKI7D/iWgUdkyXUz+TqOaiIaI0bdVWDL6dGlHdFKgYEkY1ZYM0
         JcCLHRKn8TEodiM+QB2fED73sPYk6Xv9zzopbxS8UurR6jFjEypH3lWA8Bt+1ks0inYU
         ffMQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6k38Um4QV1T23ugOUEQPyrm6YFrfFfcUT5QZ08Pa+a6K5Flm5hj+J1l3Q0NTtG5VVODTeDeMkJyk=@vger.kernel.org
X-Gm-Message-State: AFuF++nQUtc+r3UsXud9C0l8f1r84Qebap3qBfdlUVpnwsB8f9/l4d9A
	9MZ+0DpKuIGlD2cvbWMqxs9XTI5brOLMeADzJMzWmjuTHioK2Upx45i1
X-Gm-Gg: AYBFou0PT+bR9cAuxugvqLs+PLD5n5a9g3S1RuzM9CTj83meAuScSWSdj/dMd/ijRVi
	1kcltjMvP8LaPsYiwKyrSrO0ybsxEjfvNE1AZ72mKIX64EwoUQ+FG+OKlNH+CGudj6XGiSCAkww
	q7Lr2jBq3QFBBpyEdy/Uodp47G0nDVzW9sSrJg6/++ka5EAVw5fZsLMaDIRFjVg7h47OrPFqQhI
	bJm7ESPsu1Wp7wYRTgn2rhc9/pptiQoN1GI1mI9Gmfz6t67ncZRShJWb4VlwKDMFXV1kYL1E+Xp
	q72yCcz07xMvZRNTluYITdzLZQ1I4y0S5DlLxC5G1d94lT2ej5m9oSeZ2k69cSZSDUYVYsFlcwk
	ayleGLG8ddyAR9D7f1bhZ+hsNbtdQad3FsAYp6D+ez5bffgCyOBzYmyMLSGUTFdszOWdckyfvy1
	/qhthtA6Z7mj7YhLzCufj/8GtYVPQVRx9tTeXidNXqpFSr2lzVmCmqXVUJmprX87BTB6BDiIHky
	2DkFU7K+jLxKom2FQBPQ26djA14DJVFjss7kfEJA/iVm6gO
X-Received: by 2002:a05:620a:261c:b0:93c:3b14:7282 with SMTP id af79cd13be357-93cf19d92d0mr1265505585a.66.1791064619904;
        Sat, 03 Oct 2026 14:56:59 -0700 (PDT)
Received: from mango-teamkim.. ([129.170.192.163])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca2d361bsm541429885a.45.2026.10.03.14.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 14:56:59 -0700 (PDT)
From: pip-izony <eeodqql09@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pooja Katiyar <pooja.katiyar@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Fan Wu <fanwu01@zju.edu.cn>,
	Johan Hovold <johan@kernel.org>,
	Ajay Gupta <ajayg@nvidia.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Nathan Rebello <nathan.c.rebello.27@dartmouth.edu>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Seungjin Bae <eeodqql09@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] usb: typec: ucsi: ccg: Validate altmode index in GET_CURRENT_CAM response
Date: Sat,  3 Oct 2026 17:55:20 -0400
Message-ID: <20261003215520.611083-2-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026092918-evolution-modulator-3a97@gregkh>
References: <2026092918-evolution-modulator-3a97@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Seungjin Bae <eeodqql09@gmail.com>

When the PPM reports more than one DisplayPort alternate mode for a
connector, ucsi_ccg_update_altmodes() merges them into a single entry
in uc->updated[] and sets uc->has_multiple_dp. In that case,
ucsi_ccg_update_get_current_cam_cmd() rewrites the response of the
GET_CURRENT_CAM command. The response is a single byte holding the
index of the currently active alternate mode, and it is provided by
the PPM firmware.

The function uses this byte directly as an index into uc->orig[], and
then uses the linked_idx read from that entry as the translated index
into uc->updated[]. Both arrays have UCSI_MAX_ALTMODES entries, but
neither index is checked against that size.

If a malicious or buggy PPM reports a value of UCSI_MAX_ALTMODES or
larger, e.g. 0xFF, uc->orig[cam].linked_idx reads over the end of
uc->orig[]. The byte read from there is then used as the index for
writing cam into uc->updated[new_cam].active_idx, so the out-of-bounds
read is followed by an out-of-bounds write. This happens without any
userspace action, since the UCSI core issues GET_CURRENT_CAM on its own
when handling connector changes.

Fix this by rejecting responses whose index is out of range, printing an
error and returning -EPROTO, so that the caller cannot accept this.
Also check linked_idx before using it as an index, so that the write into
uc->updated[] is always within bounds.

The response is now only processed when the command completed without
an error. ucsi_sync_control_common() only reads the response when the
CCI reports command completion, so otherwise the buffer is not filled
and must not be mistaken for an invalid index.

This bug was found with a Python script that traces where firmware input
is used.

Fixes: 170a6726d0e2 ("usb: typec: ucsi: add support for separate DP altmode devices")
Cc: stable@vger.kernel.org
Reported-by: Nathan Rebello <nathan.c.rebello.27@dartmouth.edu>
Assisted-by: LLM
Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
---
 v1 -> v2: Print an error and return a failure instead of ignoring the
 response, as suggested by Heikki. Only process the response when the
 command completed without an error.

 drivers/usb/typec/ucsi/ucsi_ccg.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 91c2958a708c..80e3e84b418d 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -384,14 +384,28 @@ static int ucsi_ccg_init(struct ucsi_ccg *uc)
 	return -ETIMEDOUT;
 }
 
-static void ucsi_ccg_update_get_current_cam_cmd(struct ucsi_ccg *uc, u8 *data)
+static int ucsi_ccg_update_get_current_cam_cmd(struct ucsi_ccg *uc, u8 *data)
 {
 	u8 cam, new_cam;
 
 	cam = data[0];
+	if (cam >= UCSI_MAX_ALTMODES) {
+		dev_err(uc->dev, "PPM returned invalid alternate mode index %u\n",
+			cam);
+		return -EPROTO;
+	}
+
 	new_cam = uc->orig[cam].linked_idx;
+	if (new_cam >= UCSI_MAX_ALTMODES) {
+		dev_err(uc->dev, "invalid linked alternate mode index %u for %u\n",
+			new_cam, cam);
+		return -EPROTO;
+	}
+
 	uc->updated[new_cam].active_idx = cam;
 	data[0] = new_cam;
+
+	return 0;
 }
 
 static bool ucsi_ccg_update_altmodes(struct ucsi *ucsi,
@@ -636,8 +650,10 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
 
 	switch (UCSI_COMMAND(command)) {
 	case UCSI_GET_CURRENT_CAM:
-		if (uc->has_multiple_dp)
-			ucsi_ccg_update_get_current_cam_cmd(uc, (u8 *)data);
+		if (!ret && uc->has_multiple_dp &&
+		    (*cci & UCSI_CCI_COMMAND_COMPLETE) &&
+		    !(*cci & UCSI_CCI_ERROR))
+			ret = ucsi_ccg_update_get_current_cam_cmd(uc, (u8 *)data);
 		break;
 	case UCSI_GET_ALTERNATE_MODES:
 		if (UCSI_ALTMODE_RECIPIENT(command) == UCSI_RECIPIENT_SOP) {
-- 
2.43.0

