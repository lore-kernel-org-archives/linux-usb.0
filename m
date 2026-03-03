Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58977370D5C;
	Tue,  3 Mar 2026 16:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772555866; cv=none; b=NTMGQEupXZu+664ilpsL97yQeUnbA/7ZGu/nzXZS27rt0ft5/IUwFi80nsPzIk+eMUQCi3E2kfLtqHd2ACGXaS2C7rJjgu+C3dYaTUQ1OlFdV+9AAh/rP2io7Qm7bd4v9fgmxJTxzSWuZgZ2N0O5eOVFuN7RGeUTek/WiQmxagE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772555866; c=relaxed/simple;
	bh=4zCxRWHuSkku0YSduihXnooyBIGPdu7ySKeLPFfTZ40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PTwcS9PcH6n7b6YJKC+E8j8r8z5pFOLSFFWsOIWs18lRJlrdc+2C+xoxAqL8S9XVYNE4DKASImFtGuW9tHev4kdQvLo84oF7jqxs/dZoQHWRamtjtNhWglFHvZ4m1B7xYUrP1FBGJQLH3Vj4/66n80HTia0bfq17OUFK9YGG3gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+PIsnkD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+PIsnkD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC21C116C6;
	Tue,  3 Mar 2026 16:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772555866;
	bh=4zCxRWHuSkku0YSduihXnooyBIGPdu7ySKeLPFfTZ40=;
	h=From:To:Cc:Subject:Date:From;
	b=L+PIsnkDLRWMzQhLSe6Aw4kJcPUMaGafo8ac3Pb55w324b0Gp8p+zD+agjL3lcOrz
	 An9/pHCZGP2GME+b9fbPG4nyQqlVNKyQ7UOaXDd8AXXb8rKqDrAE3DJg8FpiI/9UUk
	 KFahwsm1N0WWea/cmzP7pUQy+1m9uhCYX+n3c3GIzP84Vxkyd2YFALuDaQDFFk7bpH
	 fpxMTwCL4DL9ajWIdlNBFYXjYae0fsIcp+XGjjuMlDUfbro/oMWpTfn7yMja7+xgjW
	 SFJhq8G3Dr2vP5G7F3BvRCK6kqB4AulRQs76CjLmavO7FWNMAbUqSYl41EiI4jqBxG
	 rFOSwfAHYPVYg==
From: Conor Dooley <conor@kernel.org>
To: linux-usb@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: usb: mpfs-musb: permit resets
Date: Tue,  3 Mar 2026 16:37:39 +0000
Message-ID: <20260303-backspace-unhearing-c6cc8cbddbba@spud>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=dpcvPwQiXhJxptNJ0T8pgqXJ5w228xDV3ANyBjxePt4=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnL+YJZ/3FZeV7jE3xefTLpbaKVbNW2c+UWZRrMHPd+7 H/PeU+5o5SFQYyLQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABM5No2R4WCT8dZZwrGRv3wD PH6k3Cmb5X0s0mbLu13+rLr1xancLowMDzoTJNKLFGfnzZFYf8z8R9rv5D6VHJelMvz3XrWtelv BDgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

The musb IP on mpfs and pic64gx has a reset pin, but until now this has
been undocumented because platform firmware takes the block out of reset
on first-party boards (or those using modified versions of the vendor
firmware), but not all boards may take this approach. Permit providing a
reset in devicetree for Linux, or other devicetree-consuming software,
to use.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: linux-usb@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml b/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
index a812317d80893..c4e1c2d73bdb3 100644
--- a/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
+++ b/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
@@ -37,6 +37,9 @@ properties:
   clocks:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
   microchip,ext-vbus-drv:
     description:
       Some ULPI USB PHYs do not support an internal VBUS supply and driving
-- 
2.51.0

