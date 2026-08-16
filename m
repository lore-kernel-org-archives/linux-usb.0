Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53F63D2FE1;
	Sun, 16 Aug 2026 21:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786916354; cv=none; b=IiuzFWBy8FPK50jUiFR0uSpgcOU0Dv1Se2WEnA3pV7l1zG+21ill3ZsI6fo6v0zWdCdHyXXHZPw6/ThuZfSDYG05yixoOTne3qqPnutZ/1ZsWZtI7uiHgySZEsLVIz4BhTnTlKw883uXgtpXDBclKtIqK4ovN+aFv2YbiMdPtY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786916354; c=relaxed/simple;
	bh=MA8MevUYY8ALkniLzhXFIeuVVJHVUdjFcPsHj0K7D6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LzJ3HRdIPb03s8mCfczwyJ0yxlGv8iJXS6+hJTFdlHVEOCBSpUQ0U3z/rX+2Ps3aP4DwFL5FGxBW8Bn77+vLW+uUXkF2v4LLsc5pi9pExF3NF+JxLOlOafwB+uMAnfmN1s98fgY4a8/DSCUTlnhKxCeMhQ/cLoCK3nzv2DJK2qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=XOIUTmIU; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="XOIUTmIU"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B360311C019;
	Sun, 16 Aug 2026 23:38:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786916340; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=ip7IdjXpbTEeQtpgf2f2+OGWRKdS1gcsDSa0BlUX+KU=;
	b=XOIUTmIUxl/DqvjJpR1nE8U/RUOpYhlbUN+4T7+ENF4+546kRJlhejTar7pkICTFh6acro
	WyGqIAhfkmeq0+KXDiFBLDmeup6DF6KeT64pVUVn8AwlFuVXpmd2Usk9WPdXPyqfq/bNGQ
	dkFB/0wzpBnn0gdpM/RZV4FQ5nlk/1AUkKeUaLVE1vKc+aQPr2MPcpkJmFRoQq8eJTnJhz
	eyr1RSkEmNeCwYoiN5+ez9V9a6a1ucQhb7Yvc+juDoZMBKX4Khj23evYdXcjOYtYyAVdcG
	CWJDEWpCK4Ias1lNJtW3rZYP6yHkHkL6aSZAFavVSKu5qdlah8Ziew31RFGH9A==
From: Marek Vasut <marex@nabladev.com>
To: linux-usb@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pankaj Dev <pankaj.dev@st.com>,
	Rahul Kumar <rahul.kumar05@st.com>,
	Rob Herring <robh@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 0/9] arm64: dts: phy: st: usb: Add STM32MP2 USB support
Date: Sun, 16 Aug 2026 23:37:02 +0200
Message-ID: <20260816213849.1044073-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add USB support for STM32MP23xx/STM32MP25xx SoCs. This includes USB 2.0
FEMTO-PHY driver, DWC3 glue code and DT adjustments. Parts of this are
taken from ST downstream kernel fork, reduced, or rewritten, since not
all of the content there was useful and bits which might be missing and
are useful can be added later.

Unlike the downstream implementation, the DWC3 glue code is using plain
dwc3-generic-plat, the EHCI and OHCI controllers are instantiated as
plain generic controllers without any wrapper glue driver, and the USB2
PHY driver is simplified.

Both USB 2.0 Host controller and DWC3 super-speed controller are tested.

Marek Vasut (6):
  dt-bindings: usb: generic-ehci: Document access-controllers property
  dt-bindings: usb: generic-ohci: Document access-controllers property
  dt-bindings: usb: dwc3: Document ST STM32MP2 DWC3 xHCI USB controller
  usb: dwc3: dwc3-generic-plat: Add ST STM32MP2 DWC3 xHCI USB controller
    glue
  dt-bindings: arm: stm32: Switch st,stm32mp23/25-syscfg into simple-mfd
  arm64: dts: st: Add USB nodes on stm32mp231

Pankaj Dev (3):
  dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO PHY
  phy: stm32: Add support for ST STM32MP25 USB2-FEMTO PHY
  arm64: dts: st: Add USB nodes on stm32mp251

 .../bindings/arm/stm32/st,stm32-syscon.yaml   |   7 +-
 .../bindings/phy/st,stm32-usb2phy.yaml        |  73 ++++
 .../devicetree/bindings/usb/generic-ehci.yaml |   3 +
 .../devicetree/bindings/usb/generic-ohci.yaml |   3 +
 .../bindings/usb/st,stm32mp25-dwc3.yaml       | 108 ++++++
 arch/arm64/boot/dts/st/stm32mp231.dtsi        |  81 +++-
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |  65 +++-
 drivers/phy/st/Kconfig                        |  10 +
 drivers/phy/st/Makefile                       |   1 +
 drivers/phy/st/phy-stm32-usb2phy.c            | 361 ++++++++++++++++++
 drivers/usb/dwc3/dwc3-generic-plat.c          |  44 +++
 11 files changed, 751 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml
 create mode 100644 drivers/phy/st/phy-stm32-usb2phy.c

Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christian Bruel <christian.bruel@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Pankaj Dev <pankaj.dev@st.com>
Cc: Rahul Kumar <rahul.kumar05@st.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Rosen Penev <rosenp@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org

-- 
2.53.0

