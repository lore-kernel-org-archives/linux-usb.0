Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6D5308F39;
	Mon, 29 Jun 2026 12:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782737208; cv=none; b=BVHJaP9WIcKu+5f5Yv362SHdRe1u701ZS72LX/weQmisSRSTgn3TKHG4llqSmJSzvVklyCkzITwymW3RpauE+ORK6jLMw2RFETL4xtY/TvgwbW0NZ+iqtsXm4Lx/JHXpSiMBoQsap6Ds6Lb7yVJDUlebesj6JvQJlBW9kVFIIJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782737208; c=relaxed/simple;
	bh=tV6et+862iTyYpbP6zTI3jiE5B28Lf22p0ZUcHpHg5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KZih3GnYd7NdseDIkFJhljru55RJsXXKP8LG35XGQdxQ6m81tAabkTFXC1AN+2vk3vvw28oR3HIbB1c9fQTAwFNwLtkulKOn3xbMz6W9h3V+qQc3OmFVDqfdHSbbCYfybdLNzi/AVJjnNJg4QRrqVbOV4d3aiKlTHty/McTay1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gRntzAPL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gRntzAPL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6A541F000E9;
	Mon, 29 Jun 2026 12:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782737207;
	bh=b/gqACINWQZJEPc5JYTXJcmKS2LrZ+4DQDgn8zglsdM=;
	h=From:To:Cc:Subject:Date;
	b=gRntzAPL3VyJX+iqAkn1Yrrn9ate9+wwmHhWKv+mzCYCNi5Bp2HHaeZT6oAYmPuv9
	 7ZtlwoM9lMwnVrj2HqMK32qr23OHPk2Nr/O3vQHIOtgUssAV6AZyceYooqUCPHdRln
	 pBhy314nx44lsQ2pNZWy6e8zWKWoydqXWux61VwBQi7hQq5xle0xG+ew8hKyyxu/xk
	 KWiJ5ZQybKzObOy9ceGrM11kkKBN8XEIQlxZb/DbqRrkVpTaFnot/fNuCgx13Nos4s
	 1DmnEXshT3VkSOXZVw1/TXQ9yycFey/LN043fxFYtzUGyan/gBSsTMirkCTiwF6rUm
	 q+ZLKk3vHh40g==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1weBNt-00000000Pe6-2luC;
	Mon, 29 Jun 2026 14:46:45 +0200
From: Johan Hovold <johan@kernel.org>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] USB: serial: keyspan_pda: drop unused driver data usb-serial pointer
Date: Mon, 29 Jun 2026 14:46:28 +0200
Message-ID: <20260629124628.98569-1-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver data usb-serial pointer is unused since commit 66c32e483355
("USB: serial: keyspan_pda: drop redundant usb-serial pointer"), which
apparently failed to remove the pointer as intended.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/keyspan_pda.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/serial/keyspan_pda.c b/drivers/usb/serial/keyspan_pda.c
index dd4cfd17f7ad..4ee0bdf98c0e 100644
--- a/drivers/usb/serial/keyspan_pda.c
+++ b/drivers/usb/serial/keyspan_pda.c
@@ -31,7 +31,6 @@
 struct keyspan_pda_private {
 	int			tx_room;
 	struct work_struct	unthrottle_work;
-	struct usb_serial	*serial;
 	struct usb_serial_port	*port;
 	bool			throttled;
 	bool			throttle_req;
-- 
2.53.0

