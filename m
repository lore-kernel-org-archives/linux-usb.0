Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2494227EA4
	for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 00:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781743862; cv=none; b=DrTjFFEF81mxbviPHbLwanKz3Q82tUstqJTRUEQPMR+bNtUtlJ/x0RLzGfJMsAUZ7qcR6rIfBOK0Koq3Q+bz8TvBVQXiFqG8LCavTtUZNNWE8yojLG29kUpMjDgTV6Rv4yi87eU0vE7lgWn9ZcyKvk+HuOI96LEPd5bT46HgLTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781743862; c=relaxed/simple;
	bh=9K8qgk/LMttc2MgVGpvjYfByG6bYbc/nsrauWvt3a5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CLypzZ35kUj4pnFY7n47vkCAz7FosLPGKQevmfNTz5RUfyQXUwL4lfFWq6XNbp6MomdsF+VXczN0d7to//wZSIy+fQ34Pkcgug6eBL/9HgM5PrUqbRg1MSeKu//FHoVd89PxVScQXVOJ2aRy1YwC6UsorxK39ozQ3vlbV2SPz7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifudc6/I; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifudc6/I"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5176bbb9384so3654991cf.1
        for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2026 17:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781743860; x=1782348660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7wO4sURN+GahEQcQ1tMouM3s3UB4GKLHDxd5/uWIVfM=;
        b=ifudc6/ITgQptEPy0NiFqCX092YNvUqPkBpxdbGY0mfVklEcx1S9J1C4pSa7LKlTMK
         eWilRCZQQTRj5kluNRZjvjGfcRpl2lwjd3h296jI5oL6VhNygiruM4YArWPX5vwtNv1q
         /89E/nfx5nCeQrptPkXRewXWgot1yV9q4AeNVzqYQ4m4GsKP4UV0+8f3hLGxiGKJdovm
         f2RLgptbTSJ7DNv+eZ1TJXKmScYEwOsPi7V9uoDVc/m7m9rpih6qthB4ZJTrFT3lqx6c
         BJoFfxfo336sak8YqnqZKsvjXtpm4U8XLtKl8EEhAzeTJbWl3pn8KuS1ylVpduHKg8Rj
         Z5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781743860; x=1782348660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wO4sURN+GahEQcQ1tMouM3s3UB4GKLHDxd5/uWIVfM=;
        b=sRufqsf/5nxSXidl0XJnsf6nMtv/NUzWtDw4E79THvTzZc4sv7fsf2a3006dLgg+ro
         /v2YAntlXtGSBZtM3Wmh+K8pPCzZHEp/BjBJfSUHVi1dWRQQHrybe9c0FjMFzvPbWtHr
         +rW5s64xwGPdT3HG3043aJFFPKOMjQVynRuFvMxO8mqtNpxEp/i+uaLAdntqyslO0Hym
         3G3b3dwjm86s3KjtelZA9Kw/A09p0toqTtyx2y7wzMXtyLfWPkmzD8WsLTErt3iftQ4M
         BmiZLew6SD++vbnCCvK/KCsPPQWlC3HOuykDF9g/p9tvDTwY3f/4/16MQNl6RwjSz0NL
         KtBw==
X-Forwarded-Encrypted: i=1; AFNElJ/6qbRYkYPCxIf6Zll3qfBCMMfUbPcNAt6zgquzUWRCZq0hmvwLArUCNdmqNVpobx0pJbSPDPiOFpw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE3Qnj8WiEp1rtoJVFfYROSWrI0qPhbI+6NUZ6vxeGs5Stev8c
	DbmzG4L6pfWwAwKqbRbhIFpqjXE4jKddZKfBfOeDoq1JP9NuNHHUIQ30
