Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6A03859F3;
	Tue,  7 Apr 2026 06:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.46.229.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775542682; cv=none; b=AuIWhC6b5AZmam6pRQNQYWvlSPJT5e4/saDIbGsYi30KcQ0qEtLZfFHOGh0vzHnxK24Z2fSaFQH/p46up88ouZ+wkoCWAL0yhgG7f1vie3tFZxY6gHjUVjsGu3ainr6jnGcfmw8DoPFWZaiQX9dKgclAb52d5YUZUkIcvve1CzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775542682; c=relaxed/simple;
	bh=AE7++OzVyS2uYHOPGoJ81l6ph3jdIaPhRW3+Fg5L0tk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XWCkJbM/sxzgB3DSyrMh5TeSIk+GZYIYiyrSCtNVQ/hzBB632Ry2QDxuOOiFJpgBElAZGwmkvErJgi21+4facBjTjjWG3g8ZeCjD19Yhbs/OyejekSnfWkEu3nMn63Z1sEhIPqi277T2/N4XPs9/dCzKJ6tWpNsHvNQJrGE79E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=207.46.229.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0006493LT.eswin.cn (unknown [10.127.112.153])
	by app2 (Coremail) with SMTP id TQJkCgDn_J95odRpo7APAA--.792S4;
	Tue, 07 Apr 2026 14:17:32 +0800 (CST)
From: caohang@eswincomputing.com
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Thinh.Nguyen@synopsys.com,
	p.zabel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	Hang Cao <caohang@eswincomputing.com>
Subject: [PATCH v1] dt-bindings: usb: Fix EIC7700 USB reset's issue
Date: Tue,  7 Apr 2026 14:17:02 +0800
Message-ID: <20260407061703.1564-1-caohang@eswincomputing.com>
X-Mailer: git-send-email 2.45.1.windows.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TQJkCgDn_J95odRpo7APAA--.792S4
X-Coremail-Antispam: 1UD129KBjvJXoW7uFWkur13Jr4UtFyUtF4ruFg_yoW8Wr1kpF
	WxGFZ7GF1xZr1fuayUXF1vkw1fX3Z3AFyYkFWxCa17JFnrX3s0gr4ayrn0qFy8Cr4xZFW3
	XFWag3y5A342yrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9E14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbknY7UUUUU==
X-CM-SenderInfo: xfdrxt1qj6v25zlqu0xpsx3x1qjou0bp/

From: Hang Cao <caohang@eswincomputing.com>

The EIC7700 USB controller requires a USB PHY RESET operation.PHY RESET
operation was missed in the verification version, as it was performed in
ESWIN's U-Boot.

If a non-ESWIN provided loader is used, this issue will occur, resulting
in USB not work.This patch does not introduce any backward incompatibility
since the dts is not upstream yet.

Fixes: c640a4239db5 ("dt-bindings: usb: Add ESWIN EIC7700 USB controller")
Signed-off-by: Hang Cao <caohang@eswincomputing.com>
---
 .../devicetree/bindings/usb/eswin,eic7700-usb.yaml         | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/eswin,eic7700-usb.yaml b/Documentation/devicetree/bindings/usb/eswin,eic7700-usb.yaml
index 41c3b1b98991..658260619423 100644
--- a/Documentation/devicetree/bindings/usb/eswin,eic7700-usb.yaml
+++ b/Documentation/devicetree/bindings/usb/eswin,eic7700-usb.yaml
@@ -41,12 +41,13 @@ properties:
       - const: usb_en

   resets:
-    maxItems: 2
+    maxItems: 3

   reset-names:
     items:
       - const: vaux
       - const: usb_rst
+      - const: usb_phy

   eswin,hsp-sp-csr:
     description:
@@ -85,8 +86,8 @@ examples:
         interrupt-parent = <&plic>;
         interrupts = <85>;
         interrupt-names = "peripheral";
-        resets = <&reset 84>, <&hspcrg 2>;
-        reset-names = "vaux", "usb_rst";
+        resets = <&reset 84>, <&hspcrg 2>, <&hspcrg 4>;
+        reset-names = "vaux", "usb_rst", "usb_phy";
         dr_mode = "peripheral";
         maximum-speed = "high-speed";
         phy_type = "utmi";
--
2.34.1

