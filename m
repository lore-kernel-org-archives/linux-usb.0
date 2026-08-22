Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574C139CD07;
	Sat, 22 Aug 2026 07:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787384928; cv=none; b=S+6qm4UD4QJETphf7aIB/jLmYj7tAMIYsEIUWaplEe4Hkx6/AlDYGYQztjb/JZ5imCGScybhyGbssk7T1e/UrUMCbtNS5dZL6zkLNA+OS1KEEdy10yyIm75oEiBf4iqwE5Xb9PxzLQIqvxcYyS49uKZwHHnX17dqj67c/dAA9zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787384928; c=relaxed/simple;
	bh=If2FdZ9BGo1yLUfe0QteMQiFtqkY7f1v4K1/I3pzohw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lb9jnTru/DH9D6vG46++I+YOeo4WlqF8MaI1T7WyCSxBrKfw72RrszXe6bJboi/x46huc8Yx8muHoanjAxLaL+pTZBG3xVJLERc52VXfUymHHfB7w95QCdSUhf5FvpXVvLnK/De5MeGaa+LeXJjSG4gx3jKZqSDTXjncyfttbOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=bT1KYw9m; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="bT1KYw9m"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4BCD111C814;
	Sat, 22 Aug 2026 09:48:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787384921; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=dHGNNdjbX2tcoPtYPHkVrNbZLNhLOGaAgeIztRF8jLc=;
	b=bT1KYw9mntE9tY1XNkNwqA1habI1lUnirgFsZeHcc8peXSwITWlHphNPPELgwwR5OI6BEd
	g2aBHRmLKWs8gce7qanmB4Vnyo2iglC5rjCROWX1QH48Mr4kfAC7T8MqfD5aFRw8ZC/LCd
	H2yDRbMpvQtrC0C/IWkZIAW4fvNyf6lskcRV9VFYMGUtR5nDr5LAwdSvJ7NYKZaeS3zNB0
	d+RwyxFYw+KV2k/e7NXHfJJQJWqgh32HPpTwNjKjEVENKGwT5KYJjZt5yDph2Tn11pjEe9
	uyPMEdgLmXORXTTZ0vo3+KDKgJgRnKOh+0h5fj2bU5QfwmMg2lpcw0LFeelmVA==
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
Subject: [PATCH v3 3/9] dt-bindings: usb: generic-ehci: Document access-controllers property
Date: Sat, 22 Aug 2026 09:46:36 +0200
Message-ID: <20260822074816.548662-4-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260822074816.548662-1-marex@nabladev.com>
References: <20260822074816.548662-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Document the access-controllers for EHCI USB controllers in case
access checks need to be performed to use them.

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
V2: No change
V3: No change
---
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index ae9fb70d0212c..6bca56681cdfe 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -80,6 +80,9 @@ properties:
     minItems: 1
     maxItems: 2
 
+  access-controllers:
+    maxItems: 1
+
   dma-coherent: true
 
   interrupts:
-- 
2.53.0