X-Gm-Gg: Acq92OGZDSYL4dOT4FwBtLU62itGhzXr5YcZ484zjV7CEt3cnncAs7fLvSjOlcjIqzW
	CaftqDJJu13IgWlykzVDeyW1Zn05D69b3XeziqtkK8PzLpFMb9bQVuW98x/+7TiuCkiizOSInNS
	cMP2vQJ/VD9a0jFbdnueF/8TzpKmm+9pdIVYjqa6NoGBigqWz8tlRpDKM5AxcLzRF1SnaBgXCXx
	eFUNi9XYPh2M02VyJ7C/z7ZLdXyhSDBTufthMdI7WH2m+mHSK1+SD2ObYcw/yltBT+ZZK9iujCN
	Ft+3iddnZv1ZNKD9FiC1MbU+NZrC0OWnwSnlCV84DfAu/aN7OnqrdMlGJQ/voVVb+022SNQEUqe
	JsM14QAG7FhkzYPJ2mybIUEPMdKC8Og7e8Uqa6TgSEyceYkTVAoqcLLcl/i87cIVEU/D0pJ965s
	p9Yobv12idHtDMz47PnHo2UP36V0fvftVDRisNcUP5CcxvBR+NXp671q8YMjX36D6JH/lecjHLY
	qIpHx/gx5uvKbDplTLIa72JcR4b6I+c
X-Received: by 2002:a05:622a:1392:b0:519:5208:1fc3 with SMTP id d75a77b69052e-519a8fe823fmr98322311cf.42.1781743859800;
        Wed, 17 Jun 2026 17:50:59 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb642740sm181646011cf.7.2026.06.17.17.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 17:50:59 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stefan Agner <stefan@agner.ch>,
	Krzysztof Opasiak <k.opasiak@samsung.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: configfs: fix out-of-bounds read of qw_sign
Date: Wed, 17 Jun 2026 20:50:43 -0400
Message-ID: <20260618005043.1581707-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

os_desc_qw_sign_show() passes OS_STRING_QW_SIGN_LEN as the input
length to utf16s_to_utf8s(), but that argument counts UTF-16 code
units while OS_STRING_QW_SIGN_LEN (14) is the byte size of qw_sign[].
The array holds only OS_STRING_QW_SIGN_LEN / 2 (7) code units, so the
conversion reads up to 7 units (14 bytes) past the end of qw_sign[]
into the following members of struct gadget_info when the stored
signature fills the array without a NUL terminator, exposing those
bytes through the configfs attribute.

The store path halves the count for its input bound but passes the
full byte count as the utf8s_to_utf16s() output limit; use the
destination code-unit count in both directions.

Fixes: 76180d716f91 ("usb: gadget: configfs: make qw_sign attribute symmetric")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 drivers/usb/gadget/configfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Notes:
 - Build-tested: drivers/usb/gadget/configfs.o, x86_64, gcc, W=1,
   CONFIG_USB_CONFIGFS=m, 0 warnings before and after the change.
 - The over-read stays within the struct gadget_info allocation
   (qw_sign[] is an inline member), so KASAN does not flag it; the
   fix removes a read past the array bounds, found while auditing
   UTF-16/UTF-8 conversion length units tree-wide.
 - Behaviour: a 7-code-unit qw_sign stored without a NUL terminator
   previously rendered trailing bytes from the adjacent struct
   members; it now renders exactly the stored signature.

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 183a25f65ac89..dd6d6b11199e0 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -1177,7 +1177,7 @@ static ssize_t os_desc_qw_sign_show(struct config_item *item, char *page)
 	struct gadget_info *gi = os_desc_item_to_gadget_info(item);
 	int res;
 
-	res = utf16s_to_utf8s((wchar_t *) gi->qw_sign, OS_STRING_QW_SIGN_LEN,
+	res = utf16s_to_utf8s((wchar_t *) gi->qw_sign, OS_STRING_QW_SIGN_LEN / 2,
 			      UTF16_LITTLE_ENDIAN, page, PAGE_SIZE - 1);
 	page[res++] = '\n';
 
@@ -1199,7 +1199,7 @@ static ssize_t os_desc_qw_sign_store(struct config_item *item, const char *page,
 	mutex_lock(&gi->lock);
 	res = utf8s_to_utf16s(page, l,
 			      UTF16_LITTLE_ENDIAN, (wchar_t *) gi->qw_sign,
-			      OS_STRING_QW_SIGN_LEN);
+			      OS_STRING_QW_SIGN_LEN / 2);
 	if (res > 0)
 		res = len;
 	mutex_unlock(&gi->lock);
-- 
2.53.0

