Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C79E1862
	for <linux-usb@vger.kernel.org>; Sun,  8 Mar 2026 23:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773012037; cv=none; b=iBbeD8n98MOHkL6+tuz4ACRTMnKaY3fYt6NpEhVosVcorfxlpYD+mlg8KdaAswJUJgHnB0lYIsORcTVloAAf60dLSnXeA2z5e8ZoRQ1EX7gjHFI4udhtirkyuTBxvloTNsFAAiKMAIEUndGlT1uPOLk1LUnFVCkjq/xgUmj2fbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773012037; c=relaxed/simple;
	bh=EFrSuc2SdbmpcJpGclMRzS8DTn9v6weqBkk5dYCqnlE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uwCiMgtU8bu4KwpxtzYMvfx4z7fnux6FxXPemwkomopuf1sopjuOD4q3fbsjF7ctdojAKfkZvaI1/M1kUMphImjaoS3SMUVaGJvRvLpSHUo9mpOO8z7aUUvVZXlnQHkrEM3NWlZuAVHG2xQCz+h97iOQS4TtwRkEt8bCcATTcVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=nby08M2i; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="nby08M2i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773012034; x=1773271234;
	bh=dx+eufURY/w9OVRqgejHERgP+fDPlU+3xj9P76ifVr0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nby08M2iImBb9SrQ/RV9tExJFGOOFmXqmMk/I/6GtwNAwHry4c+0BRY/YDWFOKnxc
	 KnfVR3W1YogoZkdbom7izuAgfItDOhj1GbA/TfwsFAXVVyjnsHde1l96S3zWUXvCHb
	 G0JzdlSwwlEFn5UpKS4dwDJVD9nDF3XJczJvhHDhYeSoC/LmtUuLAS6nOfShdqD2Zy
	 aqFMoFXZ3UmTmmq0h2DXYyEjowtau4kKEjoiJ2IfHtUGfRSwuXF4zylX9jH1vEEV89
	 9B8UwVbXZF3Yz0bxhCOzk21bWqQQ/UwcjLricCnUY7Janmyok5dXNu44vRFn8NrD5S
	 gZtM/NGNqE7Ew==
Date: Sun, 08 Mar 2026 23:20:27 +0000
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH RFC 1/2] dt-bindings: usb: qcom,pmic-typec: Document vbus-detect-gpios property
Message-ID: <20260308-qcom-typec-shared-vbus-v1-1-7d574b91052a@pm.me>
In-Reply-To: <20260308-qcom-typec-shared-vbus-v1-0-7d574b91052a@pm.me>
References: <20260308-qcom-typec-shared-vbus-v1-0-7d574b91052a@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 917b69edb690b0cb30d1e916d8e4a399105e8092
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add the optional vbus-detect-gpios property for devices where the PMIC's
built-in VBUS detection is unreliable.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/D=
ocumentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
index 6d3fa2bc9cee..f45bf3e34c03 100644
--- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -78,6 +78,12 @@ properties:
       - const: msg-rx-discarded
       - const: fr-swap
=20
+  vbus-detect-gpios:
+    maxItems: 1
+    description:
+      GPIO used to detect VBUS presence when the PMIC's built-in VBUS
+      detection is unreliable.
+
   vdd-vbus-supply:
     description: VBUS power supply.
=20

--=20
2.53.0


