Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DC740F74A;
	Wed, 12 Aug 2026 09:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786527285; cv=none; b=hesr81A7MvHcIbWJDQSkqRXUJrv9QYpoXTdy6oM7hYjTnqph2k4xwjD52WRMC1mMx5J9AhzBvihb4bnSCFyGL2dJlNV5pSFT5BFC8YXegbGYCwi7h02apM6a0Erpj2B5XkHtCKxJt3xSPrTuecIOnoSWP4FVYtjbNA3WdgFDW4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786527285; c=relaxed/simple;
	bh=pOMw1Eu8wnhIdeSjF6BvWPDaMBzo8BAut94HrKLQWS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p2pisgBKCB6rQEGX3jqj/794xjl99OxbTJQzPZCxZgeAhrHaTX3ypO8Ch0qls4UeHUQ9oiIakyD5j5h4FGkVuOclJysgaF4E5FeDld8Hap31MnJ2ITRzd1IC5BmpBWrC3knniM/AnizfDS/1Ty0CaSmDmz6BB8EihU+9ZybWvho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FvRtW7DP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FvRtW7DP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4F65C4AF09;
	Wed, 12 Aug 2026 09:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786527284;
	bh=pOMw1Eu8wnhIdeSjF6BvWPDaMBzo8BAut94HrKLQWS4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FvRtW7DPlnsCVvoDoL/fPQi0xcpURitW+9klX2ztdf0JOXDC7VDslMRkaUZIzdKJh
	 Fsq6cnhggdUaTcpME1EFDgTfaKcRB5G3JzH5Eg3MOHKmlhSoGonsEdsYKgokILPuPE
	 6R7HX+RSrk9F7jSt00xr/zxBY/n8+ygQ8uNWPCUwTr0Mj2qP8tlQhHH2wDqYt15sZ+
	 4iJqXkhUtR7pqM2zayaVjdruP2E1AmluiMtKx3q/4FC/t8Vjc7j9i3YJbxTQkEwRDj
	 ZXPG0RoHAi1psv26Sqx6Z08WbzS4jQRSb/7MNJUfCGAQVN2CqMhyaJJ73BaoQvCgmi
	 /nUMCoc1ePk1Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF884C5DF61;
	Wed, 12 Aug 2026 09:34:44 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Wed, 12 Aug 2026 13:34:41 +0400
Subject: [PATCH v2 06/14] dt-bindings: usb: qcom,snps-dwc3: Add clocks for
 USB3 on Qualcomm IPQ5332
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-ipq5018-usb3-v2-6-8f355d7ff0ef@outlook.com>
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
In-Reply-To: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Praveenkumar I <quic_ipkumar@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786527282; l=1443;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=FrZ92+JY6xObNWk+ENo3Z1dORVi7W/FDONI5nxpufY0=;
 b=k7TduvLaDJNt/6eSZS3/emidYhD1YnKCkfcymUxouaifQGrT9SFN+TVO3CTGf7/uexHa9FQtk
 ATA5CChM5R8AEzasy2DuWU4neWkDIkEQB8OV7UUIPt6hMoqxEgDq6mn
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: Praveenkumar I <quic_ipkumar@quicinc.com>

Add aux and lfps clocks in Qualcomm IPQ5332. These clocks are required
only for USB Super-Speed support.

Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml      | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index ea60f7220afe..ce36109f5df7 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -173,7 +173,6 @@ allOf:
           contains:
             enum:
               - qcom,ipq4019-dwc3
-              - qcom,ipq5332-dwc3
     then:
       properties:
         clocks:
@@ -185,6 +184,25 @@ allOf:
             - const: sleep
             - const: mock_utmi
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq5332-dwc3
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          maxItems: 5
+        clock-names:
+          items:
+            - const: core
+            - const: sleep
+            - const: mock_utmi
+            - const: aux
+            - const: lfps
+
   - if:
       properties:
         compatible:

-- 
2.53.0


