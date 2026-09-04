Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EADE35E1B8
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 23:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788565445; cv=none; b=aHw0Y0B1DLQLa3plOBgSnd9+PPBqi5QTsq+FZ15rFrS5LMiv7gTwWr/pWYqQtvBj7al5H538qa5flVetZUeU6budlKqNe3B1fWDbLFt0CxU0ioTnCkBISh6SWGZg11yD9AGQeADN0EN6qIJAdyw0zkD8oHiOaDuxg6SViRAViDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788565445; c=relaxed/simple;
	bh=6j7QtbafL0GjId7kZIPTH6hRjGmJBCaIWXYGOyGCfIM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=seVItqItHlM3UDwCDSB66Hcu/QsmoRFzLAs1QIxQ0RUoAwYfay8AWiLvUtwpE0oS1DqIEq0hO584zElLQvycBkwc8RFrp8vKCuLY4ais1tB0T6vhr841llJkp7D+aMhwIB//aPl3JeolNgNhnWaaX15hSKWtcDf/WPhWyFwQf84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A/BLVheY; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A/BLVheY"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so2264397a91.0
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 16:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788565444; x=1789170244; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=43MbP1qjgGN4vZdi/2GkDDZJfA5MhGqHcArs08teQ7w=;
        b=A/BLVheYo8MtMcD/W7YdnE6CUvW3KfqkaZ5WaVV4L1xt+h1g5cBjK39A+ZlEqgc9zJ
         KFUOdT9QFVdA0yogtzLCyfym1/VHZC0RxNLI9DJ5NDZHymmcIlkg+of8nnwk3KB7zwn4
         +Ma8DLQwLsw2qYeAMKyXtbBOlGK8Z7HFb9egxwLtzfnGiFt0luc1Sx2Y594X9jkDiMHH
         xuHQhCK8Sh3g4Otp5sEYN3456rBmnr4pfdTjdg0PNY3hw4visMbyalF81Hh5gaqbWRDL
         N4WzE972n4gB7DzBTV+G34Vf13/5G8C63WL9UbtELnuKtOlmmzjkARi9uVexyV2w/bK1
         B41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788565444; x=1789170244;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43MbP1qjgGN4vZdi/2GkDDZJfA5MhGqHcArs08teQ7w=;
        b=TZtjoywJRLmt9v/yuAEpbpWwAB2skjgZ30ix7OxXyO4/ffk8eNPe5SyAULSMnr21Ax
         lCflpa+iLBPukRhbp+lDH9sKagG6TjvQG6epn0U4522KTaDwla5SjGdIkzdBoS4WdZa4
         TA7bpz5Jo0aQtzxAT+mGRMYg2NRtDyWhRetDD1HlQnWgBgg15lLIlPPqjcR5sXbyy2Px
         B5X4xCPtgpRSSGyQXlgCudTOzx2gzy15T4BwAk4UPBp+hHdL6FiLAw01xcjNM0oEJ9V6
         S3KW7J4SVbnwXudPXb3lLSXNmGaihgmF9+zuI9x3gU7Nb8DywDiC5w6MZnRdDvhfyLoT
         hKBA==
X-Forwarded-Encrypted: i=1; AKwUvBwLqeqKqBJZgXiARkxngi5ZF9v2OqivzMWdjxGy/ztn0F9BL36/1d/XkYidPPUpkcnIoihHxo6HWMM=@vger.kernel.org
X-Gm-Message-State: AFuF++k/klQtkM8/w4JgDlNK+QOwvhw2vukjIUB+L/v/4vw/twFxfY0s
	Ybnsw9308O2H30XDQxsRBNVBtsG9NBQDUpeVSie6zUdk/j6PE2PxFRBsfKxmGy9GvwsoNKZ4YPp
	+XsY38g==
X-Received: from dycag16.prod.google.com ([2002:a05:7300:fa10:b0:328:430e:e346])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:a06:b0:3d3:aec2:4dcc
 with SMTP id adf61e73a8af0-3da3a0fd0f3mr15160633637.24.1788565443779; Fri, 04
 Sep 2026 16:44:03 -0700 (PDT)
Date: Fri,  4 Sep 2026 23:44:01 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904234401.2339633-1-jthies@google.com>
Subject: [PATCH v2] usb: typec: ucsi: displayport: Fix OOB altmode array index
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: bleung@chromium.org, gregkh@linuxfoundation.org, akuchynski@chromium.org, 
	Jameson Thies <jthies@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The UCSI displayport driver indexes the connector's port altmode array
with the GET_CURRENT_CAM response after checking it is not 0xff. The
port altmode array is UCSI_MAX_ALTMODES elements long. If the PPM
returns an invalid GET_CURRENT_CAM response above UCSI_MAX_ALTMODES and
not equal to 0xff, the kernel may crash with an array index OOB error.

Update the UCSI displayport driver to verify the current cam is less
than UCSI_MAX_ALTMODES before accessing the port altmode array.

Fixes: af8622f6a585 ("usb: typec: ucsi: Support for DisplayPort alt mode")
Cc: stable@vger.kernel.org
Signed-off-by: Jameson Thies <jthies@google.com>
---
Changes in v2:
 - removed 0xff alt mode assignement when GET_CURRENT_CAM returns an error.
 - return -EINVAL when alt mode index above UCSI_MAX_ALTMODES is returned.

 drivers/usb/typec/ucsi/displayport.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index 7067f2561b84..572da7bbd29c 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -71,11 +71,14 @@ static int ucsi_displayport_enter(struct typec_altmode *alt, u32 *vdo)
 	if (ret < 0) {
 		if (ucsi->version > 0x0100)
 			goto err_unlock;
-		cur = 0xff;
 	}
 
 	if (cur != 0xff) {
-		ret = dp->con->port_altmode[cur] == alt ? 0 : -EBUSY;
+		if (cur < UCSI_MAX_ALTMODES)
+			ret = dp->con->port_altmode[cur] == alt ? 0 : -EBUSY;
+		else
+			ret = -EINVAL;
+
 		goto err_unlock;
 	}
 

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.55.0.979.g7e5102b832-goog

