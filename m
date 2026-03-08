Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAD828469A;
	Sun,  8 Mar 2026 23:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773012029; cv=none; b=C9sw5NFsmPkUXzMJy/C2arV0qi6F8JC12oiF2g2o8O+an5rgqjbVxEygIdERQHcth8VULE9PFyUlX0ayPI/yywFvhowlD65rFFHJ2zbpNPWGA9C57Nd9S0LsqNtdA9cjO4FyOx8FV7VAa/fqlK77cioVzovNrzOQeyEaKSh7Osc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773012029; c=relaxed/simple;
	bh=OVNfy1dOLR6fLlJ63dBBVUVhrWhM3UP4iVE9xKxc3T0=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=U+RD14w1l4sSYuLvz+scCuvaBeNRvhVW/naQSeJuF/oKUMilUryxbS/imIgCKMmxxjnjVZ+e9DInoP1qATfgk+Ii7QCfOE2Zf97USRlhb8XF5rrHiXNl8z0LSPKLLbVDN0B1iPF/iUmjIb00Y16NIUXMQDd5txNj7L7g6eYldR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=JgBXpDIE; arc=none smtp.client-ip=185.70.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="JgBXpDIE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773012025; x=1773271225;
	bh=hpW5dj12Cx/i71mCTHgcHn217TNHginpnW3eYHTykNE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=JgBXpDIEzmNe7mu5gHGwkg1bsJEYI4e4YC/K25DQiMAJIwVnTc9AqMxFr54irgTui
	 2V8hJ1MqaaRJpon1rNKh2uLRSxKtHNg5BmqfWWvWqHlAGoIs5WIpojNiH7KmYt9IYf
	 relZTJ6EZno1cIsVoPBjv7byYhI8u8C53k59E2wwVQho94Q8IyryuqFIz8ULuqVgtL
	 PN2Dx/6MH9VXeC2wlz7TMrjCmWsqB/lUpp6jmEYXX/4uFbT7JMAuQ3qflFhLDqM/X0
	 0pN3vPgkSQAcBbGpO0cYnUA5+4azcMHjY+8uMGCKLXMmxYo3Ou6QM6PBw8JyLx4a2L
	 TZJiHU1l3Xafw==
Date: Sun, 08 Mar 2026 23:20:19 +0000
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH RFC 0/2] usb: typec: qcom: Add shared USBIN VBUS detection via GPIO
Message-ID: <20260308-qcom-typec-shared-vbus-v1-0-7d574b91052a@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 3cb58a88a9367d9540281d0dc09fd258b054381f
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The ASUS ROG Phone 3 has two USB-C ports whose VBUS lines are both
wired to the single USBIN input on the PM8150B PMIC. This means the
Type-C port controller cannot distinguish which port is providing
VBUS, causing one port to be unusable when the other has VBUS present
from a charger or PC.

The downstream vendor driver also appears to be touching
TYPE_C_CRUDE_SENSOR_CFG_REG for restoring CC detection after enabling
BYPASS_VSAFE0V but does not appear to be necessary with the upstream
TCPM stack?

Feedback on whether additional register configuration is needed would be
appreciated, but functionally this appears to work as is. After these
changes and configuring the property in DTS I am able to use a flash
drive on the side USB port (pm8150b_typec) while I am connected to a
charger or my PC via the bottom USB port (rt1715).

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Alexander Koskovich (2):
      dt-bindings: usb: qcom,pmic-typec: Document vbus-detect-gpios propert=
y
      usb: typec: qcom: Add support for shared USBIN VBUS detection

 .../devicetree/bindings/usb/qcom,pmic-typec.yaml   |  6 +++
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 46 ++++++++++++++++++=
+++-
 2 files changed, 50 insertions(+), 2 deletions(-)
---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260308-qcom-typec-shared-vbus-7d37c6b2d155

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>


