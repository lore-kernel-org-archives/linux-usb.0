Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B15319CC0F;
	Wed, 12 Aug 2026 01:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786496558; cv=none; b=Y80QuRfK+tx65lhrlb9B1lr5W3YAKTCqLeHBAAs42nXSDjUk8n5Lz83FajUjI2i/2HKfANksm1nxfvcjwfWDg/JrI/TNYRrS/QoVcdtVUIWx+R8eNvhPwgpbicSMEdjvL0IJqIFR6XnA1dUTA74UIXrV3ssSh2OMzVuWrbji4bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786496558; c=relaxed/simple;
	bh=T/6sX2xdcsqwfL2ZOi9Wv+/hxmdpQDlYI2um12MlG+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ABBgoRGVeziX1RkcUqC4HHLsrjme5VxDnCslxn6KujFL3MQkSkEsicEotVEd3+zmW+UF/uYvNhmkk/LzGAf/rHHZzUlYS3Fi3RZon9SuUPVLhVPaBRw+RSRMf/sHBUzpJPcGN6E4l6cMBBdzMiIfgosC4HAN/ofToauzaEj9Eqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=EFYrinV3; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="EFYrinV3"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B45B111A03D;
	Wed, 12 Aug 2026 03:02:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786496549; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=PfgDafVpcYcIsx/y/Mtz5wPBNsA0Bqi65/JdgQqh0iY=;
	b=EFYrinV3BEapm6M2XOHJBjrJ2IA4vSaRhrSmC3sLGx7r+x4bZk7Z5LZQ7Jg3kcoGWizKwE
	/KGEKJDNNvjjJRuIT24HMYRzoz6s7b8W8QG/4oOasO0Em7EAgtdhzHxzxI7qCH5SqJ5hkM
	gbWV6kmZdJPvUkclEMXOuewW6Tu7PRRV/0z9Bx5cnYbLSdGJ296L258AL86RPtrWE9V5mJ
	YbZnFXlDADh1UyCYOhXGPTS6Gh7mdCKUa0GgdwRnMU00fk3E3U4D0LPvU70nv1FLFGo6PA
	o+VioM4lgh1MwCv6wDXPl3sJMtn/TxijLzF/RljnDM8UnsBUfiiony24qnL58w==
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
Subject: [PATCH 0/8] arm64: dts: phy: st: usb: Add STM32MP2 USB support
Date: Wed, 12 Aug 2026 02:55:40 +0200
Message-ID: <20260812010157.1772849-1-marex@nabladev.com>
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

Marek Vasut (5):
  dt-bindings: usb: generic-ehci: Document access-controllers property
  dt-bindings: usb: generic-ohci: Document access-controllers property
  dt-bindings: usb: dwc3: Document ST STM32MP2 DWC3 xHCI USB controller
  usb: dwc3: dwc3-generic-plat: Add ST STM32MP2 DWC3 xHCI USB controller
    glue
  arm64: dts: st: Add USB nodes on stm32mp231

Pankaj Dev (3):
  dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO PHY
  phy: stm32: Add support for ST STM32MP25 USB2-FEMTO PHY
  arm64: dts: st: Add USB nodes on stm32mp251

 .../bindings/phy/st,stm32-usb2phy.yaml        |  72 ++++
 .../devicetree/bindings/usb/generic-ehci.yaml |   3 +
 .../devicetree/bindings/usb/generic-ohci.yaml |   3 +
 .../bindings/usb/st,stm32mp25-dwc3.yaml       | 108 ++++++
 arch/arm64/boot/dts/st/stm32mp231.dtsi        |  77 ++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |  61 +++
 drivers/phy/st/Kconfig                        |  10 +
 drivers/phy/st/Makefile                       |   1 +
 drivers/phy/st/phy-stm32-usb2phy.c            | 356 ++++++++++++++++++
 drivers/usb/dwc3/dwc3-generic-plat.c          |  44 +++
 10 files changed, 735 insertions(+)
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

