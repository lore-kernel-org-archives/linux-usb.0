Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0EC3A4502;
	Thu, 19 Mar 2026 07:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773906688; cv=none; b=PXLInAvZIRdf9S1rGjA/QvCXX9bxnqYSOR4hKHoKAp5PNzDCmRhM7wvkcOq0R9pFKF+CPQpXdQf2RVZUc2foALI0UwdT4DvJ/q2Hz0tL5afVPMKqZ2vh0yqDIDGMLZRTwRThzd1LYxTL56TCnlGn7RA4Rrtl/I1r9NfEI2sToYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773906688; c=relaxed/simple;
	bh=QzplnWO/QSNqIdcoI7K9vtWTSXhLAqnLRdXO2MNz0Wo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IhdrXOEX6l7+722MEY4j+yiW9pcnIMHL6WUSonw6++EV4QGUCjhbkTYb6PAuXYEG+ANDNHwcLPBf1MGboQ/wfykEW4jnQZdTw7ZPSJpOH6PsyZ4McG2elaLbbtb/aFfU0OhRDNjblsY0kq+VFMQd6GhFnyQbQMsXni/6WJedxHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gg4yX6fI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gg4yX6fI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC7E9C19425;
	Thu, 19 Mar 2026 07:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773906688;
	bh=QzplnWO/QSNqIdcoI7K9vtWTSXhLAqnLRdXO2MNz0Wo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gg4yX6fIqMskZle8RdRIZvK1N/AA1MmL+zwhC2UxsEZmRnGBcn5RzKqp32tLSMqSr
	 AJ7a66Hc6J1eUYt+Tnwmp5uI1yoAJBYCmstnpCQ6QWUQlmi1P3Xjjl32U+vc9ZQUOH
	 UpbWLMURXoyB+h3XJcZe1Frd1WskC4uij2Ggj102+fqOxP1KQx7qaWGF1QcX16wFNN
	 tS3OliP8XYbfXoQefRV+Vnp4fACdRAnKxWFihFzqQl5KMJmlk2TNodALMPOpYSRIHB
	 NkjAmDSg+f2Uorvcb0+SaSSwrVWYZxDT0wAqrcJ/bxY4894PdTlaQNi/7cBJRb569L
	 JbSbkZQBiurrg==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 19 Mar 2026 07:51:03 +0000
Subject: [PATCH v2 1/2] dt-bindings: usb: Add support for Terminus FE1.1s
 USB2.0 Hub controller
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-03-usb-hub-fe1-v2-1-e4e26809dd7d@kernel.org>
References: <20260319-03-usb-hub-fe1-v2-0-e4e26809dd7d@kernel.org>
In-Reply-To: <20260319-03-usb-hub-fe1-v2-0-e4e26809dd7d@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Matthias Kaehlcke <mka@chromium.org>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Inochi Amaoto <inochiama@gmail.com>, spacemit@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2171; i=dlan@kernel.org;
 h=from:subject:message-id; bh=QzplnWO/QSNqIdcoI7K9vtWTSXhLAqnLRdXO2MNz0Wo=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpu6rxM3JnSJFOj0CdqyrpG3PFZzHenKaW04Inz
 F1LrIMuB96JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCabuq8RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0EIQ/+KEuksSegBg6BFrWBo9FNf1mrrWlMFE+5h1VRkGl4m7sCmIvIHIEet
 bpE1rRrlvzN6mIyJ1I8PQUz4np0cyjZMd5ucLLk8KwxunDcne6yDamKfT5IH+oAHgjDhgsNWm/y
 HvW3gElDv+M6pHODOPcS4ZcjmJ0uipPctyHG4PvnPuoIBSb6rhySMr3F3MjtHC+ayJQxZYhRdaf
 pXbINOvSMwDaB1S+64wiOnEX+SOom2kyf0fzyXQFwUN4AkCpEAYkQdUgca6ouH/oCwpFFqv3HoL
 jVNK8kS3hWuJ5vPNsLYHsnh1GTnjImh5L8uDFsOyr1YAY6VlSsRVsmx4qUVauL6LBRX98iDf2zQ
 ID/17AA2M+d/2C2gb8ipsxxV7+GtungMdvqHDEAEuwN+kvJ+kabhHmtr0Skm42KsBN/bkzbu6rP
 dPoTDCyTWErC2aJT4jn48Yknj4tfOD8xLCyAq+oAj/pKtMAMbEqKszQ26yAvwtbfqtNo5Thm1F7
 VlYhWs7GKfhNcy61okNPkmSflLCbTZdSoEw/BPptdCFwD1XEq57qDSu51DEDMMIqw8wWA/w/GOg
 jSt5SzMTSSPn/mLC8dK1UJ6yeVKh8o2tABL73zfoGUzQvvUdS6A6cq3qHoFe7n3+I0+jxbczSAV
 820RcAdX1xDGsQHI2Cwytoq0tGa8Fw=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Terminus FE1.1s is USB2.0 protocol compliant 4-port USB HUB, It support
MTT (Multiple Transaction Translator) mode, the upstream port supports
high-speed 480MHz and full-speed 12MHz modes, also has integrated 5V to
3.3V, 1.8V regulator and Power-On-Reset circuit.

Introduce the DT binding for it.

Link: https://terminus-usa.com/wp-content/uploads/2024/06/FE1.1s-Product-Brief-Rev.-2.0-2023.pdf [1]
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 .../devicetree/bindings/usb/terminus,fe11.yaml     | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/terminus,fe11.yaml b/Documentation/devicetree/bindings/usb/terminus,fe11.yaml
new file mode 100644
index 000000000000..645f97d73807
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/terminus,fe11.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/terminus,fe11.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Terminus FE1.1/1.1S USB 2.0 Hub Controller
+
+maintainers:
+  - Yixun Lan <dlan@kernel.org>
+
+allOf:
+  - $ref: usb-hub.yaml#
+
+properties:
+  compatible:
+    enum:
+      - usb1a40,0101
+
+  reg: true
+
+  reset-gpios:
+    description:
+      GPIO controlling the RESET#.
+
+  vdd-supply:
+    description:
+      Regulator supply to the hub, one of 3.3V or 5V can be chosen.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    patternProperties:
+      '^port@':
+        $ref: /schemas/graph.yaml#/properties/port
+
+        properties:
+          reg:
+            minimum: 1
+            maximum: 4
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    usb {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hub@1 {
+            compatible = "usb1a40,0101";
+            reg = <1>;
+            reset-gpios = <&gpio0 1 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vcc_5v>;
+        };
+    };

-- 
2.53.0

