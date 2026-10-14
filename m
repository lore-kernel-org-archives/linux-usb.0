Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A4655D889
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 16:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997060; cv=none; b=jkWfjyLbg2K2RM0Kf/nr6WYO2Amb5kjB8WfACaXQQnASUC58X7V1NZ6HU5tRMeyuamAVNJHBGf7xLbvdDTAlXX7TJvCddn8c4hPiC6y7LF9ipMJPiVPrEybxbWZZwKGHrn66afZR/wjv4deDnTZQFp5mJIDQni3cAIx62GSKIig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997060; c=relaxed/simple;
	bh=f6jAdHzhboSsrvnAwQk9bd8ybs7PXFPvcgnOKc54iZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i9njhJg7jlhoipt2WP9nekm9xf19ALbBt8lI2iZua4lMUnbNl0TKG9AQ+BfRrXaNY2ZQ4Ub7sq6lnpxgwGj9t6NsxsinZWyzJvyb+R4SoxA0YSJcN4W9X33mMr67TYkjPelxEcpGCSSfyYhYrjzJACzde3w+gBRNNuEJlBU1oag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hvk17E8q; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hvk17E8q"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so34641415e9.1
        for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 09:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791997057; x=1792601857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3qcxre9NbZoUsuxuBW1AKl0J1hEgizU6C0yp28P8CW8=;
        b=Hvk17E8qvt/FVFRq3X8fP/WwagQByVmYs4aKHGAz9Ia5GFF8zBIeb27hM3Qxp3laeZ
         HYLtLUPRvnPFfuJQtUImKG9+AyNcQDO4cSjcHNRA3NoQs0MWfC73VZJ0OUE5rm1UeD9r
         A1syYWiMRku5DxIKmlEnuoV+zUfYyYK3KuhAsbga5znKTA6MlZWmytt4nkE0RpLJu+Gr
         jRJ9s+l3EF0qpNyTXpoAmQfA7V5zvOX6qZgM2+FLhk7+QHx/5kcE20qVnEQzoASuEdtk
         u63I5S6dmHyBCugFkjBQcesEyrS0lXM4X242Bi+aS2LYw4E0wvXz5yTPOhi4x2GmPaAI
         tt8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791997057; x=1792601857;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3qcxre9NbZoUsuxuBW1AKl0J1hEgizU6C0yp28P8CW8=;
        b=HpsTsSfX2RkUclo1Zmb758S894Sl8Ned9LUnOZTDNmcNHVP9wyoXSzkn8kEMXCpDTr
         c31tuDBtdXFsWFCKPtpYcPcXVxMp087laV0QKzx0QmguBSIAk1M5o0Q6FEHZ6ms4TwoU
         m/GIScD3vB2lv0DDOacMOo4a6qMpkj5LjLsY8T6OtMuMQ2iKsycty8eoysALbI2YgiaD
         75rlZL2D7o1sUBHn6V8P2o/FZAjU9GJnR9hMSMdzqLSN6blNqDEqeEeTdShuIkH/Xu6q
         u4cOwGFbTbT2XZj+ks4vmeb9ERdOjsxThEXK8DflUo7sPidLYX59/D91w+1K31ZIQ0JC
         pGrQ==
X-Gm-Message-State: AFq9FYLtxDynQMtbRj7eo+zFZKNpvxtlId0qvz/i1cVTATrdW88Npsjy
	D/HOFmmWe2oSbeMcOdbf2O6b2MDv/VLE9LOjNMzG8KooTzO4rm6Qyv7/v8ck7xQI
X-Gm-Gg: AYBFou2C18LHGz47DsKuE2LO9QOKJOetbwf+KhueoxP34cktawnIMkwTr3RIT4kTZ31
	lAV26wweu0jgSkmWrA+EkuUEpADVjMi/WCbkd8Dywd++wLMJQVigflgZNCb7dh8aJc5n1cStpvK
	SDBr1qq8ID3ZYx6qlQgOQD1c/1JLzx2Q19oxN8yr0iNwZT2Q4zd2FjYpjiBLpidmC4drv/bVvyN
	heFJLE/MfeQUZb3NU4F0kOACdEJ/RxxN9I1/OZjMWNJkV6UumPzjk+TdnDoo5e4PKrTKKSxSGTT
	uZLx2TFgeS1hblN+7nFMTGuHXKnetRIkdlW+MgjY6inLvcKAUMJYlefCA5BapaqTF/FICrjoo68
	w9r6ArBrUZTDAF9vk7hfCMDT2zDIqHSFuXenv6vtyLnPZFbg/wozmcM1n/G9RdEOv1mj+h3vKP2
	25U+dmQlgNB2Cyu2DSUnrpqKpLx7J7vg5RNHN3cUfSKDxE6ARQQ4n2VYubapXZ8ctnIsDEMdDGH
	pfYIwuzpfArlvyJMIUkqagxJEm0B3K94N1F7WI2tohVTJwKPDLnw5ZjcJ92N72vRQkPv6dlPKgN
	x9dP7vWzGCA0dRL0LnshYYBSmuqvmej43cBpcpqd+eWjSYF0uCSC00PfwK9zIEKfj4OGJO03HY5
	eXgF0oCF3rwYbJe16xpPIOHtLyttcpCfP3kDKXFp/HeEpngda/Y/+iAX6W33tLu4cVm0SmvrVvY
	o=
