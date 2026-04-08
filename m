Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AAE3ACA45;
	Wed,  8 Apr 2026 10:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775643521; cv=none; b=gLllG+rkDnZsINTURyFfrDBezMN/eNtxMFHndNuljCpPX1OPwmPGf38V0j7K733dMR+uemjO7br6/tMrmEpgIqjatrVtBvQdPgTsxjdI/1r4m5gYnX6FDd5ob4VefE+gMY3Ff84Gr9imZ2wPmO9JgJO+LZqBxlYVx2i/9K0RxnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775643521; c=relaxed/simple;
	bh=UuUxcXibHZwJGvLDN/TXRPkyHxcG9/Bc/oK8CzH8TDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iTp4EZa2sNAzNIqsUs4tGDaagwPe2Y0F9LAm3Rv551ZSNw+MGu/Q+gFLBdVPZQwWqd44ppGVyrXbgDf66VSbEhOax4vUZc2qqBhI6NWhZmJVuc5ymX62c6qJGxtBqTfoC6M0OZB1nBcy9ohmN9dxCX70uaaDaPxTYvYTw7ihsaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EpzjG1fZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EpzjG1fZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0874EC19424;
	Wed,  8 Apr 2026 10:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775643521;
	bh=UuUxcXibHZwJGvLDN/TXRPkyHxcG9/Bc/oK8CzH8TDw=;
	h=From:Date:Subject:To:Cc:From;
	b=EpzjG1fZ8FiO6Z6WwtsQOMRB6zJlZylmRAHLdJ65dO2USbKAM+ZFTzihcdu6A6hS6
	 MI2QKS1yZPFw4BDGrUaWN+CFak8OQaN3z/PAxy8IsZijRxpsOI+sjb/NquM86EYt72
	 gG8OS6latHJZ7zZUFOL0tDg+FfeDXCh9qAUq1QIfyDpBOhS8QVyAvdwUNiSlyaKYIZ
	 ols1Urg4b6cuuQ+hUx+nzLURxELwXmpK9rtxAfhaeH8fk/Y8dmrLVPKnLz6SXQcqAH
	 ZT0MzTf5E2NNw8Wv3CVQ+3MpMbvyCFIbaIPi4jaLOQTgr6jqQzSYwzmPcbyhNryUoI
	 GFndntxXFMETA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 08 Apr 2026 12:18:01 +0200
Subject: [PATCH] usb: typec: ucsi: Add quirk for repeating SOP altmodes
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-topic-repeating_sop_altmodes_x1-v1-1-1368efd3daeb@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NQQqDMBBA0avIrBtIohT1KlJCOo460CYhEyQg3
 r2hy7f5/wKhzCQwdxdkOlk4hgbz6AAPH3ZSvDaD1fapBz2qEhOjypTIFw67k5ic/5RvXElcNQo
 3MyH2o3kPFlolZdq4/g/L675/xbArK3EAAAA=
X-Change-ID: 20260408-topic-repeating_sop_altmodes_x1-cf19cc381b42
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: usb4-upstream@oss.qualcomm.com, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775643518; l=2986;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=PMjcpXoSN286wKZrHoVU+BQT4L8sjPlnOwo2GCqlhA0=;
 b=t7bza7reQqM1mf0lPEU3waNvU2eh3JwOZtUY2wXVcZDApkENFfUC4FaTslFHRIlviJmtzgmbz
 2EM0GT5xJ8TBvSOXfI6/IVf8ClIhJdVZwyuIWpJPn4Y0LkJbcgMy0MY
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Firmware on at least the Qualcomm X1E80100 SoC ignores the offset and
number fields of the GET_ALTERNATE_MODES command (with the recipient
set to SOP specifically), resulting in the UCSI core getting a payload
containing _all_ of the supported altmodes over and over and over again
(15 times 2 modes in total).

This leads to a number of 'already exists' splats from sysfs, as the
code tries to repeatedly register the same modes, with the same VDO and
SVIDs, most notably when connected to a TBT3 device that also supports
DP altmode.

Since this problem is isolated and the firmware can not really be
updated, work around it explicitly.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi.c       | 4 ++++
 drivers/usb/typec/ucsi/ucsi.h       | 2 ++
 drivers/usb/typec/ucsi/ucsi_glink.c | 4 +++-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index f6bb88b1ccee..88107af5f27a 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -632,6 +632,10 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 			if (ret)
 				return ret;
 		}
+
+		if (recipient == UCSI_RECIPIENT_SOP &&
+		    con->ucsi->quirks & UCSI_REPEATING_SOP_ALTMODES)
+			return 0;
 	}
 
 	return 0;
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index cff9ddc2ae21..1dcf8343d00a 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -500,6 +500,8 @@ struct ucsi {
 
 /* USB4 connection can imply that USB communcation is supported */
 #define UCSI_USB4_IMPLIES_USB	BIT(2)
+/* GET_ALTERNATE_MODES ignores OFFSET field for recipient == SOP */
+#define UCSI_REPEATING_SOP_ALTMODES	BIT(3)
 };
 
 #define UCSI_MAX_DATA_LENGTH(u) (((u)->version < UCSI_VERSION_2_0) ? 0x10 : 0xff)
diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 12e07b9fe622..358b69db71b7 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -371,7 +371,9 @@ static void pmic_glink_ucsi_destroy(void *data)
 static unsigned long quirk_sc8180x = UCSI_NO_PARTNER_PDOS;
 static unsigned long quirk_sc8280xp = UCSI_NO_PARTNER_PDOS | UCSI_DELAY_DEVICE_PDOS;
 static unsigned long quirk_sm8450 = UCSI_DELAY_DEVICE_PDOS;
-static unsigned long quirk_x1e80100 = UCSI_DELAY_DEVICE_PDOS | UCSI_USB4_IMPLIES_USB;
+static unsigned long quirk_x1e80100 = UCSI_DELAY_DEVICE_PDOS |
+				      UCSI_USB4_IMPLIES_USB |
+				      UCSI_REPEATING_SOP_ALTMODES;
 
 static const struct of_device_id pmic_glink_ucsi_of_quirks[] = {
 	{ .compatible = "qcom,glymur-pmic-glink", .data = &quirk_sm8450, },

---
base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
change-id: 20260408-topic-repeating_sop_altmodes_x1-cf19cc381b42

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

