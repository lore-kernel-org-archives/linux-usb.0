Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677880;
	b=T5O9Yxw87W0LTJnfeSXAs/gM/ictAFK8QxgQ9ivwYCVP3fGliw/nxJmBobhmZgIqKcnO
	 rQjyQwnN1jBiWrt9SgWA/Dw0Ux5icXFfu0YR/p9g99I9Ri33sBJdcyT36Teiq2Z7OfbZY
	 F/5nZEZMc8A7VgVcJaid31Uuj6k4bSTyNC3uafuKtt3DpXU1IQiBxR/iDI3KEw0wYc7+X
	 kf4gyiByWVQlnAMFFw68wjmrD+9D/NXQSfXYR9Bp4u/brioPxd7uDdtix/9JD0sFQtMUk
	 l0lCn7gJwMjcqOzQied/LoiyFfWnnJdHI3nq7iv2Hg94L0PinOeOPaRodKnjm2xVLKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677880;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RRFRkHSstvshHl3lrnqAQhw1v+jXEe/hRdOv3xL9AnE=;
	b=r19fQL4phYM51odHRQbS9gKcnC1o9SrFNeWRpqH3uBayflwh932qysTkYwM46qcwpAm7
	 zKEzy9hDeOQfq0HjGqWWv1zQi8l+myt65CyXDzGQvTAHL+N4BuHw7ISwVHa22f0xTjkcZ
	 n9GlOuWUTWETzjQvzaBrTgdyhhgOiddDkUImfqnFzjwunZuYbPLD7VpYvMMyUAc4gIR/v
	 dt/JaVbBe1L07TqqksxbORMRQgfQXCFfbKGm/Hb14mI9Pf7RcbF3Yv+VzawlPJzYIkn1m
	 CsRn3bpNE1lIicwiht3BQooolSOpcnwdyBioRs4ql0lmwFy7A9VvBXKeiqKRGUaBfbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XAb4ng2f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1B8606A31E;
	Thu, 26 Nov 2026 07:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XAb4ng2f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78CD71F000D1;
	Thu, 26 Nov 2026 07:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795677879;
	bh=RRFRkHSstvshHl3lrnqAQhw1v+jXEe/hRdOv3xL9AnE=;
	h=From:To:Cc:Subject:Date;
	b=XAb4ng2fW6jkoawynNubiB2qF+bCHwTIBerg/PtRv1uAql67FCm1yq8UAMJk7ECSC
	 TCcneWye2yIYE9yM1cKAOA9qCZ9g40K+R487mdfXjbzdnHiZG9MQbWDRKhZeMPD8Hu
	 oNCcd9yoY7ED+O8g0hL1LyVrkHCYDdaLwWRQA7VEl3Rlhl+xlhmLxl13tbcxMfiMDD
	 2kq9qaA8RT0v2z5V2/RDros7fkeSEQVfLK+x9zVPOj0RtO1oCMMMSw455LXnzSDzkz
	 WZM8q9bmbrI9v5IcExrtWyR4iEOiud/dcHGWEpOcdESAPLnJrOdo9fC5PJQZQMKg58
	 7D8KPwpQJ1psA==
From: Peter Chen <peter.chen@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xu Yang <xu.yang_2@nxp.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Chen <peter.chen@kernel.org>
Subject: [PATCH] MAINTAINERS: Make Xu Yang the ChipIdea USB maintainer
Date: Wed, 25 Nov 2026 23:24:37 -0800
Message-ID: <20261126072437.4037678-1-peter.chen@kernel.org>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xu Yang has real ChipIdea hardware to test on and a lot of experience
with the controller and driver. Make Xu Yang the maintainer of the
ChipIdea USB driver, and move me to reviewer.

Also remove the T: entry. My git tree is no longer kept up to date, and
ChipIdea patches will go through the USB tree.

Signed-off-by: Peter Chen <peter.chen@kernel.org>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..5383f1070c81 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6281,10 +6281,10 @@ S:	Maintained
 F:	Documentation/translations/zh_CN/
 
 CHIPIDEA USB HIGH SPEED DUAL ROLE CONTROLLER
-M:	Peter Chen <peter.chen@kernel.org>
+M:	Xu Yang <xu.yang_2@nxp.com>
+R:	Peter Chen <peter.chen@kernel.org>
 L:	linux-usb@vger.kernel.org
 S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git
 F:	drivers/usb/chipidea/
 
 CHIPONE ICN8318 I2C TOUCHSCREEN DRIVER
-- 
2.43.0

