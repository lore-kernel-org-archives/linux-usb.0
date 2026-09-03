Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A1F325726
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 03:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788404645; cv=none; b=f4BW5EoO+ddeO0l7Pm03+6du/xcbiaf2+25BKmac7Ska21jxp2UxtxYtfMHGlFYLSdRCkt/eNqShPqy8O3zrG9CXs2IEE84hYbBPhR64xrUgJ3JClqK6Xb1DCqWN1dfuyNR/x/6H7C1FqShKQHkpskDSIKk7gDPEWhRSnthm2P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788404645; c=relaxed/simple;
	bh=SrZXygJepTk1Ejs3kV6d77D2oS8arUCd1jEoUprnIqg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sNeBczF6hIRudKfX5WLQ5nnHl2l9ubS2/N7ByYvZpATA/JnwXssmsZZWaQONEOJB5oDiyd7yWJSWWx4ooN0pBa22HBJpQbJl/X4379FLd8VVrbl3bXKu2AYLY0l6tTK1VVP1zQ0ajdsWyO3l/0JxD3TMbjCzYAlycsQWMeRVTTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ORURSXF1; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ORURSXF1"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c664b8c3f3so1673755e0c.0
        for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2026 20:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788404642; x=1789009442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/i6ovSifHBTQLlkj4+YtxhWpGxWylHtU+j/C4X9Td7k=;
        b=ORURSXF1aTd/Aa/PwjhYUx1DeIds8cPNknmOm2dvTpONSD4NBhTOQIgjouW8oLdL2b
         fYcdOskbkYYBPsyWlDW7pt+ZojyVeNUjCtGP7OllH0PlANIZg5TvSObJk2yBcEiXev+t
         00c014juiRSKHr13V7gs4pyUx/3el8PcfhiHQiiGtAvkRWttKxh2m7HRTeTcRh5CT2Ij
         DGikq4bn/z6dcPjDN5uGHF/nVvQUKYdw0snTVbfKMCF8nnmwnqElLT7TABEKRZxE8Bke
         yqvqcH4kjM7WCAXU0nsPb+Ee8RJx9x5USrVETwqVZQ6FMbfmLgADiU2NW823NKcSDSDl
         f7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788404642; x=1789009442;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/i6ovSifHBTQLlkj4+YtxhWpGxWylHtU+j/C4X9Td7k=;
        b=jSoHVXVWRBOHCXZetlHH4Kjm2cp/AKFurRFbdBfhoDfSGc+y/jDOLiUaeB98eZXFyp
         EUfXeSVa32NK4AquWkvsNQamPt/JIkb6WupwNN8guJU6GqDkVvwqwDiP+UsrBj8RpXzv
         hFl3bfEDtDALTbOcxSmp+D/DbtPqjKWdRNZ0kBZrah/it4/5XAi229coaQoAPnxoA1wz
         YSwCi6e79K0PErELFADgWiogoDFGfCuwzK7iMOe/imk4rxitMrpE9FhfsRV79O76zCKn
         xwZMLyHxs/Vgmjdc2bagF5qEjqVkrkgBQQSjj58ilx/ZIFz+jODfRkJBTk5eC6Wx5bPj
         MizQ==
X-Gm-Message-State: AFuF++ls/mTYg1QDk7o9FrNccDlinPf0U6fa5OSyUKsIj5UIRLnBLg6e
	P0ht+T6fscwGdxRK5XhdNEE4RgOlUw1aJ6Hyc0lMQ6H3ixArHSaC1i19
