Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C74333442;
	Mon, 27 Jul 2026 08:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785141942; cv=none; b=niN4YrnFv8HNCs0t8Sg7xiKDjfk88O0jUIWdlUBFCNGJcnkDMX/Fyk2KM8qJQAuxhUt/97Zak9dZpKq4cdv2hD4WXi4aGCuZUJnO/q+UYneIIGE8Wyp7CCrCSjVuHrSLFIL3lSLA3unNdElxzlTrPSTD8WDv+3UKE2wfH7rfDb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785141942; c=relaxed/simple;
	bh=B4hOgD0R97s0zSf2lKkhvcdFwj3V1Wug4B7VlY2ZxuE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WC1HbruqHRMb01DR/Bs0OYS4dc+dVqYsQkUvnarWIn7DYxb0HwVFIn/9AkiUobk1XZ0tTAEPURX4yiSHqvs2SJUiLUsdAclMsnIuzdPAFj0ZtbuoVXWmISKlgxrpstChxN6fk462xlUAsbKOwSiOkA+vrM9zTdjF/4fCRkYtj54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HFN1D11D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HFN1D11D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8A91F00A3A;
	Mon, 27 Jul 2026 08:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785141941;
	bh=SCmGYQYvTEf351a469pe44RgiJyCzUCfUVrveP/GI5I=;
	h=From:To:Cc:Subject:Date;
	b=HFN1D11DivCImlY0/SMRRS43msSnwEjSBsWPeJA40cDJ+sYtSMk5zZGVKALL/aKdU
	 UtUtFAZRFQUZgrHdPL6yjKsGwXuStdY5GzB1IPjU7UxNwadNXbuBhYNhUMfXNrTO6C
	 Xhia/lC1XEWQ+qIA3MWIESqK8LJCUu6ODBtcHm3BG9Q5ImBm7sKYPkK4NBiD1/dV33
	 jEO0vJul90izJcpGFSXXkLH19vpu5KgG7z6F09fMFQ4FZQXPeQFRvUD2r1PnYeNwdK
	 g5Nd7qgEd0kFJ2cQx5Knu2l7lIgKHK5eAcudSR11rDtXnqJdW1OH00CGoJtozNvAXZ
	 s2sIRZCFw9J0g==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2] powerpc: Move CONFIG_QE_GPIO to SoC
Date: Mon, 27 Jul 2026 10:45:37 +0200
Message-ID: <9a7131d15a94e2017877e628f0e97f9aa2e0aae9.1785140877.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2442; i=chleroy@kernel.org; h=from:subject:message-id; bh=B4hOgD0R97s0zSf2lKkhvcdFwj3V1Wug4B7VlY2ZxuE=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWSlS229GLsr21EzqPmua63bu6XNpwWLtfwv7ot42Pxta ULxTI2pHaUsDGJcDLJiiizH/3PvmtH1JTV/6i59mDmsTCBDGLg4BWAi7EWMDM//Lg2rjf71ul1z 9/1Zm67yL7UOfsnCJFc+6bbMxMCMzNsM/0uL983c+T+eedXOxkl5mx+7+5zt2nbRZeLmVOE5Zs/ nybEDAA==
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit

Commit 7aa1aa6ecec2 ("QE: Move QE from arch/powerpc to drivers/soc")
moved QE into drivers/soc including gpio.c but left CONFIG_QE_GPIO
in powerpc's Kconfig.

Move it to SoC as well as it is the only place it is used:

  drivers/soc/fsl/qe/Makefile:obj-$(CONFIG_QE_GPIO)       += gpio.o qe_ports_ic.o
  include/soc/fsl/qe/qe.h:#ifdef CONFIG_QE_GPIO
  include/soc/fsl/qe/qe.h:#endif /* CONFIG_QE_GPIO */

There is also a dependency in USB subsystem for CONFIG_USB_FHCI_HCD:

  drivers/usb/host/Kconfig:	depends on QE_GPIO && QUICC_ENGINE

Because that USB driver selects CONFIG_FSL_GTM which is specific to
powerpc, it has to depend on CONFIG_PPC.

Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
---
v2: Add a dependency on CONFIG_PPC for CONFIG_USB_FHCI_HCD
---
 arch/powerpc/platforms/Kconfig | 8 --------
 drivers/soc/fsl/qe/Kconfig     | 8 ++++++++
 drivers/usb/host/Kconfig       | 1 +
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index c4e61843d9d9..2f797ac6f1b3 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -228,14 +228,6 @@ config TAU_AVERAGE
 
 	  If in doubt, say N here.
 
-config QE_GPIO
-	bool "QE GPIO support"
-	depends on QUICC_ENGINE
-	select GPIOLIB
-	help
-	  Say Y here if you're going to use hardware that connects to the
-	  QE GPIOs.
-
 config CPM2
 	bool "Enable support for the CPM2 (Communications Processor Module)"
 	depends on (FSL_SOC_BOOKE && PPC32) || PPC_82xx
diff --git a/drivers/soc/fsl/qe/Kconfig b/drivers/soc/fsl/qe/Kconfig
index eb03f42ab978..b35a8fd30ebf 100644
--- a/drivers/soc/fsl/qe/Kconfig
+++ b/drivers/soc/fsl/qe/Kconfig
@@ -67,3 +67,11 @@ config QE_USB
 	default y if USB_FSL_QE
 	help
 	  QE USB Controller support
+
+config QE_GPIO
+	bool "QE GPIO support"
+	depends on QUICC_ENGINE
+	select GPIOLIB
+	help
+	  Say Y here if you're going to use hardware that connects to the
+	  QE GPIOs.
diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index b3b1ec696bf5..10cff12a3f31 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -611,6 +611,7 @@ config USB_UHCI_ASPEED
 config USB_FHCI_HCD
 	tristate "Freescale QE USB Host Controller support"
 	depends on QE_GPIO && QUICC_ENGINE
+	depends on PPC
 	select FSL_GTM
 	select QE_USB
 	help
-- 
2.54.0

