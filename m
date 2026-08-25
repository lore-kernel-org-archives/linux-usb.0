Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DFA447817;
	Tue, 25 Aug 2026 12:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661456; cv=none; b=PKtnCzVK95gL5KYZEKy7FYLN6Gc7R77rEl0USg6fQHCrBPF44vYqvhHQNj3E5Sbq16+9a6qI3uAAjANoYdmJrUeSgnIfo9tDj2CYyZ7kC/MCNDlmRtmFXXQuY9Z59MdwhGN0dGEBHHZRNINoLo5OHRe5qQFKlsDOjHhGW/68IsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661456; c=relaxed/simple;
	bh=3InrEzqBoL04PndarbQa9vfc8Y03H+tVOBZBHp4kxfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AxVtpEVrYaOdxUIN+Y2O20eCH9C6ZpQf3MqqWJS+2qDJ/SCJsSz/dt14ZRfrxRs0HEcwXGbZcwt4+zhYfNN861FGXiCdDNv7FRMEhQKM+8alInvU1i0zggUbN45zItuCemYDFG9OkA7g7ahzN2D4e2suy0lVIKhOGGjUeW2nBxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dwgh2aSn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dwgh2aSn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 677E3C2BCFB;
	Tue, 25 Aug 2026 12:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787661453;
	bh=3InrEzqBoL04PndarbQa9vfc8Y03H+tVOBZBHp4kxfk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dwgh2aSnJOkT0WZEP6/0yf80ICfw+5qbWp7vcxXmQ7e0tPRLmtZs2oQijr2jE3pq9
	 jS4fkDIsYrYeLRMaEDkFDuZKwpVFydqkk6SwZdcojzMNJLPvdSQf32oAfRLHAw89js
	 v4ZZGFoAaMvHjtRvQN+j+3WM9lyHPEAsEyAJRSGvSslZaHp5Ql8t6+198sA5SKvXKY
	 JEo6zWOcbL9pnK2g85XTfqXjQ4dtwv6y3JnLuTJuqWunVfCuAUF1Udv+AL7P1vc5r0
	 P/a387sVAgOgtdTti7VdsFxyZwMyBmFZvaBUNjIss6zmmzEN81f4GnY8geUqiTOSv2
	 ZA3bkit2q/vww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5375EC61DC4;
	Tue, 25 Aug 2026 12:37:33 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 25 Aug 2026 16:37:26 +0400
Subject: [PATCH v3 09/12] dt-bindings: usb: qcom,snps-dwc3: Add clocks for
 USB3 on Qualcomm IPQ5018
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-ipq5018-usb3-v3-9-39be0955a6aa@outlook.com>
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Praveenkumar I <praveenkumar.i@oss.qualcomm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 Nitheesh Sekar <quic_nsekar@quicinc.com>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787661450; l=1506;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=BrVJTl3Tb6P7JuTScfV3IA2WcKzF+sHcd0AfrYGATWA=;
 b=e7gfZhyd/OCSOtqtMZiVVCph9z+d7pnrX3IBRHUK6oxcqPBmFaPIS+31US8RRgPhyLW8FUaEo
 e+XE+GM8iGbBLl1TyEA5G5+LPz0d4Ap8FcjkM+DRpZb6VS/E1SadlOK
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Add aux and lfps clocks in Qualcomm IPQ5018. These clocks are required
only for USB Super-Speed support.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml     | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index aa263dfd42a1..97dd0cefd732 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -194,6 +194,26 @@ allOf:
             - const: sleep
             - const: mock_utmi
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq5018-dwc3
+    then:
+      properties:
+        clocks:
+          minItems: 6
+          maxItems: 6
+        clock-names:
+          items:
+            - const: core
+            - const: iface
+            - const: sleep
+            - const: mock_utmi
+            - const: aux
+            - const: lfps
+
   - if:
       properties:
         compatible:
@@ -295,7 +315,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,ipq5018-dwc3
               - qcom,msm8994-dwc3
               - qcom,qcs404-dwc3
     then:

-- 
2.53.0