X-Gm-Gg: AYBFou0Ow9xkHiZqXHE9wb14JV3naN+y96q1lmcime6LQ7+nQ48VylxwRhLASUq16C+
	CunGSUW1CzPVwi2sFokgKwBThZdH6Iaw6UYXvRfmmnDTL34ciq7iKHP5OFCgSGaPWkiuF3Nu6nA
	7u/v2ImI+2jzUVlMBH91qkAJ3aEGywdkxmrRierFMD8SZgvCGG2Qgu/IL9De1lj8Lyc3Renbz+I
	fTaOq3Gk25sknHJzI2BFZtset/R33Gyo8FhbyRDlqLa6PMhZjPhi9S0z0YxkJsDYa1eSucEOkC0
	bMBAHhI9voBRoFGuJtMdlgAVFC6CYScKdEuZjYdIQgfKM44WoRLjJUuB3mp0onq6avAjuJUzhqI
	MReCkSnvR8T3o6crtofk+7fPOJ86/RXRXkRAsxXM/hDq4HWh8P9b6pDGTxcyTmIKzGSs4UiX8L7
	Q+0aEEQVEw0g5Ma428TEOQxynsGlhLfyx9KwLUBCyqNbPbQHr5W9yXdQ==
X-Received: by 2002:a05:6122:c91:b0:5c7:ac2a:770 with SMTP id 71dfb90a1353d-5c7d24672a9mr4256735e0c.2.1788404642563;
        Wed, 02 Sep 2026 20:04:02 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7cd73a477sm3534342e0c.1.2026.09.02.20.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 20:04:01 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH] usb: typec: ucsi: fix teardown races with late notifications
Date: Thu,  3 Sep 2026 00:03:56 -0300
Message-ID: <20260903030356.58597-1-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ucsi_acpi_remove() freed the UCSI instance before removing the ACPI
notify handler. A concurrent notify could call into ucsi_acpi_notify()
and use ua->ucsi after it was destroyed.

Clear ucsi->ntfy before disabling PPM notifications and NULL the
connector array after free so ucsi_connector_change() cannot schedule
work on a dangling connector while a backend still delivers events.

Tested: built drivers/usb/typec/ucsi/ with CONFIG_TYPEC_UCSI=m and
CONFIG_UCSI_ACPI=m via docker kbuild; checkpatch clean.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi.c      | 11 +++++++++++
 drivers/usb/typec/ucsi/ucsi_acpi.c | 11 ++++++++---
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index bef3f9b71d71..3395614764cf 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -2369,6 +2369,15 @@ void ucsi_unregister(struct ucsi *ucsi)
 
 	ucsi_debugfs_unregister(ucsi);
 
+	/*
+	 * Stop accepting connector-change events before the PPM disable
+	 * command and before freeing connectors. Backends may still deliver
+	 * a late notification (e.g. ACPI) until their own handler is removed;
+	 * with ntfy cleared, ucsi_connector_change() returns early instead of
+	 * scheduling work on a connector that is about to be freed.
+	 */
+	ucsi->ntfy = 0;
+
 	/* Disable notifications */
 	ucsi->ops->async_control(ucsi, cmd);
 
@@ -2382,6 +2391,8 @@ void ucsi_unregister(struct ucsi *ucsi)
 	}
 
 	kfree(ucsi->connector);
+	ucsi->connector = NULL;
+	memset(&ucsi->cap, 0, sizeof(ucsi->cap));
 }
 EXPORT_SYMBOL_GPL(ucsi_unregister);
 
diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 18286d3e9cc5..5fc485121dbb 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -256,11 +256,16 @@ static void ucsi_acpi_remove(struct platform_device *pdev)
 {
 	struct ucsi_acpi *ua = platform_get_drvdata(pdev);
 
-	ucsi_unregister(ua->ucsi);
-	ucsi_destroy(ua->ucsi);
-
+	/*
+	 * Drop the ACPI notify handler before tearing down the UCSI instance.
+	 * Otherwise a concurrent notify can race into ucsi_acpi_notify() and
+	 * use ua->ucsi after it has been freed.
+	 */
 	acpi_remove_notify_handler(ACPI_HANDLE(&pdev->dev), ACPI_DEVICE_NOTIFY,
 				   ucsi_acpi_notify);
+
+	ucsi_unregister(ua->ucsi);
+	ucsi_destroy(ua->ucsi);
 }
 
 static int ucsi_acpi_suspend(struct device *dev)
-- 
2.43.0

