Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B197E3CD8BB;
	Wed,  3 Jun 2026 15:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499837; cv=none; b=C7T0LqrgiafjBrqkLCWT4B4lGR3eWAqCgVtTOsSsW9lisbbct+Fu1CbeT55gk4K86Equmt/9jzzC96TnU4TAFQhVIm7PYMCqJSAcA3Y+yWhna1/fIHLSM259L8UN17Keg+szis46GpmgZUVkkZhpZ0Iik5Y0AFk3EH2j9jGTlTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499837; c=relaxed/simple;
	bh=GLevFBQM6mMzx5h9g9LYYW3nlsStFpyOJ+lARZz8h1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jQ75Ye47kB4ldgNHlEgBQkShdvEtBF/ueqqe0/PAnJuOQSG6XOwQczXl4AQmzjaEoa7blKZM7e3nJuZ42Kk9PiwfA+1IbL0aDfZ6stMiG/6T0Prsw4XzXLn+WX1xrSjXghD5aS+elpUpxvvsbn+hNggT3P/nGFf0GSiXeF/gJ/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF58E1F00893;
	Wed,  3 Jun 2026 15:17:14 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] usb: host: xhci-rcar: Remove SET_XHCI_PLAT_PRIV_FOR_RCAR() macro
Date: Wed,  3 Jun 2026 17:17:09 +0200
Message-ID: <a7083c3c822837556b91d845bd449c099db64769.1780499433.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780499433.git.geert+renesas@glider.be>
References: <cover.1780499433.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SET_XHCI_PLAT_PRIV_FOR_RCAR() macro does not add much value (there
are only two users), and stands in the way of handling differences
between R-Car Gen2 and Gen3.  Remove it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/usb/host/xhci-rcar.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
index 8a993ee21c879bfb..d2efc98090ce0053 100644
--- a/drivers/usb/host/xhci-rcar.c
+++ b/drivers/usb/host/xhci-rcar.c
@@ -213,19 +213,20 @@ static int xhci_rcar_resume_quirk(struct usb_hcd *hcd)
  * long delay for the handshake of STS_HALT is neeed in xhci_suspend()
  * by using the XHCI_SLOW_SUSPEND quirk.
  */
-#define SET_XHCI_PLAT_PRIV_FOR_RCAR(firmware)				\
-	.firmware_name = firmware,					\
-	.quirks = XHCI_NO_64BIT_SUPPORT |  XHCI_SLOW_SUSPEND,		\
-	.init_quirk = xhci_rcar_init_quirk,				\
-	.plat_start = xhci_rcar_start,					\
-	.resume_quirk = xhci_rcar_resume_quirk,
-
 static const struct xhci_plat_priv xhci_plat_renesas_rcar_gen2 = {
-	SET_XHCI_PLAT_PRIV_FOR_RCAR(XHCI_RCAR_FIRMWARE_NAME_V1)
+	.firmware_name = XHCI_RCAR_FIRMWARE_NAME_V1,
+	.quirks = XHCI_NO_64BIT_SUPPORT |  XHCI_SLOW_SUSPEND,
+	.init_quirk = xhci_rcar_init_quirk,
+	.plat_start = xhci_rcar_start,
+	.resume_quirk = xhci_rcar_resume_quirk,
 };
 
 static const struct xhci_plat_priv xhci_plat_renesas_rcar_gen3 = {
-	SET_XHCI_PLAT_PRIV_FOR_RCAR(XHCI_RCAR_FIRMWARE_NAME_V3)
+	.firmware_name = XHCI_RCAR_FIRMWARE_NAME_V3,
+	.quirks = XHCI_NO_64BIT_SUPPORT |  XHCI_SLOW_SUSPEND,
+	.init_quirk = xhci_rcar_init_quirk,
+	.plat_start = xhci_rcar_start,
+	.resume_quirk = xhci_rcar_resume_quirk,
 };
 
 static const struct xhci_plat_priv xhci_plat_renesas_rzv2m = {
-- 
2.43.0

