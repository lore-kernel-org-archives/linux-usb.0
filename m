Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D05D3E3152;
	Sun, 16 Aug 2026 21:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786916364; cv=none; b=EB88JbA6UtUR4DMAwgRWJdXKDFrydQb6CC69KGSgZDOO7JG1EA58sIxaHC8zmfFT1UujumOg00ZbVSmxT7S2y88JN57ThJWZtVknIn7xplDl54mz/zV6W7CY0MgRTOzCfCgecG1u4/NSeYHDXeVOqmvQAUoXwZ8l2ZGRQYjjiSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786916364; c=relaxed/simple;
	bh=pX1hKkBu4Gq1jMO8yEuwd+rvdUM86aFVVHTqWicLDs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eOCZAlbJD7p+XcuH6wBlMZao7hyb4qSSSEnbVzRSUEJIRZJhtMFGsOXsY+Ewr/h4Mmw7UXFdnf7x4VQgTHS8Q0J9R7jrIgiKtSYyc0CkaqdO2K7AithjLx5gZ+4qnX5KylgYbrEQZQ73tD7kCprUVFsAAT+JyNLyNt8Oh6k0qSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=JlmMipJY; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="JlmMipJY"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 02E5611C1E9;
	Sun, 16 Aug 2026 23:39:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786916357; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=jJt7Jm9dS7j9+nHkmEwZyfgLjpjrq0IoWW70XFyDFMw=;
	b=JlmMipJYWFu50hMoEGIywKogQMbyPOoDgARWAYc+At18F4h07+HOt3ecGckmHhuBZb33oW
	TBLYWAM9eLJmAQx8JMo2uH5uxEEAYnIoEt0vMphwLPh0DNQnS6kSBh4095nSlnKBLgQpqW
	hAT8mY/6UP64AyzAT02vPMRXJpMW1iuVndThS0BUa1mCBNmMBZUn+P8P4faSDxVO+kG0LH
	mZgJrLoXjxl7DHSe7F+NP2yKDtYvBojl3fAkJlCdCjmlFFDH/goc9jS5S2vlaw7IPSZxAN
	zu+WBC6bZ8epiClcbWA0aU3WbEO5uyJDJG03ycUp3XkK/O1dfjW3TeTF6cQX3A==
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
Subject: [PATCH v2 3/9] dt-bindings: usb: generic-ehci: Document access-controllers property
Date: Sun, 16 Aug 2026 23:37:05 +0200
Message-ID: <20260816213849.1044073-4-marex@nabladev.com>
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

