Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67AB396561;
	Mon, 20 Jul 2026 08:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784535502; cv=none; b=ci4eBHvOUySnXN+oYzUvhrp+HqlGlzQhdRTS1aDFu9I/JOKdV2Xg8AWW3bATU+snzId5WLA58nkYwLmHYWuwNs+7fD+TvwDA3hA80DZiJjYNzJg3p1UKJpN051xDxGh1j8ON3i2O0vmIcQLhyyCSXRz7syhtowlW8Fo9SfLSnAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784535502; c=relaxed/simple;
	bh=akMeAniHNxUr1PyVrqLRBg6yOrx2tvuuCaZkrYOGxe8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K69PXrEb4czhkrkH195Ho0fHXyDw2Vivbv++torqvmj5yBKmGAm8Tc2wSfnZoCwrW+2ANeB8Wicww5ijIrAS51p8FzTxyKjYCIjrbiRExfdYG4s3auocKcVy9/asSabJ4EoeTS0m+RuVZDubF43HroIDBNDFwuANxugWDUyFiik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=GJ9EkEJX; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="GJ9EkEJX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type:To; bh=ySvGUFqAafvlO2lTgerpucdEeAhsuherOh21SOd4ops=;
	b=GJ9EkEJXJNnIc20W7sYo7A9GiIA9Qye0VXf9ZcRwTcs6PPgRT+Ff6ugqQZhoox
	rD3x5kDyC5AhFAin4myy6jWwxU8z3jUVGa39dz+jRraq0W34NKgJS7027tDIjp7T
	f3thoYSfibw47Gvb3vvdDKAvUU7Kb2fwBaiWXLXDo3TJ8=
Received: from [127.0.1.1] (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wA3PReg2V1qcZ5iKg--.42916S2;
	Mon, 20 Jul 2026 16:17:39 +0800 (CST)
From: Hongyang Zhao <hongyang.zhao@163.com>
Subject: [PATCH 0/3] Add Hynetek HUSB320 Type-C controller support
Date: Mon, 20 Jul 2026 16:17:10 +0800
Message-Id: <20260720-husb320-v1-0-4a1e259d7dc8@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIfZXWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0ML3YzS4iRjIwNdMyNTi8REQ3Oj1GRzJaDqgqLUtMwKsEnRsbW1AMk
 duuVZAAAA
X-Change-ID: 20260718-husb320-6258aa172ec7
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Roger Shimizu <rosh@debian.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hongyang Zhao <hongyang.zhao@163.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784535459; l=1603;
 i=hongyang.zhao@163.com; s=20260127; h=from:subject:message-id;
 bh=akMeAniHNxUr1PyVrqLRBg6yOrx2tvuuCaZkrYOGxe8=;
 b=mEuUkECuf2ua/ZCtv5s6MBymvYqCGfMlnGhaah6nFhWswZlwmsHg+KYqaCgocPvY5pDkxedOD
 wyfQ77eo4NFBP5ka3RjBWM+KHvPw6DG50VILPAUG6065vj41o4LKOD1
X-Developer-Key: i=hongyang.zhao@163.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-CM-TRANSID:_____wA3PReg2V1qcZ5iKg--.42916S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CryxuF1DJw1fCF1UAF47Arb_yoW8XrW3pF
	ZrWF4fKrn7KF4Sk3Z3Gr4jgryrAFykG3s7KF42q34qqFsxCasrKrWakr15XFy7uryfJF47
	Kryjgr1xC34DA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRwqXLUUUUU=
X-CM-SenderInfo: 5krqw5hdqjh6xkdrqiywtou0bp/xtbC8QSRbmpd2aTBBAAA3F

Add a Devicetree binding and Type-C class driver for the Hynetek
HUSB320 autonomous Configuration Channel controller. The device handles
the Type-C state machine without USB Power Delivery.

The driver supports fixed source and sink configurations, dual-role
operation, Try.SRC and Try.SNK, orientation and Rp current reporting,
platform VBUS and USB role control, and audio and debug accessories.

Testing was performed on a Thundercomm I615 Development Kit based on
the Qualcomm QCS615 SoC. USB device mode enumerated at 5 Gbit/s in
both plug orientations. In USB host mode, a mouse worked in both
orientations, and a USB 3.0 flash drive enumerated at 5 Gbit/s in both
plug orientations.

The datasheet is available at:
https://item.szlcsc.com/datasheet/HUSB320_BA000-QN12R/8528239.html

Signed-off-by: Hongyang Zhao <hongyang.zhao@163.com>
---
Hongyang Zhao (3):
      dt-bindings: usb: Add Hynetek HUSB320 Type-C controller
      usb: typec: Add Hynetek HUSB320 Type-C controller driver
      MAINTAINERS: Add HUSB320 Type-C controller entry

 .../devicetree/bindings/usb/hynetek,husb320.yaml   |  171 +++
 MAINTAINERS                                        |    7 +
 drivers/usb/typec/Kconfig                          |   12 +
 drivers/usb/typec/Makefile                         |    1 +
 drivers/usb/typec/husb320.c                        | 1177 ++++++++++++++++++++
 5 files changed, 1368 insertions(+)
---
base-commit: 80574c40598aedbc1751c528e414d7e224bc6313
change-id: 20260718-husb320-6258aa172ec7

Best regards,
-- 
Hongyang Zhao <hongyang.zhao@163.com>

