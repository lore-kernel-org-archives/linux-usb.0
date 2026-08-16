Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C0C3E3140;
	Sun, 16 Aug 2026 21:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786916386; cv=none; b=ZLoT4YKx//Jcy1mgHU/+rkKMVmHfHoFui679GLW+Bk9QFCwMnrofmy7VilX0hOXdsdSuQZE48PilX+EEL5EEEwXqBIkLWdFlJAsiHVsubQWM4GlhkRAkHqhCVajueioX/3t6eV22Sk86WdSKwGTp2JRleKMbhJ1a7NRW7L/BOOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786916386; c=relaxed/simple;
	bh=PDnYYVyLJv3+AHYzkjYjTqGzIFAOIPEmufPDqAleX2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NiOAd40DaJnIP0X1jbWAzr9XWX8NT0fOUshSf0c0PA8N98Z2yd7AzNq/K+RaZhSdI7yQmIxHuo2iFhLEk+nbbsmuA66W825Y5u7CNSg0bMUiTFNzHg8f2c8uYgfBPG9CM7s56QaLaU/avSgmRhO722YXkz0BUVL+FjQmd3JtlK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=JREXHs+O; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="JREXHs+O"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81DE511C1F8;
	Sun, 16 Aug 2026 23:39:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786916378; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Q9gDiM6QYxKqsu9piMSKyZoacoS5srL/I072hg/wVSw=;
	b=JREXHs+O5VqJVUtcQDAD8mewPHR0G15PUgucUQkeebLlgllxiG0zrNrcCsShLMdr8EsSXN
	sUUuORcEQFBQaMbuByzxm2ZLB4FwKjoUFO+3eEu9dw+gjueNAO+kkfEcC5KZthuOzlXahJ
	lMC3aW3WZPyYB9hjqoueze8VPvuX/TGcsu5RqoFxpbhoh3OkRDvKWQMunWW2lj4yN4CovT
	UFtv4AsTWx4zxynMTW0acRtNLcQn+cdKeEIsJH5OXDbGxafen1aKLFvnELsMpANBPBxGjg
	c6wnRpl4Kx0Fp7Y8QAgr69/yemFDoUwuLKNX79FNhyOh7GZQUdGcEi6/eh9mlA==
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
Subject: [PATCH v2 7/9] dt-bindings: arm: stm32: Switch st,stm32mp23/25-syscfg into simple-mfd
Date: Sun, 16 Aug 2026 23:37:09 +0200
Message-ID: <20260816213849.1044073-8-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260816213849.1044073-1-marex@nabladev.com>
References: <20260816213849.1044073-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The st,stm32mp23-syscfg and st,stm32mp25-syscfg can have subnodes, which
represent the USB 2.0 FEMTO-PHY. Turn the syscfg into "simple-mfd" so the
PHYs would get populated by the OS.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
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
---
V2: New patch
---
 .../devicetree/bindings/arm/stm32/st,stm32-syscon.yaml     | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
index 95d2319afe235..ef640443dd239 100644
--- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
@@ -22,11 +22,12 @@ properties:
               - st,stm32mp151-pwr-mcu
               - st,stm32mp157-syscfg
               - st,stm32mp21-syscfg
-              - st,stm32mp23-syscfg
-              - st,stm32mp25-syscfg
           - const: syscon
       - items:
-          - const: st,stm32-tamp
+          - enum:
+              - st,stm32-tamp
+              - st,stm32mp23-syscfg
+              - st,stm32mp25-syscfg
           - const: syscon
           - const: simple-mfd
 
-- 
2.53.0

