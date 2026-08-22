Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992063749E1;
	Sat, 22 Aug 2026 07:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787384913; cv=none; b=MH16cy6+k6VBFB9+HREHymdZQ+mCjFgT2aaVl5j/m9Y2FnLnRSLDwKrsm23WavZFWNib+pUs2ztgqt4/Dki3nknzLAu7Mrf3eLwdRQHdhG3M9+m5yeQgi47F1+yHebWIaIhqVbq9uQLe2tcobSkAkayzT3CtsHhwEoamFlY/SXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787384913; c=relaxed/simple;
	bh=j8LXrFYW4d9S3cRqe8esKd7i5DbgIpg2FiLnU42dMnY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MpjNh4howcBS8IOoOrB3c3FDNMlxvQmeZQxt+z2RlqNIv7hRfoN9CE6ZtlGAXDnYV/rMqeHYJyU2d3IMMHEsA0WBP3T1ayqQUi1szl/cN3ZzTXJdXhh7sVO+att8Rf+G9Ipracwt6jEYAQvOmC8hFhHtG/cxWxYGyK4RO/C56w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=QDKqKIci; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="QDKqKIci"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 736C011C80D;
	Sat, 22 Aug 2026 09:48:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787384905; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=ApgKLGERBQ+N6zwIr4Wb6+GNo707nJxKKU4VrpSyuZo=;
	b=QDKqKIciwavWcNQf5Jm8iI6sIaNCwaVPj3CjCK8tLa/xPVQue/j4pB1j9JrfnNPrMYePqa
	ES6qm0/orPkUjp3FCDy7SnhQRX8/sa12YJoxweyvta6S+Fffvca1eNEPJcEzrBprY/PUrb
	8wKYlNE0Sh4bx8Xo1G8PEQ2O/c7dt5QwnnPt+8TXQDV6JG/F7dN+LJV3+Y+DhodmDFVP2W
	GMZo8oEXcsUJ817/7PTzO09QOr2rot/3IGyWFT50jY0G+W32ETtGbkHkwtIMZGqJFHh4Hv
	3vhNlF8fHhrf7m7S9bqlRJtE54M/s+QgpCC6dkfdV/+OfZIUihVqyS6TSXtamQ==
From: Marek Vasut <marex@nabladev.com>
To: linux-usb@vger.kernel.org
Cc: fabrice.gasnier@foss.st.com,
	Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
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
Subject: [PATCH v3 0/9] arm64: dts: phy: st: usb: Add STM32MP2 USB support
Date: Sat, 22 Aug 2026 09:46:33 +0200
Message-ID: <20260822074816.548662-1-marex@nabladev.com>
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

 .../bindings/arm/stm32/st,stm32-syscon.yaml   |  24 +-
 .../bindings/phy/st,stm32-usb2phy.yaml        |  67 +++
 .../devicetree/bindings/usb/generic-ehci.yaml |   3 +
 .../devicetree/bindings/usb/generic-ohci.yaml |   3 +
 .../bindings/usb/st,stm32mp25-dwc3.yaml       |  97 +++++
 arch/arm64/boot/dts/st/stm32mp231.dtsi        |  67 ++-
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |  65 ++-
 drivers/phy/st/Kconfig                        |  10 +
 drivers/phy/st/Makefile                       |   1 +
 drivers/phy/st/phy-stm32-usb2phy.c            | 406 ++++++++++++++++++
 drivers/usb/dwc3/dwc3-generic-plat.c          |  44 ++
 11 files changed, 781 insertions(+), 6 deletions(-)
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

