Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B093101B2;
	Mon, 11 May 2026 07:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778483745; cv=none; b=RXk+L5Xd+tRnr+W6wpwUOkua5h5MNsL7iXs7yQ4vq0Nc9NEoPfIDW+qGauE0lf+ndw85joCKTDxB7zGSrBtJOloPmkdPQxS9tZjrbC4LVql65vLZbTwKkpbau+gpQDkyXCDyJieZq8lXhCHkyFtjRjViNCD1GR1XB6mrmppKdq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778483745; c=relaxed/simple;
	bh=GAX3vgHnPau6iCK5ZtrdEwbtFDTfYoPmCaF3R4f2/Tk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aeeW8fFVSdVsCIvt5JaCd7LaFKGvhu+K/tn2zpynbnnNJsDYFOpl9C6FFm224Wv9svVLxxNbnFHf2lFkHtaWPpdBLa7l78S9TCqO8xKClyFGl/pcJJCs6UhV6nIm7WinfqqThxHJXRmrmd2NSrt6O3v4VYJA1u+u8N1Kdvu4sdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/Hd8bf1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/Hd8bf1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0072BC2BCFB;
	Mon, 11 May 2026 07:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778483745;
	bh=GAX3vgHnPau6iCK5ZtrdEwbtFDTfYoPmCaF3R4f2/Tk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z/Hd8bf1L7qrYV+z1qWXpDTJ3zG7xBo1+SBRqikL/NmcBDuDIrAXdAux9nECefzc/
	 IPhnwgk2ZfngW4gW7bmuKaCscbwYlr+c9v7yUY77d/5Me6vQXrBsyXr4z3+jwDwvKu
	 pBcea6rl70waZw2AxDmZRofLoe65ZxIFCY2dHOm2gSY+uv18+PXcIJo22B416Ftn3q
	 1xS2c9ve+PANI6AkgKPgEAH4cvmODKH8MKgdeS5fSyoCUxbF5eC7jYwawhghPF+EY5
	 CU3ory64ooe0ZcHGBZlQv6l8jh7CqJj0wywr4PfRxoRZhkiH2G4l+m4pMe9E8deEA+
	 T00iQUg7jaf1g==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wMKre-00000002ZCW-2ywr;
	Mon, 11 May 2026 09:15:42 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] USB: serial: garmin_gps: drop unused atomic include
Date: Mon, 11 May 2026 09:14:46 +0200
Message-ID: <20260511071448.611875-7-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511071448.611875-1-johan@kernel.org>
References: <20260511071448.611875-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver no longer uses anything from atomic.h so drop the unused
include directive.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/garmin_gps.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/serial/garmin_gps.c b/drivers/usb/serial/garmin_gps.c
index 9f955962d546..8020149f5658 100644
--- a/drivers/usb/serial/garmin_gps.c
+++ b/drivers/usb/serial/garmin_gps.c
@@ -18,7 +18,6 @@
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
-#include <linux/atomic.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
 
-- 
2.53.0