X-Received: by 2002:a05:600c:3e0a:b0:49e:6050:9fbe with SMTP id 5b1f17b1804b1-4a18e49c52bmr318268005e9.15.1791997056758;
        Wed, 14 Oct 2026 09:57:36 -0700 (PDT)
Received: from localhost.localdomain ([37.167.99.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd680c83sm2701595e9.2.2026.10.14.09.57.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 09:57:35 -0700 (PDT)
From: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
To: linux-usb@vger.kernel.org
Cc: oneukum@suse.com,
	stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org,
	linux-scsi@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
Subject: [PATCH v3] usb: uas: validate status URB length before parsing the IU
Date: Wed, 14 Oct 2026 18:56:18 +0200
Message-ID: <20261014165618.33800-1-olivier.kaloudoff@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261013221937.41490-1-olivier.kaloudoff@gmail.com>
References: <20261013221937.41490-1-olivier.kaloudoff@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

uas_stat_cmplt() dereferences iu->tag without verifying that the
status URB actually carried a full IU header.  The transfer buffer
is a freshly-zeroed sense_iu, so a status URB that completes
successfully but with a short or empty actual_length — observed in
the wild during link-level upsets (Thunderbolt-chain xhci blips) and
on a wedging bridge — reads back as iu_id=0/tag=0 and produces the
misleading

  stat urb: no pending cmd for uas-tag 0

log spam seen e.g. on an ASMT135x enclosure and a Samsung T7, right
before the affected commands time out into the error handler.

Worse, this is not just log noise: a short packet that happens to
carry a plausible header is matched to an inflight command, and the
untouched bytes of the zeroed buffer then stand in for fields that
were never transferred — sense_iu.status reads as SAM_STAT_GOOD,
falsely completing the command, and response_iu.response_code reads
as RC_TMF_COMPLETE.

Enforce the IU header minimum before parsing the tag, then enforce
per-IU minimums before dereferencing: STATUS IUs need at least the
status byte, RESPONSE IUs need response_code; READ_READY and
WRITE_READY IUs legitimately carry only the 4-byte header.

Signed-off-by: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
---
v3: address Sashiko review — the bare header check still let a
    4-15 byte STATUS/RESPONSE IU match an inflight tag and read the
    zeroed buffer as SAM_STAT_GOOD / RC_TMF_COMPLETE.  Now enforce
    per-IU minimums (status byte / response_code) before
    dereferencing; READ/WRITE_READY legitimately carry only the
    4-byte header.
v2: use dev_err_ratelimited() so a device emitting a stream of
    short status URBs cannot spam the kernel log (per Greg KH).

    Tested: module reload + 16 forced disconnect/re-enumerate cycles
    under write load on ASMT135x (Alpine Ridge TB path) and Samsung
    T7 (AMD onboard xhci); compile-verified on 7.3-rc5 tree.

 drivers/usb/storage/uas.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index 265162981..4e099f4a3 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -315,6 +315,13 @@ static void uas_stat_cmplt(struct urb *urb)
 		goto bail;
 	}
 
+	if (urb->actual_length < sizeof(struct iu)) {
+		dev_err_ratelimited(&urb->dev->dev,
+			"stat urb: short transfer (%u bytes)\n",
+			urb->actual_length);
+		goto bail;
+	}
+
 	idx = be16_to_cpup(&iu->tag) - 1;
 
 	spin_lock_irqsave(&devinfo->lock, flags);
@@ -337,6 +344,12 @@ static void uas_stat_cmplt(struct urb *urb)
 
 	switch (iu->iu_id) {
 	case IU_ID_STATUS:
+		if (urb->actual_length < offsetofend(struct sense_iu, status)) {
+			dev_err_ratelimited(&urb->dev->dev,
+				"stat urb: truncated STATUS IU (%u bytes)\n",
+				urb->actual_length);
+			break;
+		}
 		uas_sense(urb, cmnd);
 		if (cmnd->result != 0) {
 			/* cancel data transfers on error */
@@ -363,6 +376,13 @@ static void uas_stat_cmplt(struct urb *urb)
 		uas_xfer_data(urb, cmnd, SUBMIT_DATA_OUT_URB);
 		break;
 	case IU_ID_RESPONSE:
+		if (urb->actual_length < offsetofend(struct response_iu,
+						     response_code)) {
+			dev_err_ratelimited(&urb->dev->dev,
+				"stat urb: truncated RESPONSE IU (%u bytes)\n",
+				urb->actual_length);
+			break;
+		}
 		cmdinfo->state &= ~COMMAND_INFLIGHT;
 		success = uas_evaluate_response_iu((struct response_iu *)iu, cmnd);
 		if (!success) {
-- 
2.47.3

